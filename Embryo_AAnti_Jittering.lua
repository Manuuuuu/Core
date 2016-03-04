--NEKO
local SCRIPT_NAME = "AAntiJittering"
local MAJORVERSION = 2015
local SUBVERSION = 03050327 
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAARB4AAAAAQAAAEFAAACBgAAAxsBAAAYBQQAHQUECRgFBAEdBwQKGgUEAh8FBA52BgADBAQIAXYGAAYFBAgAdAYAB3YAAAAMBAAAYgMIBF8AAgEbBQgCBAQMAXUEAARfAA4BGwUIAgUEDAF1BAAFGgUEAR4HDAl2BgAAYwMMCF4ABgAMBgABGAUQAhoFBAIfBQQOdAYAAXUEAABcAAIAfAIAAQwGAAIaBQQCHQUQDnYGAAMGBBAABwgQARgJFAIACgABdggABgUIFAMYCRQAAAwAB3YIAAVbCggSGgkUAxsJFAN2CgADHAsYFlsICBcFCBgAGg0YAQcMGAIbDRQCdg4AAhwNGB8EDBwAWwwMGZQMAAAhAg45Gg0cAgcMHAF1DAAEIQEiQRsNHAKVDAABKgwORRsNHAKWDAABKg4ORRsNHAKXDAABKgwOSRsNHAKUDAQBKg4OSRsNHAKVDAQBKgwOTRsNHAKWDAQBKg4OTRsNHAKXDAQBKgwOURsNHAKUDAgBKg4OURsNHAKVDAgBKgwOVZYMCAAhAg5VlwwIACEADlmUDAwAIQIOWZUMDAAhAA5dlgwMACECDl2XDAwAIQAOYZQMEAAhAg5hlQwQACEADmWWDBAAIQIOZZcMEAAhAA5ofAIAANQAAAAQPAAAAQUFudGlKaXR0ZXJpbmcAAwAAAAAAfJ9AAwAAAICrRUdBBAkAAAB0b251bWJlcgAEBwAAAHN0cmluZwAEBgAAAG1hdGNoAAQDAAAAX0cABA8AAABHZXRHYW1lVmVyc2lvbgAEEQAAAFJlbGVhc2VzLyVkKy4lZCsABAgAAAAlZCsuJWQrAAMzMzMzMzMZQAQKAAAAUHJpbnRDaGF0AARaAAAAPGZvbnQgY29sb3I9IiM4MUJFRjciPkVtYnJ5byBBQW50aSBKaXR0ZXJpbmc6IDwvZm9udD48Zm9udCBjb2xvcj0iIzgxQkVGMCI+IExvYWRlZDwvZm9udD4ABGcAAAA8Zm9udCBjb2xvcj0iIzgxQkVGNyI+RW1icnlvIEFBbnRpIEppdHRlcmluZzogPC9mb250Pjxmb250IGNvbG9yPSIjODFCRUYwIj4gVmVyc2lvbiBub3QgbWF0Y2hlZDwvZm9udD4ABAgAAABHZXRVc2VyAAQHAAAAbGl2ZXdhAAQGAAAAcHJpbnQABA4AAABHZXRHYW1lUmVnaW9uAAQ1AAAAPGZvbnQgY29sb3I9IiM4MUJFRjciID5FbWJyeW9fQUFudGlfSml0dGVyaW5nPC9mb250PgAEJwAAAC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tAAQJAAAAdG9zdHJpbmcABAIAAAAuAAQMAAAAU0NSSVBUX1BBVEgABA4AAABHZXRDdXJyZW50RW52AAQKAAAARklMRV9OQU1FAARQAAAAaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2xpdmV3YS9Db3JlL21hc3Rlci9FbWJyeW9fQUFudGlfSml0dGVyaW5nLmx1YQAECQAAAExJQl9QQVRIAAQIAAAAXFNhdmVzXAAEBgAAAC50ZW1wAAQHAAAAVXBkYXRlAAQGAAAAY2xhc3MABAwAAABqaXR0ZXJfRGF0YQAEBgAAAGpEQVRBAAAEBwAAAF9faW5pdAAEFgAAAF9fR2VuZXJhdGVSZXNldFNwZWxscwAEFwAAAF9fR2VuZXJhdGVTcGVsbEF0dGFja3MABBYAAABfX0dlbmVyYXRlTm9uZUF0dGFja3MABA4AAABBZGRSZXNldFNwZWxsAAQPAAAAQWRkU3BlbGxBdHRhY2sABA4AAABBZGROb25lQXR0YWNrAAQNAAAASXNSZXNldFNwZWxsAAQJAAAASXNBdHRhY2sABAsAAABpb3JiV2Fsa2VyAAQMAAAAc3dpbmdfU3RhcnQABA8AAABHZXRTd2luZ0hvbGRBQQAEDAAAAE9uQW5pbWF0aW9uAAQPAAAAT25Qcm9jZXNzU3BlbGwABBAAAABPblByb2Nlc3NBdHRhY2sABBIAAABPblByb2Nlc3NTcGVsbF9EbwAEDQAAAE9uU2VuZFBhY2tldAAEBwAAAE9uTG9hZAAEBwAAAE9uVGljawAUAAAADAAAACIAAAAAAAmWAAAABkBAAAeAQABFAIAAgcAAAB2AgAEIAACABgBAAFgAQQAXwCKABgBAAAyAQQCBwAEAHYCAAQgAgIIGAEAADABCAB1AAAEGQEEAGwAAABcAIIAGQEIAB4BCAEZAQgBHgMIAhkBBAMHAAgBdgIABgQADAB2AgAFGQEIAR4DCAIZAQgCHgEIBxkBB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"), nil, "bt", _ENV))()