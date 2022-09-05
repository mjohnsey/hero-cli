#! /bin/bash

set -euo pipefail

this_dir_location="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
repo_root="$(dirname "$this_dir_location")"

output_file="${repo_root}/hero_cli/lib/schema_example/api_schemas.py"

url="http://localhost:8000/openapi.json"

echo "Downloading latest OpenAPI spec from ${url}"
curl "${url}" | poetry run datamodel-codegen --use-subclass-enum --input-file-type openapi --output "${output_file}"

echo "Format output file"
poetry run black "${output_file}"
