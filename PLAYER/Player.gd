extends KinematicBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 300

var velocity # = Vector2()
var animatedSprite
var moving
var isJumping
var gravity

# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite = get_node("AnimatedSprite")
	moving = false
	isJumping = false
	velocity = Vector2()
	animatedSprite.play("IDLE")
	gravity = 500 #ProjectSettings.get_setting("physics/2d/default_gravity")

func playAnimation(animationName):
	if (not animatedSprite.get_animation() == animationName):
		animatedSprite.stop()
		print ("animatedSprite.play ",animationName, " : ", velocity.x , ", ",velocity.y)
		animatedSprite.play(animationName)
	


func _physics_process(delta):
# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("right") - Input.get_action_strength("left"))
	# play animation idle or walk
	if (abs(velocity.x) == 0.0 &&  is_on_floor()):
		playAnimation("IDLE")
	elif (abs(velocity.x) > 0.5 && is_on_floor()):
		animatedSprite.set_flip_h(velocity.x > 0.0)
		playAnimation("WALK")
	if (not is_on_floor()):
		playAnimation("JUMP")
	
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta
	
	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("up"):
		playAnimation("JUMP")
		velocity.y = -JUMP_SPEED
