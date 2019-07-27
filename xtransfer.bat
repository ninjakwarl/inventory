set d=%date:~-4,4%%date:~-7,2%%date:~0,2%
set d=%d: =_%
set t=%time:~0,2%%time:~3,2%%time:~6,2%
set t=%t: =0%

copy "C:\Users\ksaycon\Documents\NetBeansProjects\JavaPOS\invoice.pdf" "C:\Users\ksaycon\Desktop\folder2\"
rename "C:\Users\ksaycon\Desktop\folder2\invoice.pdf" "invoice_%d%_%t%.pdf"
echo "Done Copying and renaming...."