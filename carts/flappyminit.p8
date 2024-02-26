pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- constants
g = 0.133
-- globals
s = 0
timeout = 60
function _init()
	palt(0, false)
	palt(11, true)
	randomvalue = 47
	game={
		minx=1+rnd(randomvalue),
		miny=1+rnd(randomvalue),
		maxx=127-rnd(randomvalue),
		maxy=127-rnd(randomvalue),
		bck=0,
	}
	bird={sp=1,
			x=64,
			y=64,
			vx=0,
			vy=0,
			n=0,
			pnts=0,
			dead=0

			}
	bird.x=game.minx+(game.maxx-game.minx)/2
	bird.y=game.miny+(game.maxy-game.miny)/2

	i_pipes()

end

-->8

function _update60()
  s+=0.5
  u_player()
	u_pipes()
end

function i_pipes()
	pipes={
		x1=game.maxx,
		y1=rnd((game.maxy-game.miny)/2)+game.miny+(game.maxy-game.miny)/2,
		p1=false
	}

end

function u_pipes()
	pipes.x1-=1
	if pipes.x1 < game.minx-16 then
		pipes.x1=game.maxx
		pipes.y1=rnd(32)+48
		pipes.p1=false
	end
end

function d_pipes()
	spr(56,pipes.x1,pipes.y1,2,1)
	for i=0,5 do
		id = 34+flr(i%3)*2
		spr(id,pipes.x1,pipes.y1+8+i*16,2,2)
	end
end

-->8
function _draw()
  cls(game.bck)

	d_pipes()
  d_bird(bird.x,bird.y)
  
  bird.n+=1

	rectfill(0,0,game.minx,128,0) --left
	rectfill(game.maxx,0,128,128,0) --right
	rectfill(0,0,128,game.miny,0) --top
	rectfill(0,game.maxy,128,128,0) --bottom
	rect(game.minx-1,game.miny-1,game.maxx+1,game.maxy+1,7)
	--debug
	--print(bird.dead,10)

	d_points(bird.pnts)

end

function d_bird(x,y)

	size = 2
	if bird.dead > 0 then
		spr(10,x-8,y-8,size,size)
	else
		spr(flr(bird.n/2)%4*2,x-8,y-8,size,size)
	end
end

function draw_coin(x,y)
	spr(10+flr(s/4)%4,x,y)
end

function d_points(points)
	x = game.minx+(game.maxx-game.minx)/2
	y = game.miny+8

	print(tostr(points),x+1,y,0)
	print(tostr(points),x,y+1,0)
	print(tostr(points),x-1,y,0)
	print(tostr(points),x,y-1,0)
	print(tostr(points),x,y,7)

	
end
-->8
function u_player()

	if bird.dead == 1 then
		bird.dead = 0
		_init()
	end

	if bird.dead == 0 then
		if (btn(0)) then bird.x=bird.x-1 end
		if (btn(1)) then bird.x=bird.x+1 end
		if (btn(2)) then
			bird.y=bird.y-1
			bird.vy = -2.2356
		else
			bird.vy += g
			bird.n = 0
		end
	else
		bird.dead -=1
		bird.vy += g
		bird.n = 0
	end

	
	
 	
 	if bird.y>game.maxy then
 		bird.y=bird.y-1
 		bird.vy=-2
 	end
 	
 	if bird.x < game.minx then bird.x = game.minx end
 	if bird.x > game.maxx then bird.x = game.maxx end
 	
 	bird.y+=bird.vy
 	
 	if bird.y < game.miny then bird.y = game.miny end

	if bird.x > pipes.x1 and not pipes.p1 then
		pipes.p1 = true

		if bird.y < pipes.y1 then
			bird.pnts +=1
		else
			bird.pnts = 0
			bird.dead = timeout
			game.bck = 8
		end
	end
		

end

__gfx__
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000bbbb0000bbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbb00000bbbbbbbbbb0777770bbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbb0bbbbbbbbbbbb07070bbb077770bbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbb0777770bbbbbbbb077777770bbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbb07000000bbbbb0707770b07777770bbbbbbbbbbbbbbbb
bbbbb00000bbbbbbbbbb077777770bbbbbb07777777770bbbbb077777770bbbbbbbbb00000bbbbbbbbb077777770bbbb0707770b07777770bbbbbbbbbbbbbbbb
bbbb0777770bbbbbbbb07707777070bbbbb077777777700bbb07707777070bbbbbbb0777770bbbbbbbbb077777770bbb0707770b07777770bbbbbbbbbbbbbbbb
bbb077777770bbbbbbb077077770700bbbb0777777777770bb077077770700bbbbb077777770bbbbbbb07070707070bb0707770b07777770bbbbbbb00000bbbb
bb07707777070bbbbbb0777777777770bbb000770000000bbb0777777777770bbb07707777070bbbbbb077077707770bb07070bbb077770bbbbbbb0777770bbb
bb077077770700bbbbb000770000000bbbbb077777777770bb000770000000bbbb077077770700bbbbb07070707070bbbb0000bbbb0000bbbbbbbb07070070bb
bb0777777777770bbb00077777777770bbb077077770000bbbb077777777770bbb0777777777770bbbb077777777770bbbbbbbbbbbbbbbbbbbbbbb0777770bbb
00007770000000bbb00777077770000bbb0777077770bbbbbbb07777770000bbbb007770000000bbbb00007770777770bbbbbbbbbbbbbbbbb00b00077000bbbb
077007777777770bb07770077770bbbbbb0770777770bbbbbbb07707770bbbbbbbb007777777770bb07777777707700bbbbbbbbbbbbbbbbb0770777770bbbbbb
00777777770000bbb00000777770bbbbbbb00000070bbbbbbbb00077770bbbbbbbbb0777770000bbbb0000077770770bbbbbbbbbbbbbbbbbb070770000000bbb
b0000777770bbbbbbbbb0700070bbbbbbbbbb0bbb0bbbbbbbbbb0700070bbbbbbbbb0777770bbbbbbbbbb077077070bbbbbbbbbbbbbbbbbbb0707777777770bb
bbbb0777770bbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbb0bbb0bbbbbbbbbb0777770bbbbbbbbbb07000700bbbbbbbbbbbbbbbbbbbb0700000000770bb
bbbb0700070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0700070bbbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbb0777777777770bb
bbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000000000bbb
bbb077777770bbbbb0b077777770bbbbbbbb077777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbb0000bbbb0000bbbb0000bbbb0000bbbbbbbbbbbbbbbbbb
bbb077770770bbbb070077777070bbbbbbbb070777700bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbb07070bb077770bb07070bbb077770bbbbbbbbbbbbbbbbb
bbb070770770bbbb070070777070bbbbbbbb077777770bbbbbb070777770bbbbbbbbbbbbbbbbbbbbb0707070077707700707770b07777770bbbbbbbbbbbbbbbb
bb0700077770bbbb070077077070bbbbbbbb077777770bbbbbb077777070bbbbbbbbbbbbbbbbbbbbb0707070077007700707770b07777770bbbbbbbbbbbbbbbb
bb0700077770bbbb077777777770bbbbbbbb077777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbb0707070077707700707770b07777770bbbbbbbbbbbbbbbb
bb0700077770bbbbb00777777770bbbbbbbb007777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbb0707070077707700707770b07777770bbbbbbbbbbbbbbbb
bbb070777770bbbbbbb007777770bbbbbbbb077777770b0bbbb077777770bbbbbbbbbbbbbbbbbbbbbb07070bb077770bb07070bbb077770bbbbbbbbbbbbbbbbb
bbb077777770bbbbbbb007777770bbbbbbbb077770770070bbb077777770bbbbbbbbbbbbbbbbbbbbbb0000bbbb0000bbbb0000bbbb0000bbbbbbbbbbbbbbbbbb
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
