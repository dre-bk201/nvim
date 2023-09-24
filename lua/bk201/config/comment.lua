local Comment = require "Comment";
local ts_context = require "ts_context_commentstring.integrations.comment_nvim";

Comment.setup({
  pre_hook = ts_context.create_pre_hook()
});
