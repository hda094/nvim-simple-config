-- fetch the dap plugin
local dap = require('dap')
-- setup DapUI
local dapui = require('dapui')
dapui.setup()

-- Dap fires events before and after. Trigger dap UI when we see them
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end 
dap.listeners.before.event_terminated["dap_config"] = function()
	dapui.close()
end 
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end 

dap.adapters.delve = {
	type = 'server',
	port = '${port}',
	executable = {
		command = 'dlv',
		args = {'dap', '-l', '127.0.0.1:${port}',}
	}
}
-- launch configuration
dap.configurations.go = {

	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},{
		type = "delve",
		name = "Debug Tests",
		request = "launch",
		mode = "test",
		program = "${file}"
	}


}
