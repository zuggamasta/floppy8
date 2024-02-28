pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- main
g = 0.15
s = 0
timeout = 60
function _init()
	i_game()
	i_bird()
	i_pipes()
end

function _update60()
  s+=0.5
  u_bird()
	u_pipes()
end

function _draw()
  cls(game.bck)
	d_pipes()
  d_bird()
	d_points(bird.pnts)
	d_front()
end
-->8
function i_game()
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
end

-->
-- bird logic
function i_bird()
		bird={sp=1,
				x=64,
				y=64,
				vx=0,
				vy=0,
				n=0,
				pnts=0,
				dead=0

				}
	bird.x=game.minx+(game.maxx-game.minx)/3
	bird.y=game.miny+(game.maxy-game.miny)/2
end

function u_bird()
  bird.n+=1
	bird.y+=bird.vy


	if bird.dead == 1 then
		bird.dead = 0
		_init()
	end

	if bird.dead == 0 then
		--if (btn(0)) then bird.x=bird.x-1 end
		--if (btn(1)) then bird.x=bird.x+1 end
		if (btn(2) or btn(4) or btn(5)) then
			bird.y=bird.y-1
			bird.vy = -2.2356
		else
			bird.vy += g
			bird.n = 0
		end

		if bird.x > pipes.x1 and not pipes.p1 then
			pipes.p1 = true

		if (bird.y < pipes.y1) and (bird.y > pipes.y1-32) then
			bird.pnts +=1
		else
			bird.pnts = 0
			bird.dead = timeout
			game.bck = 8
		end
	end



	else
		bird.dead -=1
		bird.vy += g
		bird.n = 0
	end

	-- clamping
	if bird.dead > 0 then
		if bird.y>game.maxy then
			bird.y=bird.y-1
			bird.vy=-2
		end
	else
		if bird.y > 128 then
			bird.pnts = 0
			bird.dead = timeout
			game.bck = 8
		end
	end
 	
 	if bird.x < game.minx then bird.x = game.minx end
 	if bird.x > game.maxx then bird.x = game.maxx end
 	if bird.y < 0 then bird.y = 0 end
 	

end

function d_bird()
	x= bird.x
	y= bird.y
	size = 2
	if bird.dead > 0 then
		spr(10,x-8,y-8,size,size)
	else
		spr(flr(bird.n/2)%4*2,x-8,y-8,size,size)
	end
end

-->8
-- pipe logic
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

	for i=0,3 do
		id2 = 42+flr(i%4)*2
		spr(id2,pipes.x1,pipes.y1-48-i*16,2,2)
	end
end

-->8
-- extras
function d_coin(x,y)
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

function d_front()
	rectfill(0,0,game.minx,128,0) --left
	rectfill(game.maxx,0,128,128,0) --right
	rectfill(0,0,128,game.miny,0) --top
	rectfill(0,game.maxy,128,128,0) --bottom
	rect(game.minx-1,game.miny-1,game.maxx+1,game.maxy+1,7)
	--debug
	--print(bird.dead,10)
end

__gfx__
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000bbbb0000bbbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbb00000bbbbbbbbbb0777770bbbbbbbbb00000bbbbbbbbbbbbbbbbbbbbbbbbbb0bbbbbbbbbbbbb07070bb077770bbbbbbbbbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbb0777770bbbbbbbb077777770bbbbbbb0777770bbbbbbbbbbbbbbbbbbbbbbbb07000000bbbbbb070707007770770bbbbbbbbbbbbbbbb
bbbbb00000bbbbbbbbbb077777770bbbbbb07777777770bbbbb077777770bbbbbbbbb00000bbbbbbbbb077777770bbbbb070707007700770bbbbbbbbbbbbbbbb
bbbb0777770bbbbbbbb07707777070bbbbb077777777700bbb07707777070bbbbbbb0777770bbbbbbbbb077777770bbbb070707007770770bbbbbbbbbbbbbbbb
bbb077777770bbbbbbb077077770700bbbb0777777777770bb077077770700bbbbb077777770bbbbbbb07070707070bbb070707007770770bbbbbbb00000bbbb
bb07707777070bbbbbb0777777777770bbb000770000000bbb0777777777770bbb07707777070bbbbbb077077707770bbb07070bb077770bbbbbbb0777770bbb
bb077077770700bbbbb000770000000bbbbb077777777770bb000770000000bbbb077077770700bbbbb07070707070bbbb0000bbbb0000bbbbbbbb07070070bb
bb0777777777770bbb00077777777770bbb077077770000bbbb077777777770bbb0777777777770bbbb077777777770bbb0000bbbb0000bbbbbbbb0777770bbb
00007770000000bbb00777077770000bbb0777077770bbbbbbb07777770000bbbb007770000000bbbb00007770777770b07070bbb077770bb00b00077000bbbb
077007777777770bb07770077770bbbbbb0770777770bbbbbbb07707770bbbbbbbb007777777770bb07777777707700b0707770b077777700770777770bbbbbb
00777777770000bbb00000777770bbbbbbb00000070bbbbbbbb00077770bbbbbbbbb0777770000bbbb0000077770770b0707770b07777770b070770000000bbb
b0000777770bbbbbbbbb0700070bbbbbbbbbb0bbb0bbbbbbbbbb0700070bbbbbbbbb0777770bbbbbbbbbb077077070bb0707770b07777770b0707777777770bb
bbbb0777770bbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbb0bbb0bbbbbbbbbb0777770bbbbbbbbbb07000700bbb0707770b07777770b0700000000770bb
bbbb0700070bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0700070bbbbbbbbbbb0bbb0bbbbbb07070bbb077770bb0777777777770bb
bbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbb0bbbbbbbbbbbbbbbbbbbbbbbb0000bbbb0000bbbb00000000000bbb
bbbbbbbbbbbbbbbbb0b077777770bbbbbbbb077777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbb077777770770bb07777777777777700777777777777770
bbbbbbbbbbbbbbbb070077777070bbbbbbbb070777700bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbb07707777770bb07770777777777700777077777777770
bbbbbbbbbbbbbbbb070070777070bbbbbbbb077777770bbbbbb070777770bbbbbbbbbbbbbbbbbbbbbbb0770777770bbb0777077777777770077707777777770b
bbbbbbbbbbbbbbbb070077077070bbbbbbbb077777770bbbbbb077777070bbbbbbbbbbbbbbbbbbbbbbb0777770770bbb0777077777777770077707777777770b
bbbbbbbbbbbbbbbb077777777770bbbbbbbb077777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbb0077770770bbbb077077777777770b0770777777770bb
bbbbbbbbbbbbbbbbb00777777770bbbbbbbb007777770bbbbbb077777770bbbbbbbbbbbbbbbbbbbbbbbb007707770bbbb07707777777700bb0770777777770bb
bbbbbbbbbbbbbbbbbbb007777770bbbbbbbb077777770b0bbbb077777770bbbbbbbbbbbbbbbbbbbbbbbbb07707770bbbb077777777770bbbbb00077777770bbb
bbbbbbbbbbbbbbbbbbb007777770bbbbbbbb077770770070bbb077777770bbbbbbbbbbbbbbbbbbbbbbbbb07707770bbbb07777777770bbbbbbbb077777770bbb
bbbbbbbbbbbbbbbbbbb077077770bbbbbbbb07777770b070bbb077077770bbbbbbbbb00000bbbbbbbbbbb0777770bbbbb07777777070bbbbbbbb077770770bbb
bbbbbbbbbbbbbbbbbbb077777770bbbbbbbb077777700070bbb07707770bbbbbbbbb0777770bbbbbbbbbb0777770bbbbb07777777070bbbbbbbb077770770bbb
bbbbbbbbbbbbbbbbbbb077777700bbbbbbbb077777777070bbb07777770bbbbbbbb007000770bbbbbbbbb0777700bbbbbb077777700bbbbbbbbb0777707770bb
bbbbbbbbbbbbbbbbbbb077777770bbbbbbbb07777777770bbbb07777770bbbbbbbb077700000bbbbbbbbb007770bbbbbbb077777700bbbbbbbbb0777707770bb
bbbbbbbbbbbbbbbbbbb077777770bbbbbbbb0707707700bbbbb077777770bbbbbbb070777770bbbbbbbbbb07770bbbbbbb0777777070bbbbbbbb07777077770b
bbbbbbbbbbbbbbbbbbb077777770bbbbbbbb070777070bbbbbb077777770bbbbbbb070777770bbbbbbbbbb0070bbbbbbbb0777777070bbbbbbb0777770777770
bbbbbbbbbbbbbbbbbbb007777070bbbbbbbb070777770bbbbbb077777070bbbbbbb077777070bbbbbbbbbbb07bbbbbbbbb0777777770bbbbb007777777777770
bbbbbbbbbbbbbbbbbbb077777070bbbbbbbb077777770bbbbbb077777770bbbbbbb077777770bbbbbbbbbbbb0bbbbbbbbb07777777770bbb0777777777777770
0777770777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb077777770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777770777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb077770770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777770777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb070770770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777770777777770bbbbbbbbbbbbbbbbbbbbbbbbbb0700077770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbb0700077770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbb0700077770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777770777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb070777770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777770777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb077777770bbbb00000000000000000000000000000000000000000000000000000000bbbbbbbbbbbbbbbb
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb000077070bbbb000000000000000000000000000000000000000000000000000000000000000000000000
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb077777770bbbb000000000000000000000000000000000000000000000000000000000000000000000000
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb077770770bbbb000000000000000000000000000000000000000000000000000000000000000000000000
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbbb077777770bbbb000000000000000000000000000000000000000000000000000000000000000000000000
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbb077777777700bb000000000000000000000000000000000000000000000000000000000000000000000000
0777777777707770bbbbbbbbbbbbbbbbbbbbbbbbb07770077007770b000000000000000000000000000000000000000000000000000000000000000000000000
0777777777777770bbbbbbbbbbbbbbbbbbbbbbbbbb0000070bb000bb000000000000000000000000000000000000000000000000000000000000000000000000
0777777777707770bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000
