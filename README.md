
# ffhistorian

## Overview

`ffhistorian` is an R package that retrieves and visualizes fantasy
football league history data. Built on top of the excellent
[ffscrapr](https://github.com/ffverse/ffscrapr) package, it provides
tools to analyze league performance across seasons, track user
statistics, and create insightful visualizations of your fantasy
football league’s history.

## Installation

You can install the development version of `ffhistorian` from GitHub:

``` r
# pak is recommended, see https://github.com/r-lib/pak
pak::pak("ffverse/ffhistorian")

# can also use remotes
remotes::install_github("ffverse/ffhistorian")
```

## Getting Started

The main workflow involves three steps:

1.  **Connect to your league** using `ffscrapr`
2.  **Pull league history** with `ff_history()`
3.  **Analyze and visualize** the results

### Basic Example

``` r
library(ffhistorian)

# Connect to a Sleeper league
conn <- ffscrapr::sleeper_connect(2025, "1203144309361090560")

# Pull league history
ff_history <- ff_history(conn)
```

    ## ── Starting Data Pull 2026-01-02 12:56:13.378307 ───────────────────────────────

    ## ℹ Finding previous seasonsℹ Getting schedule historyℹ Gathering standings     ℹ Checking how you draftedℹ Waivers in progress     ℹ Saving metadata                      ── History complete! 2026-01-02 12:56:37.414219 ────────────────────────────────
    ## ℹ Saving metadata✔ Saving metadata ... done
    ## ℹ Waivers in progress✔ Waivers in progress ... done
    ## ℹ Checking how you drafted✔ Checking how you drafted ... done
    ## ℹ Gathering standings✔ Gathering standings ... done
    ## ℹ Getting schedule history✔ Getting schedule history ... done
    ## ℹ Finding previous seasons✔ Finding previous seasons ... done

``` r
# View summary statistics
summary(ff_history)
```

<div id="wxkpaefqrx" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#wxkpaefqrx table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#wxkpaefqrx thead, #wxkpaefqrx tbody, #wxkpaefqrx tfoot, #wxkpaefqrx tr, #wxkpaefqrx td, #wxkpaefqrx th {
  border-style: none;
}
&#10;#wxkpaefqrx p {
  margin: 0;
  padding: 0;
}
&#10;#wxkpaefqrx .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 3px;
  border-top-color: #000000;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 3px;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#wxkpaefqrx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#wxkpaefqrx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#wxkpaefqrx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 3px;
  border-top-color: #000000;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #000000;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#wxkpaefqrx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#wxkpaefqrx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#wxkpaefqrx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#wxkpaefqrx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #000000;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#wxkpaefqrx .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#wxkpaefqrx .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#wxkpaefqrx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#wxkpaefqrx .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#wxkpaefqrx .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#wxkpaefqrx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 0px;
  border-top-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#wxkpaefqrx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wxkpaefqrx .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#wxkpaefqrx .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#wxkpaefqrx .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#wxkpaefqrx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wxkpaefqrx .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#wxkpaefqrx .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wxkpaefqrx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#wxkpaefqrx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #000000;
}
&#10;#wxkpaefqrx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wxkpaefqrx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#wxkpaefqrx .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wxkpaefqrx .gt_left {
  text-align: left;
}
&#10;#wxkpaefqrx .gt_center {
  text-align: center;
}
&#10;#wxkpaefqrx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#wxkpaefqrx .gt_font_normal {
  font-weight: normal;
}
&#10;#wxkpaefqrx .gt_font_bold {
  font-weight: bold;
}
&#10;#wxkpaefqrx .gt_font_italic {
  font-style: italic;
}
&#10;#wxkpaefqrx .gt_super {
  font-size: 65%;
}
&#10;#wxkpaefqrx .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#wxkpaefqrx .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#wxkpaefqrx .gt_indent_1 {
  text-indent: 5px;
}
&#10;#wxkpaefqrx .gt_indent_2 {
  text-indent: 10px;
}
&#10;#wxkpaefqrx .gt_indent_3 {
  text-indent: 15px;
}
&#10;#wxkpaefqrx .gt_indent_4 {
  text-indent: 20px;
}
&#10;#wxkpaefqrx .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="15" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>The Gridiron Goofball Gala 2024-2025</td>
    </tr>
    &#10;    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="Team">Team</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="2024→2025">2024→2025</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="5" style="font-weight: bold;" scope="colgroup" id="Regular Season">
        <span class="gt_column_spanner">Regular Season</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" style="font-weight: bold;" scope="colgroup" id="Playoffs">
        <span class="gt_column_spanner">Playoffs</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="font-weight: bold;" scope="colgroup" id="Picks Selected">
        <span class="gt_column_spanner">Picks Selected</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" style="font-weight: bold;" scope="colgroup" id="Transactions">
        <span class="gt_column_spanner">Transactions</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="AP Win %&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;1&lt;/sup&gt;&lt;/span&gt;">AP Win %<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Win %">Win %</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Luck %&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;2&lt;/sup&gt;&lt;/span&gt;">Luck %<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Record">Record</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="PP %&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;3&lt;/sup&gt;&lt;/span&gt;">PP %<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>3</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Record&lt;span class=&quot;gt_footnote_marks&quot; style=&quot;white-space:nowrap;font-style:italic;font-weight:normal;&quot;&gt;&lt;sup&gt;4&lt;/sup&gt;&lt;/span&gt;">Record<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>4</sup></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Win %">Win %</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Firsts">Firsts</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Total">Total</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Value">Value</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Trades">Trades</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Adds">Adds</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="History">History</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="user_name" class="gt_row gt_left">TyNoel</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">✔️🏆</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">63.6%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #7CC87D; color: #000000;">57.1%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #E2F4DD; color: #000000;">−6.4%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #7CC87D; color: #000000;">16-12-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">84.6%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #238B45; color: #FFFFFF;">3-1</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">75.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">0</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">3</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,105.909090909091 150,105.909090909091" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="105.909090909091" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">892</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">2</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #D6EFD0; color: #000000;">56</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,96.8965517241379 C 75,96.8965517241379 125,84.8275862068966 150,84.8275862068966" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="96.8965517241379" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="84.8275862068966" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">21</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">35</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">sox05syd</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">🏆✔️</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #3CA659; color: #FFFFFF;">59.6%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #7CC87D; color: #000000;">57.1%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #CDEBC6; color: #000000;">−2.5%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #7CC87D; color: #000000;">16-12-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #A8DCA2; color: #000000;">84.3%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #238B45; color: #FFFFFF;">3-1</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">75.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #C7E9C0; color: #000000;">4</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,94.1275988585406 150,94.1275988585406" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="94.1275988585406" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">2.05K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">0</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">216</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,28.7931034482759 C 75,28.7931034482759 125,15 150,15" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="28.7931034482759" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="15" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">100</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">116</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">ramluna</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">🥈🥈</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #3CA559; color: #FFFFFF;">59.7%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #95D391; color: #000000;">53.6%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #E0F3DB; color: #000000;">−6.1%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #95D391; color: #000000;">15-13-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">88.4%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #37A055; color: #FFFFFF;">4-2</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #37A055; color: #FFFFFF;">66.7%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">3</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,91.1516510395434 150,91.1516510395434" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="91.1516510395434" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">2.34K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">2</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #E7F6E3; color: #000000;">34</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,97.7586206896552 C 75,97.7586206896552 125,102.931034482759 150,102.931034482759" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="97.7586206896552" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="102.931034482759" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">20</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">14</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">Tomseymour</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">🥉✔️</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #60BA6C; color: #000000;">56.1%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">71.4%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #42AB5D; color: #FFFFFF;">15.4%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #238B45; color: #FFFFFF;">20-8-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">84.5%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #74C476; color: #000000;">2-2</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #74C476; color: #000000;">50.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #74C476; color: #000000;">5</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,84.5373012637586 150,84.5373012637586" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="84.5373012637586" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">2.99K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #D6EFD0; color: #000000;">1</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #E6F5E1; color: #000000;">36</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,92.5862068965517 C 75,92.5862068965517 125,106.379310344828 150,106.379310344828" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="92.5862068965517" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="106.379310344828" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">26</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">10</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">Galletti</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">🌮🥉</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #96D492; color: #000000;">50.5%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #ABDDA5; color: #000000;">50.0%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #C1E7BA; color: #000000;">−0.5%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #ABDDA5; color: #000000;">14-14-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #A6DBA0; color: #000000;">84.4%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #37A055; color: #FFFFFF;">2-1</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #37A055; color: #FFFFFF;">66.7%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #C7E9C0; color: #000000;">4</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,53.6567468406033 150,53.6567468406033" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="53.6567468406033" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">6.02K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #D6EFD0; color: #000000;">1</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #E5F5E0; color: #000000;">39</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,105.51724137931 C 75,105.51724137931 125,90.8620689655172 150,90.8620689655172" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="105.51724137931" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="90.8620689655172" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">11</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">28</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">TrapperJoe</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">✔️✔️</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #F4FBF1; color: #000000;">36.1%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #7CC87D; color: #000000;">57.1%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">21.1%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #7CC87D; color: #000000;">16-12-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #F1FAEE; color: #000000;">81.1%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #C7E9C0; color: #000000;">1-3</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #C7E9C0; color: #000000;">25.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #C7E9C0; color: #000000;">4</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,72.704851202609 150,72.704851202609" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="72.704851202609" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">4.15K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #5CB769; color: #000000;">3</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #F0F9ED; color: #000000;">17</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,108.965517241379 C 75,108.965517241379 125,106.379310344828 150,106.379310344828" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="108.965517241379" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="106.379310344828" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">7</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">10</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">Opesooorry</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">✔️❌</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #89CE87; color: #000000;">51.9%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #E2F4DD; color: #000000;">39.3%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">−12.6%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #E2F4DD; color: #000000;">11-17-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #ABDDA4; color: #000000;">84.2%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #AEDEA7; color: #000000;">1-2</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #AEDEA7; color: #000000;">33.3%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">2</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">3</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,44.2600896860987 150,44.2600896860987" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="44.2600896860987" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">6.94K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">4</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #DEF2D8; color: #000000;">47</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,96.8965517241379 C 75,96.8965517241379 125,92.5862068965517 150,92.5862068965517" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="96.8965517241379" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="92.5862068965517" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">21</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">26</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">brungls</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">❌🌮</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #B6E2AF; color: #000000;">46.8%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #E2F4DD; color: #000000;">39.3%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #E7F6E2; color: #000000;">−7.5%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #E2F4DD; color: #000000;">11-17-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #83CB82; color: #000000;">85.4%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #F7FCF5; color: #000000;">0-0</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">0.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #238B45; color: #FFFFFF;">6</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,18.5466775377089 150,18.5466775377089" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="18.5466775377089" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">9.46K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">2</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">3</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,112.413793103448 C 75,112.413793103448 125,115 150,115" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="112.413793103448" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">3</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">ZachShaw</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">❌❌</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #E1F4DC; color: #000000;">40.5%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">32.1%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #E9F7E5; color: #000000;">−8.4%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #F7FCF5; color: #000000;">9-19-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">80.7%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #F7FCF5; color: #000000;">0-0</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">0.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #C7E9C0; color: #000000;">4</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,40.7439869547493 150,40.7439869547493" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="40.7439869547493" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">7.29K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #D6EFD0; color: #000000;">1</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #F6FCF4; color: #000000;">5</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,112.413793103448 C 75,112.413793103448 125,113.275862068966 150,113.275862068966" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="112.413793103448" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="113.275862068966" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">3</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">2</text></g>
</svg>
</div></td></tr>
    <tr><td headers="user_name" class="gt_row gt_left">JTNoel</td>
<td headers="emoji_collase" class="gt_row gt_right" style="white-space: nowrap;">❌❌</td>
<td headers="allplay_winpct" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">35.2%</td>
<td headers="h2h_winpct" class="gt_row gt_right" style="background-color: #D2EDCC; color: #000000;">42.9%</td>
<td headers="luck_pct" class="gt_row gt_right" style="background-color: #86CC84; color: #000000;">7.6%</td>
<td headers="regular_season_record" class="gt_row gt_center" style="background-color: #D2EDCC; color: #000000;">12-16-0</td>
<td headers="optimal_start_percent" class="gt_row gt_right" style="background-color: #E2F4DC; color: #000000;">82.1%</td>
<td headers="playoff_record" class="gt_row gt_center" style="background-color: #F7FCF5; color: #000000;">0-0</td>
<td headers="playoff_h2h_winpct" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">0.0%</td>
<td headers="first_round_picks" class="gt_row gt_right" style="background-color: #A1D99B; color: #000000;">1</td>
<td headers="total_picks" class="gt_row gt_right" style="background-color: #C7E9C0; color: #000000;">4</td>
<td headers="pick_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,115 C 75,115 125,15 150,15" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="53.1807990216062" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="63.1807990216062" x2="150" y2="63.1807990216062" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="73.1807990216062" fill="transparent" stroke="transparent" font-size="30px">5.08K</text></g>
<circle cx="50" cy="115" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="15" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">9.81K</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">0</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">9.81K</text></g>
</svg>
</div></td>
<td headers="trade_count" class="gt_row gt_right" style="background-color: #F7FCF5; color: #000000;">0</td>
<td headers="players_added" class="gt_row gt_right" style="background-color: #E8F6E3; color: #000000;">33</td>
<td headers="add_plot" class="gt_row gt_left" style="padding-top:0; padding-bottom:0; vertical-align: middle; overflow-x: visible;"><div>
<svg 
role="img" 
viewBox="0 0 200 130" 
style="
height:2em;
margin-left:auto;
margin-right:auto;
font-size:inherit;
overflow:visible;
vertical-align:middle;
position:relative;"
>
<defs>
<pattern id="area_pattern" width="8" height="8" patternUnits="userSpaceOnUse">
<path class="pattern-line" d="M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4" stroke="red" stroke-width="1.5" stroke-linecap="round" shape-rendering="geometricPrecision">
</path>
</pattern>
</defs>
<style>text { font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; stroke-width: 0.15em; paint-order: stroke; stroke-linejoin: round; cursor: default; } .vert-line:hover rect { fill: #911EB4; fill-opacity: 40%; stroke: #FFFFFF60; color: red; } .vert-line:hover text { stroke: white; fill: #212427; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; } .y-axis-line:hover rect { fill: #EDEDED; fill-opacity: 60%; stroke: #FFFFFF60; color: red; } .y-axis-line:hover text { stroke: white; stroke-width: 0.20em; fill: #1A1C1F; } .ref-line:hover rect { stroke: #FFFFFF60; } .ref-line:hover line { stroke: #FF0000; } .ref-line:hover text { stroke: white; fill: #212427; }</style>
<path d="M 50,105.51724137931 C 75,105.51724137931 125,96.0344827586207 150,96.0344827586207" stroke="#41AB5D" stroke-width="8" fill="none"></path>
<g class="ref-line"><rect x="40" y="90.3448275862069" width="120" height="20" stroke="transparent" stroke-width="1" fill="transparent"></rect><line class="ref-line" x1="50" y1="100.344827586207" x2="150" y2="100.344827586207" stroke="#41AB5D" stroke-width="1" stroke-dasharray="4 3" transform="" stroke-linecap="round" vector-effect="non-scaling-stroke" ></line><text x="160" y="110.344827586207" fill="transparent" stroke="transparent" font-size="30px">17</text></g>
<circle cx="50" cy="105.51724137931" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<circle cx="150" cy="96.0344827586207" r="10" stroke="#FFFFFF" stroke-width="4" fill="#000000" ></circle>
<g class="y-axis-line">
<rect x="0" y="0" width="65" height="130" stroke="transparent" stroke-width="0" fill="transparent"></rect>
<text x="0" y="19" fill="transparent" stroke="transparent" font-size="25">116</text>
<text x="0" y="126" fill="transparent" stroke="transparent" font-size="25">0</text></g>
<g class="vert-line">
<rect x="40" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="60" y="20" fill="transparent" stroke="transparent" font-size="30px">11</text></g>
<g class="vert-line">
<rect x="140" y="0" width="20" height="130" stroke="transparent" stroke-width="12" fill="transparent"></rect>
<text x="160" y="20" fill="transparent" stroke="transparent" font-size="30px">22</text></g>
</svg>
</div></td></tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="15">🏆 Champion, 🥈 2nd Place, 🥉 3rd Place, ✔️ Playoffs, ❌ Missed Playoffs, 🌮 Worst Team, 🔲 Didn't Play</td>
    </tr>
  </tfoot>
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="15"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> What would your win rate be if you played every team each week?</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="15"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>2</sup></span> Difference between your win rate and all play win rate</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="15"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>3</sup></span> Percentage of potential points</td>
    </tr>
    <tr>
      <td class="gt_footnote" colspan="15"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>4</sup></span> Playoff byes counted as 1 win</td>
    </tr>
  </tfoot>
</table>
</div>

### Supported Platforms

`ffhistorian` supports all platforms available through `ffscrapr`:

- **Sleeper**
- **ESPN** (requires authentication)
- **MFL (MyFantasyLeague)**
- **Fleaflicker**

#### ESPN Example

ESPN leagues require authentication via `espn_s2` and `swid` cookies:

``` r
# Store credentials as environment variables (recommended)
conn <- ffscrapr::espn_connect(
  season = 2025,
  league_id = "your_league_id",
  espn_s2 = Sys.getenv("ESPN_S2"),
  swid = Sys.getenv("SWID")
)

history <- ff_history(conn)
summary(history)
```

#### MFL Example

``` r
conn <- ffscrapr::mfl_connect(2025, league_id = "12345")
history <- ff_history(conn)
summary(history)
```

### Support

The best places to get help on this package are:

- the [nflverse discord](https://discord.com/invite/5Er2FBnnQa) (for
  both this package as well as anything R/NFL related)
- opening [an
  issue](https://github.com/ffverse/ffhistorian/issues/new/choose)

### Terms of Use

The R code for this package is released as open source under the [MIT
license](https://ffscrapr.ffverse.com/LICENSE.html).

The APIs and data accessed by this package belong to their respective
owners, and are governed by their terms of use.
