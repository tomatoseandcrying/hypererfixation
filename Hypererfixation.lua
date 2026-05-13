--#region Atlases? Atli?? lmao

SMODS.Atlas {
    key = 'placeholders',
    path = 'placeholders.png',
    px = 71,
    py = 95
}

--#endregion

--#region Fonts
SMODS.Font {
    key = 'IsaacGame',
    path = 'IsaacGame.ttf'
}

--#region File Loading
mod_path = "" .. SMODS.current_mod.path
---Loads all files in a folder (Will likely load unordered.)
---@param folder string The filepath to the folder you want to load. (ex: "Ijiraq/Exceptions")
---@param opts table? Filepath or table of filepaths to skip during the folder loading. Filetype not required
function HPFX_load_folder(folder, opts)
    opts = opts or {}
    local except_map = {}
    if opts.except then
        if type(opts.except) == "string" then
            except_map[opts.except] = true
        elseif type(opts.except) == "table" then
            for _, v in ipairs(opts.except) do except_map[v] = true end
        end
    end

    local files = SMODS.NFS.getDirectoryItems(mod_path .. folder) or {}
    for i, file in ipairs(files) do
        local name_no_ext = file:match("(.+)%..+$") or file
        if not except_map[file] and not except_map[name_no_ext] then
            local path = folder .. "/" .. file
            local HPFX_foad_lolder = SMODS.load_file(path)
            if type(HPFX_foad_lolder) == "function" then
                HPFX_foad_lolder()
            else
                -- directory recursion
                local sub = SMODS.NFS.getDirectoryItems(mod_path .. path)
                if sub and #sub > 0 then
                    HPFX_load_folder(path, opts)
                else
                    print("hpfx - skip for recursion:", path)
                end
            end
        else
            print("hpfx - skipped:", file)
        end
    end
end

HPFX_load_folder("src")

--#endregion
