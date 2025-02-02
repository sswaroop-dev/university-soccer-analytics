-- Drop existing tables if they exist
DROP TABLE IF EXISTS [TTS.Play];
DROP TABLE IF EXISTS [TTS.Statistics];
DROP TABLE IF EXISTS [TTS.Opponent];
DROP TABLE IF EXISTS [TTS.Performance];
DROP TABLE IF EXISTS [TTS.Match];
DROP TABLE IF EXISTS [TTS.Season];

-- Create Season Table
CREATE TABLE [TTS.Season] (
    seasonId CHAR(3) NOT NULL,
    seasonYear CHAR(4),
    CONSTRAINT pk_Season_seasonId PRIMARY KEY (seasonId)
);

-- Create Match Table
CREATE TABLE [TTS.Match] (
    matchId CHAR(7) NOT NULL,
    seasonId CHAR(3) NOT NULL,
    matchDate DATE,
    CONSTRAINT pk_Match_matchId PRIMARY KEY (matchId),
    CONSTRAINT fk_Match_seasonId FOREIGN KEY (seasonId)
        REFERENCES [TTS.Season] (seasonId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Performance Table
CREATE TABLE [TTS.Performance] (
    performanceId CHAR(4) NOT NULL,
    seasonId CHAR(3) NOT NULL,
    performanceShotFirstHalf INT,
    performanceShotSecondHalf INT,
    performanceGoalFirstHalf INT,
    performanceGoalSecondHalf INT,
    performancePenaltyAttempt INT,
    performancePenaltyConvert INT,
    performanceHomeWin INT,
    performanceHomeLoss INT,
    performanceHomeDraw INT,
    performanceAwayWin INT,
    performanceAwayLoss INT,
    performanceAwayDraw INT,
    CONSTRAINT pk_Performance_performanceId PRIMARY KEY (performanceId),
    CONSTRAINT fk_Performance_seasonId FOREIGN KEY (seasonId)
        REFERENCES [TTS.Season] (seasonId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Opponent Table
CREATE TABLE [TTS.Opponent] (
    opponentId CHAR(8) NOT NULL,
    opponentName VARCHAR(50),
    CONSTRAINT pk_Opponent_opponentId PRIMARY KEY (opponentId)
);

-- Create Statistics Table
CREATE TABLE [TTS.Statistics] (
    statisticsId CHAR(7) NOT NULL,
    matchId CHAR(7) NOT NULL,
    opponentId CHAR(8) NOT NULL,
    statisticsTeamShots INT,
    statisticsTeamGoal INT,
    statisticsOpponentShots INT,
    statisticsOpponentGoal INT,
    CONSTRAINT pk_Statistics_statisticsId PRIMARY KEY (statisticsId),
    CONSTRAINT fk_Statistics_matchId FOREIGN KEY (matchId)
        REFERENCES [TTS.Match] (matchId)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_Statistics_opponentId FOREIGN KEY (opponentId)
        REFERENCES [TTS.Opponent] (opponentId)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Play Table
CREATE TABLE [TTS.Play] (
    matchId CHAR(7),
    opponentId CHAR(8),
    CONSTRAINT pk_Play_matchId_opponentId PRIMARY KEY (matchId),
    CONSTRAINT fk_Play_matchId FOREIGN KEY (matchId)
        REFERENCES [TTS.Match] (matchId)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_Play_opponentId FOREIGN KEY (opponentId)
        REFERENCES [TTS.Opponent] (opponentId)
        ON DELETE CASCADE ON UPDATE CASCADE
);