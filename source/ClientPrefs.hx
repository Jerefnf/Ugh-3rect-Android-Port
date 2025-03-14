package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var showFPS:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var iconBoping:Bool = true;
	public static var noteOffset:Int = 0;
	public static var speed:Float = 2;
	public static var noteSize:Float = 0.7;
	public static var scroll:Bool = false;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var timeBarType:String = 'Song Name';
	public static var keTimeBar:Bool = false;
	public static var arrowOpacity:Float = 1;
	public static var laneOpacity:Float = 1;
	public static var healthBarAlpha:Float = 1;
	public static var playHitSounds:Bool = true;
	public static var dynamicCam:Bool = false;
	public static var opponentLaneOpacity:Float = 1;
	public static var healthCounter:Bool = true;
	public static var opponentArrowOpacity:Float = 0.8;
	public static var memoryCounter:Bool = true;
	public static var judgements:Bool = true;
	public static var tabi:Bool = false;
	public static var tabiMax:Int = 3;
	public static var scoreType:String = 'Psych Engine';
	public static var noAntimash:Bool = false;

	//Every key has two binds, these binds are defined on defaultKeys! If you want your control to be changeable, you have to add it on ControlsSubState (inside OptionsState.hx)'s list
	public static var keyBinds:Map<String, Dynamic> = new Map<String, Dynamic>();
	public static var defaultKeys:Map<String, Dynamic>;

	public static function startControls() {
		//Key Bind, Name for ControlsSubState
		keyBinds.set('note_left', [A, LEFT]);
		keyBinds.set('note_down', [S, DOWN]);
		keyBinds.set('note_up', [W, UP]);
		keyBinds.set('note_right', [D, RIGHT]);
		
		keyBinds.set('ui_left', [A, LEFT]);
		keyBinds.set('ui_down', [S, DOWN]);
		keyBinds.set('ui_up', [W, UP]);
		keyBinds.set('ui_right', [D, RIGHT]);
		
		keyBinds.set('accept', [SPACE, ENTER]);
		keyBinds.set('back', [BACKSPACE, ESCAPE]);
		keyBinds.set('pause', [ENTER, ESCAPE]);
		keyBinds.set('reset', [R, NONE]);


		// Don't delete this
		defaultKeys = keyBinds.copy();
	}

	public static function saveSettings() {
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		//FlxG.save.data.cursing = cursing;
		//FlxG.save.data.violence = violence;
		FlxG.save.data.speed = speed;
		FlxG.save.data.scroll = scroll;
		FlxG.save.data.noteSize = noteSize;
		FlxG.save.data.keTimeBar = keTimeBar;
		FlxG.save.data.timeBarType = timeBarType;
		FlxG.save.data.playHitSounds = playHitSounds;
		FlxG.save.data.dynamicCam = dynamicCam;
		FlxG.save.data.scoreType = scoreType;
		FlxG.save.data.healthCounter = healthCounter;
		FlxG.save.data.arrowOpacity = arrowOpacity;
		FlxG.save.data.opponentArrowOpacity = opponentArrowOpacity;
		FlxG.save.data.laneOpacity = laneOpacity;
		FlxG.save.data.opponentLaneOpacity = opponentLaneOpacity;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.iconBoping = iconBoping;
		FlxG.save.data.tabi = tabi;
		FlxG.save.data.tabiMax = tabiMax;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.achievementsMap = Achievements.achievementsMap;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = keyBinds;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.downScroll != null) {
			downScroll = FlxG.save.data.downScroll;
		}
		if(FlxG.save.data.middleScroll != null) {
			middleScroll = FlxG.save.data.middleScroll;
		}
		if(FlxG.save.data.showFPS != null) {
			showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = showFPS;
			}
		}
		if(FlxG.save.data.flashing != null) {
			flashing = FlxG.save.data.flashing;
		}
		if(FlxG.save.data.globalAntialiasing != null) {
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if(FlxG.save.data.noteSplashes != null) {
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if(FlxG.save.data.lowQuality != null) {
			lowQuality = FlxG.save.data.lowQuality;
		}
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
			cursing = FlxG.save.data.cursing;
		}
		if(FlxG.save.data.violence != null) {
			violence = FlxG.save.data.violence;
		}*/
		if(FlxG.save.data.camZooms != null) {
			camZooms = FlxG.save.data.camZooms;
		}
		if(FlxG.save.data.noAntimash != null) {
                        noAntimash = FlxG.save.data.noAntimash;
                }
		if(FlxG.save.data.healthBarAlpha != null) {
                        healthBarAlpha = FlxG.save.data.healthBarAlpha;
                }
		if(FlxG.save.data.laneOpacity != null) {
                        laneOpacity = FlxG.save.data.laneOpacity;
                }
		if(FlxG.save.data.arrowOpacity != null) {
                        arrowOpacity = FlxG.save.data.arrowOpacity;
                }
		if(FlxG.save.data.memoryCounter != null) {
                        memoryCounter = FlxG.save.data.memoryCounter;
                }
		if(FlxG.save.data.playHitSounds != null) {
                        playHitSounds = FlxG.save.data.playHitSounds;
                }
		if(FlxG.save.data.dynamicCam != null) {
                        dynamicCam = FlxG.save.data.dynamicCam;
                }
		if(FlxG.save.data.opponentArrowOpacity != null) {
                        opponentArrowOpacity = FlxG.save.data.opponentArrowOpacity;
                }
		if(FlxG.save.data.opponentLaneOpacity != null) {
                        opponentLaneOpacity = FlxG.save.data.opponentLaneOpacity;
                }
		if(FlxG.save.data.scoreType != null) {
                        scoreType = FlxG.save.data.scoreType;
                }
		if(FlxG.save.data.iconBoping != null) {
                        iconBoping = FlxG.save.data.iconBoping;
                }
		if(FlxG.save.data.tabi != null) {
			tabi = FlxG.save.data.tabi;
                }
		if(FlxG.save.data.tabiMax != null) {
			tabiMax = FlxG.save.data.tabiMax;
                }
		if(FlxG.save.data.timeBarType != null) {
                        timeBarType = FlxG.save.data.timeBarType;
                }
		if(FlxG.save.data.judgements != null) {
                        judgements = FlxG.save.data.judgements;
                }
		if(FlxG.save.data.healthCounter != null) {
                        healthCounter = FlxG.save.data.healthCounter;
                }
		if(FlxG.save.data.keTimeBar != null) {
                        keTimeBar = FlxG.save.data.keTimeBar;
                }
		if(FlxG.save.data.hideHud != null) {
			hideHud = FlxG.save.data.hideHud;
		}
		if(FlxG.save.data.noteOffset != null) {
			noteOffset = FlxG.save.data.noteOffset;
		}
		if(FlxG.save.data.arrowHSV != null) {
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if(FlxG.save.data.speed != null) {
			speed = FlxG.save.data.speed;
		}
		if(FlxG.save.data.scroll != null) {
			scroll = FlxG.save.data.scroll;
		}
		if(FlxG.save.data.noteSize != null) {
			noteSize = FlxG.save.data.noteSize;
		}
		if(FlxG.save.data.imagesPersist != null) {
			imagesPersist = FlxG.save.data.imagesPersist;
			FlxGraphic.defaultPersist = ClientPrefs.imagesPersist;
		}
		if(FlxG.save.data.ghostTapping != null) {
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		
		// flixel automatically saves your volume!
		if(FlxG.save.data.volume != null) {
			FlxG.sound.volume = FlxG.save.data.volume;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99');
		if(save != null && save.data.customControls != null) {
			var loadedControls:Map<String, Dynamic> = save.data.customControls;
			for (control => keys in loadedControls) {
				keyBinds.set(control, keys);
			}
			reloadControls();
		}
	}

	public static function reloadControls() {
		PlayerSettings.player1.controls.setKeyboardScheme(KeyboardScheme.Solo);
	}
}