#!/bin/bash

REPO_ROOT="$(git rev-parse --show-toplevel)"
MIRROR_REMOTE="mirror"
MAIN_BRANCH="main"

FILES_NOT_IN_SYNC=(
  "readme.md"
  "tex/lib/logo.tex"
  "tex/img/cover_logo.pdf"
  "docs/img/cards.svg"
)


assert_correct_remote_configured() {
  git remote get-url "${MIRROR_REMOTE}" || ( echo "No remote with name '${MIRROR_REMOTE}' configured" && exit 1 )
}

reset_file_to_origin() {
  local filename="${1}"

  git reset "origin/${MAIN_BRANCH}" "${filename}"
  git checkout -- "${filename}"
}

commit_and_push_changes() {
  local mirror_remote_url
  mirror_remote_url="$(git remote get-url "${MIRROR_REMOTE}" | cut -d: -f2)"
  
  for src_file in "${FILES_NOT_IN_SYNC[@]}"
  do
    git add "${REPO_ROOT}/$src_file"
  done

  git commit -m "Sync changes from '${mirror_remote_url}'"
}

sync_mirror_repo() {
  git checkout "${MAIN_BRANCH}"

  git fetch --all
  git pull --rebase origin "${MAIN_BRANCH}"
  git merge --strategy-option=theirs "${MIRROR_REMOTE}/${MAIN_BRANCH}"
  for src_file in "${FILES_NOT_IN_SYNC[@]}"
  do
    reset_file_to_origin "${REPO_ROOT}/$src_file"
  done

  commit_and_push_changes

  git checkout -
}


# main

assert_correct_remote_configured
sync_mirror_repo
