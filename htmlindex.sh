#!/usr/bin/env sh
# Static HTML File Index Generator
# Licensed under GNU GPLv3 or newer
set -e

cat <<EOF
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>INDEX</title>
	</head>
	<body>
		<h1>INDEX</h1>
		<table>
		<tr><th>Filename</th>	<th>Size</th><tr>
EOF

cd "${1:-.}"

{
for i in * ; do
	printf '\t\t<tr><td><a href=\"%s\">%s</a></td><td>%s</td></tr>' "$i" "$i" "$(du -hs -- "$i" | cut -f 1 -d ' ')"
done


cat <<EOF
	</table>
	</body>
</html>
EOF

} > "index.html"
