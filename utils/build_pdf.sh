#!/bin/bash -ex

# © 2022 TNG Technology Consulting
#
# SPDX-License-Identifier: Apache-2.0

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
  container_image="leplusorg/latex:alpine"
  
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

function cut_pdf_pages() {
  local file_name="${1}"
  local pages_to_keep="${2}"
  
  local repo_base_dir
  local container_work_dir
  local container_image
  repo_base_dir="$(git rev-parse --show-toplevel)"
  container_work_dir="/work"
  container_image="pdftk/pdftk:latest"

  docker run \
    --rm \
    -t \
    --user="$(id -u):$(id -g)" \
    --net=none \
    -v "${repo_base_dir}:${container_work_dir}" \
    "${container_image}" \
      "${file_name}" \
      cat "${pages_to_keep}" \
      output "${file_name}.tmp"

  mv "${file_name}.tmp" "${file_name}"
}

function compile_and_cut() {
  local pdf_base_name="${1}"
  local tex_file="${2}"
  local pages_to_keep="${3}"

  compile "${pdf_base_name}" "${tex_file}" && \
  cut_pdf_pages "tex/${pdf_base_name}.pdf" "${pages_to_keep}"
}

function convert_pdf_to_jpg() {
  local pdf_file="${1}"
  local jpg_file="${2}"

  local repo_base_dir
  local container_work_dir
  local container_image
  repo_base_dir="$(git rev-parse --show-toplevel)"
  container_work_dir="/img"
  container_image="elifesciences/imagemagick"
  
  docker run \
    --rm \
    -t \
    --user="$(id -u):$(id -g)" \
    --net=none \
    -v "${repo_base_dir}:${container_work_dir}" \
    "${container_image}" \
      -resize 4350 \
      -density 240 \
      -background white \
      -flatten \
      "${container_work_dir}/${pdf_file}" \
      "${container_work_dir}/${jpg_file}"
}


# main
current_version="$(get_current_version)"
echo "Building version ${current_version}"

clean_tmp_files
write_version_file "${current_version}"
compile_and_cut "cumulus" single_pages.tex "2-end"
compile_and_cut "cumulus_CMYK" single_pages_CMYK.tex "2-end"
compile_and_cut "back" back.tex "2-2"
compile "cumulus_printer-friendly" printer_friendly.tex
compile "cumulus_unified" all_cards_on_one_page.tex && convert_pdf_to_jpg "tex/cumulus_unified.pdf" "tex/cumulus_cards.jpg"

