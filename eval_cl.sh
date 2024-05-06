NUM_GPUS=4
MODEL_NAME=${1:-lora-stage-0-after-llava-158k}
MODEL_PATH=/localdisk/ssrivas9/prismatic-vlms/runs/$MODEL_NAME
RESULT_PATH=/localdisk/ssrivas9/prismatic-vlms/evaluations/$MODEL_NAME
EVAL_MODEL_ID=prism-clip+7b

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type vqa-v2-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type vqa-v2-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type gqa-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type gqa-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type text-vqa-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type text-vqa-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type tally-qa-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type tally-qa-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH

accelerate launch --num_processes=$NUM_GPUS scripts/evaluate.py --model_dir $MODEL_PATH --dataset.type refcoco-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
python scripts/score.py --model_id $EVAL_MODEL_ID --dataset.type refcoco-slim --dataset.root_dir /localdisk/ssrivas9/vlm-evaluation/ --results_dir $RESULT_PATH
