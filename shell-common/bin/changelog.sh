#!/usr/bin/env bash

set -e

tags_count=$(git tag 2> /dev/null | wc -l | awk '{ print $1}')
echo "tags: $tags_count"

tag_range_begin=""
tag_range_end=""

if [[ $tags_count -eq 0 ]]; then
	echo
	echo 'no tags found'
	exit 1
elif [[ $tags_count -eq 1 ]]; then
	tag_range_end=$(git tag)
else
	tag_range_begin=$(git tag | tail -2 | head -1)
	tag_range_end=$(git tag | tail -1)
fi

date_range_begin=""
if [[ "$tag_range_begin" = "" ]]; then
	tag_range_begin=$(git log --pretty=%H --reverse | head -1)
	date_range_begin=$(git log --pretty=%cd --reverse | head -1)
else
	date_range_begin=$(git log -n 1 --pretty=%cd --reverse $tag_range_begin)
fi

date_range_end=$(git log -n 1 --pretty=%cd $tag_range_end)

tag_range_total=""
if [[ "$tag_range_begin" = "" ]]; then
	tag_range_total="$tag_range_end"
else
	tag_range_total="$tag_range_begin..$tag_range_end"
fi

echo "tag begin: '$tag_range_begin' ($date_range_begin)"
echo "tag end:   '$tag_range_end' ($date_range_end)"
echo "tag range: '$tag_range_total'"

version=$(echo "$tag_range_end" | sed 's/v//')
dst="CHANGELOG-$tag_range_end.txt"

commits_count=$(git log --pretty='- %s' --grep='#RN' $tag_range_total | wc -l | awk '{ print $1}')
echo "commits: $commits_count"
echo

if [[ $commits_count -gt 0 ]]; then
	if [[ -f $dst ]]; then
		rm $dst
	fi
	touch $dst

	date +"%Y-%m-%d %H:%M:%S %Z" >> $dst
	echo >> $dst

	echo "Version $version" >> $dst
	echo >> $dst
	
	if [[ "$tag_range_begin" != "" ]]; then
		echo "Changes since $tag_range_begin" | tee -a $dst
	fi
	
	git log --pretty='- %s' --grep='#RN' --reverse $tag_range_total | sed 's/ #RN//' | tee -a $dst
	
	echo
	echo "new file: $dst"
else
	echo 'no commits found'
	exit 1
fi
