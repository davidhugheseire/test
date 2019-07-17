view: size {
  derived_table: {
  sql:
 SELECT
  'XL'  AS "size"
  FROM public.orders  AS orders2
union all
SELECT
  'L'  AS "size"
    FROM public.orders  AS orders2
union all
SELECT
  'M'  AS "size"
    FROM public.orders  AS orders2
    union all
SELECT
  'S'  AS "size"
    FROM public.orders  AS orders2
;;
}


dimension: size {
  type: string
}

}
