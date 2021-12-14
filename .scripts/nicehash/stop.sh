#!/bin/bash
nvidia-settings -c :0 -a "[gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=0"
nvidia-settings -c :0 -a "[gpu:0]/GPUFanControlState=0"
