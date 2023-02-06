#!/bin/bash

usage() { echo "Usage: $0 -e ENV_VAR=VALUE -o output.txt" 1>&2; }

envs=()
while getopts "e:o:h" opt; do
    case $opt in
        e) envs+=("$OPTARG");;
        o) file="$OPTARG";;
        h) usage; exit 0;;
        *) usage; exit 1;;
    esac
done
shift $((OPTIND -1))

if [ ${#envs[@]} -eq 0 ] || [ -z "$file" ]; then
  usage; exit 1;
fi

contents=""
for val in "${envs[@]}"; do
  contents+="$val\n"
done

echo -e "$contents"
echo -e "$contents" > "$file"
