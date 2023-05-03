function onCreate()
	makeLuaSprite('familyguy', 'familyguy', -700, -600 );
	setScrollFactor('familyguy', 0, 0);
	makeLuaSprite('famfg', 'famfg', -1200, -200);
	setScrollFactor('famfg', 1, 1);

	addLuaSprite('familyguy', false);
	addLuaSprite('famfg', false);
	close(true);
end