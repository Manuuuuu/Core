--NEKO
local SCRIPT_NAME = "AAntiJittering"
local MAJORVERSION = 2015
local SUBVERSION = 10222258 
assert(load(Base64Decode("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"), nil, "bt", _ENV))()