return {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = {
        { "tpope/vim-repeat", event = "VeryLazy" }
    },
    config = function()
        require("leap").set_default_mappings()
    end
}
