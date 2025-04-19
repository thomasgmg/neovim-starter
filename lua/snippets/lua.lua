local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local luaPrint = {
    -- Simple "print" snippet
    s("pr", {
        t("print("),
        i(1, "value"), -- Placeholder for user input
        t(")"),
    }),
}

ls.add_snippets("lua", luaPrint)
