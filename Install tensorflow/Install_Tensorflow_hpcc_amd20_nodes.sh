export PATH=~/anaconda3/bin:$PATH

conda activate DEEPLABCUT
conda init
## this guide come from HPCC guide and modify according the request in deeplabcut
## https://docs.icer.msu.edu/Installing_TensorFlow_using_anaconda/
## https://github.com/DeepLabCut/DeepLabCut/blob/main/setup.py
## run this script from ssh dev-amd20-v100
## https://stackoverflow.com/questions/76046787/which-latest-cuda-toolkit-and-tensorflow-versions-are-compatible
conda install -c conda-forge cudnn=8.1.0 --yes
conda install -c nvidia cuda-nvcc --yes 

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
pip install --upgrade pip
pip install tensorflow==2.10.0 # compatible with CuDNN v8.1.0
pip install nvidia-pyindex
pip install nvidia-tensorrt

# To fix the error of "Could not load dynamic library 'libnvinfer.so.7'". The trick is to create a symlink.
cd $CONDA_PREFIX/lib/python3.9/site-packages/tensorrt_libs
ln -s libnvinfer.so.8 libnvinfer.so.7
ln -s libnvinfer_plugin.so.8 libnvinfer_plugin.so.7

# To fix the error of "Can't find libdevice directory ${CUDA_DIR}/nvvm/libdevice." 
mkdir -p $CONDA_PREFIX/lib/nvvm/libdevice
cp $CONDA_PREFIX/lib/libdevice.10.bc $CONDA_PREFIX/lib/nvvm/libdevice

conda deactivate