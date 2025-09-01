FROM runpod/worker-comfyui:5.4.0-base

# Update comfyui
RUN comfy node update all

WORKDIR /comfyui

# Download all models into the docker image using RunPod syntax
RUN wget -O models/diffusion_models/qwen_image_edit_bf16.safetensors https://huggingface.co/Comfy-Org/Qwen-Image-Edit_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_edit_bf16.safetensors

RUN wget -O models/loras/Qwen-Image-Lightning-4steps-V1.0.safetensors https://huggingface.co/lightx2v/Qwen-Image-Lightning/resolve/main/Qwen-Image-Lightning-4steps-V1.0.safetensors

RUN wget -O models/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors

RUN wget -O models/vae/qwen_image_vae.safetensors https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors

# Add model paths for runpod (uncomment if you have the file)
# ADD extra_model_paths.yaml ./
