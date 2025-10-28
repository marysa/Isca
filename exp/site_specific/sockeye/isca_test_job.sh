#!/bin/bash
#SBATCH --job-name=isca_test     # Specify the job name
#SBATCH --account=st-mlague-1    # Specify your allocation code
#SBATCH --time=12:00:00           # Request 1 hour of runtime
#SBATCH --nodes=1                # Request 1 node
#SBATCH --ntasks-per-node=16     # Request 16 tasks
#SBATCH -e slurm-%j.err
#SBATCH -o slurm-%j.out

# Set environment variables
# directory of the Isca source code
export GFDL_BASE=/arc/project/st-mlague-1/ISCA/Isca
# "environment" configuration for use with Sockeye
export GFDL_ENV=/arc/project/st-mlague-1/ISCA/intel_sockeye
# temporary working directory used in running the model
export GFDL_WORK=/scratch/st-mlague-1/mlague/isca_work
# directory for storing model output
export GFDL_DATA=/scratch/st-mlague-1/mlague/isca_data
# Load modules
source $GFDL_ENV
export LD_LIBRARY_PATH=$NETCDF_C_ROOT/lib:$NETCDF_FORTRAN_ROOT/lib:$LD_LIBRARY_PATH
# Activate Isca virtual environment
source /arc/project/st-mlague-1/ISCA/venv/bin/activate
# Run the test case
#python $GFDL_BASE/exp/test_cases/held_suarez/held_suarez_test_case.py
python $GFDL_BASE/exp/test_cases/realistic_continents/realistic_continents_fixed_sst_test_case.py

