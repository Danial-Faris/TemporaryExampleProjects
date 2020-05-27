using Godot;
using System;

public static class ResLoaderController
{
	public static Wall LoadWall()
	{
		var wall = (PackedScene)ResourceLoader.Load("res://Wall.tscn");
		
		Wall newWall = (Wall)wall.Instance();
		
		return newWall;
	}
}
