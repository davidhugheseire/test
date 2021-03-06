view: orders {
  sql_table_name: public.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]
   html: <p style="color: red; font-size:100%">{{ rendered_value }}</p> ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

dimension: status_color {
  type: number
  sql: CASE WHEN ${status} = 'complete'   then 1
            WHEN ${status} = 'pending'   then 2
            WHEN ${status} = 'cancelled'  then 3
        END;;
  html: {{orders.status._rendered_value}} ;;
}
  set: order_details {
    fields: [id, traffic_source, status]
  }

}
