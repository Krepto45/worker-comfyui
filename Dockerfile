FROM runpod/worker-comfyui:5.4.0-base

# Update comfyui
RUN comfy node update all

WORKDIR /comfyui

# Add model paths for runpod (uncomment if you have the file)
ADD extra_model_paths.yaml ./
