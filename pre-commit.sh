#!/bin/sh
# define emojis here because they are somehow bugged if you use whitespace after inserting them
work_emoji="⚙️ "
check_emoji="✔️ "
error_emoji="❌ "

# create the todos json file
echo "$work_emoji creating todos ..."
./node_modules/.bin/leasot --reporter json "*.css" "./docs/**/*.scss" "./docs/**/*.html" "./docs/**/*.js" --ignore "docs/styles/css/" > docs/todos.json
# move into docs direcory
cd docs
# check if json file exists
if [ ! -f todos.json ] ; then
	echo "$error_emoji <todos.json> file not found!"
	exit 1
fi
# move out of folder 
cd ..
# add the created file to the commit
git add docs/todos.json
echo "$check_emoji added <todos.json> to commit"
