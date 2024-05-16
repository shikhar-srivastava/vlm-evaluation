
#!/bin/bash

# Source the conda initialization script
source /localdisk/ssrivas9/miniconda3/etc/profile.d/conda.sh  # Update this path based on your actual conda path

conda activate eval


# Save the current directory
original_dir=$(pwd)

# Change directory to ../prismatic_vlms
cd ../prismatic-vlms

# Install the package in editable mode
pip install -e .

# Change back to the original directory
cd "$original_dir"

# Remove the pip cache for 'prismatic'
pip cache remove prismatic

# Reinstall the package in editable mode
pip install -e .