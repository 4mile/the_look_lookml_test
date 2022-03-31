include: "/views/**/*.view" # include all the views

# Place in `thelook` model

explore: +order_items {
  query: year_over_year {
    description: "Suitable for line chart comparing monthly sales over the last four years"
    dimensions: [created_month_name, created_year]
    pivots: [created_year]
    measures: [total_sale_price]
    sorts: [created_month_name: asc]
    filters: [
      order_items.created_date: "before 0 months ago",
      order_items.created_year: "4 years"
    ]
  }
}

explore: +order_items {
  query: shipments_status {
    description: "Summarises the status of the shipping pipeline"
    dimensions: [created_date, status]
    pivots: [status]
    measures: [order_count]
    filters: [
      distribution_centers.name: "Chicago IL",
      order_items.created_date: "60 days",
      order_items.status: "Complete,Shipped,Processing"
    ]
  }
}

explore: +order_items {
  query: inventory_aging {
    description: "Volume of inventory by age of stock item"
    dimensions: [inventory_items.days_in_inventory_tier]
    measures: [inventory_items.count]
    filters: [distribution_centers.name: "Chicago IL"]
    #timezone: "America/Los_Angeles"
  }
}
