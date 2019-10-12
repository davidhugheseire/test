view: derived_orders {
  derived_table: {
    sql:
        SELECT
          orders2.id  AS "id",
          DATE(CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', orders2.created_at )) AS "created_date",
          orders2.status  AS "status",
          orders2.traffic_source  AS "traffic_source",
          orders2.user_id  AS "user_id"
      FROM public.orders  AS orders2
      ;;
  }


  filter: date_filter {
    type: date
  }

  filter: id_filter_1 {
    type: number
  }

  parameter: id_filter {
    type: number
  }


  parameter: status_parameter {
    type: string
    allowed_value: { value: "pending" }
    allowed_value: { value: "cancelled" }
    allowed_value: { value: "complete" }
  }





   dimension_group: date {
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
    sql: ${TABLE}.created_date ;;
  }
  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  measure: count {
    type: count
  }



  filter: incoming_traffic_source {
    type: string
    suggest_dimension: derived_orders.traffic_source
    suggest_explore: derived_orders
  }

  dimension: hidden_traffic_source_filter {
    hidden: yes
    type: yesno
    sql: {% condition incoming_traffic_source %} ${traffic_source} {% endcondition %} ;;
  }

    measure: changeable_count_measure {
      type: count_distinct
      sql: ${id} ;;
      filters: {
        field: hidden_traffic_source_filter
        value: "Yes"
      }
    }
  }
