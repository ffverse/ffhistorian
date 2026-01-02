
get_espn_playoffs <- function(conn){

  if (conn$season <= 2017){
    playoff_bracket <- ffscrapr::espn_getendpoint_raw(
      conn,
      glue::glue("https://fantasy.espn.com/apis/v3/games/ffl/leagueHistory/{conn$league_id}?view=mMatchupScore&view=mProjectedPlayoffMatchups&view=mScoreboard&view=mSettings&view=mTeam&seasonId={conn$season}")
      # "https://lm-api-reads.fantasy.espn.com/apis/v3/games/ffl/leagueHistory/805175?view=mMatchupScore&view=mStatus&view=mSettings&view=mTeam&seasonId=2015"
    )
    
    playoff_bracket_content <- 
      playoff_bracket |> 
      purrr::pluck("content", 1, "schedule") |> 
      dplyr::tibble() |> 
      tidyr::unnest_wider(1) |> 
      tidyr::unnest_wider(away, names_sep = "_") |> 
      tidyr::unnest_wider(home, names_sep = "_") |> 
      dplyr::filter(playoffTierType != "NONE") |> 
      dplyr::transmute(playoffTierType,
                       winner,
                       week = matchupPeriodId,
                       away_teamId,
                       home_teamId,
                       winning_id = dplyr::if_else(winner == "HOME",
                                                   home_teamId,
                                                   away_teamId),
                       losing_id = dplyr::if_else(winner == "AWAY",
                                                  home_teamId,
                                                  away_teamId)) |> 
      tidyr::pivot_longer(cols = c(winning_id, losing_id),
                          values_to = "franchise_id",
                          names_to = "win_loss")
  } else if(conn$season >= 2018){
  
  playoff_bracket <- ffscrapr::espn_getendpoint_raw(
    conn,
    glue::glue("https://fantasy.espn.com/apis/v3/games/ffl/seasons/{conn$season}/segments/0/leagues/{conn$league_id}?view=mMatchupScore&view=mProjectedPlayoffMatchups&view=mScoreboard&view=mSettings&view=mTeam")
  )
  
  playoff_bracket_content <- 
    playoff_bracket |> 
    purrr::pluck("content", "schedule") |> 
    dplyr::tibble() |> 
    tidyr::unnest_wider(1) |> 
    tidyr::unnest_wider(away, names_sep = "_") |> 
    tidyr::unnest_wider(home, names_sep = "_") |> 
    dplyr::filter(playoffTierType != "NONE") |> 
    dplyr::transmute(playoffTierType,
                     winner,
                     week = matchupPeriodId,
                     away_teamId,
                     home_teamId,
                     winning_id = dplyr::if_else(winner == "HOME",
                                                 home_teamId,
                                                 away_teamId),
                     losing_id = dplyr::if_else(winner == "AWAY",
                                                home_teamId,
                                                away_teamId)) |> 
    tidyr::pivot_longer(cols = c(winning_id, losing_id),
                        values_to = "franchise_id",
                        names_to = "win_loss")
  }
  
  playoffs_long <- 
    playoff_bracket_content |> 
    dplyr::mutate(franchise_id = dplyr::if_else(is.na(franchise_id), home_teamId, franchise_id),
                  round = dplyr::cur_group_id(),
                  .by = week) |> 
    dplyr::mutate(playoff_outcome = dplyr::case_when(round == max(round) &
                                                       playoffTierType == "WINNERS_BRACKET" &
                                                       win_loss == "winning_id" ~ 1,
                                                     round == max(round) &
                                                       playoffTierType == "WINNERS_BRACKET" &
                                                       win_loss == "losing_id" ~ 2,
                                                     # round == max(round) &
                                                     #   playoffTierType == "WINNERS_CONSOLATION_LADDER" &
                                                     #   win_loss == "winning_id" ~ ~ 3,
                                                     # round == max(round) &
                                                     #   playoffTierType == "WINNERS_CONSOLATION_LADDER" &
                                                     #   win_loss == "winning_id" ~ ~ 4,
                                                     TRUE ~ NA),
                  # bye_wins = dplyr::if_else(home_teamId == franchise_id &
                  #                             is.na(away_teamId), 1, 0),
                  wins = dplyr::if_else(playoffTierType == "WINNERS_BRACKET" &
                                          win_loss == "winning_id", 1, 0),
                  losses = dplyr::if_else(playoffTierType == "WINNERS_BRACKET" & 
                                            win_loss == "losing_id" &
                                            !is.na(away_teamId), 1, 0),
                  playoffs_made = dplyr::if_else(playoffTierType == "WINNERS_BRACKET", 1, 0)) 
  
  playoffs_summary <- playoffs_long |>
    dplyr::summarise(playoff_h2h_wins = sum(wins),
                     playoff_h2h_losses = sum(losses),
                     final_place = sum(playoff_outcome, na.rm = TRUE),
                     playoffs_made = max(playoffs_made, na.rm = TRUE),
                     .by = franchise_id)
    
}