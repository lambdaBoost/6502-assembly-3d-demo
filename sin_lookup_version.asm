10 OSWRCH=&FFE3
20 DIM GAP% 200
30 DIM data &18
35 DIM ofset_data &30
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

100 .offset_data \v1_xoffset_data
101 EQUB 0 \v1x
    EQUB 0 \v1y
    EQUB 6 \v2x
    EQUB 0 \v2y
    EQUB -6 \v3x

102 EQUB 0
103 EQUB 0
104 EQUB 0
105 EQUB 0
106 EQUB 0
107 EQUB 0
108 EQUB 0
109 EQUB 0
110 EQUB 0

120 \v1_yoffset_data
121 
122 EQUB 0
123 EQUB 0
124 EQUB 0
125 EQUB 0
126 EQUB 0
127 EQUB 0
128 EQUB 0
129 EQUB 0
130 EQUB 0

140 \v2_xoffset_data
141 
142 EQUB 6
143 EQUB 52
144 EQUB 125
145 EQUB 198
146 EQUB 244
147 EQUB 244
148 EQUB 198
149 EQUB 125
150 EQUB 52

160 \v2_yoffset_data
161 
162 EQUB 0
163 EQUB 0
164 EQUB 0
165 EQUB 0
166 EQUB 0
167 EQUB 0
168 EQUB 0
169 EQUB 0
170 EQUB 0

180 \v3_xoffset_data
181 
182 EQUB -6
183 EQUB -52
184 EQUB -125
185 EQUB -198
186 EQUB -244
187 EQUB -244
188 EQUB -198
189 EQUB -125
190 EQUB -52

200 \v3_yoffset_data
201 EQUB 0
202 EQUB 0
203 EQUB 0
204 EQUB 0
205 EQUB 0
206 EQUB 0
207 EQUB 0
208 EQUB 0
209 EQUB 0
210 EQUB 0



220 .entry LDX #0 \ counter for single frame
221 LDA #22\screen mode to 4
222 JSR OSWRCH
223 LDA #4
224 JSR OSWRCH
225 LDY #0 \counter for full sequence

230 .loop 
231 LDA data,X \ load VDU parameter from data block 
232 JSR OSWRCH \ perform VDU command
233 INX \ increment offset
234 LDA data,X  \second vdu parameter
235 JSR OSWRCH 
236 INX 
237 LDA data,X \ left byte of x coord
238 ADC offset_data, Y \onlyt this one has an effect
239 JSR OSWRCH 
240 INX 
241 LDA data,X \right byte of x coord
\119 ADC offset_data, Y
242 JSR OSWRCH
243 INX
244 INY
245 LDA data,X \left byte of y coord
246 ADC offset_data, Y
247 JSR OSWRCH
248 INX 
249 LDA data,X \ right byte of y coord
\128 ADC offset_data, Y
250 JSR OSWRCH
251 INX
252 INY 

260 CPX #24 \ has all data been loaded?
261 BNE loop \ if not, load next line
262 LDA #12 \clear screen
263 JSR OSWRCH 
264 LDX #0
265 CPY #48 \has full sequence been loaded?
266 BNE loop \if not draw next shape
267 LDY #0 \ return to BASIC
268 JSR loop


300 ]

310 NEXT
340 CALL entry