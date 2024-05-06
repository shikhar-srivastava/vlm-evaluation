NUM_GPUS=4
MODEL_NAME=stage-0-after-llava-vqav2
EVAL_MODEL_ID=prism-clip+7b
MODEL_PATH=/scratch/ssrivas9/prismatic-vlms/runs/$MODEL_NAME
RESULT_PATH=/scratch/ssrivas9/prismatic-vlms/evaluations/$MODEL_NAME

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type vqa-v2-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type vqa-v2-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type gqa-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type gqa-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type text-vqa-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type text-vqa-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type tally-qa-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type tally-qa-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type refcoco-slim --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type refcoco-slim  --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH


# accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type vqa-v2 --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
# accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type gqa --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
# accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type text-vqa --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
# accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type tally-qa --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
# accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type refcoco --dataset.root_dir /scratch/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH