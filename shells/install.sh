#!/bin/bash
#set -euo pipefail

# 1. Ensure python3-venv is available
if ! python3 -m venv --help &>/dev/null; then
  echo "python3-venv module not found. Attempting to install via apt..."
  sudo apt-get update
  sudo apt-get install -y python3-venv
fi

# 2. Create the virtual environment
VENV_NAME="snakeenv"
python3 -m venv "$VENV_NAME"

# 3. Activate the virtual environment
source "$VENV_NAME/bin/activate"

# 4. Install requirements
REQ_FILE="requirements.txt"
pip install -r "$REQ_FILE"

echo "Environment setup complete."
