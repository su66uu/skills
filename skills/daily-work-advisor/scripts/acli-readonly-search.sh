#!/bin/sh
set -eu

usage() {
  echo "usage: $0 --jql JQL [--fields FIELDS] [--limit 1-100]" >&2
}

jql=""
fields="key,summary,status,assignee,priority,updated"
limit="15"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --jql)
      [ "$#" -ge 2 ] || { usage; exit 2; }
      jql=$2
      shift 2
      ;;
    --fields)
      [ "$#" -ge 2 ] || { usage; exit 2; }
      fields=$2
      shift 2
      ;;
    --limit)
      [ "$#" -ge 2 ] || { usage; exit 2; }
      limit=$2
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      usage
      exit 2
      ;;
  esac
done

[ -n "$jql" ] || { usage; exit 2; }

case "$limit" in
  ''|*[!0-9]*) echo "limit must be an integer from 1 to 100" >&2; exit 2 ;;
esac
[ "$limit" -ge 1 ] && [ "$limit" -le 100 ] || {
  echo "limit must be an integer from 1 to 100" >&2
  exit 2
}

case "$fields" in
  ''|*[!A-Za-z0-9_,]*)
    echo "fields must be comma-separated Jira field identifiers" >&2
    exit 2
    ;;
esac

acli_bin=${WORK_ADVISOR_ACLI_BIN:-acli}
command -v "$acli_bin" >/dev/null 2>&1 || {
  echo "acli is not installed or not on PATH" >&2
  exit 127
}

exec "$acli_bin" jira workitem search \
  --jql "$jql" \
  --fields "$fields" \
  --limit "$limit" \
  --json
