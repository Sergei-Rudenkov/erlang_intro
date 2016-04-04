%%%-------------------------------------------------------------------
%%% @author sergei-rudenkov
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Apr 2016 15.31
%%%-------------------------------------------------------------------
-module(euler5).
-author("sergei-rudenkov").
-export([problem5/0]).

getNumber(AList) ->
  getNumber(1, AList).

getNumber(N, Evens) ->
  case dividable_by_evens(N, Evens, 1) of
    true ->
      N;
    false ->
      getNumber(N+1, Evens)
  end.

dividable_by_evens(N, AList, NDivider) ->
  case NDivider == 20 of
    true ->
      N rem lists:nth(NDivider -1, AList) == 0;
    false ->
      case N rem lists:nth(NDivider, AList) == 0 of
        true ->
          dividable_by_evens(N, AList, NDivider +1);
        false ->
          N rem lists:nth(NDivider, AList) == 0
      end
  end.



problem5() ->
  getNumber(lists:seq(1, 20)).