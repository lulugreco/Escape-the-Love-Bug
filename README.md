# BUTTON CONTROLS
| Button | Use in Game |
| -------- | ----------- |
|  Start | Start, restart, and pause |
| Left | Move player left |
| Right | Move player right |
| Up | Move player up |
| Down | Move player down |

# NAVIGATING STATE MACHINE
    - START : This is the initial state of the game, to move to the game hit the start button.

    - GAME : This is where the game runs and is played. From here you can move to LOSE state is you collide with enemy or the walls or move to WIN state if you make it to the end of the maze without any collisions. If you push start button in this state you can move to the PAUSE state.

    - PAUSE : This serves as a pause in button in the middle of the game. You can only navigate here while in the GAME state. To leave the PAUSE state hit the start button once again and reenter the GAME state.

    - WIN : This is one of the final states of the game. You enter this state if you make it to the end of the maze without collisions. You can reenter the START state to replay the game by pressing the start button.

    - LOSE : This is one of the final states of the game. You enter this state if you collide with the walls or enemy. You can reenter the START state to replay the game by pressing the start button.