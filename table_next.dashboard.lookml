- dashboard: table_next
  title: table_next_dash
  layout: newspaper
  elements:
  - title: table_next_test
    name: table_next_test
    model: dave_test
    explore: users
    type: looker_grid
    fields: [users.state, users.count, users.gender]
    sorts: [users.state, users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    series_column_widths:
      users.state: 116
      users.gender: 90
    row: 0
    col: 0
    width: 8
    height: 11
