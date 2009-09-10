% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (passthrough_route_handler).
-behaviour (route_handler).
-include ("wf.inc").
-include ("simplebridge.hrl").
-export ([
	init/1, 
	finish/1
]).

init(Module) -> 
	% Some values...
	RequestBridge = wf_context:request_bridge(),
	Path = RequestBridge:path(),
	
	% Update the page_context with the path and module.
	wf_context:page_module(Module),
	wf_context:path_info(Path),
	{ok, Module}.
		
finish(Module) -> 
	{ok, Module}.