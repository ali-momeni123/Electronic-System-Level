function RTW_Sid2UrlHash() {
	this.urlHashMap = new Array();
	/* <S2>/Discrete FIR Filter */
	this.urlHashMap["FIRoldVersion:9"] = "Programmable_FIR_via_Registers.v:230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278";
	/* <S2>/coeffs_registers */
	this.urlHashMap["FIRoldVersion:172"] = "Programmable_FIR_via_Registers.v:117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166";
	/* <S2>/shadow_regs */
	this.urlHashMap["FIRoldVersion:240"] = "Programmable_FIR_via_Registers.v:213,214,215,216,217,218,219,220,221,222,223,224,225,226,227";
	/* <S15>/coeffs_assignment */
	this.urlHashMap["FIRoldVersion:153"] = "coeffs_registers.v:133,135,136,137,138,139,140,141,142,143,145";
	/* <S15>/coeffs_regs */
	this.urlHashMap["FIRoldVersion:244"] = "coeffs_registers.v:148,149,150,151,152,153,154,155,156,157,158,159,160,161,162";
	/* <S16>/Enable */
	this.urlHashMap["FIRoldVersion:240:3"] = "msg=rtwMsg_notTraceable&block=FIRoldVersion:240:3";
	/* <S16>/FixPt
Data Type
Duplicate1 */
	this.urlHashMap["FIRoldVersion:240:4"] = "msg=rtwMsg_notTraceable&block=FIRoldVersion:240:4";
	/* <S16>/FixPt
Unit Delay1 */
	this.urlHashMap["FIRoldVersion:240:5"] = "msg=rtwMsg_notTraceable&block=FIRoldVersion:240:5";
	/* <S17>/Enable */
	this.urlHashMap["FIRoldVersion:244:3"] = "msg=rtwMsg_notTraceable&block=FIRoldVersion:244:3";
	/* <S17>/FixPt
Data Type
Duplicate1 */
	this.urlHashMap["FIRoldVersion:244:4"] = "msg=rtwMsg_notTraceable&block=FIRoldVersion:244:4";
	/* <S17>/FixPt
Unit Delay1 */
	this.urlHashMap["FIRoldVersion:244:5"] = "msg=rtwMsg_notTraceable&block=FIRoldVersion:244:5";
	this.getUrlHash = function(sid) { return this.urlHashMap[sid];}
}
RTW_Sid2UrlHash.instance = new RTW_Sid2UrlHash();
function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "FIRoldVersion"};
	this.sidHashMap["FIRoldVersion"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S2>/coeffs_in"] = {sid: "FIRoldVersion:11"};
	this.sidHashMap["FIRoldVersion:11"] = {rtwname: "<S2>/coeffs_in"};
	this.rtwnameHashMap["<S2>/write_address"] = {sid: "FIRoldVersion:12"};
	this.sidHashMap["FIRoldVersion:12"] = {rtwname: "<S2>/write_address"};
	this.rtwnameHashMap["<S2>/write_enable"] = {sid: "FIRoldVersion:13"};
	this.sidHashMap["FIRoldVersion:13"] = {rtwname: "<S2>/write_enable"};
	this.rtwnameHashMap["<S2>/write_done"] = {sid: "FIRoldVersion:14"};
	this.sidHashMap["FIRoldVersion:14"] = {rtwname: "<S2>/write_done"};
	this.rtwnameHashMap["<S2>/filter_in"] = {sid: "FIRoldVersion:8"};
	this.sidHashMap["FIRoldVersion:8"] = {rtwname: "<S2>/filter_in"};
	this.rtwnameHashMap["<S2>/Discrete FIR Filter"] = {sid: "FIRoldVersion:9"};
	this.sidHashMap["FIRoldVersion:9"] = {rtwname: "<S2>/Discrete FIR Filter"};
	this.rtwnameHashMap["<S2>/coeffs_registers"] = {sid: "FIRoldVersion:172"};
	this.sidHashMap["FIRoldVersion:172"] = {rtwname: "<S2>/coeffs_registers"};
	this.rtwnameHashMap["<S2>/shadow_regs"] = {sid: "FIRoldVersion:240"};
	this.sidHashMap["FIRoldVersion:240"] = {rtwname: "<S2>/shadow_regs"};
	this.rtwnameHashMap["<S2>/filter_out"] = {sid: "FIRoldVersion:113"};
	this.sidHashMap["FIRoldVersion:113"] = {rtwname: "<S2>/filter_out"};
	this.rtwnameHashMap["<S15>/coeffs_in"] = {sid: "FIRoldVersion:173"};
	this.sidHashMap["FIRoldVersion:173"] = {rtwname: "<S15>/coeffs_in"};
	this.rtwnameHashMap["<S15>/write_address"] = {sid: "FIRoldVersion:175"};
	this.sidHashMap["FIRoldVersion:175"] = {rtwname: "<S15>/write_address"};
	this.rtwnameHashMap["<S15>/write_enable"] = {sid: "FIRoldVersion:176"};
	this.sidHashMap["FIRoldVersion:176"] = {rtwname: "<S15>/write_enable"};
	this.rtwnameHashMap["<S15>/coeffs_assignment"] = {sid: "FIRoldVersion:153"};
	this.sidHashMap["FIRoldVersion:153"] = {rtwname: "<S15>/coeffs_assignment"};
	this.rtwnameHashMap["<S15>/coeffs_regs"] = {sid: "FIRoldVersion:244"};
	this.sidHashMap["FIRoldVersion:244"] = {rtwname: "<S15>/coeffs_regs"};
	this.rtwnameHashMap["<S15>/coeffs_out"] = {sid: "FIRoldVersion:174"};
	this.sidHashMap["FIRoldVersion:174"] = {rtwname: "<S15>/coeffs_out"};
	this.rtwnameHashMap["<S16>/u"] = {sid: "FIRoldVersion:240:1"};
	this.sidHashMap["FIRoldVersion:240:1"] = {rtwname: "<S16>/u"};
	this.rtwnameHashMap["<S16>/E"] = {sid: "FIRoldVersion:240:2"};
	this.sidHashMap["FIRoldVersion:240:2"] = {rtwname: "<S16>/E"};
	this.rtwnameHashMap["<S16>/Enable"] = {sid: "FIRoldVersion:240:3"};
	this.sidHashMap["FIRoldVersion:240:3"] = {rtwname: "<S16>/Enable"};
	this.rtwnameHashMap["<S16>/FixPt Data Type Duplicate1"] = {sid: "FIRoldVersion:240:4"};
	this.sidHashMap["FIRoldVersion:240:4"] = {rtwname: "<S16>/FixPt Data Type Duplicate1"};
	this.rtwnameHashMap["<S16>/FixPt Unit Delay1"] = {sid: "FIRoldVersion:240:5"};
	this.sidHashMap["FIRoldVersion:240:5"] = {rtwname: "<S16>/FixPt Unit Delay1"};
	this.rtwnameHashMap["<S16>/State Control"] = {sid: "FIRoldVersion:240:9"};
	this.sidHashMap["FIRoldVersion:240:9"] = {rtwname: "<S16>/State Control"};
	this.rtwnameHashMap["<S16>/y"] = {sid: "FIRoldVersion:240:6"};
	this.sidHashMap["FIRoldVersion:240:6"] = {rtwname: "<S16>/y"};
	this.rtwnameHashMap["<S17>/u"] = {sid: "FIRoldVersion:244:1"};
	this.sidHashMap["FIRoldVersion:244:1"] = {rtwname: "<S17>/u"};
	this.rtwnameHashMap["<S17>/E"] = {sid: "FIRoldVersion:244:2"};
	this.sidHashMap["FIRoldVersion:244:2"] = {rtwname: "<S17>/E"};
	this.rtwnameHashMap["<S17>/Enable"] = {sid: "FIRoldVersion:244:3"};
	this.sidHashMap["FIRoldVersion:244:3"] = {rtwname: "<S17>/Enable"};
	this.rtwnameHashMap["<S17>/FixPt Data Type Duplicate1"] = {sid: "FIRoldVersion:244:4"};
	this.sidHashMap["FIRoldVersion:244:4"] = {rtwname: "<S17>/FixPt Data Type Duplicate1"};
	this.rtwnameHashMap["<S17>/FixPt Unit Delay1"] = {sid: "FIRoldVersion:244:5"};
	this.sidHashMap["FIRoldVersion:244:5"] = {rtwname: "<S17>/FixPt Unit Delay1"};
	this.rtwnameHashMap["<S17>/State Control"] = {sid: "FIRoldVersion:244:9"};
	this.sidHashMap["FIRoldVersion:244:9"] = {rtwname: "<S17>/State Control"};
	this.rtwnameHashMap["<S17>/y"] = {sid: "FIRoldVersion:244:6"};
	this.sidHashMap["FIRoldVersion:244:6"] = {rtwname: "<S17>/y"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
