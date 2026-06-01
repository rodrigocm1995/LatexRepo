set table "2.table"; set format "%.5f"
set samples 250.0; set parametric; plot [t=0:4] [] [] log10(10**t),-180/3.1415957*atan(0.01*10**t)
