return {
    "ggandor/leap.nvim",
    dependencies = {
        { "tpope/vim-repeat", event = "VeryLazy" }
    },
    config = function()
        require("leap").set_default_mappings()
    end
}
