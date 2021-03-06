package;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;

import org.flixel.system.input.FlxTouchManager;
import org.flixel.system.input.FlxTouch;

class DeadState extends FlxState
{
	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end
		
		#if !android
		//FlxG.mouse.show();
		#end
		
		var text : FlxText = new FlxText(0, 150, Game.Width, "You Died!", 20);
		
		text.alignment = "center";
		add(text);
		
		text = new FlxText(0, Game.Height/2, Game.Width,
		#if android
		"Touch to play again"
		#else
		"Hit space to play again"
		#end
		, 12);
		
		text.alignment = "center";
		
		add(text);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		var next : Bool = false;
		
		if (FlxG.keys.justPressed("SPACE"))
		{
			next = true;
		}
		
		var touch:FlxTouch;
		for (touch in FlxG.touchManager.touches)
		{
			if (touch.justPressed())
			{
				next = true;
			}
		}
		
		if ( next )
		{
			FlxG.switchState(new GameState());
		}
	}	
}