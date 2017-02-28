#!/bin/bash
# Usage:
# ./experiments/scripts/faster_rcnn_end2end.sh GPU NET DATASET [options args to {train,test}_net.py]
# DATASET is either pascal_voc or coco.
#
# Example:
# ./experiments/scripts/faster_rcnn_end2end.sh 0 VGG_CNN_M_1024 pascal_voc \
#   --set EXP_DIR foobar RNG_SEED 42 TRAIN.SCALES "[400, 500, 600, 700]"

set -x
set -e

export PYTHONUNBUFFERED="True"
#LOG="experiments/logs/faster_rcnn_end2end_${NET}_${EXTRA_ARGS_SLUG}.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
#exec &> >(tee -a "$LOG")
#echo Logging output to "$LOG"
#  --weights data/imagenet_models/VGG16.v2.caffemodel \
#--weights output/faster_rcnn_end2end/text_chn_train/vgg16_text_iter_34000.caffemodel \
#--weights data/imagenet_models/ZF.v2.caffemodel \
python ./tools/train_net.py --gpu 2\
  --solver models/pascal_voc/VGG16/faster_rcnn_end2end/solver.prototxt \
  --imdb text_chn_train \
  --weights data/imagenet_models/VGG16.v2.caffemodel \
  --iters 300000 \
  --cfg experiments/cfgs/faster_rcnn_end2end.yml 
  #--imdb voc_2007_trainval \
  #--weights data/imagenet_models/VGG16.v2.caffemodel \
