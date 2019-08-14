%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRAMATICA
% CONFIGURATION FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_version( config_supplyon, `14/03/2019 11:43:10` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_config_file( `c_email_templates_new.pro` ).
i_config_file( `c_new_intervention_stuff.pro` ).
i_config_file( `c_rejection_parameters.pro` ).
i_config_file( `c_sub_results.pro` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% USER FIELDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
i_user_field( invoice, channel_partner, `Channel Partner` ).
i_user_field( invoice, customer, `Customer` ).
i_user_field( invoice, receiving_organisation, `Receiving Organisation` ).
i_user_field( invoice, sending_organisation, `Sending Organisation` ).
i_user_field( invoice, sender_name, `Sender Name` ).
i_user_field( invoice, return_email, `Return Email` ).
i_user_field( invoice, return_email_subject, `Return Email Subject` ).
i_user_field( invoice, return_email_body, `Return Email Body` ).
i_user_field( invoice, forward_email, `Forward Email` ).
i_user_field( invoice, forward_email_subject, `Forward Email Subject` ).
i_user_field( invoice, forward_email_body, `Forward Email Body` ).
i_user_field( invoice, enquiry_role, `Enquiry Role` ).
i_user_field( invoice, rounding_amount, `Rounding Amount` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% GENERAL SETTINGS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Config File Path & Directory
%-----------------------------------------------------------------------
i_config_param( config_file_path, `D:\\FTP\\GIT\\CONFIGS\\config supplyon.pro` ):- i_test_indicator.
i_config_param( config_file_path, `C:\\Users\\supplyon\\Documents\\Rules\\CONFIGS\\config supplyon.pro` ).
i_config_param( config_file_directory, `D:\\FTP\\GIT\\CONFIGS` ):- i_test_indicator.
i_config_param( config_file_directory, `C:\\Users\\supplyon\\Documents\\Rules\\CONFIGS` ).

%-----------------------------------------------------------------------
% Exclude Central Monitoring
%-----------------------------------------------------------------------
% i_config_param( exclude_central_monitoring, 1 ).

%-----------------------------------------------------------------------
% Directories
%-----------------------------------------------------------------------
i_config_param( supplier_directory, `D:\\Suppliers\\SupplyOn PL Test` ):- instance( `SupplyOn PL Test`), i_test_indicator.
i_config_param( supplier_directory, `D:\\Suppliers\\SupplyOn Test` ):- i_test_indicator.
i_config_param( supplier_directory, `C:\\Users\\supplyon\\Documents\\SupplyOn` ).
% i_config_param( personal_rules_directory, `C:\\Users\\supplyon\\Documents\\Rules\\Personal` ):- instance( Ins ), q_sys_sub_string( Ins, _, _, `PRD` ).
i_config_param( rules_directory, [ `D:\\FTP\\GIT\\GLOBAL`, `D:\\FTP\\GIT\\OTHER`, `D:\\FTP\\GIT\\SupplyOn`, `D:\\FTP\\GIT\\OTHER\\SupplyOn`, `C:\\Users\\supplyon\\Documents\\Rules\\SupplyOn`, `C:\\Users\\supplyon\\Documents\\Rules\\GLOBAL`, `C:\\Users\\supplyon\\Documents\\Rules\\OTHER`, `C:\\Users\\supplyon\\Documents\\Rules\\OTHER\\SupplyOn` ] ).
i_config_param( scripts_directory, `D:\\FTP\\GIT\\GLOBAL\\SCRIPTS` ):- i_test_indicator.
i_config_param( scripts_directory, `C:\\Users\\supplyon\\Documents\\Rules\\GLOBAL\\SCRIPTS` ).
i_config_param( ready_directory, `C:\\Users\\supplyon\\Documents\\SupplyOn\\XML READY` ):- instance( Ins ), q_sys_sub_string( Ins, _, _, `XML` ).
i_op_param( ready_directory, _, _, _, `C:\\Users\\supplyon\\Documents\\SupplyOn\\XML READY` ):- instance( Ins ), q_sys_sub_string( Ins, _, _, `PRD` ), chained_to( `junk` ).
i_config_param( remote_general_file_path, `D:\\FTP\\GIT\\GLOBAL\\LOOKUPS` ):- i_test_indicator.
i_config_param( remote_general_file_path, `C:\\Users\\supplyon\\Documents\\Rules\\GLOBAL\\Lookups` ).
i_config_param( bullzip_directory, `D:\\Bullzip Reprints` ):- i_test_indicator.
i_config_param( bullzip_directory, `C:\\Users\\supplyon\\Documents\\Bullzip Reprints` ).
i_op_param( validate_xml_directory, _, _, _, `D:\\FTP\\GIT\\GLOBAL\\SCHEMAS\\Financial Object` ):- i_test_indicator.
i_op_param( validate_xml_directory, _, _, _, `C:\\Users\\supplyon\\Documents\\Rules\\GLOBAL\\Financial Object` ).

%-----------------------------------------------------------------------
% Resource Settings
%-----------------------------------------------------------------------
i_config_param( prolog_resource, `h = 5000000 l = 500000 c = 1000000 t = 500000 rd = 5000 dn = real fl = double` ).

i_config_param( heap_stack_threshold, 95 ).
i_config_param( control_stack_threshold, 30 ).
i_config_param( local_stack_threshold, 30 ).
i_config_param( trail_stack_threshold, 30 ).

i_config_param( progress_bar_length, 300000 ).
i_config_param( parse_pattern_bar_length, 300000 ).

i_config_param( quiet_time_secs, 4000 ).
i_config_param( rules_timeout_minutes, 60 ).

i_config_param( disable_forwarding, 1 ).
i_config_param( absorb_prolog_exception, 0 ).
i_config_param( suspend_on_syntax_error, `true` ).

%-----------------------------------------------------------------------
% Inactivity Time
%-----------------------------------------------------------------------
i_config_param( inactivity_time, 72 ).

%-----------------------------------------------------------------------
% DISC LOGGING
%-----------------------------------------------------------------------
i_config_param( log_to_disc, `false` ).

%-----------------------------------------------------------------------
% Date Allowances
%-----------------------------------------------------------------------
i_config_param( old_date_allowance, 11000 ).
i_config_param( future_date_allowance, 11000 ).

%-----------------------------------------------------------------------
% Office Documents
%-----------------------------------------------------------------------
i_config_param( use_use_office, 1 ).
i_config_param( use_office_for_html, 1 ).

%-----------------------------------------------------------------------
% Undelay Script
%-----------------------------------------------------------------------
i_config_param( receiver_script_file_name, `utils.ps1` ).
i_config_param( receiver_script_function_name, `undelay` ).

%-----------------------------------------------------------------------
% Licenses
%-----------------------------------------------------------------------
i_config_param( sautinsoft_licence, decrypt( `BGhzSI52LGr+Knf5HHpePkfwoYSGiAe+v6o1svEAWp4=` ) ).
i_config_param( use_office_licence, decrypt( `VHQVZEN8+xyUXFTpr98zHzTWthgCwWBte/mtPnFzNVU=` ) ).
i_config_param( pdf_mosaic_registration_name, decrypt( `hIyckzlfRRJud0jo4y2XAQLiCEcVIM5d47oELMohXkGDIu7eMKBK/glC7f81W0A1` ) ).
i_config_param( pdf_mosaic_licence, decrypt( `YVh1Q1ph5a4X6KLjfB1ai3S/Hng6lUCpdAB2++nxnVpFbQ0K2usAjdCVmbiv2yAz9QJZsvl9RHgSFS5PdyZAEUiuhZrE6SGIHUBWIi355Tc=` ) ).
i_config_param( ocr, `abby_cloud` ).
i_config_param( abby_cloud_application, decrypt( `K9AI2p37k1ApzgA2veyya6W2X8haD4rDJyL9RNEJptM=` ) ).
i_config_param( abby_cloud_password, decrypt( `fqYhNOT+vu4oQhZ9qUe8Nvfc0rHlw0TJPeBwKcDuKXROgqjeU8gSCCYy9m1v4V+mDso8erBB4lPd5q6V7xUe7w==` ) ).

%-----------------------------------------------------------------------
% Archive
%-----------------------------------------------------------------------
i_op_param( archive, _, _, _, `no` ).

%-----------------------------------------------------------------------
% VAT Rates to Try When None Are Specified
%-----------------------------------------------------------------------
i_vat_rate( 5.0 ).
i_vat_rate( 10.0 ).
i_vat_rate( 15.0 ).
i_vat_rate( 19.0 ).
i_vat_rate( 20.0 ).
i_vat_rate( 21.0 ).
i_vat_rate( 23.0 ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EMAIL POLLING
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Email Addresses To Poll
%-----------------------------------------------------------------------
i_receivers( [

	[ `ct7@cloud-trade.com`, decrypt(`TEQ5tht+lllaGlAmPgP9HTJNRr9Lj6knqxmyxNsAyZbSHJB3d6YxSe0d4gmydpOo`)
		, imap_inbox, `supplyon.intervention@cloud-trade.com`
	]

] ):- instance( `SupplyOn PRD` ).

i_op_param( imap_recipient_alias( `supplyon.intervention@cloud-trade.com` ), _, _, _, `supplyon.intervention@cloud-trade.com` ).

%-----------------------------------------------------------------------
% IMAP Settings
%-----------------------------------------------------------------------
i_config_param( imap_server, `outlook.office365.com` ).
i_config_param( imap_port, 993 ).
i_config_param( imap_authentication, `auto` ).
i_config_param( imap_encryption, `implicit` ).
i_config_param( imap_delete_messages, `true` ).
i_config_param( imap_timeout, 60 ).
i_config_param( imap_delete_message_after_days, 60 ).


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
% File Extensions to Receive
%-----------------------------------------------------------------------
i_config_param( attachment_extensions_to_receive, [ `pdf`, `xml`, `doc`, `docx`, `blank`, `htm`, `html` ] ).

%-----------------------------------------------------------------------
% File Extensions to Change
%-----------------------------------------------------------------------
i_op_param( i2o_ext( `bmp` ), _, _, _, `jpg` ).
i_op_param( i2o_ext( `csv` ), _, _, _, `excel` ).
i_op_param( i2o_ext( `dat` ), _, _, _, `pdf` ).
i_op_param( i2o_ext( `html` ), _, _, _, `htm` ).
i_op_param( i2o_ext( `jpeg` ), _, _, _, `jpg` ).
i_op_param( i2o_ext( `xlsm` ), _, _, _, `xls` ).
i_op_param( i2o_ext( `xltx` ), _, _, _, `xls` ).
i_op_param( i2o_ext( `docx` ), _, _, _, `doc` ).

%-----------------------------------------------------------------------
% Receive Body As Attachment
%-----------------------------------------------------------------------
i_op_param( receive_body_as_attachment, _, _, Subject, `always` ):- string_to_lower( Subject, SubjectL ), q_sys_sub_string( SubjectL, _, _, `mapping request` ).
i_op_param( receive_body_as_attachment, _, _, _, `true` ).

%-----------------------------------------------------------------------
% Suspect Wait ID Mins
%-----------------------------------------------------------------------
i_op_param( suspect_wait_id_mins, _, _, _, `2` ).

%-----------------------------------------------------------------------
% Unique ID Name
%-----------------------------------------------------------------------
ii_op_param( unique_id_name, _, _, _, `supplyon` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% RULES & PROCESS FILES
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% (Supplier) Rules File
%-----------------------------------------------------------------------
i_op_param( supplier, _, _, Subject, `supplyon mapping request` ):- string_to_lower( Subject, SubjectL ), q_sys_sub_string( SubjectL, _, _, `mapping request` ).
i_op_param( supplier, _, _, _, `supplyon` ).

%-----------------------------------------------------------------------
% Process (p_) File
%-----------------------------------------------------------------------
i_op_param( process, _, _, _, `supplyon` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% INTERVENTION
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Enquiry Role
%-----------------------------------------------------------------------
i_op_param( enquiry_role, _, _, _, Role ):- ( result( _, invoice, enquiry_role, Role ); data( invoice, enquiry_role, Role ) ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% OUTPUT FILE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Output File Schema
%-----------------------------------------------------------------------
i_op_param( output, _, _, _, financial_object_xml ).

%-----------------------------------------------------------------------
% Output File Type (Extension)
%-----------------------------------------------------------------------
i_op_param( output_file_type, _, _, _, `xml` ).

%-----------------------------------------------------------------------
% Bom
%-----------------------------------------------------------------------
% i_op_param( bom, _, _, _, `false` ).

%-----------------------------------------------------------------------
% XML Empty Tags
%-----------------------------------------------------------------------
% i_op_param( xml_empty_tags( _ ), _, _, _, `` ).

%-----------------------------------------------------------------------
% XML Transform
%-----------------------------------------------------------------------
% i_op_param( xml_transform( _, _ ), _, _, _, `` ).

%-----------------------------------------------------------------------
% XML Encoding
%-----------------------------------------------------------------------
% i_op_param( xml_encoding, _, _, _, _, `` ). % utf7, utf8 (default), utf16, utf32, ascii

%-----------------------------------------------------------------------
% Suppress Output Of Zero Value Lines
%-----------------------------------------------------------------------
i_op_param( suppress_output_of_zero_value_lines, _, _, _, true ):- document_scenario( `Zero Value Line`, _, _, `Ignore Zero Value Lines`, _, _, _, _, _, _, _, _ ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TRANSFER DETAILS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% HTTP POSTING
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% HTTP Post URL (Output File)
%-----------------------------------------------------------------------
i_op_param( url, `taigh.hawkins@cloud-trade.com`, _, Sub, `https://webhook.site/77012e2b-cef3-4db1-88ec-75fe333d47f9` ):- Sub \= `MPREQ`.
i_op_param( url, _, _, Sub, `https://soedi-scmpl.integration.qas.supplyon.com/shc` ):- Sub \= `MPREQ`, instance( `SupplyOn PL Test` ), i_success_test.
% i_op_param( url, _, _, Sub, `https://soedi-scmpl.integration.qas.supplyon.com/shc` ):- Sub \= `MPREQ`, instance( `SupplyOn PL Test` ), i_success_test.
i_op_param( url, _, _, Sub, `https://soedi.integration.qas.supplyon.com/shc` ):- Sub \= `MPREQ`, i_success_test, i_test_indicator.
i_op_param( url, _, _, Sub, `https://soedi.integration.prd.supplyon.com/shc` ):- Sub \= `MPREQ`, i_success_test.

%-----------------------------------------------------------------------
% HTTP Charset control
%-----------------------------------------------------------------------
i_op_param( omit_charset_in_http_xml_post, _, _, _, true ).

%-----------------------------------------------------------------------
% HTTP Login
%-----------------------------------------------------------------------
i_op_param( http_login, _, _, _, decrypt( `YSH5pqSvAo1Ed4q0F0vernV5o2Nw/qT/iVfLj+lfmN8=` ) ):- instance( `SupplyOn PL Test` ).
i_op_param( http_password, _, _, _, decrypt( `D7AZNUU64UAL6bwfInyE/EdlDQHvKgdka7SSjC5ZX2w=` ) ):- instance( `SupplyOn PL Test` ).
%-----------------------------------------------------------------------
i_op_param( http_login, _, _, _, decrypt( `AzBV6HVthp6xVHPg2P1peWuvmpP9l37X1GbhsAvDYFM=` ) ):- i_test_indicator.
i_op_param( http_password, _, _, _, decrypt( `gpKq2lGpUVmvES0fEz49xJ2mZC79zq20WKSIPw9210w=` ) ):- i_test_indicator.
i_op_param( http_login, _, _, _, decrypt( `t63mxGJzv3SlgRdHtuT3dkA1xA0X0C+ciP3k4SU/Srk=` ) ).
i_op_param( http_password, _, _, _, decrypt( `EL+H9oAGOqQJsM9ZC9mjUSZAobpNCS1/+6ag44t+n54=` ) ).

%-----------------------------------------------------------------------
% HTTP Authorisation
%-----------------------------------------------------------------------
% i_op_param( http_authorisation, _, _, _, `Basic Q0xPVURUUlE6TmFuNlVkYW0=` ).

%-----------------------------------------------------------------------
% HTTP Header
%
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%	Remember, these run multiple times so ALL relevant ones will be entered
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%-----------------------------------------------------------------------
i_op_param( http_header, _, _, _, `SOAPAction:SO-MAPSTAT` ):- data( mapping_request, `true` ), !.
i_op_param( http_header, _, _, _, `SOAPAction:SO-PDFINIT` ):- not( data( mapping_request, `true` ) ), !.
% i_op_param( http_header, _, _, _, `SOAPAction:SO_INVOICE` ).

%-----------------------------------------------------------------------
% HTTP Security Protocol
%-----------------------------------------------------------------------
i_config_param( http_security_protocol, `tls` ).

%-----------------------------------------------------------------------
% Suspend Post on Exception
%-----------------------------------------------------------------------
i_op_param( suspend_post_on_exception, _, _, _, _ ).

%-----------------------------------------------------------------------
% Suspend Post Reason Code
%-----------------------------------------------------------------------
i_op_param( suspend_post_rc( RC ), _, _, _, _ ):- debug( [ `HTTP Response`, RC ] ), RC \= `OK`, RC \= `200`, RC \= `ok`.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% TRANSFER DIRECTORIES
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Output Transfer Directory
%-----------------------------------------------------------------------
% i_op_param( output_transfer_directory, _, _, _, `` ).

%-----------------------------------------------------------------------
% Image (TIF) Transfer Directory
%-----------------------------------------------------------------------
% i_op_param( image_transfer_directory, _, _, _, `` ).

%-----------------------------------------------------------------------
% Input (PDF) Transfer Directory
%-----------------------------------------------------------------------
% i_op_param( input_transfer_directory, _, _, _, `` ).

%-----------------------------------------------------------------------
% Split Input (PDF) Transfer Directory
%-----------------------------------------------------------------------
% i_op_param( split_input_transfer_directory, _, _, _, `` ).

%-----------------------------------------------------------------------
% Original Transfer Directory
%-----------------------------------------------------------------------
% i_op_param( original_transfer_directory, _, _, _, `` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% TRANSFER FILE NAMES
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Output File Name
%-----------------------------------------------------------------------
% i_op_param( output_transfer_name( _ ), _, _, _, `` ). % Refers to the output file

%-----------------------------------------------------------------------
% Image (TIF) File Name
%-----------------------------------------------------------------------
% i_op_param( image_transfer_name( _ ), _, _, _, `` ). % Refers to the TIF image

%-----------------------------------------------------------------------
% Input (PDF) File Name
%-----------------------------------------------------------------------
% i_op_param( input_transfer_name( _ ), _, _, _, `` ). % Refers to the original file after it has been converted to PDF but before it has been split

%-----------------------------------------------------------------------
% Split Input (PDF) File Name
%-----------------------------------------------------------------------
% i_op_param( split_input_transfer_name( _ ), _, _, _, `` ). % Refers to the original file after it has been converted to PDF and after it has been split

%-----------------------------------------------------------------------
% Original File Name
%-----------------------------------------------------------------------
% i_op_param( original_transfer_name( _ ), _, _, _, `` ). % Refers to the original file before it has been converted to PDF

%-----------------------------------------------------------------------
% ZIP File Name
%-----------------------------------------------------------------------
% i_op_param( zip_transfer_name( _ ), _, _, _, `` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EMAIL SENDING
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% SMTP SETTINGS
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_config_param( smtp_server, `smtp.office365.com` ).
i_config_param( smtp_port, 587 ).
i_config_param( smtp_user_name, `noreply@cloud-trade.com` ).
i_config_param( smtp_password, decrypt(`hTmLYs2Idk7ZdCLzcazZPUjqck9x7itaIcJCw9TKy6k=`) ).
i_config_param( smtp_from, `noreply@cloud-trade.com` ).

i_config_param( smtp_timeout, 30 ).
i_config_param( smtp_use_64_bit_encoding_on_attachments, `true` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% EMAIL DECISION
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Test
%-----------------------------------------------------------------------
i_op_param( email_decision, _, _, _, email ):- i_test_indicator, not( i_junk_test ).

%-----------------------------------------------------------------------
% Live
%-----------------------------------------------------------------------
i_op_param( email_decision, _, _, _, do_not_email ):- i_success_test; i_junk_test.

%-----------------------------------------------------------------------
% Catch-all
%-----------------------------------------------------------------------
i_op_param( email_decision, _, _, _, email ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% EMAIL ADDRESS
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Test
%-----------------------------------------------------------------------
i_op_param( addr( _ ), From, _, _, From ):- i_test_indicator.

%-----------------------------------------------------------------------
% Test & Live
%-----------------------------------------------------------------------
i_op_param( addr( _ ), From, _, _, `supplyon@cloudtrade.zendesk.com` )
:-
    data( i_analyse_mapping_request, `true` )
.

i_op_param( addr( _ ), From, _, _, Addr )
:-
	data( i_analyse_return_to_sender, `true` ),

	(
		data( invoice, return_email, Email )

		->	Addr = Email

		;

		email_blacklist_check( From ) % in c_email_templates_new.pro

		->	Addr = `support@cloudtrade.zendesk.com`

		;

		Addr = From

	),

	!
.

i_op_param( addr( _ ), _, _, _, Email )
:-
	data( i_analyse_forward_to_address, `true` ),

	data( invoice, forward_email, Email ),

	!
.

%-----------------------------------------------------------------------
% Catch-all
%-----------------------------------------------------------------------
i_op_param( addr( _ ), _, _, _, `support@cloudtrade.zendesk.com` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% EMAIL SUBJECT
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Test & Live
%-----------------------------------------------------------------------
i_op_param( o_mail_subject, _, _, _, `Document Processed Successfully!` ):- i_success_test.

i_op_param( o_mail_subject, _, _, _, Subject )
:-
	(
		data( i_analyse_return_to_sender, `true` ),

		data( invoice, return_email_subject, Subject )

		;

		data( i_analyse_forward_to_address, `true` ),

		data( invoice, forward_email_subject, Subject )

	),

	!
.

%-----------------------------------------------------------------------
% Catch-all
%-----------------------------------------------------------------------
i_op_param( o_mail_subject, _, _, _, `Document NOT Processed` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% EMAIL BODY
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Test & Live
%-----------------------------------------------------------------------
i_op_param( o_mail, _, _, _, intervention_email_text ):- intervention_email_text_condition( _ ), !.

%-----------------------------------------------------------------------
% Catch-all
%-----------------------------------------------------------------------
i_op_param( o_mail, _, _, _, generic_o_mail ).
include_generic_o_mail( header_data ).
include_generic_o_mail( line_data ).
include_generic_o_mail( totals ).
include_generic_o_mail( vat_table ).
include_generic_o_mail( audit_log ).
include_generic_o_mail( error_log ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%///////////////////////////////////////////////////////////////////////
% EMAIL ATTACHMENTS
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Result (Output File)
%-----------------------------------------------------------------------
i_op_param( send_result( _ ), _, _, _, true ):- i_test_indicator.
i_op_param( send_result( _ ), _, _, _, false ).

%-----------------------------------------------------------------------
% Result (Output File) File Name
%-----------------------------------------------------------------------
i_op_param( send_result_name, _, _, _, Name ):- get_i_mail_expected_output_file( Name ).

%-----------------------------------------------------------------------
% PDF Image
%-----------------------------------------------------------------------
i_op_param( send_pdf_image( _ ), _, _, _, true ).

%-----------------------------------------------------------------------
% PDF Image File Name
%-----------------------------------------------------------------------
% i_op_param( send_pdf_image_name, _, _, _, `` ).

%-----------------------------------------------------------------------
% Original
%-----------------------------------------------------------------------
i_op_param( send_original( _ ), _, _, _, true ):- not( i_mail( pdf_image_file_name, _ ) ).
i_op_param( send_original( _ ), _, _, _, false ).

%-----------------------------------------------------------------------
% Original File Name
%-----------------------------------------------------------------------
% i_op_param( send_original_name, _, _, _, `` ).

%-----------------------------------------------------------------------
% Image
%-----------------------------------------------------------------------
i_op_param( send_image( _ ), _, _, _, false ).

%-----------------------------------------------------------------------
% Image File Name
%-----------------------------------------------------------------------
% i_op_param( send_image_name, _, _, _, `` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% REPORTING
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Report Name
%-----------------------------------------------------------------------
i_op_param( report, _, _, _, `Test` ):- i_test_indicator.
i_op_param( report, _, _, _, `SupplyOn` ):- i_success_test.
i_op_param( report, _, _, _, `Junk` ):- i_junk_test.


%-----------------------------------------------------------------------
% Report Header
%-----------------------------------------------------------------------
i_config_param( report_header, `Path,File,Date,Status,Reason,From,To,Subject,Attachments,Number,Document,Pages,Lines,Empty, Empty,Invoice,Order,Total` ).

%-----------------------------------------------------------------------
% Report Address(es)
%-----------------------------------------------------------------------
i_op_param( report_addr, _, _, _, `reports@cloud-trade.net` ).

%-----------------------------------------------------------------------
% I Bespoke Report Data
%-----------------------------------------------------------------------
% i_bespoke_report_data( [ ] ).

%-----------------------------------------------------------------------
% Report Time
%-----------------------------------------------------------------------
i_config_param( report_time, 6 ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% IMAGE GENERATION
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% PDF Image Generation
%-----------------------------------------------------------------------
i_op_param( pdf_image_resolution, _, _, _, `250` ).

%-----------------------------------------------------------------------
% TIF Image Generation
%-----------------------------------------------------------------------
i_op_param( tif_image_format, _, _, _, `56` ).
i_op_param( tif_image_resolution, _, _, _, `300` ).

tif_image_format_code( jpg, `10` ).
tif_image_format_code( png, `20` ).
tif_image_format_code( png_grayscale, `21` ).
tif_image_format_code( tiff_grayscale, `30` ).
tif_image_format_code( tiff_12bit_color, `31` ).
tif_image_format_code( tiff_24bit_color, `32` ).
tif_image_format_code( tiff_g3_fax_wout_eols, `33` ).
tif_image_format_code( bmp_8bit_color, `40` ).
tif_image_format_code( bmp_24bitcolor, `41` ).
tif_image_format_code( tiff_g3_fax_with_eols, `54` ).
tif_image_format_code( tiff_g3_2d, `55` ).
tif_image_format_code( tiff_g4, `56` ).
tif_image_format_code( tiff_lzw, `57` ).
tif_image_format_code( tiff_packbits, `58` ).

i_op_param( tif_rescan_format, _, _, _, F ) :- tif_image_rescan_format_code( ccittfax3, F ).

tif_image_rescan_format_code( none, `1` ).
tif_image_rescan_format_code( ccittrle, `2` ).
tif_image_rescan_format_code( ccittfax3, `3` ).
tif_image_rescan_format_code( ccitt_t4, `3` ).
tif_image_rescan_format_code( ccittfax4, `4` ).
tif_image_rescan_format_code( ccitt_t6, `4` ).
tif_image_rescan_format_code( lzw, `5` ).
tif_image_rescan_format_code( ojpeg, `6` ).
tif_image_rescan_format_code( jpeg, `7` ).
tif_image_rescan_format_code( adobe_deflate, `8` ).
tif_image_rescan_format_code( next, `32766` ).
tif_image_rescan_format_code( ccittrlew, `32771` ).
tif_image_rescan_format_code( packbits, `32773` ).
tif_image_rescan_format_code( thunderscan, `32809` ).
tif_image_rescan_format_code( it8ctpad, `32895` ).
tif_image_rescan_format_code( it8lw, `32896` ).
tif_image_rescan_format_code( it8mp, `32897` ).
tif_image_rescan_format_code( it8bl, `32898` ).
tif_image_rescan_format_code( pixarfilm, `32908` ).
tif_image_rescan_format_code( pixarlog, `32909` ).
tif_image_rescan_format_code( deflate, `32946` ).
tif_image_rescan_format_code( dcs, `32947` ).
tif_image_rescan_format_code( jbig, `34661` ).
tif_image_rescan_format_code( sgilog, `34676` ).
tif_image_rescan_format_code( sgilog24, `34677` ).
tif_image_rescan_format_code( jp2000, `34712` ).


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
% Portal Authentication
%-----------------------------------------------------------------------
i_config_param(azure_auth_aadInstance, `https://login.microsoftonline.com/{0}`).
i_config_param(azure_auth_tenant, `cloud-trade.com`).
i_config_param(azure_auth_clientId, `26237ca3-c7dc-4459-b8db-44c86574f2ae`).
i_config_param(azure_auth_todoListResourceId, `https://cloud-trade.com/ReporterClient`).
i_config_param(azure_certificate_name, `CN=APIEncryption`).

%-----------------------------------------------------------------------
% Rabbit Config
%-----------------------------------------------------------------------
i_config_param( rabbit_host, `mq.cloud-trade.com` ).
i_config_param( rabbit_username, `ct_logger` ).
i_config_param( rabbit_password, `RSXv=3@G5^#VaSLj` ).
i_config_param( rabbit_vhost, `logger` ).
i_config_param( rabbit_port, 5672 ).
i_config_param( rabbit_output_exchange, `gramatica.output` ).
i_config_param( rabbit_input_exchange, `gramatica.input` ).

%-----------------------------------------------------------------------
% Application Insights
%-----------------------------------------------------------------------
i_config_param( application_insights_app_id, decrypt( `WZn5RcR8TN9nZD6vruYYtvaAC/lPV8XssA3mrDHlOfjX+nmHRi2H7Twqg2TgHQ9+x7tdYI25JrTvJjXLA9+lLyhkJxtQyMxiuUE75XNnh0I=` ) ).
i_config_param( application_insights_api_key, decrypt( `PDQA7PbAY+BvQsQwbuAkhAXmS9rrWnlbbJVTrcnQWC+Oo5joiqHGnrdqsA3Pl/pRXm6hi4KpELDuw4ZRWHUBQvplxYakuYBzQsZV4GErhR5FiTEfzOsEll/hmueWqg/G` ) ).

%-----------------------------------------------------------------------
% Gramalgamator, Gramonitor & Gratabase Addresses (Live Portal)
%-----------------------------------------------------------------------
i_config_param( azure_gramalgamator_url, `https://supplyon-reporter.cloud-trade.com` ):- instance( Ins ), not( q_sys_sub_string( Ins, _, _, `Test` ) ).
i_config_param( azure_gramalgamator_url, `https://ct-reporter.azurewebsites.net` ):- instance( Ins ), q_sys_sub_string( Ins, _, _, `Test` ).

%-----------------------------------------------------------------------
% Remote Enquiry Address
%-----------------------------------------------------------------------
i_op_param( remote_enquiry_return_address, _, To, _, `supplyon.intervention@cloud-trade.com` ).

%-----------------------------------------------------------------------
% Azure Blob Storage
%-----------------------------------------------------------------------
i_config_param( azure_container, `docs` ).
i_config_param( azure_stored_access_policy, `docs-15D3193281D` ):- instance( Ins ), q_sys_sub_string( Ins, _, _, `Test` ).
i_config_param( blob_storage_connection_string, decrypt( `2pCjh/pJUzrAIjUOske7cmOmE5QAjC9zyg107trPXkWxYHQTz6s5t3bM0LEmMckLeoFw18b3uw5H4N/cvzqoZYIechb54Ly+HjJJoWic8TFgiV4xWJa/YDKsZ7AVKTV9TCsyPY0FKESr2MF02446huXdDLpn1AMeOM4AwJY3gkKTSHAGOj6KjUlcjEnHOMVsVg+oOsN4nV0zbfnrFY73tTyJxaNrZAlnAv1nVW5/jtP8IsF7YBJaY5DuYuI+ZypWaY0LbqnG2E79M1T57oX6fz4zTnujpLmFw6Va9+ntmMlFtLlLVHi4ZSo8m8pIlbXEGnUgjNpIzN4ZE/PdnrBp7a8wSUudOHsVYzSmYglsfFt8oMQ4s659NScM9VLgdgW/vGsPVjrdu1Ip6tfvQkNm43YbWkuQXmBMgi+0Ca0NeqIIw52cIn4pmJPsccl/QvxgA3onAwKvaJeUAwP1dI04uRjQCXRbnVWRqm0+CeJqDnERyU1Uxu7gGtnXQiJ4lMXO` ) ):- instance( Ins ), q_sys_sub_string( Ins, _, _, `Test` ).
%-----------------------------------------------------------------------
% Azure Blob Storage
%-----------------------------------------------------------------------
i_config_param( azure_container, `docs` ).
i_config_param( azure_stored_access_policy, `SupplyOn_Docs` ).
i_config_param( azure_expiry_months, 12 ).   % this isn't used for document storage in blobs which should be defined by an azure stored access policy
i_config_param( blob_storage_connection_string, decrypt( `2pCjh/pJUzrAIjUOske7cmOmE5QAjC9zyg107trPXkWxYHQTz6s5t3bM0LEmMckLeoFw18b3uw5H4N/cvzqoZYIechb54Ly+HjJJoWic8TGUEz9cN+YLEGT0u7z297yRcBimUQ1kDLUO5bp46ccJISZwZ+Oc0HANIxtZhU+8BZ9LjplMrAd4JPpdgxgOOT8nLI2ykADqLCNjrzLe6Q/ZtiRhIvto32jC4RVD2r+TbhsWCv0EBGNu3gKpsclsg2xVEumiZlSZ5XXGh7gucertX8sORnei4ZQ5hWvuZG3L3tyxlONJwbgoFDQaqt7XMq/GZcfLodCgSFMyXY3KI9b82wyMWdVblpD8XJBAIwHpShQi9UBRtYnhEhb+yn2qk5w4VlBglYOUvWG06FYwEkHSbcxTzIjQ0tuLZMqUByQNbvy2seahnhqL1jkEpXknHH+BZ0I+xFeu/jpfUB2JsRUMEGo6mHRFsOT1MsU/mnhQPrxJv9Vk92pT6qoOI+KDxaKSFTIEUdgaqyjdvcSqNcE56w==` ) ).

%-----------------------------------------------------------------------
% Upload Original File To Portal
%-----------------------------------------------------------------------
i_op_param( upload_original_file_to_portal, _, _, _, `true` ):- i_mail( attachment, Att ), string_to_lower( Att, AttL ), ( q_sys_string_ends( AttL, `.xml` ); q_sys_string_ends( AttL, `.blank` ) ).

%-----------------------------------------------------------------------
% Amazon Expiry Months (Number of Months to Keep Data In Portal)
%-----------------------------------------------------------------------
i_config_param( amazon_expiry_months, 12 ).

%-----------------------------------------------------------------------
% Channel Partner
%-----------------------------------------------------------------------
i_op_param( channel_partner, _, _, _, `SupplyOn` ).

%-----------------------------------------------------------------------
% Customer (Organisation)
%-----------------------------------------------------------------------
i_op_param( customer, _, _, _, Customer ):- customer_lookup( Customer ).

%-----------------------------------------------------------------------
% Receiver
%-----------------------------------------------------------------------
i_op_param( receiving_organisation, _, _, _, Rec_Org ):- receiving_org_lookup( Rec_Org ).

%-----------------------------------------------------------------------
% Sender
%-----------------------------------------------------------------------
i_op_param( sending_organisation, _, _, _, `Unrecognised` ).

i_analyse_invoice_fields_first:- i_check_sending_org.

i_check_sending_org
:-
	not( result( _, invoice, sending_organisation, Sending ) ),

	(
		result( _, invoice, sender_name, Sender )

		;

		Sender = `Unrecognised`

	)

	-> assertz_derived_data( invoice, sending_organisation, Sender, inserted_sending_org ),
	!
.

%-----------------------------------------------------------------------
% Testing
%-----------------------------------------------------------------------
i_op_param( testing, _, _, _, `True` ):- i_test_indicator.

%-----------------------------------------------------------------------
% Billing Group
%-----------------------------------------------------------------------
i_op_param( billing_group, _, _, _, Billing_Group ) % MUST NOT contain more than one dash '-'
:-
	rules_result( Result, _, _ ),

	(


        qq_op_param( testing, _ )
        ->  `Not Billable`

        ;   Result \= defect
		->	Billable = `Billable`

		;

		Result = defect
		->	Billable = `Not Billable`

	),

    customer_lookup( Customer ),

	strcat_list( [ Customer, ` - `, Billable ], Billing_Group ),

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
% I Test Indicator
%-----------------------------------------------------------------------
i_test_indicator:- i_mail( to, To ), i_test_address( To ).
i_test_indicator:- instance( Ins ), i_test_address( Ins ). % i_test_address just checks for test in the string

%-----------------------------------------------------------------------
% I Test Address
%-----------------------------------------------------------------------
i_test_address( To ):- string_to_lower( To, To_l ), q_sys_sub_string( To_l, _, _, `test` ).

%-----------------------------------------------------------------------
% I Junk Test
%-----------------------------------------------------------------------
i_junk_test
:-
	qq_op_param( supplier, `junk` )
	;
	chained_to( `junk` )
	;
	rules_result( defect, i_analyse_junk_flag, _ )
	;
	grammar_set( i_analyse_junk_flag )
	;
	data( i_analyse_junk_flag, `true` )
	;
	rules_result( defect, i_analyse_supporting_document, _ )
	;
	grammar_set( i_analyse_supporting_document )
	;
	rules_result( defect, Reason, _ ),
	document_reason_lookup( Scenario, _, Reason, _, _ ),
	(
		document_scenario( Scenario, _, _, `Delete`, _, _, _, _, _, _, _, _ )
		;
		document_scenario_dropdown( Scenario, `Delete`, _, _ )
	)
.

%-----------------------------------------------------------------------
% I Success Test
%-----------------------------------------------------------------------
i_success_test
:-
	rules_result( success, _, _ )
	;
	grammar_set( i_analyse_flag_as_fail_and_post )
	;
	data( i_analyse_flag_as_fail_and_post, `true` )
.
