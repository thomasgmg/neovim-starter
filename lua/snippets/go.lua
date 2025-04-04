local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local goMain = {
    -- Simple "main" snippet
    s("main", {
        t({ "package main", "", "" }),
        t({ 'import "fmt"', "", "" }),
        t({ "func main() {\t", "" }),
        i(0),
        t({ "", "}" }),
    }),
}

ls.add_snippets("go", goMain)
