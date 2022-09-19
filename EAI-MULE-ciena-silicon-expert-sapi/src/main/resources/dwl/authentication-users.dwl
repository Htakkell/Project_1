%dw 2.0
output application/json skipNullOn="everywhere"
---
{
    "status": {
        "code": payload.Status.Code,
        "message": payload.Status.Message,
        "success": payload.Status.Success,
		"jSessionId": (((((vars.responseAttributes.headers.*'set-cookie') filter ($ startsWith 'JSESSIONID=') joinBy "") splitBy ";")[0]) splitBy "=")[1]
    }
}