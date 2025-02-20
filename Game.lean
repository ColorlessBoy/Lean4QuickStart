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

欢迎来到 Lean4 快速入门教程！

Lean4 是一个现代的定理证明助手和函数式编程语言。通过本教程，你将学习：

* 基本类型系统
* Eq 类型
* Iff 类型
* And 类型
* Or 类型
* Not 类型
* Exists 类型

本教程采用游戏化的方式，通过循序渐进的关卡设计，帮助你掌握 Lean4 的核心概念。每个关卡都包含详细的解释和练习，让你在实践中学习。

网上很多教程跳过了一些重要的概念，比如类型系统，而是以lean4复杂的策略系统切入，非常不符合学习过程。
因此我编制了本教程。我们将从最基本的类型系统开始，逐步深入，帮助你理解 Lean4 的核心概念。
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
