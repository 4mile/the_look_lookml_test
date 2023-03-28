view: rolling_average_view {
  derived_table: {
    sql:
    select
      cast((format_timestamp('%Y-%m', created_at )) as string) as year,
      cast(format_timestamp('%Y-%m', date_add(cast(created_at as date), INTERVAL 1 MONTH )) as string) as last_year,
      cast(format_timestamp('%Y-%m', date_add(cast(created_at as date), INTERVAL 2 MONTH )) as string) as two_years_ago,
      count(order_id) as total_revenue
    from ${order_items.SQL_TABLE_NAME} monthly_transaction_facts
    group by 1,2,3 ;;
  }

  dimension: year {}
  dimension: last_year {}
  dimension: two_years_ago {}

  dimension: total_revenue {type: number}

  measure: year_over_year {
    type: number
    sql:  ${order_items.count} - ifnull(${one_year.total_revenue},0)  ;;
  }
  measure: year_over_year_percent {
    type: number
    value_format_name: percent_1
    sql: ${order_items.count}/nullif(${one_year.total_revenue},0) - 1 ;;
  }
}
