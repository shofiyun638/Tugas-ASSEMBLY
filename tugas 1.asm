org 0h

; Nama  : SHERLY NIA HANDAYANI
; NIM   : 18041082
; Kelas : 4i

SHERLY:
Mov A,#00000001b    ;isi A dengan 00000001b
Mov R3,#7           ;isi R3 dengan 7 Bit ke 1 nilainya 0 akan di geser ke kiri 7 langkah oleh DEC R3

Kiri:

; R3 = 7 PO = #00000001b
; R3 = 6 PO = #00000010b
; R3 = 5 PO = #00000100b
; R3 = 4 PO = #00001000b
; R3 = 3 PO = #00010000b
; R3 = 2 PO = #00100000b
; R3 = 1 PO = #01000000b
; R3 = 0 PO = #10000000b

Mov P0,A            ; copy A ke P0
acall Delay         ; panggil sub rutine delay
RL A                ; data A diputar ke kiri
DEC R3              ; data R3 dikurangi 1
CJNE R3,#0,Kiri     ; bandingkan R3 dengan 0, if NE jump kiri atau jika nilai R3 = 0 maka turun ke baris mov R3,#0, jika R3 tidak sama dengan 0 maka loncat label kiri
Mov R3,#0           ; nilai register R3 = 0 

Kanan:

; R3 = 0 PO = #10000000b
; R3 = 1 PO = #01000000b
; R3 = 2 PO = #00100000b
; R3 = 3 PO = #00010000b
; R3 = 4 PO = #00001000b
; R3 = 5 PO = #00000100b
; R3 = 6 PO = #00000010b
; R3 = 7 PO = #00000001b

Mov P0,A            ; P0 Menjadi 10000000b
acall Delay         ; panggil sub rutine delay
RR A                ; data A diputar ke kanan
INC R3              ; data R3 ditambah 1
CJNE R3,#7,Kanan    ; membandingkan R3 dengan 7 jika R3 = 7 maka akan memanggil delay. jika tidak maka akan memangil kanan sampai nilai R3 = 7
acall delay
sjmp SHERLY


delay: mov r0,#4h      ; 4 kali ulang
delay1: mov r1,#0ffh   ; 255 kali ulang
delay2: mov r2,#0      ; 256 kali ulang
djnz r2,$              ; 256 x 255 x 4 x 2 = 522240
djnz r1,delay2         ; 255 x 4 = 1020
djnz r0,delay1         ; 4 x 3 = 12
                       ; 522240 + 1020 + 12 = 523272 uS = 0,523 sekon
ret
end
