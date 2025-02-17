%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRAMATICA
% CONFIGURATION FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_version( c_sub_results, `09/08/2019 10:22:54` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PORTAL
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Sub Result Override
%-----------------------------------------------------------------------
i_op_param( sub_result_override, _, _, _, Sub_Result )
:-
	rules_result( _, Reason, _ ),
	
	sys_string_atom( Reason_String, Reason ),
	
	(
		q_sys_sub_string( Reason_String, _, _, `i_analyse_missing_` ),
		
		string_string_replace( Reason_String, `i_analyse_missing_`, ``, Variable ),
		
		required_data_item( Data_Item_Name, _, _, _, _, _, _, _, _, Variable, _ ),
		
		strcat_list( [ `Missing `, Data_Item_Name ], Sub_Result )
		
		;
		
		not( q_sys_sub_string( Reason_String, _, _, `i_analyse_missing_` ) ),
		
		(
			document_scenario( Sub_Result, _, _, _, _, _, _, _, _, _, _, _ )
			
			;
			
			document_scenario_dropdown( Sub_Result, _, _, _ )
			
		),
		
		document_reason_lookup( Sub_Result, _, Reason_String, _, _ )
		
	),
	
	!
.

% For newer versions of the SDD
i_op_param( sub_result_override, _, _, _, Sub_Result )
:-
	rules_result( _, Reason, _ ),
	
	sys_string_atom( Reason_String, Reason ),
	
	(
		q_sys_sub_string( Reason_String, _, _, `i_analyse_missing_` ),
		
		string_string_replace( Reason_String, `i_analyse_missing_`, ``, Variable ),
		
		(
			header_level_item( Data_Item_Name, _, _, _, _, _, _, _, _, _, Variable, _, _, _, _, _, _, _ )
			
			;
			
			line_level_item( Data_Item_Name, _, _, _, _, _, _, _, _, _, Variable, _, _, _, _, _, _, _ )
		
		),
		
		strcat_list( [ `Missing `, Data_Item_Name ], Sub_Result )
		
		;
		
		not( q_sys_sub_string( Reason_String, _, _, `i_analyse_missing_` ) ),
		
		q_sys_sub_string( Reason_String, _, _, `i_analyse_` ),
		
		(
			document_scenario( _, _, _, _, _, _, _, Sub_Result, _, _, _ )

			;
			
			quick_action_dropdown( _, _, _, _, Sub_Result )
			
		),
		
		string_to_lower( Sub_Result, Sub_Result_L ),
		
		string_string_replace( Sub_Result_L, ` `, `_`, Sub_Result_Replaced ),
		
		strip_string2_from_string1( Sub_Result_Replaced, `\\|,<.>/?;:'@#~]}[{=+-)(*&^%$£"!`, Sub_Result_Stripped ),
		
		strcat_list( [ `i_analyse_`, Sub_Result_Stripped ], Reason_String )
		
	),
	
	!
.

i_op_param( sub_result_override, _, _, _, Sub_Result )
:-
	rules_result( _, Reason, _ ),
	
	sub_result_lookup( Reason, Sub_Result ),
	
	!
.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PREDICATES
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Sub Result Lookup
%-----------------------------------------------------------------------
sub_result_lookup( return_to_sender, `Returned to Sender` ).
sub_result_lookup( i_analyse_return_to_sender, `Returned to Sender` ).
sub_result_lookup( forward_to_address, `Forwarded to Email Address` ).
sub_result_lookup( i_analyse_forward_to_address, `Forwarded to Email Address` ).
sub_result_lookup( i_analyse_junk_flag, `Junk` ).
sub_result_lookup( i_analyse_supporting_document, `Supporting Document (has been attached to invoice image)` ).
sub_result_lookup( empty, `Image Document` ).
sub_result_lookup( unsupported( _ ), `Unsupported Format` ).
sub_result_lookup( pdf_error, `Unsupported Format` ).
sub_result_lookup( too_big( _ ), `Unsupported Format` ).
sub_result_lookup( vat_without_vat_number, `VAT quoted but no supplier VAT number` ).
sub_result_lookup( credit_note, `Credit Note` ).
sub_result_lookup( zero_value_invoice, `Zero Value Invoice` ).
sub_result_lookup( invoice_totals_inconsistent, `Totals Do Not Add Up` ).
sub_result_lookup( sum_net_discrepancy_too_great, `Sum of Line Net Amounts Not Equal to Total Net Amount` ).
sub_result_lookup( sum_total_discrepancy_too_great, `Sum of Line Gross Amounts Not Equal to Total Gross Amount` ).
sub_result_lookup( success, `Generic Capture Success` ):-data( generic_capture_attempted, `true` ).
