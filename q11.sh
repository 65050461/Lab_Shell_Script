for file in $(find . -type f -name "L*.c")
do
	trimmedName=`echo $file | cut -d'/' -f2 | cut -d'.' -f1`
	gcc -o $trimmedName 2>/dev/null
	Name=`echo $file | cut -d'/' -f2`
	if [ -f $trimmedName ]
	then
		if [ $(./$trimmedName) = 20 ]
		then 
			printf "%s\t10\n" $Name 
		else
			printf "%s\t7\n" $Name  
		fi
	else
		printf "%s\t5\n" $Name 
	fi
done
