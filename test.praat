dir$ = "data/" 

Create Strings as file list: "file_list", dir$ + "*.wav"
nFiles = Get number of strings
printline 'nFiles'
outFile$ = "duration.txt"
askBeforeDelete = 1
if askBeforeDelete and fileReadable(outFile$)
    pauseScript: "File exists! Overwrite?"
endif

for i from 1 to nFiles
    selectObject: "Strings file_list"
    filename$ = Get string: i
    basename$ = filename$ - ".wav"
    Read from file: dir$ + filename$
    
    printline 'basename$'
    selectObject: "Sound 'basename$'"
    dur = Get total duration
	appendInfoLine: basename$, " ", dur
    appendFileLine: outFile$, basename$, " ", dur

    
endfor

# Clean up (optional)
# select all
# Remove
# printline All finished!