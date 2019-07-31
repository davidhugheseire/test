view: pdt_aaa {
    derived_table: {
      datagroup_trigger: smelookml_default_datagroup
      explore_source: users {
        column: age {}
        column: email {}
        column: id {}
        column: count {}
      }
    }
    dimension: age {
      type: number
    }
    dimension: email {}
    dimension: id {
      type: number
    }
    dimension: count {
      type: number
    }
  }
