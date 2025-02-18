%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRAMATICA
% CONFIGURATION FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_version( c_rejection_parameters, `09/08/2018 12:44:51` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DOCUMENT RECEPTION
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Receive Body As Attachment
%-----------------------------------------------------------------------
i_op_param( receive_body_as_attachment, From, _, Subject, _, `false` ) % Extra parameter (receivers) so that it overrides ones in config
:-
	string_to_lower( From, From_L ),
	q_sys_sub_string( From_L, _, _, `dpd` ),
	(
		q_sys_sub_string( Subject, _, _, `will be delivered` )
		;
		q_sys_sub_string( Subject, _, _, `has been delivered` )
		;
		q_sys_sub_string( Subject, _, _, `due for delivery` )
		;
		q_sys_sub_string( Subject, _, _, `we'll deliver` )
		;
		q_sys_sub_string( Subject, _, _, `due for collection` )
		;
		q_sys_sub_string( Subject, _, _, `your order from` )
		;
		q_sys_sub_string( Subject, _, _, `your request to change your delivery` )
	)
.

%-----------------------------------------------------------------------
% Files To Reject
%-----------------------------------------------------------------------
i_op_param( reject( Name, Size ), _, _, _, `true` ) % Generic image attachments
:-
	sys_string_length( Name, Name_Len ),
	sys_calculate( Name_Len_Minus_Four, Name_Len - 3 ),
	q_sys_sub_string( Name, Name_Len_Minus_Four, 4, Extension ),
	q_sys_member( Extension, [ `.gif`, `.htm`, `html`, `.jpg`, `.png`, `.txt`, `.wmz` ] ),
	
	(
		q_sys_sub_string( Name, _, _, `image00` )
		
		;
		
		q_sys_sub_string( Name, _, _, `ATT000` )
		
	),
	
	trace( reject( Name, Size ) )
.

i_op_param( reject( Name, Size ), _, _, _, `true` ) % General unextractable attachments
:-
	sys_string_length( Name, Name_Len ),
	sys_calculate( Name_Len_Minus_Four, Name_Len - 3 ),
	q_sys_sub_string( Name, Name_Len_Minus_Four, 4, Extension ),
	q_sys_member( Extension, [ `.ics`, `.msg`, `.p7s`, `.pub`, `.xps` ] ),
	trace( reject( Name, Size ) )
.

i_op_param( reject( Name, Size ), From, To, Subject, `true` ) % PNG images
:-
	q_sys_comp( Size < 50000 ),
	string_to_lower( Name, Name_L ),
	q_sys_sub_string( Name_L, _, _, `.png` ),
	sys_string_number( Size_Str, Size ),
	strcat_list( [ `Rejected: '`, Name, `'. Size: `, Size_Str, ` bytes. Sent to `, To, ` by `, From, ` with subject: '`, Subject, `'.` ], Alert ),
	trace( [ Alert ] )
.

i_op_param( reject( Name, Size ), From, To, Subject, `true` ) % GIF images
:-
	q_sys_comp( Size < 5000 ),
	string_to_lower( Name, Name_L ),
	q_sys_sub_string( Name_L, _, _, `.gif` ),
	sys_string_number( Size_Str, Size ),
	strcat_list( [ `Rejected: '`, Name, `'. Size: `, Size_Str, ` bytes. Sent to `, To, ` by `, From, ` with subject: '`, Subject, `'.` ], Alert ),
	trace( [ Alert ] )
.

i_op_param( reject( Name, Size ), From, To, Subject, `true` ) % JPG images
:-
	q_sys_comp( Size < 80000 ),
	string_to_lower( Name, Name_L ),
	
	(
		q_sys_sub_string( Name_L, _, _, `.jpg` )
		
		;
	
		q_sys_sub_string( Name_L, _, _, `.jpeg` )
	
	),
	
	sys_string_number( Size_Str, Size ),
	strcat_list( [ `Rejected: '`, Name, `'. Size: `, Size_Str, ` bytes. Sent to `, To, ` by `, From, ` with subject: '`, Subject, `'.` ], Alert ),
	trace( [ Alert ] )
.

i_op_param( reject( Name, Size ), From, To, Subject, `true` ) % NOX files (files with no extension)
:-
	q_sys_sub_string( Name, _, _, `.nox` ),
	not( extensionless_pdf_sender( From ) ), % Needed because this rejection prevents extensionless documents being received at all - Seen in config_egs_invoices.pro
	sys_string_number( Size_Str, Size ),
	strcat_list( [ `Rejected: '`, Name, `'. Size: `, Size_Str, ` bytes. Sent to `, To, ` by `, From, ` with subject: '`, Subject, `'.` ], Alert ),
	trace( [ Alert ] )
.

i_op_param( reject( Name, Size ), From, To, Subject, `true` ) % MACOSX files
:-
	q_sys_sub_string( Name, _, _, `MACOSX` ),
	sys_string_number( Size_Str, Size ),
	strcat_list( [ `Rejected: '`, Name, `'. Size: `, Size_Str, ` bytes. Sent to `, To, ` by `, From, ` with subject: '`, Subject, `'.` ], Alert ),
	trace( [ Alert ] ),
	alert( Alert, 0, `hours` )
.
