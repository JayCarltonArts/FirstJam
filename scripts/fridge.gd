extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interaction_area: InteractionArea =$InteractionArea
@onready var sprite_closed = $Inactive_Sprite
@onready var sprite_opened = $Active_Sprite
#@onready var speech_sound = preload()


const lines: Array[String]=[
	"You opened the Fridge"
]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	interaction_area.interact = Callable(self,"_on_interact")
	



func _on_interact():
	if sprite_closed.is_visible() and player.canPick==true:
		sprite_closed.hide()
		sprite_opened.show()
	elif sprite_opened.is_visible()==true and player.canPick==false:
		pass
	else:
		sprite_closed.show()
		sprite_opened.hide()
