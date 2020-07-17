view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: app_domain{
    label: "Media"
    type: string
    sql:
    CASE WHEN ${state} = 'Texas' THEM ${city}
    ELSE ${email}
    END;;
  }




#   dimension: date_formatted {
#     label: "Date_formatted"
#     sql: ${created_date} ;;
#     html:
#     {% if _user_attributes['region'] == 'EU' %}
#       {{ rendered_value | date: "%m/%d/%y" }}
#     {% endif %}
#     {% if _user_attributes['region'] == 'USA' %}
#       {{ rendered_value | date:  "%d/%m/%y" }}
#     {% endif %};;
#   }


  dimension: formatted_checker {
    type: string
    sql: ${created_date} ;;
    html:
        {% if users.date_type._parameter_value == "EU" %}
      {{ rendered_value | date: "%m/%d/%y" }}
    {% elsif users.date_type._parameter_value == "USA" %}
      {{ rendered_value | date: "%d/%m/%y" }}
    {% else %}
        "booooooooooooooo"
    {% endif %}
    ;;
  }

  # dynamic dimension(s)
  parameter: date_type {
    type: string
    allowed_value: { value: "EU" }
    allowed_value: { value: "USA" }
  }


  dimension: date_format {
    sql:
       CASE
       WHEN '{{ _user_attributes["locale"] }}' = 'en_gb' THEN '%Y-%d-%m'
       WHEN '{{ _user_attributes["locale"] }}' = 'en' THEN '%d/%m/%y'
       ELSE '%Y-%m-%d'
       END ;;
  }

  dimension: lcd_formatted {
    type: date
    # label: "{{ _localization['deals.lcd_formatted']}}"
    sql: 1;;
    html: {{ rendered_value | date: {{date_format}} ;;
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

  dimension: USA {
    group_label: "Formatted"  label: "Date_USA"
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%m/%d/%y" }};;
  }

  dimension: EU {
    group_label: "Formatted"  label: "Date_EU"
    sql: ${created_date} ;;
    html: {{ rendered_value | date:  "%d/%m/%y" }};;
  }

  dimension: date_formatted {
    group_label: "Formatted"  label: "Date"
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%b %d, %y" }};;
  }

  dimension: week_formatted {
    group_label: "Formatted"  label: "Week"
    sql: ${created_week} ;;
    html: {{ rendered_value | date: "Week %U (%b %d)" }};;
  }

  dimension: month_formatted {
    group_label: "Formatted"  label: "Month"
    sql: ${created_month} ;;
    html: {{ rendered_value | append: "-01" |  date: "%B %Y" }};;
  }

  dimension: more_formatted {
    group_label: "Formatted"  label: "Full"
    sql: ${created_date} ;;
    html: {{ rendered_value | date: "%A, %B, %e, %Y" }};;
  }




  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, orders.count]
  }


  measure: avg_age {
    type: average
    sql: ${age} ;;
  }

  measure: count_test {
    type: count
    drill_fields: [user_details*]
  }



  set: user_details {
    fields: [id, first_name, city, state, country, orders.*]
  }


}
