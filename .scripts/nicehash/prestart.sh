#!/bin/bash
nvidia-settings -c :0 -a "[gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=2000"
nvidia-settings -c :0 -a "[gpu:0]/GPUFanControlState=1"
nvidia-settings -c :0 -a "[fan:0]/GPUTargetFanSpeed=58"
