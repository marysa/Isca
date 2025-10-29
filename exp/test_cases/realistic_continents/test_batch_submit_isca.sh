#!/bin/bash
#SBATCH --job-name=isca_test     # Specify the job name
#SBATCH --account=rrg-mlague    # Specify your allocation code
#SBATCH --time=12:00:00           # Request 1 hour of runtime
#SBATCH --nodes=1                # Request 1 node
#SBATCH --ntasks-per-node=16     # Request 16 tasks
#SBATCH -e slurm-%j.err
#SBATCH -o slurm-%j.out

# Set environment variables

# directory of the Isca source code
export GFDL_BASE=/project/def-mlague/shared_sourcecode/ISCA/Isca
# "environment" configuration for use with ubuntu-conda
#export GFDL_ENV=drac_fir2
export GFDL_ENV=/project/def-mlague/shared_sourcecode/ISCA/Isca/src/extra/env/fir_from_narval
# temporary working directory used in running the model
export GFDL_WORK=/scratch/mlague/Isca/Isca_work
# directory for storing model output
export GFDL_DATA=/scratch/mlague/Isca/Isca_output

# Load modules
source $GFDL_ENV
export LD_LIBRARY_PATH=$NETCDF_C_ROOT/lib:$NETCDF_FORTRAN_ROOT/lib:$LD_LIBRARY_PATH

# Activate Isca virtual environment
source /project/def-mlague/shared_sourcecode/ISCA/isca_venv/bin/activate

# Run the test case
#python $GFDL_BASE/exp/test_cases/held_suarez/held_suarez_test_case.py
python $GFDL_BASE/exp/test_cases/realistic_continents/realistic_continents_fixed_sst_test_case.py

