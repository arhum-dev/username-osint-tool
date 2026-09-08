#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME=$1
echo "[*] Checking username: $USERNAME"
echo "----------------------------------------"

declare -A sites=(
    ["GitHub"]="https://github.com/$USERNAME"
    ["Instagram"]="https://www.instagram.com/$USERNAME"
    ["TikTok"]="https://www.tiktok.com/@$USERNAME"
    ["Twitter/X"]="https://x.com/$USERNAME"
    ["Reddit"]="https://www.reddit.com/user/$USERNAME"
    ["Pinterest"]="https://www.pinterest.com/$USERNAME"
)

for site in "${!sites[@]}"; do
    url="${sites[$site]}"
    status=$(curl -o /dev/null -s -w "%{http_code}" -A "Mozilla/5.0" "$url")
    if [ "$status" -eq 200 ]; then
        echo "[+] $site: FOUND -> $url"
    else
        echo "[-] $site: not found ($status)"
    fi
done

echo "----------------------------------------"
echo "[*] Extracting public Instagram info..."

IG_HTML=$(curl -s -A "Mozilla/5.0" "https://www.instagram.com/$USERNAME/")
IG_TITLE=$(echo "$IG_HTML" | grep -oP '(?<=<title>).*?(?=</title>)')

if [ -n "$IG_TITLE" ]; then
    echo "[+] Instagram page title: $IG_TITLE"
else
    echo "[-] Could not extract Instagram info (may require login or JS rendering)"
fi
