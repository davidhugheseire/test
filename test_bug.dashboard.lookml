- dashboard: test_bug
  title: Market overview | Month to date
  layout: newspaper
  query_timezone: user_timezone
  elements:
  - title: Direct Control Tower
    name: Direct Control Tower
    model: digital_direct
    explore: ga_sessions
    type: single_value
    fields: [buttons.Controltower_buttons_v1_1]
    filters:
      ga_sessions.global_date: 1 days ago for 1 days
    sorts: [buttons.Controltower_buttons_v1_1]
    limit: 1
    column_limit: 50
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_labels: {}
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: e89e1ec3-e441-4138-be03-17aa79bed931,
          palette_id: f46d6485-6c58-4e78-914b-279d0c071786, __FILE: digitaldirectv1_1/dashboard1.dashboard.lookml,
          __LINE_NUM: 2081}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: digitaldirectv1_1/dashboard1.dashboard.lookml, __LINE_NUM: 2080}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    y_axes: []
    series_types: {}
    row: 44
    col: 0
    width: 8
    height: 2
  # filters:
  # - name: Country
  #   title: Country
  #   type: field_filter
  #   default_value: ''
  #   allow_multiple_values: true
  #   required: false
  #   model: digital_direct
  #   explore: sap_sales_reporting_data
  #   listens_to_filters: []
    # field: marketmaster.market_country
  # - name: Currency Type
  #   title: Currency Type
  #   type: field_filter
  #   default_value: local
  #   allow_multiple_values: true
  #   required: false
  #   model: digital_direct
  #   explore: sap_sales_reporting_data
  #   listens_to_filters: []
  #   field: parameters.gbp_local
