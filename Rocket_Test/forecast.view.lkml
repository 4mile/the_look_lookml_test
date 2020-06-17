view: forecast {
    derived_table: {
      sql: select 'Q2' as quarter
        , '20943' as up_for_renewal_arr
        ,  '-1061' as cancellations
        , '-508' as contractions
        , '-52' as price_decrease
        , '19321' as renewal_arr
        , '1579' as price_increase
        , '237' as upsell
        , '482' as cross_sell
       ;;
    }



    dimension: quarter {
      type: string
      sql: ${TABLE}.quarter ;;
    }

    dimension: up_for_renewal_arr {
      type: number
      sql: ${TABLE}.up_for_renewal_arr ;;
    }

    dimension: cancellations {
      type: number
      sql: ${TABLE}.cancellations ;;
    }

    dimension: contractions {
      type: number
      sql: ${TABLE}.contractions ;;
    }

    dimension: price_decrease {
      type: number
      sql: ${TABLE}.price_decrease ;;
    }

    dimension: renewal_arr {
      type: number
      sql: ${TABLE}.renewal_arr ;;
    }

    dimension: price_increase {
      type: number
      sql: ${TABLE}.price_increase ;;
    }

    dimension: upsell {
      type: number
      sql: ${TABLE}.upsell ;;
    }

    dimension: cross_sell {
      type: number
      sql: ${TABLE}.cross_sell ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    measure: total_up_for_renewal_arr {
      type: sum
      sql: ${up_for_renewal_arr} ;;
    }

    measure: total_cancellations {
      type: sum
      sql: ${cancellations} ;;
    }

    measure: total_contractions {
      type: sum
      sql: ${contractions} ;;
    }

    measure: total_price_decrease {
      type: sum
      sql: ${price_decrease} ;;
    }

    measure: total_renewal_arr {
      type: sum
      sql: ${renewal_arr} ;;
    }

    measure: total_price_increase {
      type: sum
      sql: ${price_increase} ;;
    }

    measure: total_upsell {
      type: sum
      sql: ${upsell} ;;
    }

    measure: total_cross_sell {
      type: sum
      sql: ${cross_sell} ;;
    }

    set: detail {
      fields: [
        quarter,
        up_for_renewal_arr,
        cancellations,
        contractions,
        price_decrease,
        renewal_arr,
        price_increase,
        upsell,
        cross_sell
      ]
    }

  }
