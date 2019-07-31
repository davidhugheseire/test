view: union_example {
  derived_table: {
    sql:
      SELECT 1 AS my_int
         FROM union_example1
      UNION
      SELECT 2 AS my_int
       FROM union_example2  ;;
  }



dimension: my_int  {
  type: number
}

}
