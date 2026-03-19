# LangChain + Ollama (Local) Script

This is a minimal Python script to call a locally hosted Ollama model using LangChain. It supports simple prompts, optional system prompts, temperature, base URL overrides, and optional streaming.

## Prerequisites
- Python 3.13.x
- Ollama installed and running locally
  - Install in user mode in cluster using the setup_ollama.sh script


## Configure environment e.g. zshrc

```zsh
# Ollama
export PATH="${HOME}/.local/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/.local/lib/ollama:${LD_LIBRARY_PATH:-}"
export OLLAMA_HOST="127.0.0.1:11435"
```

## Figure out the GPU which can handle the model

```sh
nvidia-smi --query-gpu=index,uuid,name,memory.free,memory.total --format=csv
```

```
ps aux | grep ollama
```

```sh
CUDA_VISIBLE_DEVICES=GPU-ed593958-3b42-d47d-9dd3-c765d493335b OLLAMA_KEEP_ALIVE=-1 ollama serve
```

```sh
nohup env CUDA_VISIBLE_DEVICES=GPU-ed593958-3b42-d47d-9dd3-c765d493335b OLLAMA_KEEP_ALIVE=-1 ollama serve > ollama_log &
```

## Expose server to the world

```sh
nohup env CUDA_VISIBLE_DEVICES=GPU-ed593958-3b42-d47d-9dd3-c765d493335b OLLAMA_KEEP_ALIVE=-1 OLLAMA_HOST=0.0.0.0:11435 ollama serve > ollama_log &
```

```
curl http://172.16.2.17:11435/api/chat -d '{
  "model": "qwen3.5",
  "messages": [{
    "role": "user",
    "content": "How many letter r are in strawberry?"
  }],
  "think": false,
  "stream": false
}'
```

```
curl http://localhost:11435/api/chat -d '{
  "model": "qwen3.5",
  "messages": [{
    "role": "user",
    "content": "How many letter r are in strawberry?"
  }],
  "think": false,
  "stream": false
}'
```

```
curl http://localhost:11435/api/tags
```