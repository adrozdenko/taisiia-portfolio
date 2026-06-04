#!/bin/bash
# Test all image URLs in HTML
grep -oP 'https://[^"'\'']+' index.html | sort -u | while read url; do
  code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  status="✓"
  [ "$code" != "200" ] && status="✗ $code"
  echo "$status $url"
done
