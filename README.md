![Super Mario Bros](https://github.com/daniellopes04/super-mario-bros/blob/main/graphics/super-mario-bros-text.png)

***Lecture 4* on "S50's Intro to Game Development" course, available on [YouTube](https://www.youtube.com/playlist?list=PLWKjhJtqVAbluXJKKbCIb4xd7fcRkpzoz)**
 
Implementation of a Super Mario Bros clone game.

<!---
![Match-3](https://github.com/daniellopes04/match3/blob/main/graphics/screen1.png)
-->

## Objectives

- [ ] Implement time addition on matches, such that scoring a match extends the timer by 1 second per tile in a match.
- [ ] Ensure Level 1 starts just with simple flat blocks (the first of each color in the sprite sheet), with later levels generating the blocks with patterns on them (like the triangle, cross, etc.). These should be worth more points, at your discretion.
- [ ] Creat random shiny versions of blocks that will destroy an entire row on match, granting points for each block in the row.
- [ ] Only allow swapping when it results in a match. If there are no matches available to perform, reset the board.
- [ ] Program it such that when the player is dropped into the level, they’re always done so above solid ground.
- [ ] In ```LevelMaker.lua```, generate a random-colored key and lock block (taken from ```keys_and_locks.png``` in the ```graphics``` folder of the distro). The key should unlock the block when the player collides with it, triggering the block to disappear.
- [ ] Once the lock has disappeared, trigger a goal post to spawn at the end of the level. Goal posts can be found in ```flags.png```; feel free to use whichever one you’d like! Note that the flag and the pole are separated, so you’ll have to spawn a ```GameObject``` for each segment of the flag and one for the flag itself.
- [ ] When the player touches this goal post, we should regenerate the level, spawn the player at the beginning of it again (this can all be done via just reloading ```PlayState```), and make it a little longer than it was before. You’ll need to introduce ```params``` to the ```PlayState:enter``` function that keeps track of the current level and persists the player’s score for this to work properly.

## Installation

### Build

First, you have to install [LÖVE2D](https://love2d.org/), then run the following.

```bash
git clone https://github.com/daniellopes04/super-mario-bros
cd super-mario-bros
love .
```

### Play

Simply go to ["Releases"](https://github.com/daniellopes04/super-mario-bros/releases) and download the version compatible with your system.

## The game

### Controls

* Keyboard arrows to control Mario
* "Space" to jump

### In-game powerups
