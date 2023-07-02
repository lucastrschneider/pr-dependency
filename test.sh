OWNER='lucastrschneider'
REPO='pr-dependency'
NUMBER='11'

# First step
crossReferences="$(gh api /repos/$OWNER/$REPO/issues/$NUMBER/timeline --jq '.[] | select(.event == "cross-referenced") | .source["issue"]["url"]')"
CROSS_REFERENCES="$crossReferences"

# Second step
readarray -t cr_arr <<< "${CROSS_REFERENCES}" # Note: in bash script, use readarray -t, in the workflow, use read -a
declare -p cr_arr
for issue_url in "${cr_arr[@]}"
do
    body=$(gh api "$issue_url" --jq '.body')

    pattern="\[ \][ ]*.*$OWNER\/$REPO.*11"
    value="\[x\] $OWNER\/$REPO\#11"

    echo "Body from $issue_url"
    echo "$body"

    new_body=$(echo "$body" | sed "s/$pattern/$value/")

    echo "Issue body after sed"
    echo "$new_body"

    if [ "$body" == "$new_body" ]; then
        echo "No changes were made, no need to update issue body"
    else
        echo "Issue body changed"
        gh api "$issue_url" -f body="$new_body" --method PATCH
    fi

    echo ""
done