function onCreate()
	makeLuaSprite('clouds2', 'clouds2', -700, -600 );
	makeLuaSprite('clouds3', 'clouds3', -300, -300);
	setScrollFactor('clouds2', 0, 0);
	setScrollFactor('clouds3', 1, 1);
	
	
	addLuaSprite('clouds2', false);
	addLuaSprite('clouds3', false);
	close(true);
end