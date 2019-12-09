#!/usr/bin/env bash

set -e

sort index.txt | uniq -d

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
