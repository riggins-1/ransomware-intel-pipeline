#!/bin/bash

URL="https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json"

OUTPUT="data/kev.json"
NDJSON="data/kev_ndjson.json"
LOG="logs/project.log"

mkdir -p data logs

echo "Downloading KEV catalog..."

if curl -L -o "$OUTPUT" "$URL"; then

    if jq empty "$OUTPUT"; then

        jq -c '.vulnerabilities[]' "$OUTPUT" > "$NDJSON"

        bq load \
        --replace \
        --autodetect \
        --source_format=NEWLINE_DELIMITED_JSON \
        ransomware_intel.kev \
        "$NDJSON"

        echo "$(date): KEV updated" >> "$LOG"

    else

        echo "Invalid JSON"

    fi

else

    echo "Download failed"

fi
