#!/usr/bin/env bash

set -e

cat index.txt history.txt | sed '/^$/d' | sort -u -o history.txt

echo '
<?xml version="1.0" encoding="UTF-8"?>
<opml version="2.0">
<body>
' > index.opml

sort -u index.txt | while read LINE; do
if [[ -n "$LINE" ]]; then
    echo '<outline xmlUrl="'$LINE'" />' >> index.opml
fi
done

echo '
</body>
</opml>
' >> index.opml
