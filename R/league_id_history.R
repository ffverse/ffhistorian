

ffh_league_id_history <- function(conn, ...){

  if (conn$platform == "Sleeper") {
    league_endpoint <- glue::glue("league/{conn$league_id}") |> 
      ffscrapr::sleeper_getendpoint() |>
      purrr::pluck("content")
    
    league_id_history <- .sleeper_history(league_endpoint = league_endpoint)
  } else {
    year_range <- ffscrapr::ff_league(conn) |>
      tidyr::separate(col = years_active,
                      into = c("min_year", "max_year"),
                      sep = "-")
    
    league_id_history <- tidyr::crossing(season = 
                                           as.numeric(year_range$min_year):
                                           as.numeric(year_range$max_year),
                                         league_id = conn$league_id)
  }
  
  league_id_history <- 
    league_id_history |> 
    dplyr::mutate(platform = conn$platform,
                  season = as.numeric(season)) |> 
    dplyr::mutate(season_connection = purrr::pmap(.l = list(platform = platform,
                                                            league_id = league_id,
                                                            season = season,
                                                            ...),
                                                  .f = ffscrapr::ff_connect)) |>
    dplyr::mutate(season_info = purrr::map(.x = season_connection,
                                           .f = ffscrapr::ff_league)) |>
    dplyr::select(-league_id, -season) |>
    tidyr::unnest(season_info) |>
    dplyr::arrange(season)
  
  return(league_id_history)
}


.sleeper_history <- function(league_endpoint) {
  history <- tibble::tibble(season = character(),
                            league_id = character())
  history <- history |> 
    tibble::add_row(season = league_endpoint$season,
                    league_id = league_endpoint$league_id)
  
  prev <- league_endpoint$previous_league_id
  
  while (!is.null(prev) && prev != "0") {
    prev_endpoint <- glue::glue("league/{prev}") |>
      ffscrapr::sleeper_getendpoint() |>
      purrr::pluck("content")
    
    history <- history |> 
      tibble::add_row(season = prev_endpoint$season,
                      league_id = prev)
    
    prev <- prev_endpoint$previous_league_id
  }
  
  return(history)
}
