# LangChain + Ollama (Local) Script

This is a minimal Python script to call a locally hosted Ollama model using LangChain. It supports simple prompts, optional system prompts, temperature, base URL overrides, and optional streaming.

## Prerequisites
- Python 3.9+
- Ollama installed and running locally
  - Install: https://ollama.com/download
  - Pull a model (example): `ollama pull llama3`
  - Ensure the server is listening (default): `http://localhost:11434`

## Quickstart
```bash
# 1) (Optional) Create a virtual environment
python3 -m venv .venv
source .venv/bin/activate

# 2) Install dependencies
pip install -r requirements.txt

# 3) Run with a quick prompt
python main.py "Write a haiku about the sea."

# Use a specific model and streaming
python main.py "Summarize the benefits of unit testing" \
  --model llama3 --stream

# Override base URL if your Ollama is not on default
python main.py "Hello there" --base-url http://127.0.0.1:11434

# Provide a custom system prompt and temperature
python main.py "Explain quantum entanglement simply" \
  --system "You are a clear and concise tutor." \
  --temperature 0.2
```

## Notes
- Default model is `llama3`. Change with `--model`.
- Default base URL is read from `OLLAMA_BASE_URL` or `http://localhost:11434`.
- Use `--stream` for token-by-token streaming output.

## Troubleshooting
- If you see a connection error, verify Ollama is running:
  - `ollama serve` (if it doesn't start automatically)
  - Confirm with `curl http://localhost:11434/api/tags`
- Ensure the model you specify is pulled: `ollama pull <model>`.
