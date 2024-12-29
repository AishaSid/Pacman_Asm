INCLUDE Irvine32.inc

includelib Winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data 

obstacles db "@"
livesaddon db "+"
; music   thingy 

deviceConnect BYTE "DeviceConnect",0

SND_ALIAS    DWORD 00010000h
SND_RESOURCE DWORD 00040005h
SND_FILENAME DWORD 00020000h

filee BYTE "beginning.wav",0
deathee BYTE "death.wav",0
fruitee byte "eatfruit.wav",0


;page3 
strlvl1 db "L   E   V   E   L   1" , 0
strlvl2 db "L   E   V   E   L   2",0
strlvl3 db "L   E   V   E   L   3",0
win db 0
strwon Db "CONGRATULATIONS!!!!", 0

stg1 db " __    ____  _  _  ____  __           __ ",0 
stg2 db "(  )  ( ___)( \/ )( ___)(  )         /  )",0  
stg3 db " )(__  )__)  \  /  )__)  )(__         )( ",0  
stg4 db "(____)(____)  \/  (____)(____)       (__) ",0 

stg5 db " __    ____  _  _  ____  __          ___ ",0  
stg6 db "(  )  ( ___)( \/ )( ___)(  )        (__ \ ",0
stg7 db " )(__  )__)  \  /  )__)  )(__        / _/  ",0
stg8 db "(____)(____)  \/  (____)(____)      (____)",0

stg9 db " __    ____  _  _  ____  __          ___ ",0
stg10 db "(  )  ( ___)( \/ )( ___)(  )        (__ )",0
stg11 db " )(__  )__)  \  /  )__)  )(__        (_ \ ",0
stg12 db "(____)(____)  \/  (____)(____)      (___/ ",0


; PAGE SCORES SCREEN

ISTG1 DB " ::::::::   ::::::::   ::::::::  :::::::::  ::::::::::  :::::::: ",0  
ISTG2 DB ":+:    :+: :+:    :+: :+:    :+: :+:    :+: :+:        :+:    :+: ",0
ISTG3 DB "+:+        +:+        +:+    +:+ +:+    +:+ +:+        +:+        ",0
ISTG4 DB "+#++:++#++ +#+        +#+    +:+ +#++:++#:  +#++:++#   +#++:++#++ ",0
ISTG5 DB "       +#+ +#+        +#+    +#+ +#+    +#+ +#+               +#+ ",0
ISTG6 DB "#+#    #+# #+#    #+# #+#    #+# #+#    #+# #+#        #+#    #+# ",0
ISTG7 DB " ########   ########   ########  ###    ### ##########  ########  ",0
; MAZE
ground BYTE 80 dup("-"),0
ground1 BYTE "|",0ah,0
ground2 BYTE "|",0
hashes byte "-" ,0
; WELCOME SCREEN
pg1a db "ooooo  ooo   ooo oo    oo  ooo  o ooo  ",0ah,0
 a1      db "o   o o   o o    o o  o o o   o o    o ",0ah,0
 a2     db "ooooo ooooo o    o  oo  o ooooo o    o ",0ah,0
 a3    db "o     o   o  ooo o      o o   o o    o",0

pg1b db "ENTER    PLAYER    NAME ",0ah,0

w1 db" ##  ##  ####  ##   # #####   ",0
w2 db" ### ## ##  ## ### ## ##      ",0
w3 db" ## ### ###### ## # # ####    ",0
w4 db" ##  ## ##  ## ##   # ##      ",0
w5 db" ##  ## ##  ## ##   # #####   ",0
; GAMEOVER SCREEN
gameover db "GAME OVER :( ",0
; MAIN MENU
strmenu db "!!!      MENU      !!!",0AH,0
strMenu1 db "Press Enter to start game ", 0 
strMenu2 db "Press 'I' to Open Instructions ", 0
strMenu3 db "Press 'S' to display Scores ", 0
strMenu4 db "Press 'x' to exit game ", 0
MenuM db ?
;PAUSE SCREEN
strpause db "oo   oo", 0ah,0
; INSTRUCTIONS
v db 240
is db " !!!      INSTRUCTIONS      !!!",0AH,0AH,0AH,0
    are db " -> Press O to move UP ", 0
   are1 db " -> Press L to move DOWN ", 0
   are2 db " -> Press K to move LEFT ", 0
   are3 db " -> Press ; to move RIGHT ", 0
   are4 db " -> Press P to PAUSE Game ", 0
;SCORES
;strScore db "SCORE: ", 0
score dd 0
;LIVES
strLives BYTE "LIVES: ", 0 
lives dd 3
;LEVEL
;strlevel byte "LEVEL: ",0
;level dd 3
temp byte ?   ; extra variable 
;pacman
xPos BYTE  15
yPos BYTE  3
PacMan db  17
;Ghosts
gcr db " "
ghosts db 12

Xpos1 db 90
Xpos2 db 76
Ypos1 db 16
Ypos2 db 4
direction1 db 2
direction2 db 0

Xpos3 db 45
Xpos4 db 18
Ypos3 db 5
Ypos4 db 18
direction3 db 3
direction4 db 1

Xpos5 db 59
Xpos6 db 59
Ypos5 db 16
Ypos6 db 17
direction5 db 2
direction6 db 1
;coins
Coins1 byte 15
space byte " "
Coin1xpos  db 10 dup(?)
Coin1ypos  db 10 dup(?)
Coin2xpos  db 10 dup(?)
Coin2ypos  db 10 dup(?)
Coin3xpos db 18 dup(?)
Coin3ypos db 18 dup(?)
Coin4xpos db 12 dup(?)
Coin4ypos db 12 dup(?)
Coin5xpos  db 10 dup(?)
Coin5ypos  db 10 dup(?)
Coin6xpos  db 5 dup(?)
Coin6ypos  db 5 dup(?)
Coin7xpos  db 5 dup(?)
Coin7ypos  db 5 dup(?)


isplayer db 1
inputChar BYTE ?  ; for movement 
dlay db 165
;LEVEL 2 
Fruit db "<8", 0
fruitd db "  ",0
xFruitPos BYTE ?
yFruitPos BYTE ?
randfruit db -1
;TELEPORTATION
teleport db "O"


; FILE HANDLING 
string11 db 44 dup (" ")
ccc db 0
string22 db 44 dup (" ")
cccc db 0
string33 db 44 dup (" ")
ccccc db 0
string1 db 44 dup (" ")
string2 db 44 dup (" ")
string3 db 44 dup (" ")
string4 db 44 dup (" ")
string5 db 44 dup (" ")
string6 db 44 dup (" ")
string7 db 44 dup (" ")
string8 db 44 dup (" ")
string9 db 44 dup (" ")
string10 db 44 dup (" ")
variable2 dd  0 

variable dd  0 
filename     BYTE "output.txt",0
fileHandle   HANDLE ?			; handle to output file
bytesWritten DWORD ?    			; number of bytes written

buffer1 db 3 dup(" ")
bytesread dword 0
filehandleend handle ?

strname db 20 dup(" ")
namesize dd ($-strname)
strscore db"Score: ",0
scoresize dd ($-strscore)

scoreinstring db "000"
xx db 0,0 ,0
scrsize dd 3

strlevel db "Level: ",0
levelsize dd ($-strlevel)

level dd 3
lvlsize db ($-level)
endend db 0ah 
endsize dd ($-endend)


.code


SCORESSCREEN PROC


           mov eax , cyan +( black*16)
    call settextcolor

    mov dh, 3
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG1
    call writestring 

    mov dh, 4
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG2
    call writestring 

    
       mov eax , lightblue +( black*16)
    call settextcolor

    mov dh, 5
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG3
    call writestring 

    mov dh, 6
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG4
    call writestring 



    mov dh, 7
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG5
    call writestring 

               mov eax , blue +( black*16)
    call settextcolor

    mov dh, 8
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG6
    call writestring 

    mov dh, 9
    mov dl , 50
    call gotoxy
    mov edx, offset ISTG7
    call writestring 


invoke CreateFileA, ADDR fileName, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0

mov fileHandle, eax   
  invoke ReadFile,
fileHandle, ADDR  string11, 44, ADDR bytesRead, 0

  invoke ReadFile,
fileHandle, ADDR  string22, 44, ADDR bytesRead, 0

  invoke ReadFile,
fileHandle, ADDR  string33, 44, ADDR bytesRead, 0
	INVOKE CloseHandle, fileHandle

    mov eax , white +( black*16)
    call settextcolor

    mov dh, 10
    mov dl , 0
    call gotoxy
    mov edx, offset string11
    call writestring 

    mov dh, 15
    mov dl , 0
    call gotoxy
    mov edx, offset string22
    call writestring 

    mov dh, 20
    mov dl , 0
    call gotoxy
    mov edx, offset string33
    call writestring 


L1: 
MOV EAX,0 
CALL READCHAR
CMP AL, "m"
je return
jmp l1

return:
call mainmenu
ret
SCORESSCREEN ENDP

FILEHANDLING2 proc     ;//////////////////////////////////////////////////////////FILE HANDLING 

invoke CreateFileA, ADDR fileName, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0

mov fileHandle, eax   
  invoke ReadFile,
fileHandle, ADDR  string1, 440, ADDR bytesRead, 0
	INVOKE CloseHandle, fileHandle


invoke CreateFileA, ADDR fileName, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0

mov fileHandle, eax   

mov esi, 28


	  INVOKE SetFilePointer,
	  filehandleend  ,0,0,FILE_end

mov eax,0
mov edi, 0 
mov ecx, 10

	l11:
push ecx
push edi

;mov esi, offset string1
;add esi, edi 
;mov al , " "
;cmp [esi], al
;je l2

	mov eax, filehandle
	cmp filehandleend, eax
	je l1
	   INVOKE SetFilePointer,
	  fileHandle, 28 ,0,FILE_current
mov eax,0
mov ecx, 3
  invoke ReadFile,
fileHandle, ADDR buffer1, ecx, ADDR bytesRead, 0
mov edx, offset buffer1
call writestring

jmp jj2

hewo:
loop l11
jmp l1
jj:

pop edi
add edi, 44
push edi 
      INVOKE SetFilePointer,
	  fileHandle,edi ,0,FILE_begin

add variable, 44
pop edi 
pop ecx
jmp hewo


jj2:
mov ecx, 3
mov esi, offset buffer1
mov edi, 0
laur:
mov al, "#"
call writechar
mov al, [esi]
call writechar
mov al, [scoreinstring+edi]
call writechar
cmp al, [esi]
ja l2
jb  l44
mov al, "#"
call writechar

inc esi
inc edi
loop laur
l44:
jmp jj


l1:

	INVOKE CloseHandle, fileHandle
	INVOKE CreateFile,
	  ADDR filename, GENERIC_WRITE, DO_NOT_SHARE, NULL,
	  OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0

	mov fileHandle,eax			; save file handle

	; Move the file pointer to the end of the file
	INVOKE SetFilePointer,
	  fileHandle,0,0,FILE_END

	; Append text to the file
	INVOKE WriteFile,
	    fileHandle, ADDR strname, namesize,
	    ADDR bytesWritten, 0

			INVOKE WriteFile,
	    fileHandle, ADDR strscore, scoresize,
	    ADDR bytesWritten, 0

					INVOKE WriteFile,
	    fileHandle, ADDR scoreinstring, scrsize,
	    ADDR bytesWritten, 0

		
				INVOKE WriteFile,
	    fileHandle, ADDR strlevel, levelsize,
	    ADDR bytesWritten, 0

		add level, 30h
					INVOKE WriteFile,
	    fileHandle, ADDR level, lvlsize,
	    ADDR bytesWritten, 0

				INVOKE WriteFile,
	    fileHandle, ADDR endend, endsize,
	    ADDR bytesWritten, 0
	INVOKE CloseHandle, fileHandle

	exit 



	l2:


	mov al, "W"
	call writestring 

		INVOKE CloseHandle, fileHandle

	INVOKE CreateFile,
	  ADDR filename, GENERIC_WRITE, DO_NOT_SHARE, NULL,
	  OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0

	mov fileHandle,eax			; save file handle


	; Move the file pointer to the end of the file
	INVOKE SetFilePointer,
	  fileHandle, variable ,0,FILE_begin

	; Append text to the file
	INVOKE WriteFile,
	    fileHandle, ADDR strname, namesize,
	    ADDR bytesWritten, 0

			INVOKE WriteFile,
	    fileHandle, ADDR strscore, scoresize,
	    ADDR bytesWritten, 0

					INVOKE WriteFile,
	    fileHandle, ADDR scoreinstring, scrsize,
	    ADDR bytesWritten, 0

				INVOKE WriteFile,
	    fileHandle, ADDR strlevel, levelsize,
	    ADDR bytesWritten, 0

		add level, 30h
					INVOKE WriteFile,
	    fileHandle, ADDR level, lvlsize,
	    ADDR bytesWritten, 0

				INVOKE WriteFile,
	    fileHandle, ADDR endend, endsize,
	    ADDR bytesWritten, 0

		mov ecx, variable 
mov esi, offset string1 
add esi, ecx
mov eax, 440
sub eax, ecx

INVOKE WriteFile,
	    fileHandle,  esi, eax,
	    ADDR bytesWritten, 0


	INVOKE CloseHandle, fileHandle

	exit 


QuitNow:
	exit
ret
filehandling2 endp


filehandling1 proc

mov ebx,0
mov bl, 10 
mov eax, score
div bl
mov [scoreinstring+2] , ah 
add [scoreinstring+2] , 030h
mov ah, 0 
div bl 
mov [scoreinstring+1], ah
add [scoreinstring+1] , 030h
mov ah, 0 
div bl
mov [scoreinstring], ah
add [scoreinstring], 030h
mov ah, 0 
call filehandling2 

ret 
filehandling1 endp     ;//////////////////////////////////////////////////////////      F  I  L  E    HANDLING 

Page1 Proc        ; ////////////////////////////////////////////////////     S                C                R               E           E               N              S  ///////////////////////////////////////
            mov  eax, brown
            call SetTextColor
            mov ecx, 14
            mov dl, 33
            mov dh, 6
            call gotoxy
            call verticalline
            mov ecx, 13
            mov dl, 83
            mov dh, 6
            call gotoxy
            call verticalline

            mov ecx, 50
            mov dl, 34
            mov dh, 6
            call gotoxy
            call horizontalline

            mov ecx, 50
            mov dl, 34
            mov dh, 19
            call gotoxy
            call horizontalline

     ; just the strings display
                    mov eax, blue
                    call settextcolor
                    mov dl,40
                    mov dh,10
                    call Gotoxy
                    mov edx,OFFSET pg1a
                    call WriteString
                    mov eax, cyan
                    call settextcolor
                    mov dl,40
                    mov dh,11
                    call Gotoxy
                    mov edx,OFFSET a1
                    call WriteString
                    mov eax, green
                    call settextcolor
                    mov dl,40
                    mov dh,12
                    call Gotoxy
                    mov edx,OFFSET a2
                    call WriteString
                    mov eax, red
                    call settextcolor
                    mov dl,40
                    mov dh,13
                    call Gotoxy
                    mov edx,OFFSET a3
                    call WriteString
        mov xPos, 35
        mov Ypos,12
        mov ecx, 45
        loop1:
        mov eax, 90      
        call Delay
        call updateplayer
        inc Xpos
        call drawplayer
        loop loop1


    mov eax, 90     
    call Delay
    call clrscr
;ENTER YOUR NAME SCREEN 
                                mov  eax, brown
                                call SetTextColor
                                mov ecx, 14
                                mov dl, 33
                                mov dh, 6
                                call gotoxy
                                call verticalline
                                mov ecx, 13
                                mov dl, 83
                                mov dh, 6
                                call gotoxy
                                call verticalline

                                mov ecx, 50
                                mov dl, 34
                                mov dh, 6
                                call gotoxy
                                call horizontalline

                                mov ecx, 50
                                mov dl, 34
                                mov dh, 19
                                call gotoxy
                                call horizontalline

            mov eax, lightmagenta
            call settextcolor
          
            
            mov dl,45
            mov dh,9
            call Gotoxy
            mov edx,OFFSET w1
            call WriteString

                       mov dl,45
            mov dh,10
            call Gotoxy
            mov edx,OFFSET w2
            call WriteString

                      mov dl,45
            mov dh,11
            call Gotoxy
            mov edx,OFFSET w3
            call WriteString

                       mov dl,45
            mov dh,12
            call Gotoxy
            mov edx,OFFSET w4
            call WriteString

          mov dl,45
            mov dh,13
            call Gotoxy
            mov edx,OFFSET w5
            call WriteString

            mov dl,53
            mov dh,15
            call Gotoxy
            mov eax, cyan
            call settextcolor
            mov edx, offset strname
            mov ecx, 20
            call readstring
    ; to replace the string with empty spaces
 call clrscr
  mov Xpos, 15
  mov Ypos, 3
ret
Page1 endp

MAINMENU PROC
     ; just the string display
    ;
 call clrscr

                            mov  eax, brown
                            call SetTextColor
                            mov ecx, 14
                            mov dl, 33
                            mov dh, 6
                            call gotoxy
                            call verticalline
                            mov ecx, 13
                            mov dl, 83
                            mov dh, 6
                            call gotoxy
                            call verticalline

                            mov ecx, 50
                            mov dl, 34
                            mov dh, 6
                            call gotoxy
                            call horizontalline

                            mov ecx, 50
                            mov dl, 34
                            mov dh, 19
                            call gotoxy
                            call horizontalline

        ; MENU STRINGS 
                    mov  eax,  lightMAGENTA
                    call SetTextColor
                    mov dl,48
                    mov dh,5
                    call Gotoxy
                    mov edx,OFFSET strmenu
                    call WriteString

        mov  eax, red
        call SetTextColor
        mov dl,45
        mov dh,10
        call Gotoxy
        mov edx,OFFSET strmenu1
        call WriteString
        mov  eax, blue
        call SetTextColor
        mov dl,45
        mov dh,12
        call Gotoxy
        mov edx,OFFSET strmenu2
        call WriteString
        mov  eax, green
        call SetTextColor
        mov dl,45
        mov dh,14
        call Gotoxy
        mov edx,OFFSET strmenu3
        call WriteString
        mov  eax, white
        call SetTextColor
        mov dl,45
        mov dh,16
        call Gotoxy
        mov edx,OFFSET strmenu4
        call WriteString

    ; take user input for Main Menu
l1:
    mov al,0
    call readchar
    call clrscr
    cmp al, 0dh  ;  the hexadecimal of enter key is 13 or D in hexa 
    je return 
   ; mov edx, offset pg1a
   ; call writestring
    cmp al, 's'
    je ScoresScreen
    cmp al, 'i'
    je InstructionsScreen

    jmp l1

return:  
ret
MainMenu Endp


verticalLine proc

l1:
            mov eax, 0
            mov al, v
            call writechar
            inc dh  ; y axis
            call gotoxy 
            loop l1

 ret
verticalLine endp

horizontalLine proc

l1:
        mov eax, 0
        mov al, v
        call writechar
        loop l1
 ret
horizontalLine endp

 InstructionsScreen proc
        mov  eax, yellow
        call SetTextColor
        mov ecx, 14
        mov dl, 30
        mov dh, 6
        call gotoxy
        call verticalline
        mov ecx, 13
        mov dl, 80
        mov dh, 6
        call gotoxy
        call verticalline

          mov ecx, 50
        mov dl, 31
        mov dh, 6
        call gotoxy
        call horizontalline

          mov ecx, 50
        mov dl, 31
        mov dh, 19
        call gotoxy
        call horizontalline


         mov  eax, lightMAGENTA
        call SetTextColor
        mov dl,40
        mov dh,8
        call gotoxy
        mov edx, offset is
        call writestring 
        mov  eax, lightblue
        call SetTextColor


            mov dh,11  
              mov dl,45
        call gotoxy
        mov edx, offset are
        call writestring

        mov dh,12
                mov dl,45
        call gotoxy
        mov edx, offset are1
        call writestring

        mov dh,13
                mov dl, 45
        call gotoxy
        mov edx, offset are2
        call writestring

            
        mov dh,14
        mov dl, 45
        call gotoxy
        mov edx, offset are3
        call writestring

        mov dh,15
                mov dl, 45
        call gotoxy
        mov edx, offset are4
        call writestring

        mov al,0
        call readchar
        cmp al,'m'   
        call MainMenu
        cmp al, 0dh  ;  the hexadecimal of enter key is 13 or D in hexa 
        call clrscr
            ret
    ;cmp al, 'm'
    ;call MainMenu
 ret
 INSTRUCTIONSSCREEN endp

 BORDERS proc          ; SCREENRESOLUTION (80x25)


 GroundX:   ;draw ground at (3, 26): 
                mov dl, 13
                mov dh,29                ;(25)
                call Gotoxy
                mov edx,OFFSET ground
                call WriteString

                mov dl,13
                mov dh,2
                call Gotoxy
                mov edx,OFFSET ground
                call WriteString

;mid right
                mov esi,0     ; print 2 ka bottom horizontal 
                mov ecx, 3   ; vertical thickness
                loop12b:
                mov dl, 69      ; x 
                mov dh, 13     ; y location top 
                mov ebx, esi
                add dh, bl
                call Gotoxy
                mov ebx, ecx
                mov ecx, 24  ; x ->length
                loop12c:
                mov edx, offset hashes  ; letter by letter print hoga 
                call writestring
                loop loop12c
                 mov ecx, ebx
                 inc esi
                loop loop12b

                mov esi,0     ; print 2 ka top horizontal 
                mov ecx, 3   ; vertical thickness
                loop12a:
                mov dl, 56   ; x 
                mov dh, 7     ; y location top 
                mov ebx, esi
                add dh, bl
                call Gotoxy
                mov ebx, ecx
                mov ecx, 24  ; x ->length
                loop12:
                mov edx, offset hashes  ; letter by letter print hoga 
                call writestring
                loop loop12
                 mov ecx, ebx
                 inc esi
                loop loop12a
GroundY:
                mov ecx,26
                mov dh,3   
                mov temp,dh
                l1:     
                mov dh,temp
                mov dl,13
                call Gotoxy
                mov edx,OFFSET ground1
                call WriteString
                inc temp
                loop l1

                mov ecx,26
                mov dh,3
                mov temp,dh
                l2:
                mov dh,temp
                mov dl,93
                call Gotoxy
                mov edx,OFFSET ground2
                call WriteString
                inc temp
                loop l2
;top mid
                mov ecx,7      ; length
                mov dh,3        ; top Y     bottom = 3+7 ?
                mov temp,dh
                l3:     
                mov dh,temp
                mov dl,53         ; x location (fixed)   left ->53+5 
                call Gotoxy
                mov ebx, ecx
                mov ecx, 5       ; thickness
                loop3:
                mov edx,OFFSET hashes
                call WriteString
                loop loop3
                mov ecx, ebx
                inc temp
                loop l3
;bottom mid
                mov ecx,7
                mov dh, 22   
                mov temp,dh
                l4:     
                mov dh,temp
                mov dl,53
                call Gotoxy
                mov ebx, ecx
                mov ecx, 5 
                loop34:
                mov edx,OFFSET hashes
                call WriteString
                loop loop34
                mov ecx, ebx
                inc temp
                loop l4

cap1:   ; top left 1 
     mov dh, 4
     mov dl, 29
     call Gotoxy
     mov ecx, 10
     mov esi, 1 
loopcal2:
mov ebx, ecx
     mov ecx, 5
  loopcap1:
     mov al, hashes
     call writechar
     loop loopcap1
     mov eax, esi
     mov dh, 4
     mov dl, 29
     add dh, al 
     call Gotoxy
     inc esi
     mov ecx,ebx
loop loopcal2

tap1:   ; bottom right 1 
     mov dh, 18
     mov dl, 69
     call Gotoxy
     mov ecx, 10
     mov esi, 1 
loopcal1:
mov ebx, ecx
     mov ecx, 5
  loopcap2:
     mov al, hashes
     call writechar
     loop loopcap2
     mov eax, esi
     mov dh, 18
     mov dl, 69
     add dh, al 
     call Gotoxy
     inc esi
     mov ecx,ebx
loop loopcal1

eight1:
                mov esi,0      ; print top of 8
                mov ecx, 3   ; vertical thickness
                loop1ccb:
                mov dl, 27     ; x 
                mov dh, 20     ; y location top 
                mov ebx, esi
                add dh, bl
                call Gotoxy
                mov ebx, ecx
                mov ecx, 10  ; x ->length
                loop12cd:
                mov edx, offset hashes  ; letter by letter print hoga 
                call writestring
                loop loop12cd
                 mov ecx, ebx
                 inc esi
                loop loop1ccb

                 mov esi,0     ; print bottom of 8
                mov ecx, 3   ; vertical thickness
                loop1cc:
                mov dl, 27     ; x 
                mov dh, 25     ; y location top 
                mov ebx, esi
                add dh, bl
                call Gotoxy
                mov ebx, ecx
                mov ecx, 10  ; x ->length
                loop12cdx:
                mov edx, offset hashes  ; letter by letter print hoga 
                call writestring
                loop loop12cdx
                 mov ecx, ebx
                 inc esi
                loop loop1cc

cmp level, 2
jb return
;////////////////////////////////////////////////////////////////////            L     E    V     E    L   2 

mov ecx, 27    ; x  width
mov dl, 14      ; x
mov dh, 16    ; y 
call gotoxy
gg:               ; the line 
mov eax,0
mov al, hashes
call writechar
loop gg

mov ecx, 11
mov dh, 14
mov dl,  40
call gotoxy
gg1:                       ; upper horizontal mid  box
mov eax,0
mov al, hashes
call writechar
loop gg1
mov ecx, 11
mov dh, 18
mov dl,  40
call gotoxy
gg2:                                   ; lower horizontal mid  box
mov eax,0
mov al, hashes
call writechar
loop gg2

mov ecx, 4
mov esi,0 
gg3:                   ; mid box left vertical 
mov dh, 14
mov dl,  40
mov ebx,esi
add dh, bl
call gotoxy
inc esi
mov al, hashes
call writechar
loop gg3


;/////////////////////////////// extra lines 


mov ecx, 10
mov dh, 9
mov dl,  14 
call gotoxy
line1:                       ; horizontal 
mov eax,0
mov al, hashes
call writechar
loop line1

mov ecx, 10
mov dh, 25
mov dl,  14
call gotoxy
line2:                       ; horizontal 
mov eax,0
mov al, hashes
call writechar
loop line2

mov ecx, 10
mov dh, 23
mov dl,  83
call gotoxy
line3:                       ; horizontal 
mov eax,0
mov al, hashes
call writechar
loop line3

mov ecx, 10
mov dh, 4
mov dl,  83
call gotoxy
line4:                       ; horizontal 
mov eax,0
mov al, hashes
call writechar
loop line4

; ////////////////////////////////////////////////////////////////////////   O  B  S  T  A  C  L  E  S       
cmp level , 3 
jne return 

mov eax, brown 
call settextcolor 
mov ecx, 5
mov esi,0 
gg4:   ; mid box right vetical
mov dh, 14
mov dl,  51
mov ebx,esi
add dh, bl
call gotoxy
inc esi
mov al, obstacles
call writechar
loop gg4

mov ecx, 2 
mov esi, 0
os1:
mov dh, 20       ; ypos
mov dl,  18        ; xpos
mov ebx,esi
add dh, bl
call gotoxy
inc esi
mov al, obstacles
call writechar
mov al, obstacles
call writechar
loop os1


mov ecx, 2 
mov esi, 0
os2:
mov dh, 5       ; ypos
mov dl,  20        ; xpos
mov ebx,esi
add dh, bl
call gotoxy
inc esi
mov al, obstacles
call writechar
mov al, obstacles
call writechar
loop os2


mov ecx, 2 
mov esi, 0
os3:
mov dh, 6         ; ypos
mov dl,  86        ; xpos
mov ebx,esi
add dh, bl
call gotoxy
inc esi
mov al, obstacles
call writechar
mov al, obstacles
call writechar
loop os3

mov ecx, 2 
mov esi, 0
os4:
mov dh, 13         ; ypos
mov dl,  59        ; xpos
mov ebx,esi
add dh, bl
call gotoxy
inc esi
mov al, obstacles
call writechar
mov al, obstacles
call writechar
loop os4



return:
 ret
 Borders endp  ;/////////////////////////////////////////////////////  B   O   R    D   E      R        S ///////////////////////////////////////////////////////////////

 PAUSESCREEN PROC

 mov esi, 1
mov ecx, 7
loop123:
            mov eax, 0 
            mov  eax, blue
            add eax, esi
            call SetTextColor
            mov dl,100
            mov dh,10
            mov  ebx, esi
            add dh, bl
            call Gotoxy
            mov edx,OFFSET strpause
            call WriteString
            inc esi
   loop loop123         
            ppp:
            call ReadChar
            mov inputChar,al
            cmp inputChar, "p"
            je gmlp
            jmp ppp
            gmlp:
            mov inputChar, ";"
          mov esi, 1
         mov ecx, 7
           loop1234:
            mov eax, 0 
            mov  eax, black
            call SetTextColor
            mov dl,100
            mov dh,10
            mov  ebx, esi
            add dh, bl
            call Gotoxy
            mov edx,OFFSET strpause
            call WriteString
            inc esi
   loop loop1234

 RETURN:
 RET
 PAUSESCREEN ENDP

 GAMEOVERSCREEN proc
 call clrscr

   mov  eax, yellow
        call SetTextColor
        mov ecx, 14
        mov dl, 33
        mov dh, 6
        call gotoxy
        call verticalline
          mov ecx, 13
        mov dl, 83
        mov dh, 6
        call gotoxy
        call verticalline

        mov ecx, 50
        mov dl, 34
        mov dh, 6
        call gotoxy
        call horizontalline

        mov ecx, 50
        mov dl, 34
        mov dh, 19
        call gotoxy
        call horizontalline

        mov  eax,  RED
        call SetTextColor
        mov dl,53
        mov dh,8
        call gotoxy

        cmp win,1 
        je winwin 
        mov edx, offset  gameover
        jmp stip
        winwin:
        mov edx, offset strwon
        stip:
        call writestring 

          mov  eax,  blue 
        call SetTextColor
        mov dl,43
        mov dh,11
        call gotoxy
        MOV edx, offset strscore
        call writestring

        mov  eax, cyan
        call SetTextColor
        mov dl,50
        mov dh,13
        call gotoxy
        MOV edx, offset strname
        call writestring 
        mov eax,0
        mov al, ":"
        call writechar
        mov dl,70
        mov dh,13
        call gotoxy
        mov eax, score
        call writeint

        j1:
         mov eax,0 
         call readkey
         jz j1
  
  call filehandling1       
exit 
 gameoverscreen endp   ;///////////////////////////////////////////////////////////////  S      C        R          E            E          N        S ////////////////////////////////////////////////////




DrawPlayer PROC
                                 ; draw player at (xPos,yPos):
    mov eax, yellow      ;(blue*16)
    call SetTextColor
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al,  PacMan
    call WriteChar
    ret
DrawPlayer ENDP

UpdatePlayer PROC
    mov dl,xPos
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

callcollisionwithcoin  proc          ;/////////////////////////////////////////////////////////////// C   O     I    N    S ///////////////////////////////////////////////////////////

mov ecx, lengthof coin1xpos
mov esi, 0
mov edi, offset coin1xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision 

mov ecx, lengthof  coin2xpos
mov esi, 0
mov edi, offset coin2xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision

mov ecx, lengthof  coin3xpos
mov esi, 0
mov edi, offset coin3xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision

mov ecx, lengthof  coin4xpos
mov esi, 0
mov edi, offset coin4xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision
mov ecx, lengthof  coin5xpos
mov esi, 0
mov edi, offset coin5xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision
mov ecx, lengthof  coin6xpos
mov esi, 0
mov edi, offset coin6xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision
mov ecx, lengthof  coin7xpos
mov esi, 0
mov edi, offset coin7xpos
mov al, Xpos
mov ah, Ypos
call CoinCollision
ret
callcollisionwithcoin endp


DrawCoin PROC   

    mov eax,yellow  ;(red * 16)
    call SetTextColor
    ; top 1 ke coins 
    mov eax,0
    mov ecx, lengthof coin1xpos
    mov esi, 0
    mov edi, offset coin1xpos
l1:
mov dl, 28
 mov dh, 4
 mov ebx, esi
 add dh, bl
 mov byte ptr [edi], dl
 mov byte ptr [edi+10], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc edi
 loop l1

    mov eax,0
    mov ecx, lengthof coin2xpos
    mov esi, 0
    mov edi, offset coin2xpos
l2:
mov dl, 74
 mov dh, 18
 mov ebx, esi
 add dh, bl
 mov byte ptr [edi], dl
 mov byte ptr[edi+10], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc edi
 loop l2

     mov eax,0
    mov ecx, 12
    mov esi, 0
    mov edi, offset coin4xpos
l3:
mov dl, 69
 mov dh, 12
 mov ebx, esi
 add dl, bl
 mov  byte ptr[edi], dl
 mov byte ptr[edi+12], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc esi
 inc edi
 loop l3


    mov eax,0
    mov ecx, 18
    mov esi, 0
    mov edi, offset coin3xpos
l4:
mov dl, 15
 mov dh, 28
 mov ebx, esi
 add dl, bl
 mov byte ptr[edi], dl
 mov byte ptr[edi+18], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc esi
 inc edi
 loop l4

     mov eax,0
    mov ecx, 10
    mov esi, 0
    mov edi, offset coin5xpos
l5:
mov dl, 60
 mov dh, 6
 mov ebx, esi
 add dl, bl
 mov byte ptr[edi], dl
 mov byte ptr[edi+10], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc esi
 inc edi
 loop l5

    mov eax,0
    mov ecx, 5
    mov esi, 0
    mov edi, offset coin6xpos
l6:
mov dl, 28
 mov dh, 19
 mov ebx, esi
 add dl, bl
 mov byte ptr[edi], dl
 mov byte ptr[edi+5], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc esi
 inc edi
 loop l6

    mov eax,0
    mov ecx, 5
    mov esi, 0
    mov edi, offset coin7xpos
l7:
mov dl, 28
 mov dh, 24
 mov ebx, esi
 add dl, bl
 mov byte ptr[edi], dl
 mov byte ptr[edi+5], dh
 call Gotoxy
 mov  al, Coins1
 call Writechar
 inc esi
 inc esi
 inc edi
 loop l7
     mov eax,white  ;(red * 16)
    call SetTextColor
    ret
DrawCoin ENDP

CoinCollision proc 

    ; al -> Xpos  ah-> Ypos
  ; bh -> xpos   bl -> ypos
  mov bh, al
  mov bl,  ah
  mov esi, ecx
l1:
  cmp byte ptr [edi], al
  je l11
  jmp skip1
  l11:
cmp [edi+esi], ah
 je collision
 jmp skip1 
 skip1:
 inc edi
 loop l1

 ret 
collision:
  cmp isplayer , 1 
  je callpc
  call ghostc
  ret
  callpc:
    call playercollision
ret

CoinCollision endp

GhostC proc

mov gcr,  15
call updateghost 
ret
GhostC endp

playercollision proc
mov byte ptr [edi], -1
mov byte ptr [edi+esi], -1
inc Score
ret 
playercollision endp 

DrawFruit PROC   ;////////////////////////////////////////// just to display fruit on  SCREEN                  F        R        U        I          T

    mov eax, green;(red * 16)
    call SetTextColor
    mov dl,xFruitPos
    mov dh,yFruitPos
    call Gotoxy
    mov al,"<"
    call WriteChar
    mov eax, lightmagenta;(red * 16)
    call SetTextColor
    mov dl,xFruitPos
    mov dh,yFruitPos
    inc dl
    call Gotoxy
    mov al,"8"
    call WriteChar
                    mov eax,white (black * 16)
                    call SetTextColor
    ret 
DrawFruit ENDP

CreateRandomFruit PROC  ; it decides location of the fruit 
     mov eax, 3
             call randomrange 
             cmp eax, 0
             je qth
             cmp eax, 1
             je rth
             cmp eax, 2
             je sth
             cmp eax, 3
             je tth
qth:
mov XFruitPos, 22
mov YfruitPos, 13
jmp return
rth:
mov XFruitPos, 43
mov YfruitPos, 16
jmp return
sth:
mov XFruitPos, 88
mov YfruitPos, 8
jmp return
tth:
mov XFruitPos, 84
mov YfruitPos, 23
 
return:
call drawfruit
ret
CreateRandomFruit ENDP


;////////////////////////////////////////////////////////////////////////////////////THESE ARE THE GHOST MOVEMENTS/////////////////////////////////////////////////////////////////////////////


DrawGhost PROC
                                 ; bh -> xpos   bl -> ypos
    mov dl, bh
    mov dh, bl 
    call Gotoxy
    mov eax, lightgreen      ;(blue*16)
    call SetTextColor
    mov al,  ghosts
    call WriteChar
        mov eax, white     ;(blue*16)
    call SetTextColor
    ret
DrawGhost ENDP

UpdateGhost PROC
                                                   ; bh -> xpos   bl -> ypos
    mov dl, bh
    mov dh, bl 
    call Gotoxy
    mov al, gcr
    call WriteChar
    mov gcr, " "

    cmp level, 2 
    jb return 
      cmp bl, yfruitpos
            jne return
            cmp bh, xfruitpos
            je vvv
            mov al , xfruitpos
            inc al
            cmp bh, al
            je vvv
            jmp return
            vvv:
            call drawfruit
return:
    ret
UpdateGhost ENDP

GhostsDirection PROC
        ; Ghost  1
        mov ebx,0
        mov bl, direction1
        push bx
        mov al, YPos1
        mov ah, XPOs1
        call movements
        mov Ypos1 , bl
        mov xpos1, bh
        pop bx
        mov direction1, bl
        mov bl, ypos1
        mov bh, xpos1
        call  ghostcollision
        ;Ghost2 
        mov ebx,0
        mov bl, direction2
        push bx
        mov al, YPos2
        mov ah, XPOs2
        call movements
         mov Ypos2 , bl
         mov xpos2, bh 
         pop bx
        mov direction2, bl

        mov bl, ypos2
        mov bh, xpos2
        call  ghostcollision
        ; Ghost  3
        mov ebx,0
        mov bl, direction3
        push bx
        mov al, YPos3
        mov ah, XPOs3
        call movements
        mov Ypos3 , bl
        mov xpos3 , bh
        pop bx
        mov direction3, bl
        mov bl, ypos3
        mov bh, xpos3
        call  ghostcollision
        ;Ghost 4
        mov ebx,0
        mov bl, direction4
        push bx
        mov al, YPos4
        mov ah, XPos4
        call movements
         mov Ypos4 , bl
         mov xpos4, bh 
         pop bx
        mov direction4, bl
        mov bl, ypos4
        mov bh, xpos4
        call  ghostcollision
        mov eax, 0
 ret 
 GhostsDirection endp 

 ghostcollision proc
; ebx has location of ghost 
                    cmp bl, yPos
                    jne notCollecting
                    cmp bh, xPos
                    jne notcollecting
                    ; player is intersecting  ghost 
                    collecting:
                    mov Xpos, 15
                    mov Ypos, 3
                    mov dl, Xpos
                    mov dh, Ypos
                    call gotoxy
                    mov eax,0
                    mov al, pacman
                    call writechar
                   INVOKE PlaySound, OFFSET deathee, NULL, SND_ALIAS 
                     dec lives
                     mov eax , 350
                     call delay 
                    notCollecting:

          

return:
ret
 ghostcollision endp 

MOVEMENTS PROC

   cmp bl,1
   je movedown
   cmp bl,2
    je moveleft
   cmp bl, 3
   je moveright

MOVEUP: ; ///////////////////////////////// ghost  UP 
        cmp al, 3
        je return

        cmp al, 14
        je cond1
        jmp leaveup
cond1:     ;  top left 1  ka bottom 
     cmp ah, 27
     jna leaveup
     cmp ah, 34
     jnb leaveup
      jmp return
      leaveup:

       cmp al, 28
        je cond2
        jmp leaveup1
cond2:     ;  bottom 1 ka bottom 
     cmp ah, 68
     jna leaveup1
     cmp ah, 74
     jnb leaveup1
      jmp return
      leaveup1:

      cmp al, 23
        je cond11
        jmp leaveupxx
       cond11:        ;  8 ke top  ka bottom 
     cmp ah, 27
     jnae leaveupxx
     cmp ah, 37
     jnb leaveupxx
      jmp return
      leaveupxx:

       cmp al, 28
        je cond22
        jmp leaveup1xx
cond22:          ;  8 ke below ka bottom 
     cmp ah, 27
     jnae leaveup1xx
     cmp ah, 37
     jnb leaveup1xx
      jmp return
      leaveup1xx:
        cmp al, 10
        je cond11lalalui
        jmp leaveupxxlalalui
       cond11lalalui:           ;  2 ke top  ka bottom 
     cmp ah, 53
     jnae leaveupxxlalalui
     cmp ah, 79
     jnbe leaveupxxlalalui
      jmp return
      leaveupxxlalalui:
       cmp al, 16
        je cond22lalalui
        jmp leaveup1xxlalalui
cond22lalalui:              ;  2 ke below ka bottom 
     cmp ah, 69
     jnae leaveup1xxlalalui
   ;  cmp ah, 37
   ;  jnb leaveup1xxlalalui
      jmp return
      leaveup1xxlalalui:

      cmp level,2
      jb forreal1

      cmp al, 19
      jne v1
      cmp ah, 40
      jnae v1
      cmp ah, 51
      jnbe v1
      jmp return

      v1:
      cmp al, 17
      jne v2
      cmp ah, 14
      jnae v2
      cmp ah, 40
      jnbe v2
      jmp return
      v2:

      cmp al, 10
      je c5
      cmp al, 26
      je c5
      jmp c6
      c5:
      cmp ah, 14     ; xpos
      jnae c6
      cmp ah, 24
      jnbe c6
      jmp return
      c6:
        cmp al, 24     ; ypos
      je c7
      cmp al, 5
      je c7
      jmp c8
      c7:
      cmp ah, 83     ; xpos
      jnae c8
      cmp ah, 93
      jnbe c8
      jmp return
      c8:


                        cmp level ,3 
                        jb forreal1

                        cmp al, 22     ; ypos
                        jne c1
                        cmp ah, 18     ; xpos
                        jnae c1
                        cmp ah, 19
                        jnbe c1
                        jmp return
                        c1:         
                        cmp al,  7     ; ypos
                        jne c2
                        cmp ah, 20     ; xpos
                        jnae c2
                        cmp ah, 21
                        jnbe c2
                        jmp return
                        c2:
                        cmp al,  8     ; ypos
                        jne c3
                        cmp ah, 86     ; xpos
                        jnae c3
                        cmp ah, 87
                        jnbe c3
                        jmp return
                        c3:

                        cmp al,  15     ; ypos
                        jne c4
                        cmp ah, 59     ; xpos
                        jnae c4
                        cmp ah, 60
                        jnbe c4
                        jmp return
                        c4:



                                                                 forreal1:
                                                                mov ebx, eax
                                                                call UpdateGhost
                                                                dec bl
                                                                call DrawGhost
                                                                jmp return1
       MOVEDOWN:       ; ///////////////////////////////// ghost  DOWN
      cmp al , 27
        je return
     cmp al, 3
        je cond3
        jmp leavedown
cond3:     ;  top left 1  ka  
     cmp ah, 28
     jna  leavedown
     cmp ah, 34
     jnb  leavedown
      jmp return
      leavedown:
       cmp al, 21
        je condvv
        jmp leavevv
       condvv:        ;   mid lower boundary ka top se bottom ana 
     cmp ah, 53
     jnae leavevv
     cmp ah, 57
     jnbe leavevv
      jmp return
      leavevv:
       cmp al, 17
        je cond4
        jmp  leavedown1
cond4:     ;  bottom 1 ka 
     cmp ah, 68
     jna  leavedown1
     cmp ah, 74
     jnb  leavedown1
      jmp return
       leavedown1:
       cmp al, 18
        je cond11vv
        jmp leaveupvv
       cond11vv:        ;  8 ke top  ka top 
     cmp ah, 27
     jnae leaveupvv
     cmp ah, 37
     jnb leaveupvv
      jmp return
      leaveupvv:
       cmp al, 23
        je cond22vv
        jmp leaveup1vv
cond22vv:          ;  8 ke below ka top 
     cmp ah, 27
     jnae leaveup1vv
     cmp ah, 37
     jnb leaveup1vv
      jmp return
      leaveup1vv:

        cmp al, 5
        je cond11lalui
        jmp leaveupxxlalui
       cond11lalui:           ;  2 ke top  ka bottom 
     cmp ah, 53
     jnae leaveupxxlalui
     cmp ah, 79
     jnbe leaveupxxlalui
      jmp return
      leaveupxxlalui:

       cmp al, 11
        je cond22lalui
        jmp leaveup1xxlalui
cond22lalui:                      ;  2 ke below ka bottom 
     cmp ah, 69
     jnae leaveup1xxlalui
   ;  cmp ah, 37
   ;  jnb leaveup1xxlalalui
      jmp return
      leaveup1xxlalui:
    
      cmp level,2
      jb forreal2

      cmp al, 13
      jne v11
      cmp ah, 40
      jnae v11
      cmp ah, 51
      jnbe v11
      jmp return

      v11:
      cmp al, 15
      jne v22
      cmp ah, 14
      jnae v22
      cmp ah, 40
      jnbe v22
      jmp return
      v22:
        
      cmp al, 8
      je d5
      cmp al, 24
      je d5
      jmp d6
      d5:
      cmp ah, 14     ; xpos
      jnae d6
      cmp ah, 24
      jnbe d6
      jmp return
     d6:
        cmp al, 22     ; ypos
      je d7
      cmp al, 3
      je d7
      jmp d8
      d7:
      cmp ah, 83     ; xpos
      jnae d8
      cmp ah, 93
      jnbe d8
      jmp return
      d8:

                   cmp level ,3 
               jb forreal2
 cmp al, 19     ; ypos
 jne d1
 cmp ah, 18     ; xpos
 jnae d1
 cmp ah, 19
 jnbe d1
 jmp return
      d1:         
  cmp al,  4     ; ypos
 jne d2
 cmp ah, 20     ; xpos
 jnae d2
 cmp ah, 21
 jnbe d2
 jmp return
 d2:
  cmp al,  5     ; ypos
 jne d3
 cmp ah, 86     ; xpos
 jnae d3
 cmp ah, 87
 jnbe d3
 jmp return
 d3:

  cmp al,  12     ; ypos
 jne d4
 cmp ah, 59     ; xpos
 jnae d4
 cmp ah, 60
 jnbe d4
 jmp return
 d4:

                                                                                 forreal2:
                                                                                mov ebx, eax
                                                                                call UpdateGhost
                                                                                inc bl
                                                                                call DrawGhost
                                                                                jmp return1

MOVELEFT:          ; ///////////////////////////////// ghost  LEFT
       cmp ah , 14
        je return
        cmp ah , 34
        je cond5
        jmp leaveleft
cond5:                         ;  top left 1  ka left 
     cmp al, 4
     jnae leaveleft
     cmp al, 13
     jnbe leaveleft
      jmp return
      leaveleft:

       cmp ah , 75
        je cond6
        jmp leaveleft1
cond6:                   ;  bottom  1  ka left
     cmp al, 18
     jnae leaveleft1
     cmp al, 27
     jnbe leaveleft1
      jmp return
    leaveleft1:

     cmp ah , 78
        je cond7ab
        jmp leaveleft2
cond7ab:                      ; 2 ke lefts
     cmp al, 6
    ; jnae leaveleft2
   ;  cmp al, 22
     jnbe leaveleft2
      jmp return
      leaveleft2:
        cmp ah , 80
        je cond8b
        jmp leaveleft3
cond8b:                      ;  2 ke lefts 
     cmp al, 7
     jnae leaveleft3
     cmp al, 9
     jnbe leaveleft3
      jmp return
      leaveleft3:

        cmp ah , 58
        je cond8bc
        jmp leaveleft4
cond8bc:                      ;  2 ke lefts 
     cmp al, 22
     jnae leaveleft4
     cmp al, 28
     jnbe leaveleft4
      jmp return
      leaveleft4:

       cmp ah , 37
        je cond7a
        jmp leaveleft5
cond7a:                      ;  8 ke rights 
     cmp al, 19
     jnae leaveleft5
     cmp al, 22
     jnbe leaveleft5
      jmp return
      leaveleft5:
        cmp ah , 37
        je cond8a
        jmp leaveleft6
cond8a:                      ;  8 ke rights 
     cmp al, 24
     jnae leaveleft6
     cmp al, 27
     jnbe leaveleft6
      jmp return
      leaveleft6:

       cmp level,2

      jb forreal3
      cmp ah, 52   ; xops
      jne v111
      cmp al, 14   ; ypos
      jnae v111
      cmp al, 18
      jnbe v111
      jmp return
      v111:

      cmp ah, 25
      jne x5
      cmp al, 9 
      jne x55
      jmp return
      x55:
      cmp al, 25
      jne x5
      jmp return

                                                      x5:


                                            cmp level,3
                                            jb forreal3
         
                                            cmp ah, 22     ; xpos
                                            jne x1
                                            cmp al,   5        ; ypos
                                            jnae x1
                                            cmp al,  6
                                            jnbe x1
                                            jmp return
                                            x1:
                                            cmp ah, 20     ; xpos
                                            jne x2
                                            cmp al,   20       ; ypos
                                            jnae x2
                                            cmp al,  21
                                            jnbe x2
                                            jmp return
                                            x2:
                                            cmp ah, 88     ; xpos
                                            jne x3
                                            cmp al,   6       ; ypos
                                            jnae x3
                                            cmp al,  7
                                            jnbe x3
                                            jmp return
                                            x3:
                                            cmp ah, 61     ; xpos
                                            jne x4
                                            cmp al,   13       ; ypos
                                            jnae x4
                                            cmp al,  14
                                            jnbe x4
                                            jmp return     
                                            x4:
                                                              forreal3:
                                                                mov ebx, eax
                                                                call UpdateGhost
                                                                dec bh
                                                                call DrawGhost
                                                                jmp return1

       MOVERIGHT:            ; ///////////////////////////////// ghost  RIGHT
       cmp ah , 92
        je return
      ;   cmp ah , 28
        cmp ah , 27
        je cond7
        jmp leaveright
cond7:                      ;  top left 1  ka right
     cmp al, 4
     jnae leaveright
     cmp al, 13
     jnbe leaveright
      jmp return
      leaveright:

       cmp ah , 68
        je cond8
        jmp leaveright1
cond8:                    ;  bottom 1  ka  right 
     cmp al, 18
     jnae leaveright1
     cmp al, 27
     jnbe leaveright1
      jmp return
      leaveright1:

      cmp ah , 52
        je cond76
        jmp leaveright2
cond76:                      ;  top mid 2 ka right
     cmp al, 9
     jnbe leaveright2
      jmp return
      leaveright2:

       cmp ah , 52
        je cond77
        jmp leaveright3
                    cond77:                      ;  bottom mid 1 ka right
                    cmp al, 22
                    jnae leaveright3
                    jmp return
                    leaveright3:
                    cmp ah , 68
                    je cond78
                    jmp leaveright4
                    cond78:                      ;  2 ke bottom  ka right
                    cmp al, 12
                    jnae leaveright4
                    cmp al, 15
                    jnbe leaveright4
                    jmp return
                    leaveright4:
                    cmp ah , 26
                    je cond79
                    jmp leaveright5
                    cond79:                      ;  8 ke lefts 
                    cmp al, 19
                    jnae leaveright5
                    cmp al, 22
                    jnbe leaveright5
                    jmp return
                    leaveright5:
                    cmp ah , 26
                    je cond80
                    jmp leaveright6
                    cond80:                      ;  bottom mid 1 ka right
                    cmp al, 24
                    jnae leaveright6
                    cmp al, 27
                    jnbe leaveright6
                    jmp return
                    leaveright6: 

      cmp level,2
      jb forreal4

       cmp ah, 39
      jne v222
      cmp al, 14
      jnae v222
      cmp al, 18
      jnbe v222
      jmp return
      v222:
        cmp ah, 83
      jne bb5
      cmp al, 4 
      jne bb55
      jmp return
      bb55:
      cmp al, 23
      jne bb5
      jmp return

      bb5:
          
                                cmp level,3
                                jb forreal4

                                cmp ah, 19    ; xpos
                                jne bb1
                                cmp al,   5        ; ypos
                                jnae bb1
                                cmp al,  6
                                jnbe bb1
                                jmp return
                                bb1:
                                cmp ah, 17     ; xpos
                                jne bb2
                                cmp al,   20       ; ypos
                                jnae bb2
                                cmp al,  21
                                jnbe bb2
                                jmp return
                                bb2:
                                cmp ah, 85    ; bbpos
                                jne bb3
                                cmp al,   6       ; ypos
                                jnae bb3
                                cmp al,  7
                                jnbe bb3
                                jmp return
                                bb3:
                                cmp ah, 58     ; bbpos
                                jne bb4
                                cmp al,   13       ; ypos
                                jnae bb4
                                cmp al,  14
                                jnbe bb4
                                jmp return     
                                bb4:


                                                               forreal4:
                                                                mov ebx, eax
                                                                call UpdateGhost
                                                                inc bh
                                                                call DrawGhost
                                                                jmp return1

return:

pop esi
pop bx 

mov edx, eax
mov eax, 4 
call randomrange 
mov bx, ax 
cmp bx, 4 
jne skip
mov bx,0
skip:
push bx
push esi
mov ebx, edx
return1:
ret
MOVEMENTS endp


DRAWTEXT proc  ; //////////////////////////////////////// S C O R E ------- L I V E S ------------- L E V E L  ///////////////////////////////////////////////////////////////////////////////

      ; draw lives:
        mov dl, 100
        mov dh, 0
        call Gotoxy
        mov edx,OFFSET strlives
        call WriteString
        mov eax, lives
        call WriteInt

   ; draw score:
        mov eax,0
        mov edx,0
        mov dl,0         ; x position
        mov dh,0       ; y position
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov eax,score
        call WriteInt

          ; draw pacman positions
        mov dl,40         ; x position
        mov dh,0      ; y position
        call Gotoxy
        mov al, Xpos
        call WriteInt

  
         ; draw levels:
        mov dl,0         ; x position
        mov dh,28       ; y position
        call Gotoxy
        mov edx,OFFSET strlevel
        call WriteString
        mov eax, level
        call WriteInt  
        ; draw pacman positions 
        mov dl,60         ; x position
        mov dh,0      ; y position
        call Gotoxy
        mov al, Ypos
        call WriteInt

  ret
drawtext endp


MOVPACMANUP PROC ;  //////////////////////////////////////////////////////////////////////     U    P    ///////////////////////////////////////////////////////////////////////////

   cmp yPos , 3
         je gameLoop

         cmp yPos, 14
         je cond1
         jmp leaveup
 cond1:     ;  top left 1  ka bottom 
      cmp XPos, 28
      jna leaveup
      cmp Xpos, 34
      jnb leaveup
       jmp gameLoop
       leaveup:

        cmp yPos, 28
         je cond2
         jmp leaveup1
 cond2:     ;  bottom 1 ka bottom 
      cmp XPos, 68
      jna leaveup1
      cmp Xpos, 74
      jnb leaveup1
       jmp gameLoop
       leaveup1:

       cmp yPos, 23
         je cond11
         jmp leaveupxx
        cond11:        ;  8 ke top  ka bottom 
      cmp XPos, 27
      jnae leaveupxx
      cmp Xpos, 37
      jnb leaveupxx
       jmp gameLoop
       leaveupxx:

        cmp yPos, 28
         je cond22
         jmp leaveup1xx
 cond22:          ;  8 ke below ka bottom 
      cmp XPos, 27
      jnae leaveup1xx
      cmp Xpos, 37
      jnb leaveup1xx
       jmp gameLoop
       leaveup1xx:
         cmp yPos, 10
         je cond11lalalui
         jmp leaveupxxlalalui
        cond11lalalui:           ;  2 ke top  ka bottom 
      cmp XPos, 53
      jnae leaveupxxlalalui
      cmp Xpos, 79
      jnbe leaveupxxlalalui
       jmp gameLoop
       leaveupxxlalalui:
        cmp yPos, 16
         je cond22lalalui
         jmp leaveup1xxlalalui
 cond22lalalui:              ;  2 ke below ka bottom 
      cmp XPos, 69
      jnae leaveup1xxlalalui
    ;  cmp Xpos, 37
    ;  jnb leaveup1xxlalalui
       jmp gameLoop
       leaveup1xxlalalui:

       cmp level, 2 
       jb updateplayerplis

       cmp ypos, 19
       jne v2
       cmp xpos, 40
       jnae v2
       cmp xpos, 51
       jnbe v2
       jmp gameloop

       v2:
       cmp ypos, 17
       jne v3
       cmp xpos, 14
       jnae v3
       cmp xpos, 40
       jnbe v3
       jmp GameLoop

       v3:
        cmp ypos, 15
       jne v4
       cmp xpos, 40
       jnae v4
       cmp xpos, 51
       jnbe v4
       jmp gameloop 
       v4:

      cmp ypos, 10
      je c5
      cmp ypos, 26
      je c5
      jmp c6
      c5:
      cmp xpos, 14     ; xpos
      jnae c6
      cmp xpos, 24
      jnbe c6
      jmp gameloop
      c6:
        cmp ypos, 24     ; ypos
      je c7
      cmp ypos, 5
      je c7
      jmp c8
      c7:
      cmp xpos, 83     ; xpos
      jnae c8
      cmp xpos, 93
      jnbe c8
      jmp gameloop
      c8:

                         cmp level ,3 
                        jb updateplayerplis
   
   cmp ypos, 22     ; ypos
   jne c1
   cmp xpos, 18     ; xpos
   jnae c1
   cmp xpos, 19
   jnbe c1
   jmp gameloop
        c1:         
    cmp ypos,  7     ; ypos
   jne c2
   cmp xpos, 20     ; xpos
   jnae c2
   cmp xpos, 21
   jnbe c2
   jmp gameloop
   c2:
    cmp ypos,  8     ; ypos
   jne c3
   cmp xpos, 86     ; xpos
   jnae c3
   cmp xpos, 87
   jnbe c3
   jmp gameloop
   c3:

    cmp ypos,  15     ; ypos
   jne c4
   cmp xpos, 59     ; xpos
   jnae c4
   cmp xpos, 60
   jnbe c4
   jmp gameloop
   c4:

       updateplayerplis:
         call UpdatePlayer
        dec yPos
        call DrawPlayer
        jmp gameLoop

GAMELOOP:
RET
MOVPACMANUP ENDP

MOVPACMANDOWN PROC   ;           /////////////////////////////////////////   D   O    W    N  
 cmp yPos , 28
         je gameLoop
      cmp yPos, 3
         je cond3
         jmp leavedown
 cond3:     ;  top left 1  ka  
      cmp XPos, 28
      jna  leavedown
      cmp Xpos, 34
      jnb  leavedown
       jmp gameLoop
       leavedown:
        cmp yPos, 21
         je condvv
         jmp leavevv
        condvv:        ;   mid lower boundary ka top se bottom ana 
      cmp XPos, 53
      jnae leavevv
      cmp Xpos, 57
      jnbe leavevv
       jmp gameLoop
       leavevv:
        cmp yPos, 17
         je cond4
         jmp  leavedown1
 cond4:     ;  bottom 1 ka 
      cmp XPos, 68
      jna  leavedown1
      cmp Xpos, 74
      jnb  leavedown1
       jmp gameLoop
        leavedown1:
        cmp yPos, 19
         je cond11vv
         jmp leaveupvv
        cond11vv:                                    ;  8 ke top  ka top 
      cmp XPos, 27
      jnae leaveupvv
      cmp Xpos, 37
      jnb leaveupvv
       jmp gameLoop
       leaveupvv:
        cmp yPos, 24
         je cond22vv
         jmp leaveup1vv
 cond22vv:                                      ;  8 ke below ka top 
      cmp XPos, 27
      jnae leaveup1vv
      cmp Xpos, 37
      jnb leaveup1vv
       jmp gameLoop
       leaveup1vv:

         cmp yPos, 6
         je cond11lalui
         jmp leaveupxxlalui
        cond11lalui:           ;  2 ke top  ka bottom 
      cmp XPos, 53
      jnae leaveupxxlalui
      cmp Xpos, 79
      jnbe leaveupxxlalui
       jmp gameLoop
       leaveupxxlalui:

        cmp yPos, 12
         je cond22lalui
         jmp leaveup1xxlalui
 cond22lalui:                      ;  2 ke below ka bottom 
      cmp XPos, 69
      jnae leaveup1xxlalui
    ;  cmp Xpos, 37
    ;  jnb leaveup1xxlalalui
       jmp gameLoop
       leaveup1xxlalui:

        cmp level, 2 
       jb updateplayerplis

       cmp ypos, 13
       jne v2
       cmp xpos, 40
       jnae v2
       cmp xpos, 51
       jnbe v2
       jmp gameloop

       v2:
       cmp ypos, 15
       jne v3
       cmp xpos, 14
       jnae v3
       cmp xpos, 40
       jnbe v3
       jmp GameLoop

       v3:
       cmp ypos, 17
       jne v4
       cmp xpos, 40
       jnae v4
       cmp xpos, 51
       jnbe v4
       jmp gameloop 
       v4:
             cmp ypos, 8
      je d5
      cmp ypos, 24
      je d5
      jmp d6
      d5:
      cmp xpos, 14     ; xpos
      jnae d6
      cmp xpos, 24
      jnbe d6
      jmp gameloop
     d6:
        cmp ypos, 22     ; ypos
      je d7
      cmp ypos, 3
      je d7
      jmp d8
      d7:
      cmp xpos, 83     ; xpos
      jnae d8
      cmp xpos, 93
      jnbe d8
      jmp gameloop
      d8:


              cmp level, 3 
       jb updateplayerplis    
cmp ypos, 19     ; ypos
jne d1
cmp xpos, 18     ; xpos
jnae d1
cmp xpos, 19
jnbe d1
jmp gameloop
     d1:         
 cmp ypos,  4     ; ypos
jne d2
cmp xpos, 20     ; xpos
jnae d2
cmp xpos, 21
jnbe d2
jmp gameloop
d2:
 cmp ypos,  5     ; ypos
jne d3
cmp xpos, 86     ; xpos
jnae d3
cmp xpos, 87
jnbe d3
jmp gameloop
d3:

 cmp ypos,  12     ; ypos
jne d4
cmp xpos, 59     ; xpos
jnae d4
cmp xpos, 60
jnbe d4
jmp gameloop
d4:


       updateplayerplis:
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        jmp gameLoop


GAMELOOP:
RET
MOVPACMANDOWN ENDP

MOVPACMANLEFT PROC   ;  ////////////////////////////////////// L    E   F    T

   cmp xPos , 14
         je gameLoop
         cmp xPos , 34
         je cond5
         jmp leaveleft
 cond5:                         ;  top left 1  ka left 
      cmp YPos, 4
      jnae leaveleft
      cmp Ypos, 13
      jnbe leaveleft
       jmp gameLoop
       leaveleft:

        cmp xPos , 74
         je cond6
         jmp leaveleft1
 cond6:                   ;  bottom  1  ka left
      cmp YPos, 18
      jnae leaveleft1
      cmp Ypos, 27
      jnbe leaveleft1
       jmp gameLoop
     leaveleft1:

      cmp xPos , 58
         je cond7ab
         jmp leaveleft2
 cond7ab:                      ; 2 ke lefts
      cmp Ypos, 6
     ; jnae leaveleft2
    ;  cmp Ypos, 22
      jnbe leaveleft2
       jmp gameLoop
       leaveleft2:
         cmp xPos , 80
         je cond8b
         jmp leaveleft3
 cond8b:                      ;  2 ke lefts 
      cmp Ypos, 7
      jnae leaveleft3
      cmp Ypos, 9
      jnbe leaveleft3
       jmp gameLoop
       leaveleft3:
         cmp xPos , 58
         je cond8bc
         jmp leaveleft4
 cond8bc:                      ;  2 ke lefts 
      cmp Ypos, 22
      jnae leaveleft4
      cmp Ypos, 28
      jnbe leaveleft4
       jmp gameLoop
       leaveleft4:

        cmp xPos , 37
         je cond7a
         jmp leaveleft5
 cond7a:                      ;  8 ke rights 
      cmp Ypos, 20
      jnae leaveleft5
      cmp Ypos, 22
      jnbe leaveleft5
       jmp gameLoop
       leaveleft5:
         cmp xPos , 37
         je cond8a
         jmp leaveleft6
 cond8a:                      ;  8 ke rights 
      cmp Ypos, 25
      jnae leaveleft6
      cmp Ypos, 27
      jnbe leaveleft6
       jmp gameLoop
       leaveleft6:

           cmp level, 2
       jb updateplayerplis

       cmp xpos, 41
       jne v1
       cmp ypos, 14
       jnae v1
       cmp ypos, 18
       jnbe v1
       jmp gameloop
       v1:
         cmp xpos, 52
       jne v22
       cmp ypos, 14
       jne v21
       jmp gameloop
       v21:
       cmp ypos, 18
       jne v2
       jmp gameloop

       v22:
                   cmp xpos, 25
      jne x5
      cmp ypos, 9 
      jne x55
      jmp gameloop
      x55:
      cmp ypos, 25
      jne x5
      jmp gameloop

      x5:

        cmp level, 3 
       jb updateplayerplis

 
   cmp xpos, 52
   jne v2
   cmp ypos, 14
   jnae v2
   cmp ypos, 18
   jnbe v2
   jmp gameloop
   v2:

    cmp xpos, 22     ; xpos
  jne x1
  cmp ypos,   5        ; ypos
  jnae x1
  cmp ypos,  6
  jnbe x1
  jmp gameloop
   x1:
   cmp xpos, 20     ; xpos
  jne x2
  cmp ypos,   20       ; ypos
  jnae x2
  cmp ypos,  21
  jnbe x2
  jmp gameloop
  x2:

    cmp xpos, 88     ; xpos
  jne x3
  cmp ypos,   6       ; ypos
  jnae x3
  cmp ypos,  7
  jnbe x3
  jmp gameloop
  x3:
   cmp xpos, 61     ; xpos
  jne x4
  cmp ypos,   13       ; ypos
  jnae x4
  cmp ypos,  14
  jnbe x4
  jmp gameloop
   
  x4:     

       updateplayerplis:
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp gameLoop
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp gameLoop

GAMELOOP:
RET

MOVPACMANLEFT ENDP

MOVPACMANRIGHT PROC ;////////////////////////////////////////////////////////  R   I  G    H    T 
   cmp xPos , 92
         je gameLoop
       ;   cmp xPos , 28
         cmp xPos , 28
         je cond7
         jmp leaveright
 cond7:                      ;  top left 1  ka right
      cmp YPos, 4
      jnae leaveright
      cmp Ypos, 13
      jnbe leaveright
       jmp gameLoop
       leaveright:

        cmp xPos , 68
         je cond8
         jmp leaveright1
 cond8:                    ;  bottom 1  ka  right 
      cmp YPos, 18
      jnae leaveright1
      cmp Ypos, 27
      jnbe leaveright1
       jmp gameLoop
       leaveright1:

       cmp xPos , 52
         je cond76
         jmp leaveright2
 cond76:                      ;  top mid 2 ka right
      cmp Ypos, 9
      jnbe leaveright2
       jmp gameLoop
       leaveright2:

        cmp xPos , 52
         je cond77
         jmp leaveright3
 cond77:                      ;  bottom mid 1 ka right
      cmp Ypos, 22
      jnae leaveright3
       jmp gameLoop
       leaveright3:
        cmp xPos , 68
         je cond78
         jmp leaveright4
 cond78:                      ;  2 ke bottom  ka right
      cmp Ypos, 13
      jnae leaveright4
      cmp Ypos, 15
      jnbe leaveright4
       jmp gameLoop
       leaveright4:
         cmp xPos , 26
         je cond79
         jmp leaveright5
 cond79:                                 ;  8 ke rights 
      cmp Ypos, 20
      jnae leaveright5
      cmp Ypos, 22
      jnbe leaveright5
       jmp gameLoop
       leaveright5:
         cmp xPos , 26
         je cond80
         jmp leaveright6
 cond80:                      ;  bottom mid 1 ka right
      cmp Ypos, 25
      jnae leaveright6
      cmp Ypos, 27
      jnbe leaveright6
       jmp gameLoop
       leaveright6:
       ;  je gameLoop

         cmp level, 2 
       jb updateplayerplis

       cmp xpos, 39
       jne v1
       cmp ypos, 14
       jnae v1
       cmp ypos, 18
       jnbe v1
       jmp gameloop

       v1:
      cmp xpos, 83
      jne bb5
      cmp ypos, 4 
      jne bb55
      jmp gameloop
      bb55:
      cmp ypos, 23
      jne bb5
      jmp gameloop

      bb5:

           cmp level, 3 
       jb updateplayerplis

       cmp xpos, 50
       jne v2
       cmp ypos, 14
       jnae v2
       cmp ypos, 18
       jnbe v2
       jmp gameloop
       v2:
  
       
       cmp xpos, 19    ; xpos
      jne bb1
      cmp ypos,   5        ; ypos
      jnae bb1
      cmp ypos,  6
      jnbe bb1
      jmp gameloop
       bb1:
       cmp xpos, 17     ; xpos
      jne bb2
      cmp ypos,   20       ; ypos
      jnae bb2
      cmp ypos,  21
      jnbe bb2
      jmp gameloop
      bb2:

        cmp xpos, 85    ; bbpos
      jne bb3
      cmp ypos,   6       ; ypos
      jnae bb3
      cmp ypos,  7
      jnbe bb3
      jmp gameloop
      bb3:
       cmp xpos, 58     ; bbpos
      jne bb4
      cmp ypos,   13       ; ypos
      jnae bb4
      cmp ypos,  14
      jnbe bb4
      jmp gameloop     
      bb4:
  

       updateplayerplis:
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp gameLoop


GAMELOOP:
RET
MOVPACMANRIGHT ENDP

INPUTKEYBOARD PROC     ;/////////////////////////////////////////     I      N       P    U     T     //////////////////////////////////////////////////////////////////////////////////////

       mov eax, 0
       call ReadKey
       jz sapki
       mov inputChar,al
        sapki:
        mov eax,0
        mov al, dlay
        call delay
        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"o"
        je moveUp

        cmp inputChar,"l"
        je moveDown

        cmp inputChar,"k"
        je moveLeft

        cmp inputChar,";"
        je moveRight
        cmp inputChar, "p"
       je PauseScreen
         jmp RETURN 


    ;MOVEMENTS PACMAN
        MOVEUP:
        CALL MOVPACMANUP
        JMP RETURN
        MOVEDOWN:
       CALL MOVPACMANDOWN
        JMP RETURN
        MOVELEFT:
      CALL MOVPACMANLEFT
        JMP RETURN
        MOVERIGHT:
      CALL MOVPACMANRIGHT
        JMP RETURN
RETURN:
RET

exitgame:
exit
INPUTKEYBOARD ENDP


checkcoins proc 

mov ecx, 140
mov esi, 0
mov edi, offset coin1xpos
mov al, -1 
l1:
mov ah, [edi]
cmp ah , al
jne return 
inc edi 
loop l1

mov win, 1
call gameoverscreen

return:
ret
checkcoins endp



 Level2 proc    ;  ....................................................................... LEVEL 2 .......................

 ghostbehavior:
 mov eax, 10
 call randomrange
 cmp eax, 5
 je change
 jmp fruitskacode
 change:
   
            mov eax, 4 
            call randomrange 
            mov direction1, al
            mov eax, 4 
            call randomrange 
            mov direction2, al
            mov eax, 4 
            call randomrange 
            mov direction3, al
            mov eax, 4 
            call randomrange 
            mov direction4, al

            cmp level, 3 
            jne fruitskacode
            mov eax, 4 
            call randomrange 
            mov direction5, al
            mov eax, 4 
            call randomrange 
            mov direction6, al

fruitskacode:
                    ; getting points:
                    mov bl,yPos
                    cmp bl,yFruitPos
                    jne notCollecting
                    mov bl,xPos
                    cmp bl,xFruitPos
                    je collecting
                    mov bl,xFruitPos
                    inc bl
                    cmp bl,xPos
                    jne notCollecting
                    ; player is intersecting coin:
                    collecting:
                    mov dl, xfruitpos
                    mov dh, yfruitpos
                    call gotoxy
                    mov edx, offset fruitd
                    call writestring
                    add score, 25
                    mov randfruit , -1
                    notCollecting:
mov dlay, 90
ret
 level2 endp   ;  ....................................................................... LEVEL 2 .......................

 LEVEL3 PROC

 mov dlay, 50
 GHOSTSS:
   ; Ghost  5
        mov ebx,0
        mov bl, direction5
        push bx
        mov al, YPos5
        mov ah, XPOs5
        call movements
        mov Ypos5 , bl
        mov xpos5 , bh
        pop bx
        mov direction5, bl
        mov bl, ypos5
        mov bh, xpos5
        call  ghostcollision
        ;Ghost 6
        mov ebx,0
        mov bl, direction6
        push bx
        mov al, YPos6
        mov ah, XPos6
        call movements
        mov Ypos6 , bl
        mov xpos6, bh 
        pop bx
        mov direction6, bl
        mov bl, ypos6
        mov bh, xpos6
        call  ghostcollision
        mov eax, 0

TELEPORTATION:

mov eax, cyan
call settextcolor
  ; TO DRAW           "    o    "          AT DIFFERENT LOCATIONS
mov  edx,0
mov dl, 14
mov dh, 8
call gotoxy 
mov eax,0
mov al, teleport
call writechar

mov  edx,0
mov dl, 41
mov dh,  15
call gotoxy 
mov eax,0
mov al, teleport
call writechar

mov  edx,0
mov dl, 78
mov dh,  4
call gotoxy 
mov eax,0
mov al, teleport
call writechar

mov  edx,0
mov dl, 88
mov dh,  25
call gotoxy 
mov eax,0
mov al, teleport
call writechar

; TO TELEPORT PACMAN FROM ONE  "  O  "    TO ANOTHER 
cmp Xpos, 14
jne  t1
cmp Ypos, 8
jne t1
INVOKE PlaySound, OFFSET fruitee, NULL, SND_ALIAS 
mov Xpos, 42
mov Ypos, 15
call drawplayer
t1:
cmp Xpos, 41
jne  t2
cmp Ypos, 15
jne t2
INVOKE PlaySound, OFFSET fruitee, NULL, SND_ALIAS 
mov Xpos,  14
mov Ypos, 7
call drawplayer
t2:

cmp Xpos, 78
jne  t3
cmp Ypos, 4
jne t3
INVOKE PlaySound, OFFSET fruitee, NULL, SND_ALIAS 
mov Xpos, 89
mov Ypos, 26
call drawplayer
t3:
cmp Xpos, 88
jne  t4
cmp Ypos, 25
jne t4
INVOKE PlaySound, OFFSET fruitee, NULL, SND_ALIAS 
mov Xpos,  79
mov Ypos, 5
call drawplayer
t4:

LIVESADDONS:                ; ///////////////////////////////             LIVES   A   D   D  O    N

; display it at one position 
cmp lives,  3 
jnb skiplives

mov eax, lightgray
call settextcolor 

mov  edx,0
mov dl, 47
mov dh,  16
call gotoxy 
mov eax,0
mov al, Livesaddon
call writechar

cmp Xpos, 47
jne  skiplives
cmp Ypos, 16
jne skiplives
inc lives

skiplives:

mov edx,0
call gotoxy


return:
mov eax, white +(black*16)
call settextcolor
 ret
 LEVEL3 ENDP


 PAGE3 PROC
            mov eax, green
            call settextcolor

            mov dh, 5
            mov dl, 40
            call gotoxy
            mov EDX, offset stg1
            call writestring
            mov dh, 6
            mov dl, 40
            call gotoxy
            mov EDX, offset stg2
            call writestring
            mov dh, 7
            mov dl, 40
            call gotoxy
            mov EDX, offset stg3 
            call writestring
             mov dh, 8
            mov dl, 40
            call gotoxy
            mov EDX, offset stg4
            call writestring

            mov eax, lightblue
            call settextcolor

            mov dh, 10
            mov dl, 40
            call gotoxy
            mov EDX, offset stg5
            call writestring
            mov dh, 11
            mov dl, 40
            call gotoxy
            mov EDX, offset stg6
            call writestring
            mov dh, 12
            mov dl, 40
            call gotoxy
            mov EDX, offset stg7
            call writestring
             mov dh, 13
            mov dl, 40
            call gotoxy
            mov EDX, offset stg8
            call writestring


            mov eax, red
            call settextcolor
            mov dh, 16
            mov dl, 40
            call gotoxy
            mov EDX, offset stg9
            call writestring
            mov dh, 17
            mov dl, 40
            call gotoxy
            mov EDX, offset stg10
            call writestring
            mov dh, 18
            mov dl, 40
            call gotoxy
            mov EDX, offset stg11 
            call writestring
             mov dh, 19
            mov dl, 40
            call gotoxy
            mov EDX, offset stg12
            call writestring

    
 l1:
 mov eax, 0 
 call readchar
 cmp al, "1"
 je lvl1
 cmp al, "2"
 je lvl2
 cmp al, "3"
 je lvl3
 jmp l1
 lvl1:
 mov hashes, 216
     mov level,1
     mov  eax, lightblue
    call SetTextColor
 jmp return
 lvl2:
     mov hashes, 205
     mov level,2
     mov  eax,  blue
    call SetTextColor
 jmp return
 lvl3:
 mov hashes, "-"
 mov level,3
     mov  eax,  red
    call SetTextColor
 jmp return

 return:

 call clrscr
 ret
 page3 endp

MAIN   PROC   ; \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\          MAIN     PROC  /////////////////////////////////////////////////////////////////////////////////////////////////////////////
;mov eax, cyan*16
;call settextcolor
;call clrscr
mov eax,0
call settextcolor

   call Page1
    call MainMenu
    call page3
    call Borders
    call DrawPlayer
    call DrawCoin

  INVOKE PlaySound, OFFSET filee, NULL, SND_ALIAS 
GameLoop:
                    cmp lives,0 
                    je gameoverscreen
                    mov isplayer, 1
                    call callcollisionwithcoin
cmp level, 2
jae lev2
jmp stipp
lev2:
        cmp randfruit, -1
        je fruitiscreated
        jmp notCollecting
        fruitiscreated:
        mov eax, 50
        call randomrange
        cmp eax,5
        jne notCollecting
        mov randfruit , 1
        call CreateRandomFruit
        notCollecting:
        call level2

                   stipp:
cmp level, 3
je lev3
jmp stipp2
lev3:
call level3
       
                 stipp2:
                            call inputkeyboard  
                            call drawtext
                            call GhostsDirection
                            call checkcoins
 jmp gameloop  

    exitGame:
    exit
main ENDP

END main