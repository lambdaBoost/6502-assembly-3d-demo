10 OSWRCH=&FFE3
20 DIM GAP% 800
30 DIM data &2A
35 DIM x_offset_data &70
36 DIM y_offset_data &70
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
81 EQUW 125\v4
82 EQUW 100
83 EQUB 25
84 EQUB 5
85 EQUW 250\v3
86 EQUW 50
87 EQUB 25
88 EQUB 5
89 EQUW 125\v1
90 EQUW 250
91 EQUB 25
92 EQUB 5
93 EQUW 125\v5
94 EQUW 2
95 EQUB 25
96 EQUB 5
97 EQUW 250\v3
98 EQUW 50


100 .x_offset_data \just an x offset to add to each vertex
101 EQUB 0 \v1
102 EQUB 0 \ v2 sin
103 EQUB 0 \v4 cos
104 EQUB 0 \ v3 sin 180 oop
105 EQUB 0 \v1
106 EQUB 0 \v5 cos 180 oop
107 EQUB 0 \ v3 sin 180 oop


110 EQUB 0
113 EQUB 10
114 EQUB -18
115 EQUB -10
117 EQUB 0
118 EQUB 18
119 EQUB -10



121 EQUB 0
123 EQUB 37
124 EQUB -60
125 EQUB -37
127 EQUB 0
128 EQUB 60
129 EQUB -37



131 EQUB 0
133 EQUB 77
134 EQUB -102
135 EQUB -77
137 EQUB 0
138 EQUB 102
139 EQUB -77



141 EQUB 0
143 EQUB 125
144 EQUB -120
145 EQUB -125
147 EQUB 0
148 EQUB 120
149 EQUB -125



151 EQUB 0
153 EQUB 173
154 EQUB -102
155 EQUB -173
157 EQUB 0
158 EQUB 102
159 EQUB -173



161 EQUB 0
163 EQUB 213
164 EQUB -60
165 EQUB -213
167 EQUB 0
168 EQUB 60
169 EQUB -213



171 EQUB 0
173 EQUB 240
174 EQUB -18
175 EQUB -240
176 EQUB 0
177 EQUB 18
179 EQUB -240



181 EQUB 0
183 EQUB 250
184 EQUB 0
185 EQUB -250
187 EQUB 0
188 EQUB 0
189 EQUB -250



191 EQUB 0
193 EQUB 240
194 EQUB 18
195 EQUB -240
197 EQUB 0
198 EQUB -18
199 EQUB -240



201 EQUB 0
203 EQUB 213
204 EQUB 60
205 EQUB -213
207 EQUB 0
208 EQUB -60
209 EQUB -213



211 EQUB 0
213 EQUB 173
214 EQUB 102
215 EQUB -173
217 EQUB 0
218 EQUB -102
219 EQUB -173



221 EQUB 0
223 EQUB 125
224 EQUB 120
225 EQUB -125
227 EQUB 0
228 EQUB -120
229 EQUB -125


231 EQUB 0
233 EQUB 77
234 EQUB 102
235 EQUB -77
237 EQUB 0
238 EQUB -102
239 EQUB -77



241 EQUB 0
243 EQUB 37
244 EQUB 60
245 EQUB -37
247 EQUB 0
248 EQUB -60
249 EQUB -37



251 EQUB 0
253 EQUB 10
254 EQUB 18
255 EQUB -10
257 EQUB 0
258 EQUB -18
259 EQUB -10




290 .y_offset_data

300 EQUB 0
301 EQUB 0 \v2 - cos
303 EQUB 0 \v4 - sin
304 EQUB 0 \v3 - cos 180 out of phase
305 EQUB 0
306 EQUB 0 \v5 cos 180 oop
307 EQUB 0 \v3 - cos 180 out of phase



312 EQUB 0
314 EQUB -4
315 EQUB -4
316 EQUB 4
318 EQUB 0
319 EQUB 4
320 EQUB 4



322 EQUB 0
324 EQUB -13
325 EQUB -14
326 EQUB 13
328 EQUB 0
329 EQUB 14
330 EQUB 13



332 EQUB 0
334 EQUB -21
335 EQUB -30
336 EQUB 21
338 EQUB 0
339 EQUB 30
340 EQUB 21



342 EQUB 0
344 EQUB -25
345 EQUB -50
346 EQUB 25
348 EQUB 0
349 EQUB 50
350 EQUB 25



352 EQUB 0
354 EQUB -21
355 EQUB -70
356 EQUB 21
358 EQUB 0
359 EQUB 70
360 EQUB 21



362 EQUB 0
364 EQUB -13
365 EQUB -86
366 EQUB 13
368 EQUB 0
369 EQUB 86
370 EQUB 13



372 EQUB 0
374 EQUB -4
375 EQUB -96
376 EQUB 4
378 EQUB 0
379 EQUB 96
380 EQUB 4



382 EQUB 0
384 EQUB 0
385 EQUB -100
386 EQUB 0
388 EQUB 0
389 EQUB 100
390 EQUB 0



392 EQUB 0
394 EQUB 4
395 EQUB -96
396 EQUB -4
398 EQUB 0
399 EQUB 96
400 EQUB -4



402 EQUB 0
404 EQUB 13
405 EQUB -86
406 EQUB -13
408 EQUB 0
409 EQUB 86
410 EQUB -13



412 EQUB 0
414 EQUB 21
415 EQUB -70
416 EQUB -21
418 EQUB 0
419 EQUB 70
420 EQUB -21



422 EQUB 0
424 EQUB 25
425 EQUB -48
426 EQUB -25
428 EQUB 0
429 EQUB 48
430 EQUB -25



432 EQUB 0
434 EQUB 21
435 EQUB -30
436 EQUB -21
438 EQUB 0
439 EQUB 30
440 EQUB -21



442 EQUB 0
444 EQUB 13
445 EQUB -14
446 EQUB -13
448 EQUB 0
449 EQUB 14
450 EQUB -13



452 EQUB 0
454 EQUB 4
455 EQUB -4
456 EQUB -4
458 EQUB 0
459 EQUB 4
460 EQUB -4




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


540 CPX #42 \ has all data been loaded? (operand in decimal for some reason)
541 BNE loop \ if not, load next line
545 LDA #12 \clear screen
547 JSR OSWRCH 
548 LDX #0
549 CPY #112 \has full sequence been loaded? (operand in decimal for some reason)
550 BNE loop \if not draw next shape
551 LDY #0 \ restart shape loop
552 JSR loop


600 ]

610 NEXT
640 CALL entry