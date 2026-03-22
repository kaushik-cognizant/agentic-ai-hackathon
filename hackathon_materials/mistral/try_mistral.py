from langchain_mistralai.chat_models import ChatMistralAI

llm = ChatMistralAI(
    model="mistral-medium-latest",
    temperature=0,
    max_retries=2,
    # other params...
)

messages = [
    (
        "system",
        "You are a helpful assistant that translates English to French. Translate the user sentence.",
    ),
    ("human", "I love programming."),
]
ai_msg = llm.invoke(messages)

print(ai_msg.content)