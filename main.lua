local HttpService = game:GetService("HttpService");

local OpenAI = {
    BaseURL = "https://api.openai.com/v1/%s";
    Utils = {};
};

local Utils = OpenAI.Utils;

local function Merge(Seperator, ...)
    Seperator = Seperator or "/"
    
    local Strings = {...};
    return table.concat(Strings, Seperator)
end

Utils.Merge = Merge;
Utils.Dump = loadstring(game:HttpGet('https://raw.githubusercontent.com/strawbberrys/LuaScripts/main/TableDumper.lua'))();

local URL = {} URL.__index = URL;

function URL.new(...)
    return OpenAI.BaseURL:format(...);
end

OpenAI.URL = URL;

local Configuration = {} Configuration.__index = Configuration;

function Configuration.new(Info)
    assert(Info.APIKey, "APIKey Missing");
    
    return setmetatable(Info, {});
end

OpenAI.Configuration = Configuration;

local OpenAIAPI = {} OpenAIAPI.__index = OpenAIAPI;

function OpenAIAPI.new(Info)
    local self = setmetatable(Info, OpenAIAPI)
    
    return self
end

function OpenAIAPI:MakeAuthedRequest(Data)
    Data.Headers = Data.Headers or {};
    
    Data.Headers["Authorization"] = ("Bearer %s"):format(self.APIKey);
    Data.Body = Data.Body and HttpService:JSONEncode(Data.Body)
    print(Utils.Dump(Data))

    local Response = syn.request(Data)
    
    return Response.StatusCode == 200 and Response.Success and HttpService:JSONDecode(Response.Body) or error (("[Request Error] Code: %s Status: %s"):format(Response.StatusCode, Response.StatusMessage)) , Response
end

function OpenAIAPI:ListModels()
    local EndPoint = URL.new("Models");
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:RetrieveModel(Model)
    local EndPoint = URL.new(Merge("/", "models", Model))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:CreateCompletion(Body)
    local EndPoint = URL.new("completions");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })


    return Response;
end

function OpenAIAPI:CreateEdit()
    local EndPoint = URL.new("edits");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:CreateImage()
    local EndPoint = URL.new("generations");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:CreateImageEdit()
    return error("[Unimplemented] Unable to emulate html form.");
end

function OpenAIAPI:CreateImageVariation()
    return error("[Unimplemented] Unable to emulate html form.");
end

function OpenAIAPI:CreateEmbedding()
    local EndPoint = URL.new("embeddings");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:ListFiles()
    local EndPoint = URL.new("files");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:CreateFile()
    return error("[Unimplemented] Unable to emulate html form.");
end

function OpenAIAPI:DeleteFile(File)
    local EndPoint = URL.new(Merge("/", "files", File))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "DELETE";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:RetrieveFile(File)
    local EndPoint = URL.new(Merge("/", "files", File))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:DownloadFile()
    local EndPoint = URL.new(Merge("/", "files", File, "content"))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:CreateFineTune(Body)
    local EndPoint = URL.new("fine-tunes");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:ListFineTunes(Body)
    local EndPoint = URL.new("fine-tunes");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:ListFineTunes(Model)
    local EndPoint = URL.new(Merge("/", "fine-tunes", Model))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:CancelFineTune(Model)
    local EndPoint = URL.new(Merge("/", "fine-tunes", Model, "cancel"))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:ListFineTuneEvents(Model)
    local EndPoint = URL.new(Merge("/", "fine-tunes", Model, "events"))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:DeleteModel(Model)
    local EndPoint = URL.new(Merge("/", "fine-tunes", Model))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "DELETE";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end

function OpenAIAPI:CreateModeration()
    local EndPoint = URL.new("moderations");
    print(EndPoint);
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "POST";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAIAPI:ListEngines()
    local EndPoint = URL.new("engines");
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
        Body = Body;
    })

    return Response;
end

function OpenAI:RetrieveEngine(Engine)
    local EndPoint = URL.new(Merge("/", "engines", Engine))
    
    local Response = self:MakeAuthedRequest({
        Url = EndPoint;
        Method = "GET";
        Headers = {
            ["Content-Type"] = "application/json";
        };
    })

    return Response;
end
    
OpenAI.OpenAIAPI = OpenAIAPI

return OpenAI
