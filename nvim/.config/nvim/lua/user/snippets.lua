
local ls = require("luasnip")
local vsc = require("luasnip.loaders.from_vscode")

vsc.lazy_load()

ls.add_snippets("python", {
    ls.snippet(
        "dump", {
            ls.text_node({"if \""}),
            ls.insert_node(1, "string"),
            ls.text_node({"\" in __import__(\"json\").dumps("}),
            ls.insert_node(2, "target"),
            ls.text_node({"):", "    __import__(\"pdb\").set_trace()", "    "}),
            ls.insert_node(0, ""),
        }
    )
})

