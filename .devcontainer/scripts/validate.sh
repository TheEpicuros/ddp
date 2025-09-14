#!/usr/bin/env bash
set -euo pipefail

echo "PREFLIGHT=START"

jq --version >/dev/null && echo "JQ=OK"
yamllint --version >/dev/null && echo "YAMLLINT=OK"
actionlint -version >/dev/null && echo "ACTIONLINT=OK"
gh --version >/dev/null && echo "GH=OK"

echo "PREFLIGHT=OK"
