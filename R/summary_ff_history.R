#' Compute Pretty Summary Table
#'
#' @description Uses the R package gt to create a pretty html table of the
#'   ff_history summary data frame.
#' @param object an object for which a summary is desired.
#' @param ... additional arguments passed on to the methods (currently not used).
#' @examples
#' \donttest{
#' conn <- ffscrapr::sleeper_connect(2023, "957091261993811968")
#' ff_history_obj <- ff_history(conn)
#' 
#' conn <- ffscrapr::mfl_connect(2022, 54040)
#'
#' # Create Summary Tables
#' tbl <- summary(ff_history_obj)
#'
#' }
#' @export
summary.ff_history <- function(object, ...){
  
  object$summary_history |> 
    gt::gt() |>
    gt::cols_nanoplot(columns = value_by_season,
                      plot_type = "line",
                      new_col_name = "pick_plot",
                      reference_line = object$league_metadata$median_pick_value,
                      expand_y = c(0, object$league_metadata$max_pick_value),
                      missing_vals = "zero",
                      options = gt::nanoplot_options(data_point_fill_color = "#000000",
                                                     data_line_stroke_color = "#41AB5D",
                                                     reference_line_color = "#41AB5D",
                                                     show_data_area = FALSE)) |> 
    gt::cols_nanoplot(columns = players_added_by_season,
                      plot_type = "line",
                      new_col_name = "add_plot",
                      reference_line = object$league_metadata$median_players_added,
                      expand_y = c(0, object$league_metadata$max_players_added),
                      missing_vals = "zero",
                      options = gt::nanoplot_options(data_point_fill_color = "#000000",
                                                     data_line_stroke_color = "#41AB5D",
                                                     reference_line_color = "#41AB5D",
                                                     show_data_area = FALSE)) |> 
    gt::tab_header(title = glue::glue("{object$league_metadata$league_name} {object$league_metadata$years_active}")) |>
    gt::cols_label(user_name = "Team",
                   emoji_collase = glue::glue("{object$league_metadata$min_year}\U2192{object$league_metadata$max_year}"),
                   allplay_winpct = "AP Win %",
                   h2h_winpct = "Win %",
                   luck_pct = "Luck %",
                   regular_season_record = "Record",
                   optimal_start_percent = "PP %",
                   
                   playoff_record = "Record",
                   playoff_h2h_winpct = "Win %",
                   
                   first_round_picks = "Firsts",
                   total_picks = "Total",
                   pick_plot = "Value",
                   trade_count = "Trades",
                   players_added = "Adds",
                   add_plot = "History") |> 
    gt::cols_hide(columns = c(value_by_season, players_added_by_season)) |> 
    gt::fmt_percent(columns = c(allplay_winpct, h2h_winpct, luck_pct, optimal_start_percent, playoff_h2h_winpct),
                    decimals = 1) |>
    gt::tab_spanner(label = "Regular Season",
                    columns = c(allplay_winpct, optimal_start_percent, regular_season_record, h2h_winpct, luck_pct)) |>
    gt::tab_spanner(label = "Playoffs",
                    columns = c(playoff_record, playoff_h2h_winpct)) |>
    gt::tab_spanner(label = "Picks Selected",
                    columns = c(first_round_picks, total_picks, pick_plot)) |> 
    gt::tab_spanner(label = "Transactions",
                    columns = c(trade_count, players_added, add_plot)) |> 
    
    gt::cols_align(align = "right",
                   columns = c(emoji_collase)) |>
    gt::tab_style(style = gt::cell_text(whitespace = "nowrap"),
                  locations = gt::cells_body(columns = emoji_collase)) |> 
    
    gt::data_color(
      columns = c(optimal_start_percent,
                  h2h_winpct,
                  allplay_winpct,
                  luck_pct,
                  playoff_h2h_winpct,
                  first_round_picks,
                  total_picks,
                  trade_count,
                  players_added),
      palette = c("#F7FCF5", "#E5F5E0", "#C7E9C0", "#A1D99B", "#74C476", "#41AB5D", "#238B45")) |>
    gt::data_color(
      columns = h2h_winpct,
      target_columns = regular_season_record,
      palette = c("#F7FCF5", "#E5F5E0", "#C7E9C0", "#A1D99B", "#74C476", "#41AB5D", "#238B45")) |>
    gt::data_color(
      columns = playoff_h2h_winpct,
      target_columns = playoff_record,
      palette = c("#F7FCF5", "#E5F5E0", "#C7E9C0", "#A1D99B", "#74C476", "#41AB5D", "#238B45")) |>
    gt::cols_move(columns = c(emoji_collase,
                              allplay_winpct,
                              h2h_winpct,
                              luck_pct,
                              regular_season_record,
                              optimal_start_percent,
                              playoff_record,
                              playoff_h2h_winpct,
                              first_round_picks,
                              total_picks,
                              pick_plot,
                              trade_count,
                              players_added,
                              add_plot),
                  after = user_name) |> 
    gt::tab_footnote(footnote = "What would your win rate be if you played every team each week?",
                     locations = gt::cells_column_labels(columns = allplay_winpct)) |> 
    gt::tab_footnote(footnote = "Difference between your win rate and all play win rate",
                     locations = gt::cells_column_labels(columns = luck_pct)) |>
    gt::tab_footnote(footnote = "Percentage of potential points",
                     locations = gt::cells_column_labels(columns = optimal_start_percent)) |> 
    gt::tab_footnote(footnote = "Playoff byes counted as 1 win",
                     locations = gt::cells_column_labels(columns = playoff_record)) |> 
    gt::tab_source_note(source_note = emoji::emoji_glue(":trophy: Champion, :2nd_place_medal: 2nd Place, :3rd_place_medal: 3rd Place, :check_mark: Playoffs, :x: Missed Playoffs, :taco: Worst Team, :black_square_button: Didn't Play")) |> 
    gt::tab_style(
      style = list(
        gt::cell_text(weight = "bold")
      ),
      locations = gt::cells_column_spanners(gt::everything())
    ) |> 
    gt::opt_table_lines(extent = "default") |>
    gt::tab_options(
      column_labels.border.top.color = "black",
      column_labels.border.top.width = gt::px(3),
      column_labels.border.bottom.color = "black",
      table_body.hlines.color = "white",
      table_body.hlines.width = gt::px(0),
      table.border.bottom.color = "white",
      table.border.bottom.width = gt::px(3),
      table_body.border.bottom.color = "black",
      table.border.top.color = "black",
      table.border.top.width = gt::px(3)
    )
  
}
