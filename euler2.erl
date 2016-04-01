
-module(euler2).
-author("sergei_rudenkov").
-export([problem2/0]).

fib(1) ->
  1;
fib(2) ->
  2;
fib(N) ->
  fib(N-2) + fib(N-1).

even(N) ->
  N rem 2 == 0.

evaluate(Evenable, Condition) ->
  evaluate(1, Evenable, Condition).

evaluate(N, Evenable, Condition) ->
  X = fib(N),
  case Condition(X) of
    true ->
      case Evenable(X) of
        true ->
           io:format("Current even fib number is: ~p ~n", [fib(N)]),
           fib(N) + evaluate(N + 1, Evenable, Condition);
        false ->
          evaluate(N + 1, Evenable, Condition)
      end;
    false ->
      0
  end.

problem2() ->
  evaluate(fun even/1,fun(X) -> X < 4000000 end).