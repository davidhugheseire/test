- dashboard: table_next_dashboard
  title: Table Next Dashboard
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: dave_test
    explore: users
    type: looker_grid
    fields: [users.state, users.count, users.gender]
    sorts: [users.state]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    series_column_widths:
      users.state: 116
      users.gender: 90
    row: 0
    col: 0
    width: 24
    height: 11
