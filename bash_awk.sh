#!/bin/bash

function usage() {
  if [ -n "$1" ]; then
    echo -e " $1\n";
  fi
  echo "Usage example: $0 [--columns 2 --old_separator \",\"] [--new_separator \"\t\"] [--output_record_separator \"\\n-->\\n\"] [--file file_to.read]"
  echo "  -c,   --columns                   Columns to print."
  echo "  -o,   --old_separator             Separator to replace."
  echo "  -u,   --output_record_separator   Output record separator."
  echo "  -p,   --output_field_separator    Output field separator."
  echo "  -f,   --file                      File to read."
  echo
  exit 1
}

while [[ "$#" -gt 0 ]]
  do case $1 in
    -c|--columns) COLUMNS="$2"
      shift;shift;;
    -o|--old_separator) OLD_SEPARATOR="$2"
      shift;shift;;
    -u|--output_record_separator) OU_REC_SEPARATOR="$2"
      shift;shift;;
    -p|--output_field_separator) OU_FIELD_SEPARATOR="$2"
      shift;shift;;
    -f|--file) R_FILE="$2"
      shift;shift;;
    *) usage "Unknown parameter passed: $1"
      shift; shift;;
  esac
done

if [ -z "$COLUMNS" ]
  then usage "Columns are not set, use the -c option for this."
fi

if [[ "$COLUMNS" -eq "0"  ]]; then
  PRINT_COL='$1=$1;print $0'
else
  COLUMNS=$(sed "s/,/,$/g;s/^/$/g;" <<< "$COLUMNS")
  PRINT_COL="print $COLUMNS"
fi

if [ -z "$OU_REC_SEPARATOR" ]
  then OU_REC_SEPARATOR="\n"
fi

if [ -z "$OU_FIELD_SEPARATOR" ]
  then usage "Output field separator is not set, use the -p option for this."
fi

if [ -z "$OLD_SEPARATOR" ]
  then usage "Old separator is not set, use the -o option for this."
fi

if [ -z "$R_FILE" ]
  then usage "File is not set, use the -f option for this."
  else
  if [ ! -f "$R_FILE" ]
    then
      echo "File not exist."
      EXIT 0
    fi
fi

awk "BEGIN { FS=\"$OLD_SEPARATOR\" ; ORS=\"$OU_REC_SEPARATOR\"; OFS=\"$OU_FIELD_SEPARATOR\"} {$PRINT_COL}" "$R_FILE"
echo -e "\nawk command used:"
echo "awk \"BEGIN { FS=\"$OLD_SEPARATOR\" ; ORS=\"$OU_REC_SEPARATOR\"; OFS=\"$OU_FIELD_SEPARATOR\"} {$PRINT_COL}" "$R_FILE"\"