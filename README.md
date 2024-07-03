# ArguelloALab
Analysis of operant self-administration behaviors with supervised machine learning: Protocol for video acquisition and pose estimation analysis using DeepLabCut (DLC)  and Simple Behavioral Analysis (SimBA).

The use of supervised machine learning to approximate poses in video recordings allows for rapid and efficient analysis of complex behavioral profiles. Currently, there are limited protocols for automated analysis of operant self-administration behavior. We provide methodology to 1) obtain videos of training sessions via Raspberry Pi microcomputers or GoPros 2) obtain pose estimation data using the supervised machine learning software packages DeepLabCut and Simple Behavioral Analysis (SimBA) with local high performance computer cluster, and 3) comparison of standard MedPC lever press vs quadrant time data generated from pose estimation regions of interest and 4) generation of predictive classifiers for non-lever pressing behaviors.

You should refer to the official repository to install the software correctly for your specific hardware configuration.

**Video Acquisition using RasPi**

**Install DeepLabCut**
github official repository https://github.com/DeepLabCut/DeepLabCut. 

`pip install deeplabcut`

`conda env create -f DEEPLABCUT.yaml`

**Install SimBA**

github repository https://github.com/sgoldenlab/simba

 `pip install simba-uw-tf-dev`

**Install Anaconda on HPCC**

`sbatch Install_Tensorflow_hpcc_amd20_nodes.sh`

**Track videos with DLC**

`sbatch 01_tracking_batch.sh`
