
# Ensure each of the json files are properly formatted
export badfiles=0
for file in `find json -name "*.json"`; do
  python -m json.tool $file output.json

  if [ $? -ne 0 ]; then 
    echo "$file is malformatted"
    ((badfiles++))
  fi
done

echo
if [ $badfiles -ne 0 ]; then
  echo "$badfiles files were malformatted"
  exit 1
fi

jsonschema json/gnds-2.0.json
