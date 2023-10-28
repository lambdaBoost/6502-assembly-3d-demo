10 OSWRCH=&FFE3
20 DIM GAP% 500
30 DIM data &18
35 DIM x_offset_data &40
36 DIM y_offset_data &40
40 FOR opt%=0 TO 3 STEP 3

50 P%=GAP%

55 [
60 OPT opt% \suppress error messages on first pass

70 .data
71 EQUB 25
72 EQUB 4
73 EQUW 125\v1
74 EQUW 250
75 EQUB 25
76 EQUB 5
77 EQUW 5\v2
78 EQUW 50
79 EQUB 25
80 EQUB 5
81 EQUW 250\v3
82 EQUW 50
83 EQUB 25
84 EQUB 5
85 EQUW 125\v1
86 EQUW 250

95 .x_offset_data \just an x offset to add to each vertex
96 EQUB 0 \v1
98 EQUB 0 \ v2 sin
100 EQUB 0 \ v3 sin 180 oop
102 EQUB 0

110 EQUB 0
113 EQUB 10
115 EQUB -10
117 EQUB 0


121 EQUB 0
123 EQUB 37
125 EQUB -37
127 EQUB 0


131 EQUB 0
133 EQUB 77
135 EQUB -77
137 EQUB 0


141 EQUB 0
143 EQUB 125
145 EQUB -125
147 EQUB 0


151 EQUB 0
153 EQUB 173
155 EQUB -173
157 EQUB 0


161 EQUB 0
163 EQUB 213
165 EQUB -213
167 EQUB 0


171 EQUB 0
173 EQUB 240
175 EQUB -240
177 EQUB 0


181 EQUB 0
183 EQUB 250
185 EQUB -250
187 EQUB 0


191 EQUB 0
193 EQUB 240
195 EQUB -240
197 EQUB 0


201 EQUB 0
203 EQUB 213
205 EQUB -213
207 EQUB 0


211 EQUB 0
213 EQUB 173
215 EQUB -173
217 EQUB 0


221 EQUB 0
223 EQUB 125
225 EQUB -125
227 EQUB 0


231 EQUB 0
233 EQUB 77
235 EQUB -77
237 EQUB 0


241 EQUB 0
243 EQUB 37
245 EQUB -37
247 EQUB 0


251 EQUB 0
253 EQUB 10
255 EQUB -10
257 EQUB 0



290 .y_offset_data

300 EQUB 0
301 EQUB 0 \v2 - cos
302 EQUB 0 \v3 - cos 180 out of phase
303 EQUB 0


312 EQUB 0
314 EQUB -4
316 EQUB 4
318 EQUB 0


322 EQUB 0
324 EQUB -13
326 EQUB 13
328 EQUB 0


332 EQUB 0
334 EQUB -21
336 EQUB 21
338 EQUB 0


342 EQUB 0
344 EQUB -25
346 EQUB 25
348 EQUB 0


352 EQUB 0
354 EQUB -21
356 EQUB 21
358 EQUB 0


362 EQUB 0
364 EQUB -13
366 EQUB 13
368 EQUB 0


372 EQUB 0
374 EQUB -4
376 EQUB 4
378 EQUB 0


382 EQUB 0
384 EQUB 0
386 EQUB 0
388 EQUB 0


392 EQUB 0
394 EQUB 4
396 EQUB -4
398 EQUB 0


402 EQUB 0
404 EQUB 13
406 EQUB -13
408 EQUB 0


412 EQUB 0
414 EQUB 21
416 EQUB -21
418 EQUB 0


422 EQUB 0
424 EQUB 25
426 EQUB -25
428 EQUB 0


432 EQUB 0
434 EQUB 21
436 EQUB -21
438 EQUB 0


442 EQUB 0
444 EQUB 13
446 EQUB -13
448 EQUB 0


452 EQUB 0
454 EQUB 4
456 EQUB -4
458 EQUB 0



500 .entry LDX #0 \ counter for single frame. counts draw commands
501 LDA #22\screen mode to 4
502 JSR OSWRCH
503 LDA #4
504 JSR OSWRCH
505 LDY #0 \counter for full sequence

510 .loop 
511 LDA data,X \ load VDU parameter from data block 
512 JSR OSWRCH \ perform VDU command
513 INX \ increment offset
514 LDA data,X  \second vdu parameter
515 JSR OSWRCH 
516 INX 
517 LDA data,X \ left byte of x coord
518 ADC x_offset_data, Y \onlyt this one has an effect
519 JSR OSWRCH 
520 INX 
521 LDA data,X \right byte of x coord
\119 ADC offset_data, Y
522 JSR OSWRCH
523 INX
525 LDA data,X \left byte of y coord
526 ADC y_offset_data, Y
527 JSR OSWRCH
528 INX 
529 LDA data,X \ right byte of y coord
\128 ADC offset_data, Y
530 JSR OSWRCH
531 INX
532 INY

540 CPX #24 \ has all data been loaded?
541 BNE loop \ if not, load next line
545 LDA #12 \clear screen
547 JSR OSWRCH 
548 LDX #0
549 CPY #40 \has full sequence been loaded?
550 BNE loop \if not draw next shape
551 LDY #0 \ return to BASIC
552 JSR loop


600 ]

610 NEXT
640 CALL entry