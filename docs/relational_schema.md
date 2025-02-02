# TTS University Soccer Analysis - Relational Schema

## Tables and Relationships

### Season
- **Season** (seasonId, seasonYear)
  - Primary Key: seasonId

### Performance
- **Performance** (performanceId, seasonId, performanceShotFirstHalf, performanceShotSecondHalf, performanceGoalFirstHalf, performanceGoalSecondHalf, performancePenaltyAttempt, performancePenaltyConvert, performanceHomeWin, performanceHomeLoss, performanceHomeDraw, performanceAwayWin, performanceAwayLoss, performanceAwayDraw)
  - Primary Key: performanceId
  - Foreign Key: seasonId references Season(seasonId)

### Match
- **Match** (matchId, matchDate, seasonId)
  - Primary Key: matchId
  - Foreign Key: seasonId references Season(seasonId)

### Opponent
- **Opponent** (opponentId, opponentName)
  - Primary Key: opponentId

### Statistics
- **Statistics** (statisticsId, matchId, opponentId, statisticsTeamShots, statisticsTeamGoal, statisticsOpponentShots, statisticsOpponentGoal)
  - Primary Key: statisticsId
  - Foreign Key: matchId references Match(matchId)
  - Foreign Key: opponentId references Opponent(opponentId)

### Play
- **Play** (matchId, opponentId)
  - Primary Key: (matchId, opponentId)
  - Foreign Key: matchId references Match(matchId)
  - Foreign Key: opponentId references Opponent(opponentId)
