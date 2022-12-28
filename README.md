# LuaOpenAI
```lua
local OpenAI = loadstring(game:HttpGet('https://raw.githubusercontent.com/Perthys/LuaOpenAI/main/main.lua'))()
local Dump = loadstring(game:HttpGet('https://raw.githubusercontent.com/strawbberrys/LuaScripts/main/TableDumper.lua'))()

local Configuration, API = OpenAI.Configuration, OpenAI.OpenAIAPI

local Config = Configuration.new({
    APIKey = "sk-__________________________________________";
})

local OpenAIInstance = API.new(Config);

local Response = OpenAIInstance:CreateCompletion({
    ["model"] = "text-davinci-003",
    ["prompt"] = "hello",
    ["temperature"] = 0.8,
    ["max_tokens"] = 40,
    ["top_p"] = 1,
    ["frequency_penalty"] = 0,
    ["presence_penalty"] = 0
});

print(Dump(Response))


```

#### Most if not all endpoints are inside of the api
