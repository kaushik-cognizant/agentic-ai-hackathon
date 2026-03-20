
# LLM Resources

A list of free API keys are given in this git repo: https://github.com/cheahjs/free-llm-api-resources
Please keep any eye out on your usage so that you don't run out.


Once you've procured the key, the configuration of some of them for neuro-san-studio are given below:

## Mistral

Get your key from Mistral.ai and set it up in your env file based on your OS. For e.g. in linux:

```zsh
export MISTAL_API_KEY="<your-api-key>"
```

You'll need the langchain package.

```zsh
pip install langchain-mistralai==1.1.2
```

Example `llm_config.hocon`:

```json
{
    "llm_config": {
        "class": "langchain_mistralai.chat_models.ChatMistralAI",
        "model": "mistral-medium-latest",
        "temperature": 0,
    }
}
```

## Google Gemini

Get your key from google and set it up in your env file based on your OS. For e.g. in linux:

```zsh
export GEMINI_API_KEY='<your-api-key>'
```

You'll need the langchain package.

```zsh
pip install langchain-google-genai==4.2.1
```

Example `llm_config.hocon`:

```json
{
    "llm_config": {
        "class": "langchain_google_genai.chat_models.ChatGoogleGenerativeAI",
        "model": "gemini-flash-latest",
        "temperature": 0,
    }
}
```

## Cerebras

Get your free key from https://cloud.cerebras.ai/

Install the langchain package:

```
pip install langchain-cerebras
```

Important: the above package isn't updated for latest version of langchain. So once you've installed `langchain-cerebras` install neuro-san-studio requirements.txt one more time. 

Only a few models are supporeted by cerebras in the free-tier, check your playground in the cerbras website for the available ones.

```json
{
    "llm_config": {
        "class": "langchain_cerebras.chat_models.ChatCerebras",
        "model": "qwen-3-235b-a22b-instruct-2507",
        "temperature": 0,
    }
}
```

