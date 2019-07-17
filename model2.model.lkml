connection: "thelook"
include: "*.view"


datagroup: smelookml_default_datagroup {
  sql_trigger: SELECT 1;;
  max_cache_age: "1 hour"
}

explore: users {
  join: orders {
    sql_on: ${users.id} = ${orders.user_id} ;;
  }
}

explore:pdt_aaa {}
