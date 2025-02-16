local repo = "https://raw.githubusercontent.com/minombreesprorax/ComputerCraftable/main" -- Replace with your actual GitHub repo URL
local binPath = "/"

-- Function to fetch directory listing (requires a raw file list from GitHub)
local function fetchFileList()
    local url = repo .. "/bin/filelist.txt" -- You need to generate this file manually
    local response = http.get(url)

    if response then
        local content = response.readAll()
        response.close()

        local files = {}
        for line in content:gmatch("[^\r\n]+") do
            table.insert(files, line)
        end
        return files
    else
        print("Failed to fetch file list.")
        return nil
    end
end

-- Function to download a file
local function downloadFile(file)
    local url = repo .. "/bin/" .. file
    local filePath = binPath .. file

    -- Ensure directory structure exists
    local folder = filePath:match("(.*/)")
    if folder and not fs.exists(folder) then
        fs.makeDir(folder)
    end

    local response = http.get(url)
    if response then
        local content = response.readAll()
        response.close()

        local fileHandle = fs.open(filePath, "w")
        fileHandle.write(content)
        fileHandle.close()

        print(url .. " downloaded to " .. filePath)
    else
        print("couldn't download " .. url)
    end
end

-- Main installer process
local files = fetchFileList()
if files then
    for _, file in ipairs(files) do
        downloadFile(file)
    end
    print("Installation complete! Rebooting in 3 seconds...")
    sleep(3)
    ---@diagnostic disable-next-line: undefined-field
    os.reboot()
else
    print("Installation failed: No files retrieved.")
end
