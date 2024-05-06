#!/bin/bash

# List of model names
MODEL_NAMES=("model1" "model2" "model3")

# Loop over each model name and call eval_cl.sh with it
for MODEL_NAME in "${MODEL_NAMES[@]}"; do
    ./eval_cl.sh $MODEL_NAME
done