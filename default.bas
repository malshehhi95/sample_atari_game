 rem batari Basic Program
 rem Created 9/11/2024 8:32:02 PM by Visual bB Version 1.0.0.544
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 COLUBK = 174 : COLUPF = 164
 player0x = 30 : player0y = 50
 player1x = 130 : player1y = 20
 missile0x=150
 NUSIZ0=16


sprites

player
 player0:
 %00111100
 %01000010
 %10011001
 %10100101
 %10000001
 %10100101
 %01000010
 %00111100
end


enemy
 player1:
 %01010100
 %01101100
 %10010010
 %10111010
 %01111100
 %01111100
 %00111000
 %00000000
end

 if missile0x > 161 then goto skip
 missile0x =  missile0x +2 : goto draw_loop

skip
 if joy0fire then missile0y = player0y - 2 : missile0x = player0x



draw_loop
 drawscreen

 if player1x < player0x then player1x = player1x + 1
 if player1x > player0x then player1x = player1x - 1
 if player1y < player0y then player1y = player1y + 1
 if player1y > player0y then player1y = player1y - 1



 if joy0up then player0y = player0y - 1
 if joy0down then player0y = player0y + 1
 if joy0left then player0x = player0x -1
 if joy0right then player0x = player0x +1


 if collision(missile0 , player1) then score = score+1: player1x = 130 : player1y = rand/2 : missile0x = 161
 if collision(player0, player1) then score= 0 : player1x = 130 : player1y = rand/2 : COLUBK = 174 : COLUPF = 164


 dim _sc1 = score
 dim _sc2 = score +1
 dim _sc3 = score +2

 if _sc3 > $10 then COLUBK = 30 : COLUPF = 16
 if _sc3 > $20 then COLUBK = 206 : COLUPF = 192
 if _sc3 > $30 then COLUBK = 78 : COLUPF = 64


 goto sprites
