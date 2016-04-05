%%%-------------------------------------------------------------------
%%% @author sergei-rudenkov
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Apr 2016 15.39
%%%-------------------------------------------------------------------
-module(euler7).
-author("sergei-rudenkov").
-export([problem7/0]).

dividable(Number, NDivider, Count) ->
  case Number rem NDivider == 0 of
    true ->
      case Number == NDivider of
        true ->
          case Count == 10001 of
            false ->
              dividable(Number + 1, 2, Count + 1);
            true ->
              Number
          end;
        false ->
          dividable(Number + 1, 2, Count)
      end;
    false ->
      dividable(Number, NDivider + 1, Count)
  end.


problem7() ->
  dividable(2, 2, 1).