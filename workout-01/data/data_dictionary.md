data-dictionary
================
Lara Volski
March 11, 2019

team\_name
==========

**Description**
The name of the player's team
**Data Type**
Character
**Units of Measurement**
N/A
**Expected Min and Max**
N/A
**Permitted Values**
All players in this data set belong to the Golden State Warriors.

game\_date
==========

**Description**
The date that the specific game took place
**Data Type**
Character
**Units of Measurement**
Month-Day-Year Format
**Expected Min and Max**
Years should be in between 2016 and 2017
**Permitted Values**
Any date between 2016 and 2017 on which a game was played.

season
======

**Description**
The basketball season
**Data Type**
Integer
**Units of Measurement**
A year
**Expected Min and Max**
2016
**Permitted Values**
The only season listed should be 2016

period
======

**Description**
An NBA game is divided into 4 periods of 12 minutes each. Thus, a value of period = 1 would refer the first period, or the first 12 minutes, of the game.
**Data Type**
Integer
**Units of Measurement**
A period of 12 minute intervals
**Expected Min and Max**
Min = 1 and Max = 4
**Permitted Values**
1, 2, 3, or 4.

minutes\_remaining
==================

**Description**
The amound of time in minutes that remained to be played in a given period.
**Data Type**
Integer
**Units of Measurement**
Minutes composed of 60 seconds each
**Expected Min and Max**
Min = 0 and Max = 11
**Permitted Values**
Whole numbers between 0 and 11

seconds\_remaining
==================

**Description**
The amound of time in seconds that remained to be played in a given period.
**Data Type**
Integer
**Units of Measurement**
Seconds
**Expected Min and Max**
Min = 0 and Max = 59
**Permitted Values**
Whole numbers between 0 and 59

shot\_made\_flag
================

**Description**
Indicates whether a shot was made (y) or missed (n)
**Data Type**
Character
**Units of Measurement**
Binary, y or n
**Expected Min and Max**
N/A
**Permitted Values**
y or n

action\_type
============

**Description**
The details the moves executed by players. A player can either pass by defenders to gain acess to the basket, or they can get a clean pass to a teammate to score a two pointer or a three pointer.
**Data Type**
Character
**Units of Measurement**
N/A
**Expected Min and Max**
N/A
**Permitted Values**
Cutting Finger Roll Layup Shot, Cutting Layup Shot, Driving Bank shot, Driving Finger Roll Layup Shot, Driving Floating Bank Jump Shot, Driving Floating Jump Shot, Driving Hook Shot, Driving Layup Shot, Driving Reverse Layup Shot, Dunk Shot, Fadeaway Jump Shot, Finger Roll Layup Shot, Floating Jump shot, Hook Shot, Jump Bank Shot, Jump Shot, Layup Shot, Pullup Jump shot, Reverse Layup Shot, Running Finger Roll Layup Shot, Running Jump Shot, Running Layup Shot, Running Pull-Up Jump Shot, Running Reverse Layup Shot, Step Back Bank Jump Shot, Step Back Jump shot, Tip Layup Shot, Turnaround Bank shot, Turnaround Fadeaway shot, Turnaround Jump Shot.

shot\_type
==========

**Description**
Indicates whether the basketball shot was a 2-point field goal or a 3-point field goal.
**Data Type**
Character
**Units of Measurement**
N/A
**Expected Min and Max**
N/A
**Permitted Values**
2PT Field Goal or 3PT Field Goal

shot\_distance
==============

**Description**
Indicates the distance to the basket.
**Data Type**
Integer
**Units of Measurement**
Feet
**Expected Min and Max**
min = 0 and max = 94
**Permitted Values**
Anywhere between 0 and 94 feet (the length of a basketball court)

opponent
========

**Description**
What team the game was fought against.
**Data Type**
Character
**Units of Measurement**
N/A
**Expected Min and Max**
N/A
**Permitted Values**
Any other team in the NBA

x
=

**Description**
The x-axis of the court coordinates where a shot occurs
**Data Type**
Integer
**Units of Measurement**
Inches
**Permitted Values**
Can be positive or negative numbers

y
=

**Description**
The y-axis of the court coordinates where a shot occurs
**Data Type**
Integer
**Units of Measurement**
Inches
**Permitted Values**
Can be positive or negative numbers
