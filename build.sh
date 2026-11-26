#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input

python manage.py migrate --no-input

# Seed the 2,400-row synthetic demo dataset right after migrations.
# Idempotent: the importer skips projects whose project_id already exists, so
# re-running on every deploy (Render free plan has no Shell) is safe and adds
# no duplicates. First deploy imports 2,400 projects; later deploys import 0.
python manage.py generate_synthetic_data --seed-db

# Ensure the default admin/demo accounts exist (idempotent; never resets passwords).
python manage.py bootstrap_accounts