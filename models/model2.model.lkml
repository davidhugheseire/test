connection: "thelook"
#include: "/base_views/*.view"
include: "/**/*.view"



datagroup: smelookml_default_datagroup {
  sql_trigger: SELECT 10;;
  max_cache_age: "24 hour"
}

explore: users {
  join: orders {
    sql_on: ${users.id} = ${orders.user_id} ;;
  }
}

explore:pdt_aaa {}
