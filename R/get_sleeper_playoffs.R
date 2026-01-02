
get_sleeper_playoffs <- function(conn, num_teams = NULL){

  winners_query <- glue::glue('league/{conn$league_id}/winners_bracket')
  
  sleeper_playoffs <- ffscrapr::sleeper_getendpoint(winners_query) |> 
    purrr::pluck("content") |> 
    dplyr::bind_rows()
  
  playoffs_long <- 
    sleeper_playoffs |> 
    tidyr::pivot_longer(cols = c(w, l),
                        values_to = "franchise_id") |> 
    dplyr::mutate(playoff_outcome = dplyr::if_else(name == "w", p, p+1, missing = NA), 
                  # playoff_outcome = dplyr::case_when(p == 1 & name == "w" ~ 1,
                  #                                    p == 1 & name == "l" ~ 2,
                  #                                    p == 3 & name == "w" ~ 3,
                  #                                    p == 3 & name == "l" ~ 4,
                  #                                    p == 5 & name == "w" ~ 5,
                  #                                    p == 5 & name == "l" ~ 6,
                  #                                    TRUE ~ 99),
                  bye_wins = dplyr::if_else(r == 2 & t1 == franchise_id & t1_from == "NULL", 1, 0),
                  wins = dplyr::case_when(p == 5 ~ 0,
                                          name == "w" ~ 1,
                                          TRUE ~ 0),
                  losses = dplyr::case_when(p == 5 ~ 0,
                                            name == "l" ~ 1,
                                            TRUE ~ 0),
                  # wins = dplyr::if_else(name == "w", 1, 0),
                  # losses = dplyr::if_else(name == "l", 1, 0),
                  playoffs_made = 1)
  
  winners_teams <- max(playoffs_long$playoff_outcome, na.rm = TRUE)
  
  settings_query <- glue::glue('league/{conn$league_id}')
  
  # 0 is toilet bowl, 1 is consolation bracket
  consolation_type <- ffscrapr::sleeper_getendpoint(settings_query) |> 
    purrr::pluck("content", "settings", "playoff_type")
  
  losers_query <- glue::glue('league/{conn$league_id}/losers_bracket')
  
  sleeper_consolation <- ffscrapr::sleeper_getendpoint(losers_query) |> 
    purrr::pluck("content") |> 
    dplyr::bind_rows()
  
  consolation_long <- 
    sleeper_consolation |> 
    tidyr::pivot_longer(cols = c(w, l),
                        values_to = "franchise_id") |> 
    dplyr::mutate(
      # playoff_outcome = dplyr::if_else(name == "l",
      #                                              p + winners_teams,
      #                                              p + winners_teams + 1,
      #                                              missing = NA),
      playoff_outcome = dplyr::case_when(consolation_type == 1 & name == "w" ~ p + winners_teams,
                                         consolation_type == 1 & name == "l" ~ p + winners_teams + 1,
                                         consolation_type == 0 & p == 1 & name == "w" ~ num_teams,
                                         consolation_type == 0 & p == 1 & name == "l" ~ num_teams - 1,
                                         consolation_type == 0 & p == 3 & name == "w" ~ num_teams - 2,
                                         consolation_type == 0 & p == 3 & name == "l" ~ num_teams - 3,
                                         consolation_type == 0 & p == 5 & name == "w" ~ num_teams - 4,
                                         consolation_type == 0 & p == 5 & name == "l" ~ num_teams - 5,
                                         TRUE ~ 99),
                  bye_wins = 0,
                  wins = 0,
                  losses = 0,
                  playoffs_made = 0)
  
  playoffs_summary <- playoffs_long |>
    dplyr::bind_rows(consolation_long) |> 
    dplyr::summarise(playoff_h2h_wins = sum(wins) + sum(bye_wins),
                     playoff_h2h_losses = sum(losses),
                     final_place = min(playoff_outcome, na.rm = TRUE),
                     playoffs_made = max(playoffs_made, na.rm = TRUE),
                     .by = franchise_id)
  
  return(playoffs_summary)
  
}
