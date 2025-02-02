# Business Rules and Referential Integrity

## Business Rules

### Season Related Rules
- [R1] When a season is deleted, all related performance records should be deleted.
- [R2] When season identifier is updated, all related performance records should be updated accordingly.
- [R3] When a season is deleted, all related match records should be deleted.
- [R4] When season identifier is updated, all related match records should be updated accordingly.

### Match Related Rules
- [R5] When a match is deleted, all related statistics records should be deleted.
- [R6] When match identifier is updated, all related statistics records should be updated accordingly.

### Opponent Related Rules
- [R7] When an opponent is deleted, all related statistics records should be deleted.
- [R8] When opponent identifier is updated, all related statistics records should be updated accordingly.

### Combined Rules
- [R9] When a match is deleted then the corresponding opponent and statistics details should be retained.
- [R10] When match identifier is updated then the corresponding opponent and statistics details should be updated accordingly.
- [R11] When an opponent is deleted then the corresponding match and statistics details should be retained.
- [R12] When opponent identifier is updated then the corresponding match and statistics details should be updated accordingly.

## Referential Integrity Constraints

| Relation    | Foreign Key | Base Relation | Primary Key | Business Rule | ON DELETE | ON UPDATE |
|-------------|-------------|---------------|-------------|---------------|-----------|-----------|
| Performance | seasonId    | Season        | seasonId    | R1           | CASCADE   | CASCADE   |
| Match       | seasonId    | Season        | seasonId    | R3           | CASCADE   | CASCADE   |
| Statistics  | matchId     | Match         | matchId     | R5           | NO ACTION | CASCADE   |
| Statistics  | opponentId  | Opponent      | opponentId  | R7           | NO ACTION | CASCADE   |
| Play        | matchId     | Match         | matchId     | R9           | NO ACTION | CASCADE   |
| Play        | opponentId  | Opponent      | opponentId  | R11          | NO ACTION | CASCADE   |
