- name: test_bug_dave
  title: Untitled Visualization
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
