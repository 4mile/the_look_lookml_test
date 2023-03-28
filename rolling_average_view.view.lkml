view: rolling_average_view {
  derived_table: {
    sql:
    select
      cast(format_timestamp('%Y-%m', created_at ) as string) as month_year,
      cast(format_timestamp('%Y-%m', date_add(cast(created_at as date), INTERVAL 1 MONTH )) as string) as prior_month,
      cast(format_timestamp('%Y-%m', date_add(cast(created_at as date), INTERVAL 2 MONTH )) as string) as prior_two_months,
      count(order_id) as total_revenue
    from ${order_items.SQL_TABLE_NAME} monthly_transaction_facts
    group by 1,2,3 ;;
  }

  dimension: month_year {}
  dimension: prior_month {}
  dimension: prior_two_months {}
  dimension: total_revenue {type: number}

  measure: month_over_month {
    type: number
    sql:  ${order_items.total_revenue} - ifnull(${prior_month.total_revenue},0)  ;;
  }
  measure: month_over_month_percent {
    type: number
    value_format_name: percent_1
    sql: ${order_items.total_revenue}/nullif(${prior_month.total_revenue},0) - 1 ;;
  }
}
