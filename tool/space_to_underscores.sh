
#!/bin/bash
#Autho:Samray
#Description:
#replace spaces to underscores

function replace_spaces_to_underscores {
    for file in $1*
    do
        mv "$file" `echo $file | tr ' ' '_'` ;
    done 
}
