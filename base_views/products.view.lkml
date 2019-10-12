view: products {
  sql_table_name: public.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

#   dimension: brand {
#     type: string
#     sql: ${TABLE}.brand ;;
#   }



  dimension: brand {
    sql: ${TABLE}.brand ;;
    link: {
    label: "Search Google for {{ value }}"
    url: "http://www.google.com/search?q={{ value | encode_uri }}"
    icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri}}.com"
    }
    link: {
      label: "{{ value }} Analytics Dashboard"
      url: "https://dcltraining.dev.looker.com/dashboards/24?Brand={{ value }}
            &Category={{ _filters['products.category'] }}
            &Department={{ products.department | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "Explore {{ value }}"
      url: "https://dcltraining.dev.looker.com/explore/smelookml/products?
      fields=products.id,products.brand
            ,products.item_name,products.retail_price
            ,products.department,products.category
            &f[products.brand]={{ products.brand | url_encode }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }












  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count, product_facts.count]
  }
}
