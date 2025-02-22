extends StaticBody2D

@onready var interactzone: InteractionArea =$IntractionArea
@onready var sprite_closed = $Closed_Sprite
@onready var sprite_opened = $Open_Sprite
#@onready var speech_sound = preload()


const lines: Array[String]=[
	"You opened the Fridge"
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactzone.interact =Callable(self,"_on_interact")



func _on_interact():
	if sprite_closed.hide == true:
		sprite_closed.show()
		sprite_opened.hide()
	else:
		sprite_closed.hide()
		sprite_opened.show()
