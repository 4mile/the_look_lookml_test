connection: "thelook"

include: "/views_v2/order_items.view.lkml"
include: "/views_v2/users.view.lkml"
include: "/views_v2/inventory_items.view.lkml"
include: "/views_v2/products.view.lkml"
include: "/views_v2/distribution_centers.view.lkml"


explore: order_items {

  join: users {
    relationship: many_to_one
    sql_on: ${users.id} = ${order_items.user_id} ;;
  }

  join: inventory_items {
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id};;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
  }

  join: distribution_centers {
    relationship: many_to_one
    sql_on: ${inventory_items.product_distribution_center_id} = ${distribution_centers.id} ;;
  }
}

explore: users {
  label: "Customers"
}
