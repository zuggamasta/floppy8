pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
// constants
g = 0.1
// globals
x = 64  y = 64 n = 0 s = 0
vy = 0

function _init()
	palt(0, false)
	palt(11, true)
end

function _update()
  move_player()
end

function enemy()
end

function move_player()
		if (btn(0)) then x=x-1 end
  if (btn(1)) then x=x+1 end
  if (btn(2)) then
  	y=y-1
  	vy = -1
  else
  	vy += g
  	n = 0
 	end
 	y+=vy
end

function _draw()
  cls(0)
  
  s+=0.3
  map(s)
  map(s-32)
  if(s>32) then
  	s = 0
  end
  
  draw_log(128-16,0,2,true)
  
  draw_player(x,y)
  
  n+=1
end

function draw_player(x,y)
	spr(flr(n/2)%4*2,x,y,2,2)
end

function draw_log(x,y,h,f)
	spr(14,x,y,2,2)
end
__gfx__
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbb00000bbbbbbbbbb0777770bbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbb0777770bbbbbbbb077777770bbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbb00000bbbbbbbbbb077777770bbbbbb07777777770bbbbb077777770bbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbb0777770bbbbbbbb07707777070bbbbb077777777700bbb07707777070bbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb077777770bbbbbbb077077770700bbbb0777777777770bb077077770700bbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000bbbb
bb07707777070bbbbbb0777777777770bbb000770000000bbb0777777777770bbb07707777070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0777770bbb
bb077077770700bbbbb000770000000bbbbb077777777770bb000770000000bbbb077077770700bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb07070070bb
bb0777777777770bbb00077777777770bbb077077770000bbbb077777777770bbb0777777777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0777770bbb
00007770000000bbb00777077770000bbb0777077770bbbbbbb07777770000bbbb007770000000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00b00077000bbbb
077007777777770bb07770077770bbbbbb0770777770bbbbbbb07707770bbbbbbbb007777777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0770777770bbbbbb
00777777770000bbb00000777770bbbbbbb00000070bbbbbbbb00077770bbbbbbbbb0777770000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb070770000000bbb
b0000777770bbbbbbbbb0700070bbbbbbbbbb0bbb0bbbbbbbbbb0700070bbbbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0707777777770bb
bbbb0777770bbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbb0bbb0bbbbbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0700000000770bb
bbbb0700070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0700070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0777777777770bb
bbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000000bbb
bbb077777770bbbbb0b077777770bbbbbbbb077777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb077770770bbbb070077777070bbbbbbbb070777700bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb070770770bbbb070070777070bbbbbbbb077777770bbbbbb070777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bb0700077770bbbb070077077070bbbbbbbb077777770bbbbbb077777070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bb0700077770bbbb077777777770bbbbbbbb077777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bb0700077770bbbbb00777777770bbbbbbbb007777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb070777770bbbbbbb007777770bbbbbbbb077777770b0bbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb077777770bbbbbbb007777770bbbbbbbb077770770070bbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb000077070bbbbbbb077077770bbbbbbbb07777770b070bbb077077770bbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb077777770bbbbbbb077777770bbbbbbbb077777700070bbb07707770bbbbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb077770770bbbbbbb077777700bbbbbbbb077777777070bbb07777770bbbbbbbb007000770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbb077777770bbbbbbb077777770bbbbbbbb07777777770bbbb07777770bbbbbbbb077700000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bb077777777700bbbbb077777770bbbbbbbb0707707700bbbbb077777770bbbbbbb070777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
b07770077007770bbbb077777770bbbbbbbb070777070bbbbbb077777770bbbbbbb070777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bb0000070bb000bbbbb007777070bbbbbbbb070777770bbbbbb077777070bbbbbbb077777070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbb0bbbbbbbbbbb077777070bbbbbbbb077777770bbbbbb077777770bbbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000038390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000024250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000034350000000000000038390000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000022230000000000000026270000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000032330000000000000036370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000026270000000000000026270000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000036370000000000000036370000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000026270000000000000024250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000036370000000000000034350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000020210000000000000020210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000030310000000000000030310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
