%%%-------------------------------------------------------------------
%%% @author sergei_rudenkov
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 02. Apr 2016 3:50 PM
%%%-------------------------------------------------------------------
-module(euler1).
-author("sergei_rudenkov").
-export([problem1/0]).

sumMultiples(Multiples3, Multiples5, Condition) ->
  sumMultiples(1, Multiples3, Multiples5, Condition).

dividable_by3(N)->
  N rem 3 == 0.

dividable_by5(N)->
  N rem 5 == 0.

sumMultiples(N, Multiples3, Multiples5, Condition) ->
  case Condition(N) of
    true ->
      case Multiples3(N) or Multiples5(N) of
        true ->
          N + sumMultiples(N+1, Multiples3, Multiples5, Condition);
        false -> sumMultiples(N+1, Multiples3, Multiples5, Condition)
      end;
    false -> 0
  end.

problem1() ->
  sumMultiples(fun dividable_by3/1, fun dividable_by5/1,fun(X) -> X < 1000 end).

