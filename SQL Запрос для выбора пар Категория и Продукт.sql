SELECT        ISNULL(dbo.categories.name + ' - ', '') + ISNULL(dbo.products.name, '') AS Result
FROM            dbo.matching_products LEFT OUTER JOIN
                         dbo.categories ON dbo.matching_products.category_id = dbo.categories.id LEFT OUTER JOIN
                         dbo.products ON dbo.matching_products.product_id = dbo.products.id