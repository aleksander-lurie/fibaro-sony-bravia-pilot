--[[
%% properties

%% globals
--]]

local sonyip = 'xxx.xxx.xxx.xxx' --set ip of your sony tv

-- do not edit below
local sonypsk = fibaro:getGlobalValue('SB_PSK');
local function putMethod(requestUrl, data, successCallback, errorCallback)
  local http = net.HTTPClient()
  http:request(requestUrl, {
    options = {
      method = 'POST',
      headers = {
        ["Content-Type"] = "text/xml";
        ["soapaction"] = '"urn:schemas-sony-com:service:IRCC:1#X_SendIRCC"';
        ["x-auth-psk"] = '' .. sonypsk .. '';
      },
      data = data
    },
    success = successCallback,
    error = errorCallback
  })
end

local ircc = fibaro:getGlobalValue('SB_IRCC');
local url = 'http://' .. sonyip .. '/sony/IRCC'
local data = [[
<?xml version="1.0" encoding="utf-8"?>
	<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
		<s:Body>
			<u:X_SendIRCC xmlns:u="urn:schemas-sony-com:service:IRCC:1">
				<IRCCCode>]] .. ircc .. [[</IRCCCode>
			</u:X_SendIRCC>
		</s:Body>
</s:Envelope>
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