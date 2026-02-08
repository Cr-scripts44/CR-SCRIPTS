-- CRAutojoiner.lua

-- This script updates all occurrences of names, TikTok mentions, and colors in the text

local function updateScript(scriptContent)
    -- Replace names
    scriptContent = string.gsub(scriptContent, "name", "CR Scripts")
    
    -- Replace TikTok mentions
    scriptContent = string.gsub(scriptContent, "tiktok", "kirah.bloom")
    
    -- Change colors to green
    scriptContent = string.gsub(scriptContent, "red", "green")
    scriptContent = string.gsub(scriptContent, "blue", "green")
    scriptContent = string.gsub(scriptContent, "yellow", "green")
    scriptContent = string.gsub(scriptContent, "color", "green")
    
    return scriptContent
end

-- Example usage
local originalScript = "This is an example script where I mention my name and tiktok and use colors like red and blue."
local updatedScript = updateScript(originalScript)
print(updatedScript)