@echo off
	setlocal enabledelayedexpansion enableextensions
	set "cmd.con=HKCU\Console\%%SystemRoot%%_system32_cmd.exe /v"
	set  gpu=core\MineColor.dll
	set "ram=!tmp!\WRAM.tmp"
	del "%tmp%\_$xy.bat">nul 2>&1
	md Worlds >nul 2>&1
	if [%1]==[ok] goto:init
	Reg export HKCU\Console Backup.reg>nul
	Reg delete HKCU\Console\%%SystemRoot%%_system32_cmd.exe /f>nul
for %%a in (
	"FaceName /t REG_SZ /d "Terminal" /f"
	"FontFamily /t REG_DWORD /d 48 /f"
	"FontSize /t REG_DWORD /d 1024294 /f"
	"FontWeight /t REG_DWORD /d 700 /f"
	"ScreenBufferSize /t REG_DWORD /d 13107280 /f"
	"CursorSize /t REG_DWORD /d 0 /f"
) do (
	set "param=%%a"
	set "param=!param:~1!"
	set "param=%cmd.con% !param:~0,-1!"
	Reg Add !param! >nul
)
	start /high cmd /q /k "%~0" ok
for %%a in (
	"FaceName /f"
	"FontFamily /f"
	"FontSize /f"
	"FontWeight /f"
	"CursorSize /f"
) do (
	set "param=%%a"
	set "param=!param:~1!"
	set "param=%cmd.con% !param:~0,-1!"
	Reg Delete !param! >nul
)
	Reg import Backup.reg>nul
	Del /Q "screen.size">nul
	Del /Q "Backup.reg">nul
	exit
:Init
cls
	(
	echo Set objshell = createobject("wscript.shell"^)
	echo Objshell.sendkeys "{Bs}"
	)>"!tmp!\sp.vbs"
mode con cols=64 lines=21
Title BatchCraft - Version 1.3 beta - By Honguito98^^!
for %%a in (
"ÛÛÛÛÛ   ÛÛÛÛ  ÛÛÛÛÛ ÛÛÛÛ Û  .Û ÛÛÛÛÛ ÛÛÛÛÛ   ÛÛÛÛ  ÛÛÛÛÛ ÛÛÛÛÛ "
"Û  . Û Û. . Û . Û.  Û .  Û . Û Û. .  Û..  Û Û. . Û Û    .  Û. ."
"Û..  Û Û . .Û . Û  .Û  . Û.  Û Û . . Û. . Û Û .. Û ÛÛÛÛÛ . Û. ."
"Û ÛÛÛ  ÛÛÛÛÛÛ  .Û.  Û .  ÛÛÛÛÛ Û. .  Û ÛÛÛ  ÛÛÛÛÛÛ Û . . . Û.. "
"Û..  Û Û .  Û.. Û   Û  . Û.  Û Û . . Û. .Û  Û .. Û Û. . .  Û  ."
"ÛÛÛÛÛ  Û.  .Û . Û  .ÛÛÛÛ Û . Û ÛÛÛÛÛ Û .  Û Û. . Û Û .   . Û.  "
"    .   .    .     __________________________  .  . . . . . .. "
" .      .    .  . ÝMineCraft in Batch EditionÝ .  . .   .   .  "
" .  .  .  .    .  `--------------------------'  . . . .   . . ."
"  .  .    .  .  .   .   Ver 1.3 beta . . .   . .  .    .   .  ."
"  .    .    .   .   .    .   .   .    .   .    .   .   .  .   ."
" . .  .  .  .  .   .  . ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿. .   .  .   .   .   . ."
" . .  .    .   .  .  .  ³ Start Game  ³ . .   .  .   .   . .  ."
" .  .   .   .    .    . ³    _______  ³ .   .   .   .  . .   . "
" .  .   .   .    .    . ³   /      /Ý ³ .   .   .   .  . .   . "
" .  .   .   .    .    . ³   °°°°°°° Ý ³ .   .   .   .  . .   . "
" .  .   .   .    .    . ³   °°°°°°° Ý ³ .   .   .   .  . .   . "
" .  .   .   .    .    . ³   °°°°°°° Ý ³  .   .   .   .  . .   ."
" .    . .    .    .     ³   °°°°°°°/  ³ .   .   .   .  . .   . "
"                        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ          Honguito98^^^!¸") do echo.%%~a
!gpu! mouse >nul
:phase2
set file=
cls
echo.ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄ¿
echo.³        .::{New World}::.        ³Start^^!³ Exit  ³Delete ³
echo.ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÙ	
call:list
:select_w
	title BatchCraft [World Selected: '!file!' ] %x%,%y% !sel.wld!
	for /f "tokens=1,2,3" %%a in ('!gpu! mouse') do set/a x=%%b,y=%%c
	call:list
	call "!tmp!\_$xy.bat" !x! !y! 2>nul
	if !y! geq 1 if !y! leq 3 if !x! geq 2 if !x! leq 34 goto:new
	if !y! geq 1 if !y! leq 3 if !x! geq 36 if !x! leq 41 goto:start
	if !y! geq 1 if !y! leq 3 if !x! geq 43 if !x! leq 49 exit
	if !y! geq 1 if !y! leq 3 if !x! geq 51 if !x! leq 57 goto:del
	goto:select_w

:List
	!gpu! 0 0 1,4
	set/a fi=4,max=17,comax=1
	for /f "tokens=*" %%a in ('"dir Worlds\*.bc /b 2>nul"') do (
	if not !comax! geq !max! (
echo.if [%%1]==[2] if [%%2]==[!fi!] %%Gpu%% 10 0 2,!fi! O^&set "file=%%a">>"%tmp%\_$xy.bat"
	echo.[ ] %%a)
	set/a fi+=1,comax+=1)
	goto:eof
:del
	set todel=
	if not defined file (
	!gpu! 12 4 13,10 "[Select a World Please]"
	ping -n 2 localhost>nul&goto:phase2
)
	!gpu! 12 0 13,10 "[Are You Sure?]"
	!gpu! 12 0 13,11 "[Yes/No]:      "
	!gpu! 10 0 22,11
	start wscript.exe "%tmp%\sp.vbs"&set/p todel=
	if not defined todel goto:del
	if /i [!todel!]==[Yes] del "worlds\!file!" >nul&goto:phase2
	if /i [!todel!]==[No] goto:phase2
	goto:del
:new
	cls
	set file=
	!gpu! 11 0 10,3 "[Name of World to create:]"
	!gpu! 14 0 10,5 "-To Finish and start the game press enter-"
	!gpu! 10 0 10,8 "->"
	start wscript.exe "!tmp!\sp.vbs" 
	set/p file=
	if not defined file    goto:new
	if exist "core\!file!" goto:new
	set "file=!file!.bc"
	cls
	!gpu! 10 0 8,4 "Creating !file!. This may take several seconds..."
	for /l %%y in (2,1,5)  do (
	for /l %%x in (2,1,46) do (
	if %%x leq 9 (set xc=0%%x) else (set xc=%%x)
	if %%y leq 9 (set yc=0%%y) else (set yc=%%y)
	set "sky.co=!sky.co!!xc!,!yc!;"
))
	for /l %%y in (6,1,25) do (
	for /l %%x in (2,1,46) do (
	if %%x leq 9 (set xc=0%%x) else (set xc=%%x)
	if %%y leq 9 (set yc=0%%y) else (set yc=%%y)
	set "grass.co=!grass.co!!xc!,!yc!;"))

        for /l %%# in (10,1,45) do (
	!gpu! 12 4 %%#,6 $178
	SET /a _rand=%RANDOM%*2/32768+1
	!gpu! sleep !_rand!80
)
(
	echo.11
	echo.3
	echo.!sky.co!
	echo.$178
	echo.-
	echo.10
	echo.2
	echo.!grass.co!
	echo.$178
	echo.-
)>>"Worlds\!file!"
:start
	if not defined file (
	!gpu! 12 4 13,10 "[Select a World Please]"
	ping -n 2 localhost>nul&goto:phase2
)
	cls
	mode con cols=48 lines=33
	set clr1=
	set tmp_=false
	for /l %%y in (2,1,25) do (
	for /l %%x in (2,1,46) do (set "clr1=!clr1!%%x,%%y;"))
(
	echo.0
	echo.0
	echo.!clr1!
	echo.Û
	echo.-
)>"!tmp!\clr.dat"
	title Please Wait^^!...
	set clean=
	for /l %%# in (1,1,30) do set "clean=!clean!."
	set coord=
	set "item=&call:toRAM %%c%% %%s%% %%tip%%&call:GetItem"
	set "put=&call:Getplaced"
	set "box.1=19,28 12 7 $176 "Brick Block""
	set "box.2=21,28 10 2 $178 "Grass Block""
	set "box.3=23,28 15 7 $178 "Quartz Block""
	set "box.4=25,28 08 7 $178 "Boulder""
	set "box.5=27,28 02 4 $177 "Wood Block""
	set first=box.1
	set cp.1=1252
	Chcp !cp.1! >nul
	!gpu! 14 6 1,1 É
	for /l %%a in (2,1,46) do !gpu! 14 6 %%a,1 Í
	!gpu! 14 6 47,1 »
	for /l %%a in (2,1,25) do !gpu! 14 6  1,%%a º
	for /l %%a in (2,1,25) do !gpu! 14 6 47,%%a º
	!gpu! 14 6 1,26 È
	for /l %%a in (2,1,46) do !gpu! 14 6 %%a,26 Í
	!gpu! 14 6 47,26 ¼
	!gpu! 14 6 07,1 ".::{BatchCraft - By Honguito98}::."
	!gpu! 10 2 18,27 "ÚÄÂÄÂÄÂÄÂÄÂÄ¿"
	!gpu! 10 2 18,28 "³ ³ ³ ³ ³ ³:³"
	!gpu! 10 2 18,29 "ÀÄÁÄÁÄÁÄÁÄÁÄÙ"
	!gpu! 07 0 18,30 " O O O O O"
	!gpu! 12 4 1,27 "[ ]Break Block"
	!gpu! 11 3 1,28 "[ ]Save World "
	!gpu! 13 5 1,29 "[ ]Main Menu  "
	call:getItem
	!gpu! /f "worlds\!file!" || goto:phase2
	copy  /y "worlds\!file!" !ram! >nul
:main
	title BatchCraft: [Playing World:'!file!'] !x!,!y!
	for /f "tokens=1,2,3" %%a in ('!gpu! mouse') do (
	if %%b leq 9 (set x=0%%b) else (set x=%%b)
	if %%c leq 9 (set y=0%%c) else (set y=%%c)
)
	if not [!first!]==[na] (
	if !x! geq 02 if !x! leq 46 (
	if !y! geq 02 if !y! leq 25 (
	!gpu! !c! !s! !x!,!y! !tip!
	if not [%tmp_%]==[true] set tmp_=true
	set coord=%coord%!x!,!y!;
)))
	if [!first!]==[na] (
	if !x! geq 02 if !x! leq 46 if !y! geq 02 if !y! leq 25 (
	set tmp_=false
	!gpu! 0 0 !x!,!y! " "
	for /f "tokens=*" %%a in ('type !ram!') do (
	set "ln=%%a"
	if "[!ln!]"=="[!x!,!y!;]" (set "ln=#") else (set "ln=!ln:%x%,%y%;=!")
	echo.!ln!>>"!tmp!\tmp.tm")
	copy /y "%tmp%\tmp.tm" !ram! >nul
	del "%tmp%\tmp.tm" >nul
))
	
	if !y!==28 (
	if !x!==19 set first=box.1%item%
	if !x!==21 set first=box.2%item%
	if !x!==23 set first=box.3%item%
	if !x!==25 set first=box.4%item%
	if !x!==27 set first=box.5%item%
	if !x!==29 goto:objects
	!gpu! 12 4 2,27 " "
)
	if !y!==27 if !x!==02 goto:break
	if !y!==28 if !x!==02 goto:save
	if !y!==29 if !x!==02 goto:return
	goto:main
:getItem
	if [!first!]==[na] call:toram !c! !s! !tip! &set first=box.1
	chcp 850 >nul
	for /l %%# in (1,1,5) do (
	for /f "tokens=1,2,3,4,*" %%a in ('echo.!box.%%#!') do (
	if !first!==box.%%# (
	!gpu! 07 0 18,30 " O O O O O"
	call:getcord %%a
	!gpu! 09 0 !xx!,30 O
	set c=%%b&set s=%%c&set tip=%%d
	!gpu! 00 0 18,31 !clean!
	set "type=%%~e"
	!gpu! 10 5 18,31 %%e
)
	!gpu! %%b %%c %%a %%d
))
	chcp !cp.1! >nul
	goto:eof
:getcord
	for /f "Tokens=1,2" %%a in ('echo.%*') do set xx=%%a&set yy=%%b
	goto:eof
:ToRAM
if not [%tmp_%]==[true] goto:eof
(
	echo.%1
	echo.%2
	echo.!coord!
	echo.%3
	echo.-
)>>!ram!
	set tmp_=false
	set coord=
	goto:eof
:objects
	!gpu! 12 4 2,27 " "
	call:toRAM %c% %s% %tip%
	set count.block=1
	set count=2
	!gpu! 06 4 5,2       "ÚÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄ¿"
	for /l %%# in (3,1,13) do (
	set/a count+=1
	!gpu! 06 4 5,!count! "³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³ ³"
	set/a xc=!count!+1,count+=1
	!gpu! 06 4 5,!xc!    "ÃÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄÅÄ´"
)
	!gpu! 06 4 5,24      "ÀÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÙ"
	!gpu! 06 4 5,25      "Select Blocks:                      [X]"
	!gpu! 09 1 36,3 $219    &!gpu! 12 4 38,3 #
	!gpu! 12 7 6,3 $176  &!gpu! 10 2 8,3 $178
	!gpu! 15 7 10,3 $178 &!gpu! 08 7 12,3 $178
	!gpu! 02 4 14,3 $177 &!gpu! 14 6 16,3 H
	!gpu! 14 6 18,3 $176 &!gpu! 09 3 20,3 $178
	!gpu! 13 4 22,3 $178 &!gpu! 12 4 24,3 $176
	!gpu! 10 3 26,3 $176 &!gpu! 00 7 28,3 $178
	!gpu! 15 7 30,3 $219 &!gpu! 12 6 32,3 $177
	!gpu! 11 3 34,3 $178 &!gpu! 10 2 6,5  $005
	!gpu! 13 5 8,5  $004 &!gpu! 12 4 10,5 $003
	!gpu! 11 3 12,5 $001 &!gpu! 12 4 14,5 $002
	!gpu! 09 1 16,5 $014 &!gpu! 14 4 18,5 $015
	!gpu! 10 2 20,5 $006 &!gpu! 00 7 22,5 $009
	!gpu! 14 6 6,7  $201 &!gpu! 14 6 8,7  $203
	!gpu! 14 6 10,7 $187 &!gpu! 14 6 12,7 $205
	!gpu! 12 4 14,7 $030 &!gpu! 12 4 16,7 $031
	!gpu! 12 4 18,7 $016 &!gpu! 12 4 20,7 $017
	:ob_ms
	title BatchCraft: [Current Box:!count.block!] [Past Object:!type!]
	for /f "tokens=1,2,3" %%a in ('!gpu! mouse') do set/a x=%%b,y=%%c
	if !y!==25 if !x!==42 (
	!gpu! /f "%tmp%\clr.dat"
	!gpu! /f !ram!
	set first=box.1
	call:getItem
	goto:main
)
	if !y!==3 (
	if !x!==6  set "desc=12 7 $176 "Brick Block"" %put%
	if !x!==8  set "desc=10 2 $178 "Grass Block"" %put%
	if !x!==10 set "desc=15 7 $178 "Quartz Block""%put%
	if !x!==12 set "desc=08 7 $178 "Boulder""     %put%
	if !x!==14 set "desc=02 4 $177 "Wood Block""  %put%
	if !x!==16 set "desc=14 6 H    "Stair""       %put%
	if !x!==18 set "desc=14 6 $176 "Yellow Wool"" %put%
 	if !x!==20 set "desc=09 3 $178 "Blue Wool""   %put%
	if !x!==22 set "desc=13 4 $178 "Pink Wool""   %put%
	if !x!==24 set "desc=12 4 $176 "Red Wool""    %put%
	if !x!==26 set "desc=10 3 $176 "Green Wool""  %put%
	if !x!==28 set "desc=00 7 $178 "Black Wool""  %put%
	if !x!==30 set "desc=15 7 $219 "Snow Block""  %put%
	if !x!==32 set "desc=12 6 $177 "Orange Wool"" %put%
	if !x!==34 set "desc=11 3 $178 "Sky Block""   %put%
	if !x!==36 set "desc=09 1 $219 "Water Block"" %put%
	if !x!==38 set "desc=12 4 #    "Lava Block""  %put%
)
	if !y!==5 (
	if !x!==6  set "desc=10 2 $005 "Clover Block"" %put%
	if !x!==8  set "desc=13 5 $004 "Micro Diamond""%put%
	if !x!==10 set "desc=12 4 $003 "Heart Block""  %put%
	if !x!==12 set "desc=11 3 $001 "Blue Monster"" %put%
	if !x!==14 set "desc=12 4 $002 "Red Monster""  %put%
	if !x!==16 set "desc=09 1 $014 "Blue Note""    %put%
	if !x!==18 set "desc=14 4 $015 "Sun Block""    %put%
	if !x!==20 set "desc=10 2 $006 "Micro Tree""   %put%
	if !x!==22 set "desc=00 7 $009 "Circle Block"" %put%
)
	if !y!==7 (
	if !x!==6  set "desc=14 6 $201 "A Fence 45ø""         %put%
	if !x!==8  set "desc=14 6 $203 "A Fence 180ø""        %put%
	if !x!==10 set "desc=14 6 $187 "A Fence Inverted 45ø""%put%
	if !x!==12 set "desc=14 6 $205 "A Fence Normal 180ø"" %put%
	if !x!==14 set "desc=12 4 $030 "Peak Block (up^)""    %put%
	if !x!==16 set "desc=12 4 $031 "Peak Block (down^)""  %put%
	if !x!==18 set "desc=12 4 $016 "Peak Block (right^)"" %put%
	if !x!==20 set "desc=12 4 $017 "Peak Block (left^)""  %put%
)
	goto:ob_ms
:GetPlaced
	if !count.block! geq 6 set count.block=1
	set first=box.!count.block!
	for /f "tokens=1" %%a in ('echo.!box.%count.block%!') do set "box.coord=%%a"
	set "box.!count.block!=!box.coord! !desc!"
	call:GetItem
	set/a count.block+=1
	goto:eof
:Break
	call:ToRAM %c% %s% %tip%
	set first=na
	!gpu! 07 0 18,30 " O O O O O"
	!gpu! 09 4 2,27 "O"
	goto:main
:save
	call:ToRAM !c! !s! !tip!
	copy /y !ram! "worlds\!file!" >nul
	!gpu! 10 4 1,30 "Saved sucessfully"
	ping -n 2 localhost>nul
	!gpu! 00 0 1,30 "Saved sucessfully"
	goto:main
:return
	call:ToRam !c! !s! !tip!
	copy /y !ram! "worlds\!file!" >nul
	!gpu! 12 4 16,10 "[World Saved]"
	ping -n 2 localhost>nul
	mode con cols=64 lines=21
	cls
	goto:init