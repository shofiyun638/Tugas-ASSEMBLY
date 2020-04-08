org 0h

; Nama  : SHOFIYUN
; NIM   : 17041094
; Kelas : 4i

SHOFIYUN:
Mov A,#11111010b    ;isi A dengan 11111110b
Mov R3,#7           ;isi R3 dengan 7 Bit ke 1 nilainya 0 akan di geser ke kiri 7 langkah oleh DEC R3

Kiri:

; R3 = 7 PO = #11111010b
; R3 = 6 PO = #11110101b
; R3 = 5 PO = #11101011b
; R3 = 4 PO = #11010111b
; R3 = 3 PO = #10101111b
; R3 = 2 PO = #01011111b
; R3 = 1 PO = #10111110b
; R3 = 0 PO = #01111101b

Mov P0,A            ;copy A ke P0
acall Delay         ;panggil sub rutine delay
RL A                ;data A diputar ke kiri
DEC R3              ;data R3 dikurangi 1
CJNE R3,#0,Kiri     ;bandingkan R3 dg 0, if NE jump kiri atau jika nilai R3 = 0 maka turun ke baris mov R0,#0, jika R3 tidak sama dengan 0 maka loncat label kiri
Mov R3,#0           ; nilai register R3=0 Bit ke 8 nilainya 0 akan di geser ke kiri 7 langkah oleh INC R3

Kanan:

; R3 = 0 PO = #01111101b
; R3 = 1 PO = #10111110b
; R3 = 2 PO = #01011111b
; R3 = 3 PO = #10101111b
; R3 = 4 PO = #11010111b
; R3 = 5 PO = #11101011b
; R3 = 6 PO = #11110101b
; R3 = 7 PO = #11111010b

Mov P0,A            ; P0 Menjadi 01111101b
acall Delay         ; panggil sub rutine delay
RR A                ; data A diputar ke kanan
INC R3              ; data R3 ditambah 1
CJNE R3,#7,Kanan    ; membandingkan R0 dengan 7 jika R3 = 7 maka akan memanggil delay. jika tidak maka akan memangil kanan sampai nilai R3 = 7
acall delay
sjmp SHOFIYUN


delay: mov r0,#4h      ; 4 kali ulang
delay1: mov r1,#0ffh   ; 255 kali ulang
delay2: mov r2,#0      ; 256 kali ulang
djnz r2,$              ; 256 x 255 x 4 x 2 = 522240
djnz r1,delay2         ; 255 x 4 = 1020
djnz r0,delay1         ; 4 x 3 = 12
                       ; 522240 + 1020 + 12 = 523272 uS = 0,523 sekon
ret
end