FROM runpod/worker-comfyui:5.4.0-base

# Update comfyui
RUN comfy node update all

WORKDIR /comfyui

RUN comfy-node-install ComfyUI-Inspyrenet-Rembg

# Add model paths for runpod (uncomment if you have the file)
ADD extra_model_paths.yaml ./
