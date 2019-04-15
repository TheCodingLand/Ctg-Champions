#Tables: 

USERs : 
- DisplayName : Text
- email : text
- password : pwdhash
- notif on / off : bool
- Favorite : rel 1 to 1 team
- score : int

TEAMs :  
- NAME : text
- FLAG URL : text

MATCHEs:
- DATETIME START : datetime
- ENDED : bool
- Score HOME : int 
- Score AWAY : int
- WINNER : rel 1 to 1 TEAM 
- LOSER : rel 1 to 1 TEAM 
- HOME : rel 1 to 1 TEAM
- AWAY : rel 1 to 1 TEAM


VOTEs : 
- rel 1 to 1 to user
- rel 1 to 1 to match
- rel 1 to 1 to team



#SAMPLE Queries :
- leaderboard is just : TOP 5 user sorted by score
- a vote:
    - user A
    - match 1 
    - team England
    - 
    
    





