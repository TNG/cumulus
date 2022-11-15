#!/bin/bash -ex

function get_current_version() {
  local tag_at_head
  local version_name
  tag_at_head="$(git name-rev --name-only --tags HEAD | sed 's/^undefined$//')"
  version_name="${tag_at_head:-snapshot/"$(git rev-parse --short HEAD)"}"
  echo "${version_name}"
}

function clean_tmp_files() {
  git clean -dfX || true
}

function write_version_file() {
  local version="${1}"

  echo "(version ${version})" > tex/version.tex
}

function compile() {
  local pdf_base_name="${1}"
  local tex_file="${2}"

  local repo_base_dir
  local container_work_dir
  local container_image
  repo_base_dir="$(git rev-parse --show-toplevel)"
  container_work_dir="/tmp"
  container_image="leplusorg/latex"
  
  docker run \
    --rm \
    -t \
    --user="$(id -u):$(id -g)" \
    --net=none \
    -v "${repo_base_dir}:${container_work_dir}" \
    "${container_image}" \
    latexmk \
      -halt-on-error \
      -outdir="${container_work_dir}/tex" \
      -jobname="${pdf_base_name}" \
      -pdf \
      "${container_work_dir}/tex/${tex_file}" 
}



# main
current_version="$(get_current_version)"
echo "Building version ${current_version}"

clean_tmp_files
write_version_file "${current_version}"
compile "cumulus" single_pages.tex
