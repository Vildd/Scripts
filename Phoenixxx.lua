cookiewindow = TextWindow.new("List cookies")
do
  local hostname = Field.new("http.host")
  local cookiedata = Field.new("http.cookie")
  local function init_listener()
    local tap = Listener.new("http")
    function tap.packet(pinfo,buffer,userdata)
      local targethost = hostname()
      local targetcookie = cookiedata()
      if targethost ~= nil then
        if targethost ~= nil then
          cookiewindow:append(tostring(targethost))
          cookiewindow:append("\n")
          cookiewindow:append(tostring(targethost))
          cookiewindow:append("\n\n")
        end
      end
    end
  end
  init_listener()
end
