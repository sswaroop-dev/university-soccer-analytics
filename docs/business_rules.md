# Business Rules and Referential Integrity

## Business Rules

### Performance-Season Rules
- [R1] When a season is deleted, all related performance records should be deleted
- [R2] When season identifier is updated, all related performance records should be updated accordingly

### Match-Season Rules  
- [R3] When a season is deleted, all related match records should be deleted
- [R4] When season identifier is updated, all related match records should be updated accordingly

### Statistics-Match Rules
- [R5] When a match is deleted, related statistics records should be retained 
- [R6] When match identifier is updated, all related statistics records should be updated accordingly

### Statistics-Opponent Rules
- [R7] When an opponent is deleted, related statistics records should be retained
- [R8] When opponent identifier is updated, all related statistics records should be updated accordingly

### Play-Match Rules
- [R9] When a match is deleted, related play records should be retained
- [R10] When match identifier is updated, all related play records should be updated accordingly

### Play-Opponent Rules
- [R11] When an opponent is deleted, related play records should be retained
- [R12] When opponent identifier is updated, all related play records should be updated accordingly
  
## Referential Integrity Constraints

| Relation    | Foreign Key | Base Relation | Primary Key | Rule | ON DELETE | Rule | ON UPDATE |
|-------------|-------------|---------------|-------------|------|-----------|------|-----------|
| Performance | seasonId    | Season        | seasonId    | R1   | CASCADE   | R2   | CASCADE   |
| Match       | seasonId    | Season        | seasonId    | R3   | CASCADE   | R4   | CASCADE   |
| Statistics  | matchId     | Match         | matchId     | R5   | NO ACTION | R6   | CASCADE   |
| Statistics  | opponentId  | Opponent      | opponentId  | R7   | NO ACTION | R8   | CASCADE   |
| Play        | matchId     | Match         | matchId     | R9   | NO ACTION | R10  | CASCADE   |
| Play        | opponentId  | Opponent      | opponentId  | R11  | NO ACTION | R12  | CASCADE   |
