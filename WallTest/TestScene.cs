using Godot;
using System;

public class TestScene : Node2D
{
	public override void _Ready()
	{
		Wall wall = ResLoaderController.LoadWall();
		AddChild(wall);
	}
}
