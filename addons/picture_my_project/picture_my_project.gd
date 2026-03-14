@tool
extends EditorPlugin

func screenshot() -> void:
	var atlas: AtlasTexture = AtlasTexture.new()
	var viewport: Viewport
	if EditorInterface.get_edited_scene_root() is Node3D:
		viewport = EditorInterface.get_editor_viewport_3d()
	else:
		viewport = EditorInterface.get_editor_viewport_2d()
	var vt_size: Vector2 = viewport.get_texture().get_size()
	atlas.atlas = viewport.get_texture()
	atlas.region = Rect2(vt_size/2 - Vector2(vt_size.y,vt_size.y)/4,Vector2(vt_size.y,vt_size.y)/2)
	atlas.get_image().save_png("res://addons/picture_my_project/game.png")#addons/picture_my_project/game.png")

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	scene_saved.connect(change_icon)

func change_icon(filepath: String) -> void:
	screenshot()
	ProjectSettings.set("application/config/icon","res://addons/picture_my_project/game.png")
	ProjectSettings.save()
	
func _exit_tree() -> void:
	pass
