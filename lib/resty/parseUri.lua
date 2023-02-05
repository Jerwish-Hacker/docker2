-- Function to parse URI and extract tenantId
function parse_uri( uri )
  tenantId = ""
    local count = 0
    for token in string.gmatch(uri, "^%s/") do
      print(token)
        count = count + 1
        -- URI example: /tenants/{tenantId}/users/{userId}/payments/{paymentId}/
        -- break after reading tenantId path param and return tenantId
        if(count == 2) then
          tenantId = token
          break
        end
    end
  return tenantId
end

function splitString(input, sep)
  local count = 0
  for token in string.gmatch(input, "([^"..sep.."]+)") do
    print(token)
    tenantId = token
    if(count == 1) then
      break
    end
    count = count + 1
  end
end

return splitString(ngx.arg[1], '/')