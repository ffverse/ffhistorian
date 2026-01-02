
#' @examples
#' conn <- ffscrapr::mfl_connect(2018, 55526)
#' ff_history1 <- ff_history(conn)
#' 
#' conn <- ffscrapr::sleeper_connect(2025, "1200503479357952000")
#' ff_histodevtools::build_readme()ry2 <- ff_history(conn)
#' 
#' combo <- combine_ff_history(ff_history1, ff_history2, user_mapping = user_mapping)
#' summary(combo)

user_mapping <- function(team_name){
  
  switch(team_name,
         "mfl_team1" = "sleeper_team1",
         "mfl_team2" = "sleeper_team2",
         team_name)
  
}

combine_ff_history <- function(ff_history1,
                               ff_history2,
                               user_mapping = NULL){

  franchise_history <- 
    ff_history1$all_franchises |>
    rbind(ff_history2$all_franchises) |> 
    dplyr::mutate(user_name = purrr::map_chr(.x = user_name,
                                             .f = user_mapping))
  
  blank_seasons <- 
    tidyr::crossing(user_name = unique(franchise_history$user_name),
                    season = unique(franchise_history$season)) |>
    dplyr::left_join(franchise_history |>
                       dplyr::transmute(season, franchise_id = as.numeric(franchise_id), user_name),
                     by = c("season", "user_name"))
  
  all_schedules <- 
    ff_history1$all_schedules |>
    rbind(ff_history2$all_schedules) |> 
    dplyr::mutate(franchise_id = as.numeric(franchise_id))
  
  
  standings_history_combined <- 
    ff_history1$standings_history |>
    rbind(ff_history2$standings_history) |> 
    dplyr::mutate(franchise_id = as.numeric(franchise_id))
  
  team_number <- unique(ff_history2$league_metadata$franchise_count)
  
  transaction_history <- 
    blank_seasons |> 
    dplyr::full_join(ff_history1$transaction_history |> 
                       dplyr::mutate(franchise_id = as.numeric(franchise_id)) |> 
                       dplyr::bind_rows(ff_history2$transaction_history),
                     by = c("franchise_id", "season")) |>
    dplyr::mutate(user_name = purrr::map_chr(.x = user_name,
                                             .f = user_mapping))
  
  transaction_summary <- 
    transaction_history |> 
    dplyr::mutate(missing_season = dplyr::if_else(is.na(franchise_id), 1, 0)) |> 
    dplyr::summarise(trade_count = dplyr::n_distinct(dplyr::if_else(stringr::str_to_lower(type) == "trade",
                                                                    timestamp, NA)) - 1,
                     players_added = sum(dplyr::if_else(type_desc == "added" &
                                                          type %in% c("waiver_complete", "free_agent",
                                                                      "FREE_AGENT", "BBID_WAIVER"), 1, 0),
                                         na.rm = TRUE),
                     .by = c(user_name, season, missing_season)) |> 
    dplyr::mutate(players_added = dplyr::if_else(missing_season == 1, NA, players_added)) |> 
    dplyr::summarise(trade_count = sum(trade_count, na.rm = TRUE),
                     players_added_by_season = list(players_added),
                     players_added = sum(players_added, na.rm = TRUE),
                     .by = user_name)
  
  draft_history <- 
    blank_seasons |> 
    dplyr::full_join(ff_history1$draft_history |> 
                       dplyr::mutate(franchise_id = as.numeric(franchise_id),
                                     pick = as.numeric(pick)) |> 
                       dplyr::bind_rows(ff_history2$draft_history),
                     by = c("franchise_id", "season")) |> 
    dplyr::mutate(user_name = purrr::map_chr(.x = user_name,
                                             .f = user_mapping))
  
  draft_history_summary <- 
    draft_history |> 
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
  
  min_year <- as.character(pmin(as.numeric(ff_history1$league_metadata$min_year),
                                as.numeric(ff_history2$league_metadata$min_year)))
  
  max_year <- as.character(pmax(as.numeric(ff_history1$league_metadata$max_year),
                                as.numeric(ff_history2$league_metadata$max_year)))
  
  years_active <- paste0(min_year,"-",max_year)
  
  max_pick_value <- pmax(ff_history1$league_metadata$max_pick_value,
                         ff_history2$league_metadata$max_pick_value)
  
  median_pick_value <- 
    draft_history |> 
    dplyr::summarise(total_pick_value = sum(value, na.rm = TRUE),
                     .by = c(franchise_id, season)) |> 
    dplyr::summarise(med_added = stats::median(total_pick_value)) |> 
    dplyr::pull(med_added)
  
  max_players_added <- pmax(ff_history1$league_metadata$max_players_added,
                            ff_history2$league_metadata$max_players_added)
  
  median_players_added <- 
    transaction_history |> 
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
      all_schedules = all_schedules,
      league_metadata = list(league_name = ff_history2$league_metadata$league_name,
                             franchise_count = team_number,
                             years_active = years_active,
                             min_year = min_year,
                             max_year = max_year,
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
