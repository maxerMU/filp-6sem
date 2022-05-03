/*****************************************************************************

		Copyright (c) My Company

 Project:  LAB_11
 FileName: LAB_11.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

predicates
  record(symbol, string)
clauses
  record(max, "79151070860").
  record(egor, "89031001249").
  record(john, "89031041459").
  record(denis, "791511438714").

goal
  record(max, X). %yes
  record(max, "13"). %no solution
  record(X, _). %all names
