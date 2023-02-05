-- Function to parse URI and extract tenantId
function parse_uri( uri )
  tenantId = ""
    local count = 0
    for token in string.gmatch(uri, "^%s/") do
      print(token)
        count = count + 1
        -- URI example: /tenants/{tenantId}/users/{userId}/payments/{paymentId}/
        -- break after reading tenantId path param and return tenantId
        if(count == 2)
          tenantId = token
          break
    end
  return tenantId
end

return parse_uri(ngx.arg[1])