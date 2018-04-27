--[[
%% properties

%% globals
--]]

local sonyip = fibaro:getGlobalValue('SB_IP');
local sonypsk = fibaro:getGlobalValue('SB_PSK');
local function putMethod(requestUrl, data, successCallback, errorCallback)
  local http = net.HTTPClient()
  http:request(requestUrl, {
    options = {
      method = 'POST',
      headers = {
        ["soapaction"] = '"urn:schemas-sony-com:service:IRCC:1#X_SendIRCC"';
        ["x-auth-psk"] = '' .. sonypsk .. '';
      },
      data = data
    },
    success = successCallback,
    error = errorCallback
  })
end

local app = fibaro:getGlobalValue('SB_APP');
local url = 'http://' .. sonyip .. '/sony/appControl'
local data = [[
{"method":"setActiveApp","params":[{"uri":"]] .. app .. [["}],"id":10, "version":"1.0"}
]]

putMethod(
  url,
  data,
  function(resp)
    print('Status: ' .. resp.status)
  end,
  function(err)
    print('error' .. err)
  end
)