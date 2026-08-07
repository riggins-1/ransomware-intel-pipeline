URL="https://api.ransomware.live/v2/allcyberattacks"
OUTPUT_FILE="data/ransomware_attacks.json"
LOG_FILE="logs/project.log"

mkdir -p "$(dirname "$OUTPUT_FILE")" "$(dirname "$LOG_FILE")"

if curl -f -L -A "Mozilla/5.0 (X11; Linux x86_64)" -o "$OUTPUT_FILE" "$URL"; then
    if ! jq empty "$OUTPUT_FILE" 2>/dev/null; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: Downloaded file is not valid JSON." >> "$LOG_FILE"
        echo "Downloaded file failed JSON validation!" >&2
        exit 1
    fi
    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCCESS: Ransomware attack data downloaded and validated." >> "$LOG_FILE"
    echo "Download successful and validated."
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: curl failed to download file." >> "$LOG_FILE"
    echo "Download failed!" >&2
    exit 1
fi
