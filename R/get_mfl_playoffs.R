
# Credit to Tan Ho for getting me through this

parse_one_game <- function(game) {
  tibble::tibble(list(game)) |> 
    tidyr::unnest_wider(1) |> 
    tidyr::unnest_wider(c(home,away), names_sep = "_")
}

parse_game <- function(game){
  vec_depth <- purrr::pluck_depth(game)
  if (vec_depth == 3) game <- parse_one_game(game)
  if (vec_depth == 4) game <- purrr::map_dfr(game, parse_one_game)
  return(game)
}

parse_round <- function(round){
  if(purrr::pluck_depth(round) == 4) return(tibble::tibble(list(round)))
  return(tibble::tibble(round))
}

.get_mfl_bracket <- function(conn, bracket_id) {

  mfl_bracket <- ffscrapr::mfl_getendpoint(conn, 
                                           endpoint = "playoffBracket",
                                           BRACKET_ID = bracket_id) |> 
    purrr::pluck("content", "playoffBracket", "playoffRound") |> 
    parse_round() |> 
    tidyr::unnest_wider(1) |> 
    dplyr::mutate(playoffGame = purrr::map(playoffGame, parse_game)) |> 
    tidyr::unnest(playoffGame)
  
  bracket_long <- 
    mfl_bracket |> 
    dplyr::mutate(home_points = as.numeric(home_points),
                  away_points = as.numeric(away_points),
                  winning_id = dplyr::if_else(home_points > away_points,
                                              home_franchise_id,
                                              away_franchise_id),
                  losing_id = dplyr::if_else(home_points < away_points,
                                             home_franchise_id,
                                             away_franchise_id)) |> 
    tidyr::pivot_longer(cols = c(winning_id, losing_id),
                        values_to = "franchise_id",
                        names_to = "win_loss")
  
  return(bracket_long)
  
}

get_mfl_playoffs <- function(conn){

  mfl_playoffs <- ffscrapr::mfl_getendpoint(conn, endpoint = "playoffBrackets") |> 
    purrr::pluck("content") |> 
    purrr::pluck("playoffBrackets") |> 
    dplyr::bind_rows() |> 
    dplyr::mutate(bracket_nested = purrr::map(.x = id,
                                              .f = ~.get_mfl_bracket(conn = conn,
                                                                     bracket_id = .x)))
  
  mfl_playoffs_long <- 
    mfl_playoffs |> 
    tidyr::unnest(bracket_nested) |> 
    dplyr::mutate(round = dplyr::cur_group_id(),
                  .by = week) |> 
    dplyr::mutate(playoff_outcome = dplyr::case_when(game_id == max(game_id) &
                                                       name == "Main Playoff" &
                                                       win_loss == "winning_id" ~ 1,
                                                     game_id == max(game_id) &
                                                       name == "Main Playoff" &
                                                       win_loss == "losing_id" ~ 2,
                                                     bracketWinnerTitle == "3rd Place" & 
                                                       win_loss == "winning_id" ~ 3,
                                                     bracketWinnerTitle == "3rd Place" &
                                                       win_loss == "losing_id" ~ 4,
                                                     TRUE ~ NA),
                  bye_wins = dplyr::if_else(round == 2 &
                                              home_franchise_id == franchise_id &
                                              is.na(home_winner_of_game), 1, 0),
                  wins = dplyr::if_else(win_loss == "winning_id", 1, 0),
                  losses = dplyr::if_else(win_loss == "losing_id", 1, 0),
                  playoffs_made = 1) 
  
  playoffs_summary <- mfl_playoffs_long |>
    dplyr::summarise(playoff_h2h_wins = sum(wins) + sum(bye_wins),
                     playoff_h2h_losses = sum(losses),
                     final_place = sum(playoff_outcome, na.rm = TRUE),
                     playoffs_made = max(playoffs_made, na.rm = TRUE),
                     .by = franchise_id)
  
  return(playoffs_summary)
  
}
