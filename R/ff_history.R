#' Pull Fantasy Football History
#'
#' The main function of the package - uses ffscrapr to retrieve league history 
#' data for analysis and visualization.
#'
#' @param conn A connection to a fantasy football league created with 
#'   `ffscrapr::ff_connect()` or platform-specific functions like 
#'   `ffscrapr::sleeper_connect()`, `ffscrapr::mfl_connect()`, etc. (required)
#' @param users Optional user mapping to track users across seasons and/or 
#'   platforms. See details for format.
#' @param ... Additional arguments passed to platform-specific connection 
#'   functions (e.g., `espn_s2`, `swid` for ESPN)
#'
#' @return An `ff_history` object which can be passed to `summary()` and 
#'   contains league histories retrieved from ffscrapr.
#'
#' @examples
#' \donttest{
#' try({ # try block to prevent CRAN-related issues
#'   conn <- ffscrapr::sleeper_connect(2025, "1200503479357952000")
#'   ff_history_obj <- ff_history(conn)
#'   summary(ff_history_obj)
#' })
#' }
#'
#' @seealso `vignette("basic")` for example usage
#'
#' @export
#' 
ff_history <- function(conn,
                       # league_type = c("dynasty", "redraft"),
                       users = NULL,
                       ...){
  
  #### Assertions ####
  
  if (!class(conn) %in% c("mfl_conn", "sleeper_conn", "flea_conn", "espn_conn")) {
    stop("conn should be a connection object created by `ff_connect()` and friends!",
         call. = FALSE
    )
  }
  
  # league_type <- rlang::arg_match0(league_type, c("dynasty","redraft"))
  
  #### Import Data ####
  
  cli::cli_rule("Starting Data Pull {Sys.time()}")
  
  cli::cli_process_start(msg = "Finding previous seasons")
  
  league_id_history <- ffh_league_id_history(conn = conn,
                                             ...) |> 
    dplyr::select(platform,
                  season_connection,
                  league_id,
                  league_name,
                  season,
                  league_type,
                  franchise_count,
                  qb_type)
  
  qb_number <- unique(league_id_history$qb_type)
  team_number <- unique(league_id_history$franchise_count)
  
  if(conn$platform %in% c("Sleeper", "ESPN")){
    franchise_history <- league_id_history |> 
      dplyr::mutate(yearly_franchises = purrr::map(.x = season_connection,
                                                   .f = ffscrapr::ff_franchises)) |> 
      tidyr::unnest(yearly_franchises) |>
      # Group the user_name by user_id
      dplyr::mutate(user_name = dplyr::last(user_name, order_by = season),
                    .by = user_id)
  } else if(conn$platform == "MFL"){
    franchise_history <- league_id_history |> 
      dplyr::mutate(yearly_franchises = purrr::map(.x = season_connection,
                                                   .f = ffscrapr::ff_franchises)) |> 
      tidyr::unnest(yearly_franchises) |>
      # Group the user_name by user_id
      dplyr::mutate(user_name = dplyr::last(franchise_name, order_by = season),
                    .by = franchise_id)
  } else break
  
  cli::cli_process_start(msg = "Getting schedule history")
  
  if(conn$platform %in% c("Sleeper")){
    all_schedules <- league_id_history |>
      dplyr::mutate(schedule = purrr::map(.x = season_connection,
                                          .f = ffscrapr::ff_schedule)) |>
      tidyr::unnest(schedule)
  } else {
    all_schedules <- NULL
  }
  
  # cli::cli_process_start(msg = "Getting current rosters")
  # 
  # if(conn$platform %in% c("Sleeper", "ESPN")){
  #   franchise_rosters <- league_id_history |> 
  #     dplyr::mutate(yearly_rosters = purrr::map(.x = season_connection,
  #                                                  .f = ffscrapr::ff_rosters)) |> 
  #     tidyr::unnest(yearly_rosters)
  # } else break
  # 
  # cli::cli_process_start(msg = "Getting scoring history")
  # 
  # if(conn$platform %in% c("Sleeper", "ESPN")){
  #   scoring_history <- league_id_history |> 
  #     dplyr::mutate(scoring = purrr::map2(.x = season_connection,
  #                                        .y = season,
  #                                        .f = ffscrapr::ff_scoringhistory)) |> 
  #     dplyr::select(-season) |> 
  #     tidyr::unnest(scoring)
  #   
  #   starter_history <- league_id_history |> 
  #     dplyr::mutate(starters = purrr::map(.x = season_connection,
  #                                         .f = ffscrapr::ff_starters)) |> 
  #     tidyr::unnest(starters)
  #   
  #   combine_scoring <- 
  #     starter_history |> 
  #     left_join(scoring_history |> select(player_id = sleeper_id,
  #                                         points,
  #                                         season,
  #                                         week),
  #               by = c("player_id",
  #                       "season",
  #                       "week"))
  # } else break
  
  cli::cli_process_start(msg = "Gathering standings")
  
  if(conn$platform == "Sleeper"){
    standings_history <- league_id_history |> 
      dplyr::mutate(yearly_standings = purrr::map(.x = season_connection,
                                                  .f = ffscrapr::ff_standings)) |> 
      tidyr::unnest(yearly_standings)
    
    playoff_history <- league_id_history |> 
      dplyr::mutate(playoff_standings = purrr::map(.x = season_connection,
                                                   .f = ~get_sleeper_playoffs(conn = .x,
                                                                              num_teams = team_number))) |> 
      tidyr::unnest(playoff_standings)
  } else if(conn$platform == "MFL"){
    standings_history <- league_id_history |> 
      dplyr::mutate(yearly_standings = purrr::map(.x = season_connection,
                                                  .f = ffscrapr::ff_standings)) |> 
      tidyr::unnest(yearly_standings) |> 
      tidyr::separate(col = h2h_wlt, into = c("h2h_wins", "h2h_losses", "h2h_ties"), sep = "-") |> 
      dplyr::mutate(dplyr::across(.cols = c("h2h_wins", "h2h_losses", "h2h_ties"),
                                  .fns = as.numeric),
                    # TODO pull MFL potential points through ffscrapr
                    potential_points = points_for / 0.8,
                    allplay_wins = h2h_wins*14,
                    allplay_losses = h2h_losses*14,
                    allplay_winpct = h2h_winpct)
    
    playoff_history_raw <- league_id_history |> 
      dplyr::mutate(playoff_standings = purrr::map(.x = season_connection,
                                                   .f = get_mfl_playoffs)) |> 
      tidyr::unnest(playoff_standings)
    
    playoff_ranking <- standings_history |> 
      dplyr::mutate(final_rank = dplyr::row_number(),
                    .by = season) |> 
      dplyr::select(season, franchise_id, final_rank)
    
    playoff_history <- 
      playoff_ranking |> 
      dplyr::left_join(playoff_history_raw, by = c("season", "franchise_id")) |> 
      dplyr::mutate(final_place = final_rank)
  } else if(conn$platform == "ESPN"){
    standings_history <- league_id_history |> 
      dplyr::mutate(yearly_standings = purrr::map(.x = season_connection,
                                                  .f = ffscrapr::ff_standings)) |> 
      tidyr::unnest(yearly_standings) |> 
      dplyr::mutate(# TODO pull ESPN potential points through ffscrapr
        potential_points = points_for / 0.8)
    
    playoff_history <- league_id_history |> 
      dplyr::mutate(playoff_standings = purrr::map(.x = season_connection,
                                                   .f = get_espn_playoffs)) |> 
      tidyr::unnest(playoff_standings)
    
  }
  
  standings_history_combined <- standings_history |>
    dplyr::left_join(playoff_history |> 
                       dplyr::select(season,
                                     franchise_id,
                                     playoff_h2h_wins,
                                     playoff_h2h_losses,
                                     final_place,
                                     playoffs_made),
                     by = c("franchise_id", "season"),
                     na_matches = "never") |> 
    dplyr::transmute(season,
                     franchise_id,
                     h2h_wins,
                     h2h_losses,
                     h2h_ties,
                     h2h_winpct,
                     points_for,
                     points_against,
                     potential_points,
                     allplay_wins,
                     allplay_losses,
                     allplay_winpct,
                     playoff_h2h_wins,
                     playoff_h2h_losses,
                     final_place = dplyr::if_else(is.na(final_place), franchise_count - 1, final_place),
                     playoffs_made = dplyr::if_else(is.na(playoffs_made), 0, playoffs_made))
  
  blank_seasons <- 
    tidyr::crossing(user_name = unique(franchise_history$user_name),
                    season = unique(franchise_history$season)) |>
    dplyr::left_join(franchise_history |>
                       dplyr::select(season, franchise_id, user_name),
                     by = c("season", "user_name"))
  
  cli::cli_process_start(msg = "Checking how you drafted")
  
  pick_values <- 
    ffscrapr::dp_values() |> 
    dplyr::filter(pos == "PICK",
                  stringr::str_detect(player, "\\.")) |> 
    dplyr::transmute(pick_number = dplyr::row_number(),
                     sf_flag = qb_number == "2QB/SF",
                     value = dplyr::if_else(sf_flag, value_2qb, value_1qb))
  
  if(conn$platform == "Sleeper"){
    scrape_drafts <- league_id_history |> 
      dplyr::mutate(draft_history = purrr::map(.x = season_connection,
                                               .f = ffscrapr::ff_draft)) |> 
      dplyr::select(-season) |> 
      tidyr::unnest(draft_history)

    draft_history <- 
      scrape_drafts |> 
      dplyr::filter(type == "linear") |> 
      dplyr::mutate(season = as.numeric(season),
                    round = dplyr::case_when(draft_id == 1227384460106792960 ~ 4,
                                             TRUE ~ round)) |>
      dplyr::arrange(season, round, pick) |> 
      dplyr::mutate(pick_number = dplyr::row_number(),
                    .by = season) |> 
      dplyr::left_join(pick_values, by = "pick_number") 
    
    startup_draft <- 
      scrape_drafts |> 
      dplyr::filter(type == "snake") |> 
      dplyr::mutate(season = as.numeric(season)) |> 
      dplyr::mutate(pick_number = dplyr::row_number(),
                    .by = season)
    
  } else if(conn$platform == "MFL"){ 
    draft_history <- league_id_history |> 
      dplyr::mutate(draft_history = purrr::map(.x = season_connection,
                                               .f = ffscrapr::ff_draft)) |> 
      tidyr::unnest(draft_history) |> 
      dplyr::mutate(season = as.numeric(season),
                    round = as.numeric(round)) |> 
      dplyr::mutate(pick_number = dplyr::row_number(),
                    .by = season) |> 
      dplyr::left_join(pick_values, by = "pick_number") 
  }
  
  draft_history_summary <-
    blank_seasons |> 
    dplyr::full_join(draft_history, by = c("franchise_id", "season")) |>
    dplyr::mutate(missing_season = dplyr::if_else(is.na(franchise_id), 1, 0)) |> 
    dplyr::summarise(first_round_picks = sum(dplyr::if_else(is.na(pick) | round != 1, 0, 1)),
                     total_picks = sum(dplyr::if_else(is.na(pick), 0, 1)),
                     total_pick_value = sum(value, na.rm = TRUE),
                     .by = c(user_name, season, missing_season)) |> 
    dplyr::mutate(total_pick_value = dplyr::if_else(missing_season == 1, NA, total_pick_value)) |> 
    dplyr::summarise(first_round_picks = sum(first_round_picks, na.rm = TRUE),
                     picks_by_season = list(total_picks),
                     total_picks = sum(total_picks, na.rm = TRUE),
                     value_by_season = list(total_pick_value),
                     .by = user_name)
  
  cli::cli_process_start(msg = "Waivers in progress")
  
  if(conn$platform == "Sleeper"){
    transaction_history <- league_id_history |> 
      dplyr::mutate(transaction_history = purrr::map(.x = season_connection,
                                                     .f = ffscrapr::ff_transactions)) |>
      tidyr::unnest(transaction_history) |> 
      dplyr::mutate(franchise_id = as.numeric(franchise_id))
  } else if(conn$platform == "MFL"){ 
    transaction_history <- league_id_history |> 
      dplyr::mutate(transaction_history = purrr::map(.x = season_connection,
                                                     .f = ffscrapr::ff_transactions)) |>
      tidyr::unnest(transaction_history) |> 
      dplyr::mutate(franchise_id = as.character(franchise_id))
  }
  
  transaction_summary <- 
    blank_seasons |> 
    dplyr::full_join(transaction_history, by = c("franchise_id", "season")) |>
    dplyr::mutate(missing_season = dplyr::if_else(is.na(franchise_id), 1, 0)) |> 
    dplyr::summarise(trade_count = dplyr::n_distinct(dplyr::if_else(stringr::str_to_lower(type) == "trade",
                                                                    timestamp, NA)) - 1,
                     players_added = sum(dplyr::if_else(type_desc == "added", 1, 0), na.rm = TRUE),
                     .by = c(user_name, season, missing_season)) |> 
    dplyr::mutate(players_added = dplyr::if_else(missing_season == 1, NA, players_added)) |> 
    dplyr::summarise(trade_count = sum(trade_count, na.rm = TRUE),
                     players_added_by_season = list(players_added),
                     players_added = sum(players_added, na.rm = TRUE),
                     .by = user_name)
  
  summary_history <- 
    blank_seasons |> 
    dplyr::full_join(standings_history_combined, by = c("franchise_id", "season")) |>
    dplyr::mutate(finish_emoji = dplyr::case_when(is.na(final_place) ~ emoji::emoji("black_square_button"),
                                                  final_place == 1 ~ emoji::emoji("trophy"),
                                                  final_place == 2 ~ emoji::medal("silver"),
                                                  final_place == 3 ~ emoji::medal("bronze"),
                                                  playoffs_made == 1 ~ emoji::emoji("check_mark"),
                                                  final_place == team_number ~ emoji::emoji("taco"),
                                                  TRUE ~ emoji::emoji("x"))) |> 
    dplyr::summarise(dplyr::across(.cols = c(h2h_wins, h2h_losses, h2h_ties, allplay_wins, allplay_losses,
                                             points_for, potential_points,
                                             playoff_h2h_wins, playoff_h2h_losses),
                                   .fns = ~sum(.x, na.rm = TRUE)),
                     emoji_collase = paste(finish_emoji, sep = "", collapse = ""),
                     h2h_winpct = h2h_wins / (h2h_wins + h2h_losses + h2h_ties),
                     allplay_winpct = allplay_wins / (allplay_wins + allplay_losses),
                     first_place = sum(final_place == 1, na.rm = TRUE),
                     second_place = sum(final_place == 2, na.rm = TRUE),
                     third_place = sum(final_place == 3, na.rm = TRUE),
                     total_playoffs = sum(playoffs_made, na.rm = TRUE),
                     optimal_start_percent = points_for / potential_points,
                     luck_pct = h2h_winpct - allplay_winpct,
                     playoff_h2h_winpct = playoff_h2h_wins / (playoff_h2h_wins + playoff_h2h_losses),
                     .by = user_name) |> 
    dplyr::mutate(playoff_h2h_winpct = tidyr::replace_na(playoff_h2h_winpct, 0)) |> 
    dplyr::left_join(transaction_summary, by = "user_name") |> 
    dplyr::left_join(draft_history_summary, by = "user_name") |>
    
    dplyr::arrange(-first_place, -second_place, -third_place, -total_playoffs, -allplay_wins, -allplay_winpct) |> 
    
    dplyr::transmute(user_name,
                     optimal_start_percent,
                     regular_season_record = glue::glue("{h2h_wins}-{h2h_losses}-{h2h_ties}"),
                     h2h_winpct,
                     allplay_winpct,
                     emoji_collase, 
                     luck_pct,
                     playoff_record = glue::glue("{playoff_h2h_wins}-{playoff_h2h_losses}"),
                     playoff_h2h_winpct,
                     first_round_picks,
                     total_picks,
                     value_by_season,
                     trade_count,
                     players_added,
                     players_added_by_season)
  
  cli::cli_process_start(msg = "Saving metadata")
  
  league_info <- ffscrapr::ff_league(conn)
  
  year_range <- league_info |>
    tidyr::separate(col = years_active,
                    into = c("min_year", "max_year"),
                    sep = "-")
  
  max_pick_value <- draft_history |>
    dplyr::summarise(total_pick_value = sum(value, na.rm = TRUE),
                     .by = c(franchise_id, season)) |> 
    dplyr::summarise(max_added = max(total_pick_value)) |> 
    dplyr::pull(max_added)
  
  median_pick_value <- draft_history |>
    dplyr::summarise(total_pick_value = sum(value, na.rm = TRUE),
                     .by = c(franchise_id, season)) |> 
    dplyr::summarise(med_added = stats::median(total_pick_value)) |> 
    dplyr::pull(med_added)
  
  max_players_added <- transaction_history |>
    dplyr::summarise(players_added = sum(dplyr::if_else(type_desc == "added", 1, 0), na.rm = TRUE),
                     .by = c(franchise_id, season)) |> 
    dplyr::summarise(max_added = max(players_added)) |> 
    dplyr::pull(max_added)
  
  median_players_added <- transaction_history |>
    dplyr::summarise(players_added = sum(dplyr::if_else(type_desc == "added", 1, 0), na.rm = TRUE),
                     .by = c(franchise_id, season)) |> 
    dplyr::summarise(med_added = stats::median(players_added)) |> 
    dplyr::pull(med_added)
  
  out <- structure(
    list(
      summary_history = summary_history,
      all_franchises = blank_seasons,
      standings_history = standings_history_combined,
      transaction_history = transaction_history,
      draft_history = draft_history,
      # startup_draft = startup_draft,
      # franchise_rosters = franchise_rosters,
      # combine_scoring = combine_scoring,
      all_schedules = all_schedules,
      league_metadata = list(league_name = league_info$league_name,
                             franchise_count = team_number,
                             years_active = league_info$years_active,
                             min_year = year_range$min_year,
                             max_year = year_range$max_year,
                             max_pick_value = max_pick_value,
                             median_pick_value = median_pick_value,
                             max_players_added = max_players_added,
                             median_players_added = median_players_added)
    ),
    class = "ff_history"
  )
  
  
  cli::cli_rule("History complete! {Sys.time()}")
  
  return(out)
  
} 
