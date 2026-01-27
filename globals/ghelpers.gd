extends Node

@warning_ignore("untyped_declaration")
func enum_to_string(enum_dict, value: int) -> String:
	#if value < 0 or value >= enum_dict.size():
		#return "UNKNOWN"
	return enum_dict.keys()[value]
