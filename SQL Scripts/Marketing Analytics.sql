-- 1. Total campaigns
SELECT COUNT(*) FROM campaigns;

-- 2. Campaigns with over 1000 impressions
SELECT * FROM campaigns WHERE impressions > 1000;

-- 3. Click-through rate per campaign
SELECT campaign_id, (SUM(clicks) / SUM(impressions)) * 100 AS ctr
FROM campaigns
GROUP BY campaign_id;

-- 4. Campaigns that generated leads
SELECT DISTINCT campaign_id FROM leads;

-- 5. Average cost per lead
SELECT AVG(cost/lead_count) AS avg_cost_per_lead FROM campaigns;

-- 6. Top 5 campaigns by conversion
SELECT campaign_id, (leads/clicks)*100 AS conversion_rate
FROM campaigns
ORDER BY conversion_rate DESC
LIMIT 5;

-- 7. Monthly lead generation trend
SELECT MONTH(created_at) AS month, COUNT(*) AS leads
FROM leads
GROUP BY MONTH(created_at);

-- 8. Campaigns with impressions but no clicks
SELECT * FROM campaigns WHERE clicks = 0 AND impressions > 0;

-- 9. Campaign with highest ROI
SELECT campaign_id, (revenue - cost) / cost AS roi
FROM campaigns
ORDER BY roi DESC
LIMIT 1;

-- 10. Daily average impressions per campaign
SELECT campaign_id, AVG(impressions) AS avg_impressions
FROM campaign_daily_stats
GROUP BY campaign_id;
