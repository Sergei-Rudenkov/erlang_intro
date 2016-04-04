%%%-------------------------------------------------------------------
%%% @author sergei-rudenkov
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Apr 2016 14.07
%%%-------------------------------------------------------------------
-module(euler4).
-author("sergei-rudenkov").
-export([problem4/0]).

find_palindrome(List1, List2, IfPalindrome) ->
  find_palindrome([X * Y || X <- List1, Y <- List2], IfPalindrome).

find_palindrome(List_of_values, IfPalindrome) ->
  lists:usort(List_of_values),
  lists:max([X || X <- List_of_values, IfPalindrome(X)]).

check_palindrome(N) ->
  (N) == (list_to_integer(lists:reverse(integer_to_list(N)))).

problem4() ->
  find_palindrome(lists:seq(100, 999), lists:seq(100, 999), fun check_palindrome/1).