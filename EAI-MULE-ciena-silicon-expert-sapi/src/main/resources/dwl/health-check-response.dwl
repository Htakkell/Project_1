%dw 2.0
output application/json
---
{
	api: {
		name: "ciena-silicon-expert-sapi",
		version: "1.0.0",
		environment: p('env')
	},
	status: "OK",
	message: "Success",
	timestamp: now()
}