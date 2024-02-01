
#define DEBUG
#define LOG(MSG) \
_name = if (isServer) then { "SERVER" } else { name player }; \
_log = format ['[BAX] System:%1 (%2,%3) %4',_name,_fnc_scriptName,__LINE__,MSG]; \
diag_log _log; \
if !(isServer) then { [_log] remoteExec ["diag_log",2] };
#define LOG_LOCAL(MSG,TARGET) \
_name = if (isServer) then { "SERVER" } else { name player }; \
_log = format ['[BAX] System:%1 (%2,%3) %4',_name,_fnc_scriptName,__LINE__,MSG]; \
diag_log _log; \
if (!isServer && local TARGET) then { [_log] remoteExec ["diag_log",2] };