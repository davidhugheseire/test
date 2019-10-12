# If necessary, uncomment the line below to include explore_source.
# include: "smelookml.model.lkml"

view: orders_full {
  derived_table: {
    explore_source: orders2 {
      column: user_id {}
      column: id {}
      column: created_date {}
      filters: {
        field: orders2.user_id
        value: "<=9"
      }
    }
  }
  dimension: user_id {
    type: number
  }
  dimension: id {
    type: number
  }
  dimension: created_date {
    type: date
  }
}
