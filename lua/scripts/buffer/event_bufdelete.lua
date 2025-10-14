local function no_buffers_worth_saving()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(bufnr, 'buflisted') and not vim.api.nvim_buf_get_option(bufnr, 'readonly') then -- disregard unlisted buffers
            if vim.api.nvim_buf_get_name(bufnr) ~= '' then
                return false                                                                                           -- there is a buffer with a name
            end
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
            if #lines > 1 or (#lines == 1 and #lines[1] > 0) then
                return false -- there is a buffer with content
            end
        end
    end
    return true -- there are no listed, writable, named, nonempty buffers
end

local buffer_visible = function(bufnr)
    for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
        for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(tabid)) do
            local winbufnr = vim.api.nvim_win_get_buf(winid)
            local winvalid = vim.api.nvim_win_is_valid(winid)

            if winvalid and winbufnr == bufnr then
                return true
            end
        end
    end

    return false
end

local function has_content(lines)
    if #lines > 1 or (#lines == 1 and #lines[1] > 0) then
        return true
    end
    return false
end

local function open_dashboard_on_empty()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(bufnr, 'buflisted') and not vim.api.nvim_buf_get_option(bufnr, 'readonly') then -- disregard unlisted buffers
            local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
            if vim.api.nvim_buf_get_name(bufnr) ~= '' and not has_content(lines) then
                require("snacks").dashboard.open()
                return true
            end
        end
    end
end

vim.api.nvim_create_autocmd("BufDelete", {
    group = vim.api.nvim_create_augroup("buf", { clear = true }),
    callback = open_dashboard_on_empty,
})
