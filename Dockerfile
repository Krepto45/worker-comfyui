FROM runpod/worker-comfyui:5.4.0-base

#update comfyui
RUN comfy node update all

#change to comfyui directory
WORKDIR /comfyui

#add model paths for runpod
ADD extra_model_paths.yaml ./
