%%%-------------------------------------------------------------------
%%% @author sergei-rudenkov
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Apr 2016 17.42
%%%-------------------------------------------------------------------
-module(euler6).
-author("sergei-rudenkov").
-import(math, [pow/2]).
-export([problem6/0]).


sum(L) ->
  sum(L, 0).

sum([H|T], Acc) ->
  sum(T, H + Acc);

sum([], Acc) ->
  Acc.

problem6() ->
  pow(sum(lists:seq(1, 100)), 2) - sum([pow(X, 2) || X <- lists:seq(1, 100)]).