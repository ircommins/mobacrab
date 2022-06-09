extends KinematicBody
var gravity = -100
var speed = 10

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector3(0,0,0)

func nothing_pressed():
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		return false
	else:
		return true
		
func no_left_right_pressed():
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		return false
	else:
		return true

func no_up_down_pressed():
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		return false
	else:
		return true
# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready to bean")
	

func _physics_process(delta):
	if no_up_down_pressed():
		velocity.x = 0
	if no_left_right_pressed():
		velocity.z = 0
	if Input.is_action_pressed("ui_up"):
		velocity.x = speed
	if Input.is_action_pressed("ui_down"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_left"):
		velocity.z = -speed
	if Input.is_action_pressed("ui_right"):
		velocity.z = speed
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector3.UP)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
