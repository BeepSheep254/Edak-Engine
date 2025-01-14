package;

import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;

function create() {
    /*importLib("flixel.util.FlxTimer");
    importLib("flixel.text.FlxText");
    importLib("WiggleEffect");*/
    var bg = new FlxSprite().makeGraphic(Std.int(FlxG.width * 1.2), Std.int(FlxG.height * 1.2));
    bg.color = 0xFFB3DFd8;
    bg.alpha = 0;

    dia.add(bg);

    new FlxTimer().start(0.83, t -> {
		bg.alpha += (1 / 5) * 0.7;
		if (bg.alpha > 0.7)
			bg.alpha = 0.7;
	}, 5);
    dia.box = new FlxSprite(-20, 45);
    dia.box.frames = Paths.getSparrowAtlas('dialogueBox-evil');
	dia.box.animation.addByPrefix('open', 'Spirit Textbox spawn', 24, false);
	dia.box.animation.addByIndices('idle', 'Spirit Textbox spawn', [10], "", 24);
    dia.box.setGraphicSize(Std.int(dia.box.width * PlayState.daPixelZoom * 0.9));
    dia.box.screenCenter();
    dia.box.y = 350;
    

    var dadPortrait = new FlxSprite(320, 170).loadGraphic(Paths.image("portraits/spiritFaceForward"));
    dadPortrait.setGraphicSize(Std.int(dadPortrait.width * 6));
    dadPortrait.screenCenter();
    dadPortrait.y -= 50;
    dia.portraits["dad"] = dadPortrait;
}

function createPost() {
    dia.speakTxt.size = 32;
    dia.speakTxt.font = 'Pixel Arial 11 Bold';
    dia.speakTxt.x -= 350;
    dia.speakTxt.y += 100;
    dia.speakTxt.sounds = [FlxG.sound.load(_Paths.sound('dialogue/pixelText'), 0.6)];
}

function update(elapsed) {
    if (FlxG.keys.justPressed.ENTER) FlxG.sound.play(_Paths.sound('dialogue/clickText'), 0.8);
}