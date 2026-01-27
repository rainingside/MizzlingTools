class_name Array2D

var Row:int = 1
var Column:int = 1
var Data:Array = []

func _init(row:int, column:int) -> void:
	Row = row
	Column = column
	Data.resize(Row * Column)

func set_value(row:int, column:int, value:Variant) -> void:
	Data[row * Column + column] = value

func get_value(row:int, column:int) -> Variant:
	return Data[row * Column + column]
