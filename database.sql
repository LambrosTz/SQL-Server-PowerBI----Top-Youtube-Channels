
--	Creating the Database

CREATE DATABASE youtube_stats

--	Using the Database

USE	youtube_stats

--	Creating a View, keeping the wanted columns

CREATE VIEW view_youtube_statistics AS

SELECT Title, subscribers, video_views, uploads, highest_monthly_earnings
		FROM youtube_channels_statistics
		

--	Checking for duplicates

SELECT Title, COUNT(*) AS duplicates 
FROM view_youtube_statistics 
GROUP BY Title
HAVING COUNT(*) > 1


--	Testing getting rid of duplicates by keeping highest values


SELECT * FROM view_youtube_statistics WHERE Title = '#Refugio Mental' OR Title = 'Like Nastya Vlog' OR Title = 'Preston'

SELECT Title, MAX(subscribers) as subscribers, MAX(video_views) as video_views, MAX(uploads) as uploads, MAX(highest_monthly_earnings) as highest_monthly_earnings
FROM view_youtube_statistics
GROUP BY Title


--	Fixing our View to contain no duplicates, grouping by Title and keeping the maximum value for the columns


ALTER VIEW view_youtube_statistics
AS
SELECT Title,
		MAX(subscribers) as subscribers,
		MAX(video_views) as video_views,
		MAX(uploads) as uploads,
		MAX(highest_monthly_earnings) as highest_monthly_earnings
FROM youtube_channels_statistics
GROUP BY Title


--	Re-checking the final View

SELECT * FROM view_youtube_statistics