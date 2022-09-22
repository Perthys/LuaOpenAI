# LuaOpenAI
```lua
local OpenAI = loadstring()();

local Configuration = OpenAI.Configuration.new({
    Organization = "";
    APIKey = "";
})

local OpenAIApi = OpenAI.OpenAIApi.new(Configuration);

local Response = OpenAIApi:ListEngines();
local Response = OpenAIApi:RetrieveModel()
local Response = OpenAIApi:CreateCompletion({
    
  Model = "text-davinci-002",
  Prompt = "Say this is a test",
  MaxTokens = 6,
  Temperature = 0,
});

local Response = OpenAIApi:CreateEdit({
  Model = "text-davinci-edit-001",
  Input = "What day of the wek is it?",
  Instruction = "Fix the spelling mistakes",
});

local Response = OpenAIApi:CreateEmbedding({
  Model = "text-similarity-babbage-001",
  Input = "The food was delicious and the waiter...",
});


```
