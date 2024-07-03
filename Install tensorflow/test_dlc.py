
import deeplabcut as dlc

#previus load the module GCC 11.1.0: than contain  GLIBCXX_3.4.29
#import tensorflow as tf
#tf.debugging.set_log_device_placement(True)


config_path='~/DLC/network_5-lps-2024-04-13/config.yaml'
dlc.analyze_videos(config_path, ['~/DLC/videos/test.mp4'],gputouse=0, save_as_csv=True)
