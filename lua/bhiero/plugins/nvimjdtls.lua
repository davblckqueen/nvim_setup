return {
	"mfussenegger/nvim-jdtls",
	config = function()
		local mason_registry = require("mason-registry")
		local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
		local lombok_jar = jdtls_path .. "/lombok.jar"
		return {
			cmd = {
				"jdtls",
				"--jvm-arg=-javaagent:" .. lombok_jar,
			},
			-- Additional jdtls configurations
		}
	end,
}
