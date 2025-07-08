-- 1. Trades in the last year
SELECT COUNT(*) FROM trades
WHERE trade_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 2. Unique stock symbols
SELECT DISTINCT symbol FROM stocks;

-- 3. Top 5 traded stocks by volume
SELECT symbol, SUM(volume) AS total_volume
FROM trades
GROUP BY symbol
ORDER BY total_volume DESC
LIMIT 5;

-- 4. Average price per stock
SELECT symbol, AVG(price) AS avg_price FROM prices GROUP BY symbol;

-- 5. Highest closing price of the year
SELECT symbol, MAX(closing_price) AS max_price
FROM prices
WHERE YEAR(date) = 2025
GROUP BY symbol;

-- 6. Portfolio value by user
SELECT user_id, SUM(quantity * current_price) AS portfolio_value
FROM portfolios
GROUP BY user_id;

-- 7. Stocks with over 20% growth this quarter
SELECT symbol
FROM prices
WHERE quarter_growth > 0.20;

-- 8. Monthly trade volume
SELECT MONTH(trade_date) AS month, SUM(volume) AS volume
FROM trades
GROUP BY MONTH(trade_date);

-- 9. Daily return of top stocks
SELECT symbol, date, 
       (closing_price - opening_price) / opening_price * 100 AS daily_return
FROM prices
WHERE symbol IN ('AAPL', 'GOOG', 'AMZN');

-- 10. Volatility per stock
SELECT symbol, STDDEV(price) AS volatility
FROM prices
GROUP BY symbol;