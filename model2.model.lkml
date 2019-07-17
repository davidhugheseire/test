connection: "thelook"

# include all the views
include: "*.view"


datagroup: smelookml_default_datagroup {
  sql_trigger: SELECT 1;;
  max_cache_age: "1 hour"
}
