
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/sha2_xl_v3_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "VERSION" -widget comboBox

}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
	
	set C_S00_AXI_ADDR_WIDTH ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
	set C_S00_AXI_DATA_WIDTH ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}
	set values(C_S00_AXI_DATA_WIDTH) [get_property value $C_S00_AXI_DATA_WIDTH]
	set_property value [gen_USERPARAMETER_C_S00_AXI_ADDR_WIDTH_VALUE $values(C_S00_AXI_DATA_WIDTH)] $C_S00_AXI_ADDR_WIDTH
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.MODE { PARAM_VALUE.MODE PARAM_VALUE.VERSION } {
	# Procedure called to update MODE when any of the dependent parameters in the arguments change
	
	set MODE ${PARAM_VALUE.MODE}
	set VERSION ${PARAM_VALUE.VERSION}
	set values(VERSION) [get_property value $VERSION]
	set_property value [gen_USERPARAMETER_MODE_VALUE $values(VERSION)] $MODE
}

proc validate_PARAM_VALUE.MODE { PARAM_VALUE.MODE } {
	# Procedure called to validate MODE
	return true
}

proc update_PARAM_VALUE.T { PARAM_VALUE.T PARAM_VALUE.VERSION } {
	# Procedure called to update T when any of the dependent parameters in the arguments change
	
	set T ${PARAM_VALUE.T}
	set VERSION ${PARAM_VALUE.VERSION}
	set values(VERSION) [get_property value $VERSION]
	set_property value [gen_USERPARAMETER_T_VALUE $values(VERSION)] $T
}

proc validate_PARAM_VALUE.T { PARAM_VALUE.T } {
	# Procedure called to validate T
	return true
}

proc update_PARAM_VALUE.VERSION { PARAM_VALUE.VERSION } {
	# Procedure called to update VERSION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VERSION { PARAM_VALUE.VERSION } {
	# Procedure called to validate VERSION
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.MODE { MODELPARAM_VALUE.MODE PARAM_VALUE.MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MODE}] ${MODELPARAM_VALUE.MODE}
}

proc update_MODELPARAM_VALUE.T { MODELPARAM_VALUE.T PARAM_VALUE.T } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.T}] ${MODELPARAM_VALUE.T}
}

