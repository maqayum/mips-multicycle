// megafunction wizard: %ALTFP_MULT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altfp_mult 

// ============================================================
// File Name: mul_s.v
// Megafunction Name(s):
// 			altfp_mult
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Build 222 10/21/2009 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2009 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altfp_mult CBX_AUTO_BLACKBOX="ALL" DEDICATED_MULTIPLIER_CIRCUITRY="YES" DENORMAL_SUPPORT="NO" DEVICE_FAMILY="Cyclone II" PIPELINE=5 REDUCED_FUNCTIONALITY="NO" WIDTH_EXP=8 WIDTH_MAN=23 clock dataa datab nan overflow result underflow zero
//VERSION_BEGIN 9.1 cbx_alt_ded_mult_y 2009:10:21:21:22:16:SJ cbx_altbarrel_shift 2009:10:21:21:22:16:SJ cbx_altfp_mult 2009:10:21:21:22:16:SJ cbx_altmult_add 2009:10:21:21:22:16:SJ cbx_cycloneii 2009:10:21:21:22:16:SJ cbx_lpm_add_sub 2009:10:21:21:22:16:SJ cbx_lpm_compare 2009:10:21:21:22:16:SJ cbx_lpm_mult 2009:10:21:21:22:16:SJ cbx_mgl 2009:10:21:21:37:49:SJ cbx_padd 2009:10:21:21:22:16:SJ cbx_parallel_add 2009:10:21:21:22:16:SJ cbx_stratix 2009:10:21:21:22:16:SJ cbx_stratixii 2009:10:21:21:22:16:SJ cbx_util_mgl 2009:10:21:21:22:16:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = lpm_add_sub 4 lpm_mult 1 reg 140 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mul_s_altfp_mult_64m
	( 
	clock,
	dataa,
	datab,
	nan,
	overflow,
	result,
	underflow,
	zero) ;
	input   clock;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   nan;
	output   overflow;
	output   [31:0]  result;
	output   underflow;
	output   zero;

	reg	dataa_exp_all_one_ff_p1;
	reg	dataa_exp_not_zero_ff_p1;
	reg	dataa_man_not_zero_ff_p1;
	reg	dataa_man_not_zero_ff_p2;
	reg	datab_exp_all_one_ff_p1;
	reg	datab_exp_not_zero_ff_p1;
	reg	datab_man_not_zero_ff_p1;
	reg	datab_man_not_zero_ff_p2;
	reg	[9:0]	delay_exp2_bias;
	reg	[9:0]	delay_exp_bias;
	reg	delay_man_product_msb;
	reg	delay_man_product_msb_p0;
	reg	[8:0]	exp_add_p1;
	reg	[7:0]	exp_result_ff;
	reg	input_is_infinity_dffe_0;
	reg	input_is_infinity_dffe_1;
	reg	input_is_infinity_ff1;
	reg	input_is_nan_dffe_0;
	reg	input_is_nan_dffe_1;
	reg	input_is_nan_ff1;
	reg	input_not_zero_dffe_0;
	reg	input_not_zero_dffe_1;
	reg	input_not_zero_ff1;
	reg	lsb_dffe;
	reg	[22:0]	man_result_ff;
	reg	[23:0]	man_round_p;
	reg	[24:0]	man_round_p2;
	reg	nan_ff;
	reg	overflow_ff;
	reg	round_dffe;
	reg	[0:0]	sign_node_ff0;
	reg	[0:0]	sign_node_ff1;
	reg	[0:0]	sign_node_ff2;
	reg	[0:0]	sign_node_ff3;
	reg	[0:0]	sign_node_ff4;
	reg	sticky_dffe;
	reg	underflow_ff;
	reg	zero_ff;
	wire  [8:0]   wire_exp_add_adder_result;
	wire  [9:0]   wire_exp_adj_adder_result;
	wire  [9:0]   wire_exp_bias_subtr_result;
	wire  [24:0]   wire_man_round_adder_result;
	wire  [47:0]   wire_man_product2_mult_result;
	wire aclr;
	wire  [9:0]  bias;
	wire clk_en;
	wire  [7:0]  dataa_exp_all_one;
	wire  [7:0]  dataa_exp_not_zero;
	wire  [22:0]  dataa_man_not_zero;
	wire  [7:0]  datab_exp_all_one;
	wire  [7:0]  datab_exp_not_zero;
	wire  [22:0]  datab_man_not_zero;
	wire  exp_is_inf;
	wire  exp_is_zero;
	wire  [9:0]  expmod;
	wire  [7:0]  inf_num;
	wire  lsb_bit;
	wire  [23:0]  man_result_round;
	wire  [24:0]  man_shift_full;
	wire  [7:0]  result_exp_all_one;
	wire  [8:0]  result_exp_not_zero;
	wire  round_bit;
	wire  round_carry;
	wire  [22:0]  sticky_bit;

	// synopsys translate_off
	initial
		dataa_exp_all_one_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_exp_all_one_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_exp_all_one_ff_p1 <= dataa_exp_all_one[7];
	// synopsys translate_off
	initial
		dataa_exp_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_exp_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_exp_not_zero_ff_p1 <= dataa_exp_not_zero[7];
	// synopsys translate_off
	initial
		dataa_man_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_man_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_man_not_zero_ff_p1 <= dataa_man_not_zero[10];
	// synopsys translate_off
	initial
		dataa_man_not_zero_ff_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_man_not_zero_ff_p2 <= 1'b0;
		else if  (clk_en == 1'b1)   dataa_man_not_zero_ff_p2 <= dataa_man_not_zero[22];
	// synopsys translate_off
	initial
		datab_exp_all_one_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_exp_all_one_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_exp_all_one_ff_p1 <= datab_exp_all_one[7];
	// synopsys translate_off
	initial
		datab_exp_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_exp_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_exp_not_zero_ff_p1 <= datab_exp_not_zero[7];
	// synopsys translate_off
	initial
		datab_man_not_zero_ff_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_man_not_zero_ff_p1 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_man_not_zero_ff_p1 <= datab_man_not_zero[10];
	// synopsys translate_off
	initial
		datab_man_not_zero_ff_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) datab_man_not_zero_ff_p2 <= 1'b0;
		else if  (clk_en == 1'b1)   datab_man_not_zero_ff_p2 <= datab_man_not_zero[22];
	// synopsys translate_off
	initial
		delay_exp2_bias = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_exp2_bias <= 10'b0;
		else if  (clk_en == 1'b1)   delay_exp2_bias <= delay_exp_bias;
	// synopsys translate_off
	initial
		delay_exp_bias = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_exp_bias <= 10'b0;
		else if  (clk_en == 1'b1)   delay_exp_bias <= wire_exp_bias_subtr_result;
	// synopsys translate_off
	initial
		delay_man_product_msb = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_man_product_msb <= 1'b0;
		else if  (clk_en == 1'b1)   delay_man_product_msb <= delay_man_product_msb_p0;
	// synopsys translate_off
	initial
		delay_man_product_msb_p0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) delay_man_product_msb_p0 <= 1'b0;
		else if  (clk_en == 1'b1)   delay_man_product_msb_p0 <= wire_man_product2_mult_result[47];
	// synopsys translate_off
	initial
		exp_add_p1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_add_p1 <= 9'b0;
		else if  (clk_en == 1'b1)   exp_add_p1 <= wire_exp_add_adder_result;
	// synopsys translate_off
	initial
		exp_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_result_ff <= 8'b0;
		else if  (clk_en == 1'b1)   exp_result_ff <= ((inf_num & {8{((exp_is_inf | input_is_infinity_ff1) | input_is_nan_ff1)}}) | ((wire_exp_adj_adder_result[7:0] & {8{(~ exp_is_zero)}}) & {8{input_not_zero_ff1}}));
	// synopsys translate_off
	initial
		input_is_infinity_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_dffe_0 <= ((dataa_exp_all_one_ff_p1 & (~ (dataa_man_not_zero_ff_p1 | dataa_man_not_zero_ff_p2))) | (datab_exp_all_one_ff_p1 & (~ (datab_man_not_zero_ff_p1 | datab_man_not_zero_ff_p2))));
	// synopsys translate_off
	initial
		input_is_infinity_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_dffe_1 <= input_is_infinity_dffe_0;
	// synopsys translate_off
	initial
		input_is_infinity_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_infinity_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_infinity_ff1 <= input_is_infinity_dffe_1;
	// synopsys translate_off
	initial
		input_is_nan_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe_0 <= ((dataa_exp_all_one_ff_p1 & (dataa_man_not_zero_ff_p1 | dataa_man_not_zero_ff_p2)) | (datab_exp_all_one_ff_p1 & (datab_man_not_zero_ff_p1 | datab_man_not_zero_ff_p2)));
	// synopsys translate_off
	initial
		input_is_nan_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_dffe_1 <= input_is_nan_dffe_0;
	// synopsys translate_off
	initial
		input_is_nan_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_is_nan_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_is_nan_ff1 <= input_is_nan_dffe_1;
	// synopsys translate_off
	initial
		input_not_zero_dffe_0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_dffe_0 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_dffe_0 <= (dataa_exp_not_zero_ff_p1 & datab_exp_not_zero_ff_p1);
	// synopsys translate_off
	initial
		input_not_zero_dffe_1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_dffe_1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_dffe_1 <= input_not_zero_dffe_0;
	// synopsys translate_off
	initial
		input_not_zero_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) input_not_zero_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   input_not_zero_ff1 <= input_not_zero_dffe_1;
	// synopsys translate_off
	initial
		lsb_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) lsb_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   lsb_dffe <= lsb_bit;
	// synopsys translate_off
	initial
		man_result_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_result_ff <= 23'b0;
		else if  (clk_en == 1'b1)   man_result_ff <= {((((((man_result_round[22] & input_not_zero_ff1) & (~ input_is_infinity_ff1)) & (~ exp_is_inf)) & (~ exp_is_zero)) | (input_is_infinity_ff1 & (~ input_not_zero_ff1))) | input_is_nan_ff1), (((((man_result_round[21:0] & {22{input_not_zero_ff1}}) & {22{(~ input_is_infinity_ff1)}}) & {22{(~ exp_is_inf)}}) & {22{(~ exp_is_zero)}}) & {22{(~ input_is_nan_ff1)}})};
	// synopsys translate_off
	initial
		man_round_p = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_p <= 24'b0;
		else if  (clk_en == 1'b1)   man_round_p <= man_shift_full[24:1];
	// synopsys translate_off
	initial
		man_round_p2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_round_p2 <= 25'b0;
		else if  (clk_en == 1'b1)   man_round_p2 <= wire_man_round_adder_result;
	// synopsys translate_off
	initial
		nan_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) nan_ff <= 1'b0;
		else if  (clk_en == 1'b1)   nan_ff <= (input_is_nan_ff1 | (input_is_infinity_ff1 & (~ input_not_zero_ff1)));
	// synopsys translate_off
	initial
		overflow_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) overflow_ff <= 1'b0;
		else if  (clk_en == 1'b1)   overflow_ff <= (((exp_is_inf | input_is_infinity_ff1) & (~ input_is_nan_ff1)) & (~ (input_is_infinity_ff1 & (~ input_not_zero_ff1))));
	// synopsys translate_off
	initial
		round_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) round_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   round_dffe <= round_bit;
	// synopsys translate_off
	initial
		sign_node_ff0 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff0 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff0 <= (dataa[31] ^ datab[31]);
	// synopsys translate_off
	initial
		sign_node_ff1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff1 <= sign_node_ff0[0:0];
	// synopsys translate_off
	initial
		sign_node_ff2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff2 <= sign_node_ff1[0:0];
	// synopsys translate_off
	initial
		sign_node_ff3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff3 <= sign_node_ff2[0:0];
	// synopsys translate_off
	initial
		sign_node_ff4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_node_ff4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_node_ff4 <= sign_node_ff3[0:0];
	// synopsys translate_off
	initial
		sticky_dffe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sticky_dffe <= 1'b0;
		else if  (clk_en == 1'b1)   sticky_dffe <= sticky_bit[22];
	// synopsys translate_off
	initial
		underflow_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) underflow_ff <= 1'b0;
		else if  (clk_en == 1'b1)   underflow_ff <= (((exp_is_zero & input_not_zero_ff1) & (~ input_is_nan_ff1)) & (~ (input_is_infinity_ff1 & (~ input_not_zero_ff1))));
	// synopsys translate_off
	initial
		zero_ff = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) zero_ff <= 1'b0;
		else if  (clk_en == 1'b1)   zero_ff <= (((exp_is_zero | (~ input_not_zero_ff1)) & (~ input_is_nan_ff1)) & (~ input_is_infinity_ff1));
	lpm_add_sub   exp_add_adder
	( 
	.aclr(aclr),
	.cin(1'b0),
	.clken(clk_en),
	.clock(clock),
	.cout(),
	.dataa({1'b0, dataa[30:23]}),
	.datab({1'b0, datab[30:23]}),
	.overflow(),
	.result(wire_exp_add_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.add_sub(1'b1)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_add_adder.lpm_pipeline = 1,
		exp_add_adder.lpm_width = 9,
		exp_add_adder.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_adj_adder
	( 
	.cin(1'b0),
	.cout(),
	.dataa(delay_exp2_bias),
	.datab(expmod),
	.overflow(),
	.result(wire_exp_adj_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_adj_adder.lpm_width = 10,
		exp_adj_adder.lpm_type = "lpm_add_sub";
	lpm_add_sub   exp_bias_subtr
	( 
	.cout(),
	.dataa({1'b0, exp_add_p1[8:0]}),
	.datab({bias[9:0]}),
	.overflow(),
	.result(wire_exp_bias_subtr_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exp_bias_subtr.lpm_direction = "SUB",
		exp_bias_subtr.lpm_pipeline = 0,
		exp_bias_subtr.lpm_representation = "UNSIGNED",
		exp_bias_subtr.lpm_width = 10,
		exp_bias_subtr.lpm_type = "lpm_add_sub";
	lpm_add_sub   man_round_adder
	( 
	.cout(),
	.dataa({1'b0, man_round_p}),
	.datab({{24{1'b0}}, round_carry}),
	.overflow(),
	.result(wire_man_round_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_round_adder.lpm_pipeline = 0,
		man_round_adder.lpm_width = 25,
		man_round_adder.lpm_type = "lpm_add_sub";
	lpm_mult   man_product2_mult
	( 
	.aclr(aclr),
	.clken(clk_en),
	.clock(clock),
	.dataa({1'b1, dataa[22:0]}),
	.datab({1'b1, datab[22:0]}),
	.result(wire_man_product2_mult_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.sum({1{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		man_product2_mult.lpm_pipeline = 2,
		man_product2_mult.lpm_representation = "UNSIGNED",
		man_product2_mult.lpm_widtha = 24,
		man_product2_mult.lpm_widthb = 24,
		man_product2_mult.lpm_widthp = 48,
		man_product2_mult.lpm_widths = 1,
		man_product2_mult.lpm_type = "lpm_mult",
		man_product2_mult.lpm_hint = "DEDICATED_MULTIPLIER_CIRCUITRY=YES";
	assign
		aclr = 1'b0,
		bias = {{3{1'b0}}, {7{1'b1}}},
		clk_en = 1'b1,
		dataa_exp_all_one = {(dataa[30] & dataa_exp_all_one[6]), (dataa[29] & dataa_exp_all_one[5]), (dataa[28] & dataa_exp_all_one[4]), (dataa[27] & dataa_exp_all_one[3]), (dataa[26] & dataa_exp_all_one[2]), (dataa[25] & dataa_exp_all_one[1]), (dataa[24] & dataa_exp_all_one[0]), dataa[23]},
		dataa_exp_not_zero = {(dataa[30] | dataa_exp_not_zero[6]), (dataa[29] | dataa_exp_not_zero[5]), (dataa[28] | dataa_exp_not_zero[4]), (dataa[27] | dataa_exp_not_zero[3]), (dataa[26] | dataa_exp_not_zero[2]), (dataa[25] | dataa_exp_not_zero[1]), (dataa[24] | dataa_exp_not_zero[0]), dataa[23]},
		dataa_man_not_zero = {(dataa[22] | dataa_man_not_zero[21]), (dataa[21] | dataa_man_not_zero[20]), (dataa[20] | dataa_man_not_zero[19]), (dataa[19] | dataa_man_not_zero[18]), (dataa[18] | dataa_man_not_zero[17]), (dataa[17] | dataa_man_not_zero[16]), (dataa[16] | dataa_man_not_zero[15]), (dataa[15] | dataa_man_not_zero[14]), (dataa[14] | dataa_man_not_zero[13]), (dataa[13] | dataa_man_not_zero[12]), (dataa[12] | dataa_man_not_zero[11]), dataa[11], (dataa[10] | dataa_man_not_zero[9]), (dataa[9] | dataa_man_not_zero[8]), (dataa[8] | dataa_man_not_zero[7]), (dataa[7] | dataa_man_not_zero[6]), (dataa[6] | dataa_man_not_zero[5]), (dataa[5] | dataa_man_not_zero[4]), (dataa[4] | dataa_man_not_zero[3]), (dataa[3] | dataa_man_not_zero[2]), (dataa[2] | dataa_man_not_zero[1]), (dataa[1] | dataa_man_not_zero[0]), dataa[0]},
		datab_exp_all_one = {(datab[30] & datab_exp_all_one[6]), (datab[29] & datab_exp_all_one[5]), (datab[28] & datab_exp_all_one[4]), (datab[27] & datab_exp_all_one[3]), (datab[26] & datab_exp_all_one[2]), (datab[25] & datab_exp_all_one[1]), (datab[24] & datab_exp_all_one[0]), datab[23]},
		datab_exp_not_zero = {(datab[30] | datab_exp_not_zero[6]), (datab[29] | datab_exp_not_zero[5]), (datab[28] | datab_exp_not_zero[4]), (datab[27] | datab_exp_not_zero[3]), (datab[26] | datab_exp_not_zero[2]), (datab[25] | datab_exp_not_zero[1]), (datab[24] | datab_exp_not_zero[0]), datab[23]},
		datab_man_not_zero = {(datab[22] | datab_man_not_zero[21]), (datab[21] | datab_man_not_zero[20]), (datab[20] | datab_man_not_zero[19]), (datab[19] | datab_man_not_zero[18]), (datab[18] | datab_man_not_zero[17]), (datab[17] | datab_man_not_zero[16]), (datab[16] | datab_man_not_zero[15]), (datab[15] | datab_man_not_zero[14]), (datab[14] | datab_man_not_zero[13]), (datab[13] | datab_man_not_zero[12]), (datab[12] | datab_man_not_zero[11]), datab[11], (datab[10] | datab_man_not_zero[9]), (datab[9] | datab_man_not_zero[8]), (datab[8] | datab_man_not_zero[7]), (datab[7] | datab_man_not_zero[6]), (datab[6] | datab_man_not_zero[5]), (datab[5] | datab_man_not_zero[4]), (datab[4] | datab_man_not_zero[3]), (datab[3] | datab_man_not_zero[2]), (datab[2] | datab_man_not_zero[1]), (datab[1] | datab_man_not_zero[0]), datab[0]},
		exp_is_inf = (((~ wire_exp_adj_adder_result[9]) & wire_exp_adj_adder_result[8]) | ((~ wire_exp_adj_adder_result[8]) & result_exp_all_one[7])),
		exp_is_zero = (wire_exp_adj_adder_result[9] | (~ result_exp_not_zero[8])),
		expmod = {{8{1'b0}}, (delay_man_product_msb & man_round_p2[24]), (delay_man_product_msb ^ man_round_p2[24])},
		inf_num = {8{1'b1}},
		lsb_bit = man_shift_full[1],
		man_result_round = ((man_round_p2[23:0] & {24{(~ man_round_p2[24])}}) | (man_round_p2[24:1] & {24{man_round_p2[24]}})),
		man_shift_full = ((wire_man_product2_mult_result[46:22] & {25{(~ wire_man_product2_mult_result[47])}}) | (wire_man_product2_mult_result[47:23] & {25{wire_man_product2_mult_result[47]}})),
		nan = nan_ff,
		overflow = overflow_ff,
		result = {sign_node_ff4[0:0], exp_result_ff[7:0], man_result_ff[22:0]},
		result_exp_all_one = {(result_exp_all_one[6] & wire_exp_adj_adder_result[7]), (result_exp_all_one[5] & wire_exp_adj_adder_result[6]), (result_exp_all_one[4] & wire_exp_adj_adder_result[5]), (result_exp_all_one[3] & wire_exp_adj_adder_result[4]), (result_exp_all_one[2] & wire_exp_adj_adder_result[3]), (result_exp_all_one[1] & wire_exp_adj_adder_result[2]), (result_exp_all_one[0] & wire_exp_adj_adder_result[1]), wire_exp_adj_adder_result[0]},
		result_exp_not_zero = {(result_exp_not_zero[7] | wire_exp_adj_adder_result[8]), (result_exp_not_zero[6] | wire_exp_adj_adder_result[7]), (result_exp_not_zero[5] | wire_exp_adj_adder_result[6]), (result_exp_not_zero[4] | wire_exp_adj_adder_result[5]), (result_exp_not_zero[3] | wire_exp_adj_adder_result[4]), (result_exp_not_zero[2] | wire_exp_adj_adder_result[3]), (result_exp_not_zero[1] | wire_exp_adj_adder_result[2]), (result_exp_not_zero[0] | wire_exp_adj_adder_result[1]), wire_exp_adj_adder_result[0]},
		round_bit = man_shift_full[0],
		round_carry = (round_dffe & (lsb_dffe | sticky_dffe)),
		sticky_bit = {(sticky_bit[21] | (wire_man_product2_mult_result[47] & wire_man_product2_mult_result[22])), (sticky_bit[20] | wire_man_product2_mult_result[21]), (sticky_bit[19] | wire_man_product2_mult_result[20]), (sticky_bit[18] | wire_man_product2_mult_result[19]), (sticky_bit[17] | wire_man_product2_mult_result[18]), (sticky_bit[16] | wire_man_product2_mult_result[17]), (sticky_bit[15] | wire_man_product2_mult_result[16]), (sticky_bit[14] | wire_man_product2_mult_result[15]), (sticky_bit[13] | wire_man_product2_mult_result[14]), (sticky_bit[12] | wire_man_product2_mult_result[13]), (sticky_bit[11] | wire_man_product2_mult_result[12]), (sticky_bit[10] | wire_man_product2_mult_result[11]), (sticky_bit[9] | wire_man_product2_mult_result[10]), (sticky_bit[8] | wire_man_product2_mult_result[9]), (sticky_bit[7] | wire_man_product2_mult_result[8]), (sticky_bit[6] | wire_man_product2_mult_result[7]), (sticky_bit[5] | wire_man_product2_mult_result[6]), (sticky_bit[4] | wire_man_product2_mult_result[5]), (sticky_bit[3] | wire_man_product2_mult_result[4]), (sticky_bit[2] | wire_man_product2_mult_result[3]), (sticky_bit[1] | wire_man_product2_mult_result[2]), (sticky_bit[0] | wire_man_product2_mult_result[1]), wire_man_product2_mult_result[0]},
		underflow = underflow_ff,
		zero = zero_ff;
endmodule //mul_s_altfp_mult_64m
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module mul_s (
	clock,
	dataa,
	datab,
	nan,
	overflow,
	result,
	underflow,
	zero);

	input	  clock;
	input	[31:0]  dataa;
	input	[31:0]  datab;
	output	  nan;
	output	  overflow;
	output	[31:0]  result;
	output	  underflow;
	output	  zero;

	wire  sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire  sub_wire3;
	wire [31:0] sub_wire4;
	wire  overflow = sub_wire0;
	wire  nan = sub_wire1;
	wire  underflow = sub_wire2;
	wire  zero = sub_wire3;
	wire [31:0] result = sub_wire4[31:0];

	mul_s_altfp_mult_64m	mul_s_altfp_mult_64m_component (
				.dataa (dataa),
				.datab (datab),
				.clock (clock),
				.overflow (sub_wire0),
				.nan (sub_wire1),
				.underflow (sub_wire2),
				.zero (sub_wire3),
				.result (sub_wire4));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: FPM_FORMAT STRING "Single"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: VERSION_NUMBER NUMERIC "2"
// Retrieval info: CONSTANT: DEDICATED_MULTIPLIER_CIRCUITRY STRING "YES"
// Retrieval info: CONSTANT: DENORMAL_SUPPORT STRING "NO"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altfp_mult"
// Retrieval info: CONSTANT: PIPELINE NUMERIC "5"
// Retrieval info: CONSTANT: REDUCED_FUNCTIONALITY STRING "NO"
// Retrieval info: CONSTANT: WIDTH_EXP NUMERIC "8"
// Retrieval info: CONSTANT: WIDTH_MAN NUMERIC "23"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL clock
// Retrieval info: USED_PORT: dataa 0 0 32 0 INPUT NODEFVAL dataa[31..0]
// Retrieval info: USED_PORT: datab 0 0 32 0 INPUT NODEFVAL datab[31..0]
// Retrieval info: USED_PORT: nan 0 0 0 0 OUTPUT NODEFVAL nan
// Retrieval info: USED_PORT: overflow 0 0 0 0 OUTPUT NODEFVAL overflow
// Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL result[31..0]
// Retrieval info: USED_PORT: underflow 0 0 0 0 OUTPUT NODEFVAL underflow
// Retrieval info: USED_PORT: zero 0 0 0 0 OUTPUT NODEFVAL zero
// Retrieval info: CONNECT: @dataa 0 0 32 0 dataa 0 0 32 0
// Retrieval info: CONNECT: @datab 0 0 32 0 datab 0 0 32 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
// Retrieval info: CONNECT: overflow 0 0 0 0 @overflow 0 0 0 0
// Retrieval info: CONNECT: underflow 0 0 0 0 @underflow 0 0 0 0
// Retrieval info: CONNECT: nan 0 0 0 0 @nan 0 0 0 0
// Retrieval info: CONNECT: zero 0 0 0 0 @zero 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL mul_s.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL mul_s.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mul_s.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mul_s.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mul_s_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL mul_s_bb.v TRUE
// Retrieval info: LIB_FILE: lpm
