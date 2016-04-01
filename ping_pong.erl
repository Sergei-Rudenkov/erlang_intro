%%%-------------------------------------------------------------------
%%% @author sergei_rudenkov
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Apr 2016 12.04
%%%-------------------------------------------------------------------
-module(ping_pong).
-author("sergei_rudenkov").
-export([start/0, ping/2, pong/0]).
ping(0, Pong_PID) ->
  Pong_PID ! finished,
  io:format("ping finished~n", []);
ping(N, Pong_PID) ->
  Pong_PID ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong, PID:~s ~n", [pid_to_list(Pong_PID)])
  end,
  ping(N - 1, Pong_PID).
pong() ->
  receive
    finished ->
      io:format("Pong finished~n", []);
    {ping, Ping_PID} ->
      io:format("Pong received ping, PID:~s ~n", [pid_to_list(Ping_PID)]),
      Ping_PID ! pong,
      pong()
  end.
start() ->
  Pong_PID = spawn(ping_pong, pong, []),
  spawn(ping_pong, ping, [3, Pong_PID]).


