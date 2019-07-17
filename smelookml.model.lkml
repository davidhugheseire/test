connection: "thelook"

# include all the views
include: "*.view"

datagroup: smelookml_default_datagroup {
  sql_trigger: SELECT 1;;
  max_cache_age: "1 hour"
}

#persist_with: smelookml_default_datagroup

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: one_to_many
  }
}
explore: inventory_itemsA {
  from: inventory_items
  join: products {
    type: left_outer
    sql_on: ${inventory_itemsA.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

# explore: users {
#   join: orders {
#     type: full_outer
#     sql: ${users.id} = ${orders.user_id} ;;
#     relationship: one_to_many
#   }
# }


explore: orders2 {
  from: orders
}

explore: users2 {
  from: users
}


explore: users {
  join: orders {
    sql_on: ${users.id} = ${orders.user_id} ;;
  }
}

explore:pdt_a {}


explore: orders_full {}
explore: users_full {}
explore: size {}
explore: union_example {}



explore:cross_ex{
  from: products
  join: size {
    type: cross
  }
}





explore: users_full_2 {
  from: users_full
  join: orders_full {
    type: full_outer
    sql_on: ${users_full_2.id} = ${orders_full.user_id} ;;
    relationship: one_to_many
  }
}

explore: product_facts {
  join: products {
    type: left_outer
    sql_on: ${product_facts.product_id} = ${products.id} ;;
    relationship: one_to_many
  }
}

explore: products {}
explore: derived_orders {}

#explore: users {}
