extends Node3D

var background_viewport
var foreground_viewport
var background_camera
var foreground_camera
# Called when the node enters the scene tree for the first time.
func _ready():
	background_viewport = $Camera3D/background_viewport_container/background_viewport
	foreground_viewport = $Camera3D/foreground_viewport_container/foreground_viewport

	background_camera = $Camera3D/background_viewport_container/background_viewport/background_camera
	foreground_camera = $Camera3D/foreground_viewport_container/foreground_viewport/foreground_camera
	resize()
	pass # Replace with function body.

func resize():
	background_viewport.size = DisplayServer.window_get_size()
	foreground_viewport.size = DisplayServer.window_get_size()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	background_camera.global_transform = GameManager.player.camera_point.global_transform
	foreground_camera.global_transform = GameManager.player.camera_point.global_transform	
	pass
