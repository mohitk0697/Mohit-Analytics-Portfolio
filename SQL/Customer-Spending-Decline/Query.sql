-- Customer Spending Decline Analysis
-- Business Question:
-- Identify customers who spent > ₹1,000 in Jan-Feb 2026
-- but < ₹500 in Jun-Jul 2026.

SELECT
    O.customer_id,
    C.customer_name,

    SUM(
        CASE
            WHEN O.order_date >= '2026-01-01'
             AND O.order_date < '2026-03-01'
            THEN O.amount
            ELSE 0
        END
    ) AS early_period_spend,

    SUM(
        CASE
            WHEN O.order_date >= '2026-06-01'
             AND O.order_date < '2026-08-01'
            THEN O.amount
            ELSE 0
        END
    ) AS recent_period_spend

FROM Orders AS O

JOIN Customers AS C
    ON O.customer_id = C.customer_id

GROUP BY
    O.customer_id,
    C.customer_name

HAVING
    SUM(
        CASE
            WHEN O.order_date >= '2026-01-01'
             AND O.order_date < '2026-03-01'
            THEN O.amount
            ELSE 0
        END
    ) > 1000

    AND

    SUM(
        CASE
            WHEN O.order_date >= '2026-06-01'
             AND O.order_date < '2026-08-01'
            THEN O.amount
            ELSE 0
        END
    ) < 500

ORDER BY
    early_period_spend DESC;
