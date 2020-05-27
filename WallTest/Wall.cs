using Godot;
using System;
 
/// <summary>
/// Base class for all Walls in the game
/// </summary>
public class Wall : Actor
{
	public override Vector2? Interact()
	{
		return Vector2.Zero;
	}
	
	public override void _Process(float delta)
	{
		GD.Print("I am a wall!!!!");
	}
}
