for FILE in $(find ../E -type f );
do
    mv "${FILE}" "${FILE//\.[A-z]*/}"
done
