view: users_full {
  derived_table: {
    explore_source: users2 {
      column: id {}
      column: first_name {}
      column: last_name {}
      column: state {}
      filters: {
        field: users2.id
        value: "[8, 10]"
      }
    }
  }
  dimension: id {
    type: number
  }
  dimension: first_name {}
  dimension: last_name {}
  dimension: state {}
}
