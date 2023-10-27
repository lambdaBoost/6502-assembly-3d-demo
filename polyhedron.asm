10 OSWRCH=&FFE3
20 DIM GAP% 500
30 DIM data &18
35 DIM offset_data &80
40 FOR opt%=0 TO 3 STEP 3

50 P%=GAP%

60 [
70 OPT opt% \suppress error messages on first pass

80 .data
81 EQUB 25
82 EQUB 4
83 EQUW 125\v1
84 EQUW 250
85 EQUB 25
86 EQUB 5
87 EQUW 5\v2
88 EQUW 5
89 EQUB 25
90 EQUB 5
91 EQUW 250\v3
92 EQUW 5
93 EQUB 25
94 EQUB 5
95 EQUW 125
96 EQUW 250

100 .offset_data \just an x-y offset to add to each vertex
101 EQUB 0
102 EQUB 0
103 EQUB 0 \v2x - sin
104 EQUB 12 \v2y - cos
105 EQUB 0 \ v3x - sin 180 out of phase
106 EQUB 12 \v3y - cos 180 out of phase
107 EQUB 0
108 EQUB 0

110 EQUB 0
112 EQUB 0
113 EQUB 10
114 EQUB 7
115 EQUB -10
116 EQUB 17
117 EQUB 0
118 EQUB 0

121 EQUB 0
122 EQUB 0
123 EQUB 37
124 EQUB 4
125 EQUB -37
126 EQUB 20
127 EQUB 0
128 EQUB 0

131 EQUB 0
132 EQUB 0
133 EQUB 77
134 EQUB 1
135 EQUB -77
136 EQUB 23
137 EQUB 0
138 EQUB 0

141 EQUB 0
142 EQUB 0
143 EQUB 125
144 EQUB 0
145 EQUB -125
146 EQUB 24
147 EQUB 0
148 EQUB 0

151 EQUB 0
152 EQUB 0
153 EQUB 173
154 EQUB 1
155 EQUB -173
156 EQUB 23
157 EQUB 0
158 EQUB 0

161 EQUB 0
162 EQUB 0
163 EQUB 213
164 EQUB 4
165 EQUB -213
166 EQUB 20
167 EQUB 0
168 EQUB 0

171 EQUB 0
172 EQUB 0
173 EQUB 240
174 EQUB 7
175 EQUB -240
176 EQUB 17
177 EQUB 0
178 EQUB 0

181 EQUB 0
182 EQUB 0
183 EQUB 250
184 EQUB 12
185 EQUB -250
186 EQUB 12
187 EQUB 0
188 EQUB 0

191 EQUB 0
192 EQUB 0
193 EQUB 240
194 EQUB 17
195 EQUB -240
196 EQUB 7
197 EQUB 0
198 EQUB 0

201 EQUB 0
202 EQUB 0
203 EQUB 213
204 EQUB 20
205 EQUB -213
206 EQUB 4
207 EQUB 0
208 EQUB 0

211 EQUB 0
212 EQUB 0
213 EQUB 173
214 EQUB 23
215 EQUB -173
216 EQUB 1
217 EQUB 0
218 EQUB 0

221 EQUB 0
222 EQUB 0
223 EQUB 125
224 EQUB 24
225 EQUB -125
226 EQUB 0
227 EQUB 0
228 EQUB 0

231 EQUB 0
232 EQUB 0
233 EQUB 77
234 EQUB 23
235 EQUB -77
236 EQUB 1
237 EQUB 0
238 EQUB 0

241 EQUB 0
242 EQUB 0
243 EQUB 37
244 EQUB 20
245 EQUB -37
246 EQUB 4
247 EQUB 0
248 EQUB 0

251 EQUB 0
252 EQUB 0
253 EQUB 10
254 EQUB 17
255 EQUB -10
256 EQUB 7
257 EQUB 0
258 EQUB 0




300 .entry LDX #0 \ counter for single frame
301 LDA #22\screen mode to 4
302 JSR OSWRCH
303 LDA #4
304 JSR OSWRCH
305 LDY #0 \counter for full sequence

310 .loop 
311 LDA data,X \ load VDU parameter from data block 
312 JSR OSWRCH \ perform VDU command
313 INX \ increment offset
314 LDA data,X  \second vdu parameter
315 JSR OSWRCH 
316 INX 
317 LDA data,X \ left byte of x coord
318 ADC offset_data, Y \onlyt this one has an effect
319 JSR OSWRCH 
320 INX 
321 LDA data,X \right byte of x coord
\119 ADC offset_data, Y
322 JSR OSWRCH
323 INX
324 INY
325 LDA data,X \left byte of y coord
326 ADC offset_data, Y
327 JSR OSWRCH
328 INX 
329 LDA data,X \ right byte of y coord
\128 ADC offset_data, Y
330 JSR OSWRCH
331 INX
332 INY

340 CPX #24 \ has all data been loaded?
341 BNE loop \ if not, load next line
342 LDA #12 \clear screen
343 JSR OSWRCH 
344 LDX #0
345 CPY #80 \has full sequence been loaded?
346 BNE loop \if not draw next shape
347 LDY #0 \ return to BASIC
348 JSR loop


400 ]

410 NEXT
440 CALL entry