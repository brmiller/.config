-- Volume (https://awesome.naquadah.org/wiki/Volume_control_and_display)

local wibox = require("wibox")

volume_widget = wibox.widget.textbox()

function update_volume(widget)
    local fd = io.popen("amixer sget Master")
    local status = fd:read("*all")
    fd:close()
    
    local volume = string.match(status, "(%d?%d?%d)%%")
    volume = string.format("% 3d", volume)

    status = string.match(status, "%[(o[^%]]*)%]")

    if string.find(status, "on", 1, true) then
        volume = "♪" .. volume .. "%"
    else
        volume = "♪" .. volume .. "M"
    end
    widget:set_text(volume)
end

update_volume(volume_widget)

cpu_timer = timer({timeout = 1})
cpu_timer:connect_signal("timeout", function() update_volume(volume_widget) end)
cpu_timer:start()

