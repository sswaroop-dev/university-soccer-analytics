-- Problem Statement 1
DROP VIEW IF EXISTS TeamPenaltyPerformance;
GO
CREATE VIEW TeamPenaltyPerformance AS
SELECT 
   seasonId,
   SUM(performancePenaltyConvert) AS totalPenaltiesConverted,
   SUM(performancePenaltyAttempt) AS totalPenaltiesAttempted,
   CAST(ROUND(SUM(performancePenaltyConvert) * 100.0 / 
       SUM(performancePenaltyAttempt), 2) AS DECIMAL(5, 2)) AS penaltyConversionRate
FROM 
   [TTS.Performance]
GROUP BY 
   seasonId;
GO
-- Now query the view in a separate batch:
SELECT * FROM TeamPenaltyPerformance;

-- Problem Statement 2
DROP VIEW IF EXISTS TeamHomeAwayPerformance;
GO
CREATE VIEW TeamHomeAwayPerformance AS
SELECT 
   seasonId,
   SUM(performanceHomeWin) AS totalHomeWins,
   SUM(performanceHomeLoss) AS totalHomeLosses, 
   SUM(performanceHomeDraw) AS totalHomeDraws,
   SUM(performanceAwayWin) AS totalAwayWins,
   SUM(performanceAwayLoss) AS totalAwayLosses,
   SUM(performanceAwayDraw) AS totalAwayDraws
FROM 
   [TTS.Performance]
GROUP BY 
   seasonId;
GO
-- Now query the view in a separate batch:
SELECT * FROM TeamHomeAwayPerformance;

-- Problem Statement 3
DROP VIEW IF EXISTS TeamFirstHalfVsSecondHalf;
GO
CREATE VIEW TeamFirstHalfVsSecondHalf AS
SELECT 
   seasonId,
   SUM(performanceShotFirstHalf) AS totalFirstHalfShots,
   SUM(performanceShotSecondHalf) AS totalSecondHalfShots,
   SUM(performanceGoalFirstHalf) AS totalFirstHalfGoals,
   SUM(performanceGoalSecondHalf) AS totalSecondHalfGoals
FROM 
   [TTS.Performance]
GROUP BY 
   seasonId;
GO
-- Now query the view in a separate batch:
SELECT * FROM TeamFirstHalfVsSecondHalf;

-- Problem Statement 4
DROP VIEW IF EXISTS TeamStatsAgainstOpponents;
GO
CREATE VIEW TeamStatsAgainstOpponents AS
SELECT 
   pe.matchId,
   o.opponentName,
   s.statisticsTeamShots,
   s.statisticsTeamGoal, 
   s.statisticsOpponentShots,
   s.statisticsOpponentGoal
FROM 
   [TTS.Play] pe
JOIN 
   [TTS.Opponent] o ON pe.opponentId = o.opponentId
JOIN 
   [TTS.Statistics] s ON pe.matchId = s.statisticsId;
GO
-- Now query the view in a separate batch:
SELECT * FROM TeamStatsAgainstOpponents;