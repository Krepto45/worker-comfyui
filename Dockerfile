FROM runpod/worker-comfyui:5.4.0-base

# Update comfyui
RUN comfy node update all

# Change to comfyui directory
WORKDIR /comfyui

# Create model directories if they don't exist
RUN mkdir -p models/diffusion_models models/loras models/text_encoders models/vae

# Download all models into the docker image using RunPod syntax
RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_bf16.safetensors --relative-path models/diffusion_models --filename qwen_image_edit_bf16.safetensors

RUN comfy model download --url https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors --relative-path models/loras --filename Qwen-Image-Lightning-4steps-V1.0.safetensors

RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors --relative-path models/text_encoders --filename qwen_2.5_vl_7b_fp8_scaled.safetensors

RUN comfy model download --url https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors --relative-path models/vae --filename qwen_image_vae.safetensors

# Add model paths for runpod (uncomment if you have the file)
# COPY extra_model_paths.yaml ./
