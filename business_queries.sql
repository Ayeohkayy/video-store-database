-- =====================================================
-- JOHNSON VIDEO STORE - BUSINESS QUERIES
-- =====================================================

-- 1) Which movies are currently available for rent?

SELECT DISTINCT
    m.MovieID,
    m.Title
FROM Inventory i
JOIN Movies m
    ON m.MovieID = i.MovieID
JOIN Status s
    ON s.StatusID = i.StatusID
WHERE s.Status = 'Available'
ORDER BY m.Title;


-- =====================================================
-- 2) How many inventory items does the store have in total?

SELECT COUNT(*) AS total_inventory_items
FROM Inventory;


-- =====================================================
-- 3) How many inventory copies does the store have for each movie?

SELECT
    m.MovieID,
    m.Title,
    COUNT(*) AS inventory_copies
FROM Inventory i
JOIN Movies m
    ON m.MovieID = i.MovieID
GROUP BY
    m.MovieID,
    m.Title
ORDER BY
    inventory_copies DESC,
    m.Title;


-- =====================================================
-- 4) Which customers currently have late or unreturned rentals?

SELECT DISTINCT
    c.CustomerID,
    c.CxFirstName,
    c.CxLastName,
    r.RentalID,
    r.RentalDate,
    r.DueDate,
    r.ReturnDate
FROM Rental r
JOIN Customers c
    ON c.CustomerID = r.CustomerID
WHERE r.ReturnDate IS NULL
   OR r.ReturnDate > r.DueDate
ORDER BY
    c.CxLastName,
    c.CxFirstName,
    r.RentalDate;


-- =====================================================
-- 5) How much additional revenue is generated from rentals
--    returned late or not returned compared to rentals returned on time?

WITH rental_totals AS (
    SELECT
        r.RentalID,
        CASE
            WHEN r.ReturnDate IS NULL OR r.ReturnDate > r.DueDate
                THEN 'Late/Unreturned'
            ELSE 'On Time'
        END AS return_group,
        SUM(ri.LineTotal) AS rental_revenue
    FROM Rental r
    JOIN RentalItem ri
        ON ri.RentalID = r.RentalID
    GROUP BY
        r.RentalID,
        CASE
            WHEN r.ReturnDate IS NULL OR r.ReturnDate > r.DueDate
                THEN 'Late/Unreturned'
            ELSE 'On Time'
        END
),
group_totals AS (
    SELECT
        return_group,
        SUM(rental_revenue) AS total_revenue
    FROM rental_totals
    GROUP BY return_group
)
SELECT
    COALESCE(MAX(CASE WHEN return_group = 'Late/Unreturned' THEN total_revenue END), 0) AS late_or_unreturned_revenue,
    COALESCE(MAX(CASE WHEN return_group = 'On Time' THEN total_revenue END), 0) AS on_time_revenue,
    COALESCE(MAX(CASE WHEN return_group = 'Late/Unreturned' THEN total_revenue END), 0)
    - COALESCE(MAX(CASE WHEN return_group = 'On Time' THEN total_revenue END), 0) AS additional_revenue
FROM group_totals;


-- =====================================================
-- 6) What percentage of rentals are returned late?

SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN r.ReturnDate IS NOT NULL
                 AND r.ReturnDate > r.DueDate
                    THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS pct_rentals_returned_late
FROM Rental r;


-- =====================================================
-- 7) What types of fees (late, damage, rewind) are most common across rentals?

SELECT
    fee_type,
    fee_count
FROM (
    SELECT
        'Late Fee' AS fee_type,
        COUNT(*) AS fee_count
    FROM RentalItem
    WHERE COALESCE(LateFee, 0) > 0

    UNION ALL

    SELECT
        'Damage Fee' AS fee_type,
        COUNT(*) AS fee_count
    FROM RentalItem
    WHERE COALESCE(DamageFee, 0) > 0

    UNION ALL

    SELECT
        'Rewind Fee' AS fee_type,
        COUNT(*) AS fee_count
    FROM RentalItem
    WHERE COALESCE(RewindFee, 0) > 0
) x
ORDER BY
    fee_count DESC,
    fee_type;


-- =====================================================
-- 8) How much revenue has the store generated from rental fees,
--    late fees, and damage fees?

SELECT
    SUM(COALESCE(RentalPrice, 0)) AS base_rental_revenue,
    SUM(COALESCE(LateFee, 0)) AS late_fee_revenue,
    SUM(COALESCE(DamageFee, 0)) AS damage_fee_revenue,
    SUM(COALESCE(RentalPrice, 0))
      + SUM(COALESCE(LateFee, 0))
      + SUM(COALESCE(DamageFee, 0)) AS subtotal_revenue_excl_discounts,
    SUM(COALESCE(LineTotal, 0)) AS total_revenue_including_discounts_and_all_fees
FROM RentalItem;


-- =====================================================
-- 9) What percentage of total rental revenue comes from Academy Award-winning movies?

WITH totals AS (
    SELECT
        SUM(ri.LineTotal) AS total_revenue,
        SUM(
            CASE
                WHEN am.MovieID IS NOT NULL THEN ri.LineTotal
                ELSE 0
            END
        ) AS award_movie_revenue
    FROM RentalItem ri
    JOIN Inventory i
        ON i.InventoryID = ri.InventoryID
    LEFT JOIN (
        SELECT DISTINCT MovieID
        FROM AAwardsMovie
    ) am
        ON am.MovieID = i.MovieID
)
SELECT
    award_movie_revenue,
    total_revenue,
    ROUND(
        100.0 * award_movie_revenue / NULLIF(total_revenue, 0),
        2
    ) AS pct_revenue_from_award_winning_movies
FROM totals;


-- =====================================================
-- 10) How does rental format (VHS, DVD, Blu-ray, 4K) impact the total amount
--     customers pay, including fees and discounts?

SELECT
    f.Format,
    COUNT(*) AS rental_lines,
    ROUND(AVG(ri.LineTotal), 2) AS avg_total_paid,
    ROUND(SUM(ri.LineTotal), 2) AS total_paid,
    ROUND(AVG(ri.RentalPrice), 2) AS avg_base_price,
    ROUND(AVG(COALESCE(ri.DiscountAmount, 0)), 2) AS avg_discount_amount,
    ROUND(AVG(COALESCE(ri.LateFee, 0)), 2) AS avg_late_fee,
    ROUND(AVG(COALESCE(ri.DamageFee, 0)), 2) AS avg_damage_fee,
    ROUND(AVG(COALESCE(ri.RewindFee, 0)), 2) AS avg_rewind_fee
FROM RentalItem ri
JOIN Inventory i
    ON i.InventoryID = ri.InventoryID
JOIN Catalog c
    ON c.CatalogID = i.CatalogID
JOIN Format f
    ON f.FormatID = c.FormatID
GROUP BY f.Format
ORDER BY
    avg_total_paid DESC,
    f.Format;