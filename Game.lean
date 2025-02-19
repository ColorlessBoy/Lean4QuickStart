import Game.Levels.Basic
import Game.Levels.Eq
import Game.Levels.Iff
import Game.Levels.And
import Game.Levels.Or
import Game.Levels.Not
import Game.Levels.Exists

Dependency Basic → Eq → Iff → And → Or → Not → Exists

-- Here's what we'll put on the title screen
Title "Lean4 快速入门"
Introduction
"
# Lean4 快速入门
"

Info "
*Game version: 0.0.1*
"

/-! Information to be displayed on the servers landing page. -/
Languages "Chinese"
CaptionShort "Lean4 快速入门"
CaptionLong "Lean4 快速入门"
-- Prerequisites "" -- add this if your game depends on other games
-- CoverImage "images/cover.png"

/-! Build the game. Show's warnings if it found a problem with your game. -/
MakeGame
