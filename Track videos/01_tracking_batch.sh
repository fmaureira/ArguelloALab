#!/bin/bash

#SBATCH --array=1:69 #this define the array in practical term call one video at the time in the jjson files are 66 paths.  the value will pass one by one to SLURM_ARRAY_TASK_ID

# Job name:
#SBATCH --job-name=track_videos
#SBATCH --ntasks=1       # number of CPUs
# Request GPU:

#SBATCH --gpus=v100:1 #because I compile tensorflow in v100 nodes now we contraint to v100 nodes, after: it is the number of GPU nodes for DLC tracking (only one is allowed for DLC)
# Memory:

#SBATCH --mem-per-gpu=8G # memory for GPUs for each video in this case 2hrs length
# Wall clock limit (minutes or hours:minutes or days-hours):
#SBATCH --time=10:15:00

#module purgue
export PATH=~/anaconda3/bin:$PATH # this is just an example PATH; use your own conda installation

source ~/anaconda3/etc/profile.d/conda.sh

conda activate DEEPLABCUT # again, activate your own TF env
echo $CONDA_PREFIX

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib/:/lib64/:$CONDA_PREFIX/lib/:$CONDA_PREFIX/lib/python3.9/site-packages/tensorrt_libs
export XLA_FLAGS=--xla_gpu_cuda_data_dir=$CONDA_PREFIX/lib

video_list="~/mp4_files.json"
python3 analyze_videos.py $video_list ${SLURM_ARRAY_TASK_ID}

conda deactivate

# Write job information to SLURM output file.
# write resource usage to SLURM output file (powertools command).
# scontrol show job $SLURM_JOB_ID
# js -j $SLURM_JOB_ID