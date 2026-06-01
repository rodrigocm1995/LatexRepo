set table "1.table"; set format "%.5f"
set samples 250.0; set parametric; plot [t=0:4] [] [] log10(10**t),(t<log10(1./(0.01))? 0:-90)
