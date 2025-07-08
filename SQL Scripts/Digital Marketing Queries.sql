-- 1. List all ad campaigns
SELECT * FROM ads;

-- 2. Total clicks per ad
SELECT ad_id, COUNT(*) AS total_clicks FROM clicks GROUP BY ad_id;

-- 3. Conversion rate per ad
SELECT ad_id, 
       (SELECT COUNT(*) FROM conversions WHERE conversions.ad_id = a.ad_id) /
       (SELECT COUNT(*) FROM clicks WHERE clicks.ad_id = a.ad_id) AS conversion_rate
FROM ads a;

-- 4. Top channel by conversions
SELECT channel_id, COUNT(*) AS total_conversions
FROM conversions
GROUP BY channel_id
ORDER BY total_conversions DESC
LIMIT 1;

-- 5. Daily click trends
SELECT DATE(click_time) AS date, COUNT(*) AS clicks
FROM clicks
GROUP BY DATE(click_time);

-- 6. Cost per click per ad
SELECT ad_id, AVG(cost_per_click) FROM ads GROUP BY ad_id;

-- 7. Campaigns with no conversions
SELECT ad_id FROM ads
WHERE ad_id NOT IN (SELECT DISTINCT ad_id FROM conversions);

-- 8. Return on ad spend (ROAS)
SELECT ad_id, SUM(revenue)/SUM(spend) AS roas
FROM ads
GROUP BY ad_id;

-- 9. Average session duration per channel
SELECT channel_id, AVG(session_duration) AS avg_duration
FROM sessions
GROUP BY channel_id;

-- 10. Funnel: Click → Visit → Purchase
SELECT ad_id,
       COUNT(DISTINCT click_id) AS clicks,
       COUNT(DISTINCT visit_id) AS visits,
       COUNT(DISTINCT purchase_id) AS purchases
FROM funnel_data
GROUP BY ad_id;