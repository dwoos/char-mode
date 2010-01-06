* Basics
Name:
Race:
Class:
Notes: /alignment, etc. goes here/

* Abilities
#+TBLNAME: ABILITIES
| Name | Score | Mod |
|------+-------+-----|
| STR  |    16 |   3 |
| DEX  |    12 |   1 |
| CON  |    12 |   1 |
| INT  |    10 |   0 |
| WIS  |    10 |   0 |
| CHA  |    10 |   0 |
#+TBLFM:$3='(score-to-mod $2);N
#+TBLNAME: ABL
| ! | STR    | DEX    | CON    | INT    | WIS    | CHA    |
|---+--------+--------+--------+--------+--------+--------|
| _ | str    | dex    | con    | int    | wis    | cha    |
| # |     16 |     12 | 12     | 10     | 10     | 10     |
| _ | strmod | dexmod | conmod | intmod | wismod | chamod |
| # |      3 |      1 | 1      | 0      | 0      | 0      |
  #+TBLFM:$str=remote(ABILITIES,@2$2)::$strmod=remote(ABILITIES,@2$3)::$dex=remote(ABILITIES,@3$2)::$dexmod=remote(ABILITIES,@3$3)::$con=remote(ABILITIES,@4$2)::$conmod=remote(ABILITIES,@4$3)::$int=remote(ABILITIES,@5$2)::$intmod=remote(ABILITIES,@5$3)::$wis=remote(ABILITIES,@6$2)::$wismod=remote(ABILITIES,@6$3)::$cha=remote(ABILITIES,@7$2)::$chamod=remote(ABILITIES,@7$3)
**TODO: maybe put in formula for modifier, or just do it with external python/js
* Saves
#+TBLNAME: SAVES
| Name | Total | Ability | Base | Special |
|------+-------+---------+------+---------|
| Fort |     1 |       1 |      |         |
| Ref  |     1 |       1 |      |         |
| Will |     0 |       0 |      |         |
#+TBLFM: $2=$3+$4+$5::@2$3=remote(ABL,$conmod)::@3$3=remote(ABL,$dexmod)::@4$3=remote(ABL,$wismod)
* Skills
#+TBLNAME: SKILLS
| 16 |
| 3  |
#+TBLFM: @1$1=remote(ABL,$str)::@2$1=remote(ABL,$strmod)
**TODO: copy in skill table
