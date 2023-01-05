function onCreate()
	makeLuaSprite('AWESOME', 'AWESOME', -700, -600 );
	setScrollFactor('AWESOME', 0, 0);
	makeLuaSprite('AWESOME2', 'AWESOME2', -600, -700);
	setScrollFactor('AWESOME2', 0.1, 0.1);
	makeLuaSprite('ground', 'ground', 0, -300);
	setScrollFactor('ground', 1, 1);

	addLuaSprite('AWESOME', false);
	addLuaSprite('AWESOME2', false);
	addLuaSprite('ground', false);
	close(true);
end