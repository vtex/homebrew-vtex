function replace_line_in_file () {
    file="$1"
    line_num="$2"
    replacement="$3"

    replacement_escaped=$( echo "$replacement" | sed -e 's/[\/&]/\\&/g' )
    sed -i '' "${line_num}s/.*/$replacement_escaped/" "$file"
}

filePath="Formula/vtex.rb"

echo "Downloading latest release..."
allData=$(curl -sk https://vtex-toolbelt-test.s3.us-east-2.amazonaws.com/darwin-x64)

version=$(echo $allData | jq --raw-output '.version')
url=$(echo $allData | jq --raw-output '.gz')
sha256=$(echo $allData | jq --raw-output '.sha256gz')

echo "Latest verison: $version"
url="  url \"$url\""
version="  version \"$version\""
sha256="  sha256 \"$sha256\""

echo "Bumping brew version..."
replace_line_in_file "$filePath" 4 "$url"
replace_line_in_file "$filePath" 5 "$version"
replace_line_in_file "$filePath" 6 "$sha256"

fileUrlData=$(sed -n 4p "$filePath")
fileVersionData=$(sed -n 5p "$filePath")
fileSha256Data=$(sed -n 6p "$filePath")

if [ "$fileUrlData" = "$url" ] && [ "$fileVersionData" = "$version" ] && [ "$fileSha256Data" = "$sha256" ]
then
    echo "Version bumped successfully!"
else
    echo "Failed to bump version."
    exit 1
fi