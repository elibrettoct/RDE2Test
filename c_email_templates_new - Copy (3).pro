%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRAMATICA
% CONFIGURATION FILE - C_EMAIL_TEMPLATES_NEW
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_version( c_email_templates_new, `29/07/2019 10:05:21` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Updated for Gramatica v.6.2.0.0. Added loads of line breaks (<br>).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Contents (alphabetical):
%
%	- reject_body_text
%	- forward_body_text
%
%	- reject_credit_note_text
%	- forward_credit_note_text
%
%	- reject_duplicate_invoice_text
%	- forward_duplicate_invoice_text
%
%	- reject_future_dated_text
%	- forward_future_dated_text
%
%	- reject_inconsistent_quantity_unit_and_net_amount_text
%	- forward_inconsistent_quantity_unit_and_net_amount_text
%
%	- reject_inconsistent_totals_text
%	- forward_inconsistent_totals_text
%
%	- reject_missing_date_text
%	- forward_missing_date_text
%
%	- reject_missing_invoice_no_text
%	- forward_missing_invoice_no_text
%
%	- reject_missing_totals_text
%	- forward_missing_totals_text
%
%	- reject_negative_totals_text
%	- forward_negative_totals_text
%
%	- reject_new_format_text
%	- forward_new_format_text
%
%	- reject_not_on_project_text
%	- forward_not_on_project_text
%
%	- reject_positive_and_negative_lines_text
%	- forward_positive_and_negative_lines_text
%
%	- reject_statement_correspondence_text
%	- forward_statement_correspondence_text
%
%	- reject_total_discrepancy_text
%	- forward_total_discrepancy_text
%
%	- reject_unsupported_format_text
%	- forward_unsupported_format_text
%
%	- reject_vat_without_vat_number_text
%	- forward_vat_without_vat_number_text
%
%	- reject_zero_value_invoice_text
%	- forward_zero_value_invoice_text
%
%	- reject_zero_value_line_text
%	- forward_zero_value_line_text
%
%	- email_blacklist_check
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% BODY
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_body_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it is the body of an email that was sent with no attachments.<br>
<br>
Please can you ensure that any emails you submit contain attachments.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_body_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it is the body of an email that was sent with no attachments.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% CREDIT NOTE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_credit_note_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it is a credit note.<br>
<br>
Please can you you ensure that you only send invoices to the invoicing email address. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_credit_note_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it is a credit note.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DUPLICATE INVOICE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_duplicate_invoice_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it is a duplicate of an invoice that has previously been received.<br>
<br>
Please can you ensure that you only submit invoices once. If you have any queries about payment, please contact your customer directly.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_duplicate_invoice_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it is a duplicate of an invoice that has previously been received.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NOT ON PROJECT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_not_on_project_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately this document cannot be processed because the supplier it relates to has not been signed up to the e-invoicing project.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_not_on_project_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because the supplier it relates to has not been signed up to the e-invoicing project.<br>
<br>
If you wish for this document to be set up and processed, please can you send over the supplier details to your e-invoicing project manager, so that they can be added to the project.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% UNSUPPORTED FORMAT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_unsupported_format_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately this document cannot be processed because it has been sent in a format which is not supported by the system.<br>
<br>
This usually means that it is an image. If it has been printed off and scanned, then the document is an image and the text cannot be read.<br>
<br>
If there are parts of the text that cannot be highlighted, then these cannot be read either.<br>
<br>
If you can highlight all of the text, then the document has been rejected because the text cannot be read for some other reason. This is usually the result of the PDF being protected or containing an embedded font.<br>
<br>
The system is also unable to process password protected invoices.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_unsupported_format_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it has been sent in a format which is not supported by the system.<br>
<br>
This usually means that it is an image. If it has been printed off and scanned, then the document is an image and the text cannot be read.<br>
<br>
If there are parts of the text that cannot be highlighted, then these cannot be read either.<br>
<br>
If you can highlight all of the text, then the document has been rejected because the text cannot be read for some other reason. This is usually the result of the PDF being protected or containing an embedded font.<br>
<br>
The system is also unable to process password protected invoices.<br>
<br>
As the documet has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NEW FORMAT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_new_format_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it has a different layout to any that have been previously configured for the supplier it relates to.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_new_format_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it has a different layout to any that have been previously configured for the supplier it relates to.<br>
<br>
If you wish for this new layout to be configured so that the invoice can be processed, please can you let your e-invoicing project manager know.<br>
<br>
New layout configurations are treated as new supplier configurations.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% STATEMENT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_statement_correspondence_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it is a statement or some other correspondence.<br>
<br>
Please can you ensure that you only submit invoices and credit notes for processing.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_statement_correspondence_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it is a statement or some other correspondence.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% VAT WITHOUT VAT NUMBER
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_vat_without_vat_number_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it quotes VAT but does not contain a VAT number.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_vat_without_vat_number_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it quotes VAT but does not contain a VAT number.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NEGATIVE TOTALS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_negative_totals_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately this document cannot be processed because it contains negative totals but does not appear to be a credit note.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_negative_totals_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it contains negative totals but does not appear to be a credit note.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MISSING INVOICE NUMBER
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_missing_invoice_no_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it has an invalid or missing invoice number.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_missing_invoice_no_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it has an invalid or missing invoice number.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MISSING INVOICE DATE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_missing_date_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it has an invalid or missing invoice date.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_missing_date_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it has an invalid or missing invoice date.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUTURE DATED
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_future_dated_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because the invoice date is in the future.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_future_dated_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because the invoice date is in the future.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% REJECT POSITIVE AND NEGATIVE LINES
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_positive_and_negative_lines_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it contains both positve and negative lines.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_positive_and_negative_lines_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it contains both positve and negative lines.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% REJECT INCONSISTENT QUANTITY UNIT AND NET AMOUNT
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_inconsistent_quantity_unit_and_net_amount_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it contains a line where the quantity, unit and net amounts are inconsistent (Quantity x Unit Amount \= Net Amount).<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_inconsistent_quantity_unit_and_net_amount_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it contains a line where the quantity, unit and net amounts are inconsistent (Quantity x Unit Amount \= Net Amount).<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% REJECT MISSING TOTALS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_missing_totals_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it does not contain document totals. Please note that documents must state the total net, tax and gross amounts.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_missing_totals_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because it does not contain document totals. Documents must state the total net, tax and gross amounts.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% INCONSISTENT TOTALS (TOTALS DO NOT ADD UP)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_inconsistent_totals_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because the sum of the total net amount and total VAT amount is not equal to the total gross amount.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_inconsistent_totals_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not been processed because the sum of the total net amount and total VAT amount is not equal to the total gross amount.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TOTAL DISCREPANCY (SUM OF LINES NOT EQUAL TO TOTAL(S))
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_total_discrepancy_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because the sum of the line net amounts does not equal the total net amount and/or the sum of the line total amounts does not equal the total gross amount.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_total_discrepancy_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
The attached document has not processed because the sum of the line net amounts does not equal the total net amount and/or the sum of the line total amounts does not equal the total gross amount.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ZERO VALUE INVOICE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_zero_value_invoice_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it is a zero-value invoice.<br>
<br>
Please can you ensure that you only submit invoices with a non-zero total value. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_zero_value_invoice_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it is a zero-value invoice.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ZERO VALUE LINE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
reject_zero_value_line_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
Unfortunately the attached document cannot be processed because it contains a zero-value line.<br>
<br>
Please can you amend and resubmit. If you have any queries, please email your customer contact.<br>
<br>
Thank you<br>
<br>
<br>
<br>
THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT RESPOND`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `. Documents submitted to this address are processed by an automated system which extracts data from the text contained within the document.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
forward_zero_value_line_text
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	i_mail( to, To ),
	i_mail( from, From ),
	i_mail( received_date, Date ),
	q_sys_sub_string( Date, 4, 2, Day ),
	q_sys_sub_string( Date, 1, 2, Month_no ),
	month_lookup( Month_no, Month ),
	q_sys_sub_string( Date, 7, 4, Year ),
	q_sys_sub_string( Date, 12, 5, Time ),
	Remaining_text = `<br>
<br>
This document has not been processed because it contains a zero-value line.<br>
<br>
As it has not been processed, it will need to be dealt with manually.<br>
<br>
Kindest regards,<br>
<br>`,
	strcat_list( [ `The attached document was submitted to `, To, ` by `, From, ` at `, Time, ` (GMT) on `, Day, ` `, Month, ` `, Year, `.`, Remaining_text ], Text ),
	writeln_proc_file_predicate( o_mail( text, Text ) )
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% EMAIL BLACKLIST CHECK
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
email_blacklist_check( From )
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
:-
	string_to_lower( From, FromL ),
	not( whitelisted_emails( FromL ) ),
	trace( `Not whitelisted` ),
	noreply_blacklist( NoRep ),
	(
		q_sys_is_string( NoRep ),
		q_sys_sub_string( FromL, _, _, NoRep )
		
		;
		
		q_sys_is_list( NoRep ),
		sub_string_all_components( FromL, NoRep )
	
	),
	trace( `Email blacklisted` ),
	!
.

sub_string_all_components( From, [ ] ).
sub_string_all_components( From, [ H | T ] )
:-
	q_sys_sub_string( From, _, _, H ),
	sub_string_all_components( From, T )
.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NO REPLY BLACKLIST
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
noreply_blacklist( [ `reply`, `no` ] ).
noreply_blacklist( `billing` ).
noreply_blacklist( `invoic` ).
noreply_blacklist( `service` ).
noreply_blacklist( `batch` ).
noreply_blacklist( `system` ).
noreply_blacklist( `processed.by.mitie@cloud-trade.com` ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WHITELISTED EMAILS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
whitelisted_emails( From ):- q_sys_sub_string( From, _, _, `@premiersiteservices.co.uk` ).
whitelisted_emails( From ):- q_sys_sub_string( From, _, _, `@commercialservices.org.uk` ).
whitelisted_emails( From ):- q_sys_sub_string( From, _, _, `@churchillservices.com` ).
whitelisted_emails( From ):- q_sys_sub_string( From, _, _, `@cardiac-services.com` ).
whitelisted_emails( From ):- q_sys_sub_string( From, _, _, `@arcticservice.co.uk` ).

whitelisted_emails( `alltypefencing.rcservices@yahoo.co.uk` ).
whitelisted_emails( `billing.cmrs.uk@smcnet-sharedservices.com` ).
whitelisted_emails( `corporatecollectionservices@ealing.gov.uk` ).
whitelisted_emails( `councilinvoice@eurohotelsgroup.co.uk` ).
whitelisted_emails( `customerservices@scichem.com` ).
whitelisted_emails( `ebilling@travisperkins.co.uk` ).
whitelisted_emails( `invoice@crestaworldtravel.co.uk` ).
whitelisted_emails( `rob@specialistdogservices.co.uk` ).
whitelisted_emails( `servicedesk@ngagerecruitment.com` ).
whitelisted_emails( `slinvoicedistribution@ifs.inchcape.co.uk` ).
whitelisted_emails( `uk_b2b_invoice@euro.apple.com` ).
whitelisted_emails( `info@limbtolimbtreeservices.co.uk` ).
whitelisted_emails( `admin@jcmaintenanceservices.co.uk` ).
whitelisted_emails( `councilinvoice@lhg.co.uk` ).
whitelisted_emails( `customer.services@fullers.co.uk` ).
whitelisted_emails( `apinvoices2@smartlinkllc.com` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MONTH LOOKUP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
month_lookup( `01`, `January` ).
month_lookup( `02`, `February` ).
month_lookup( `03`, `March` ).
month_lookup( `04`, `April` ).
month_lookup( `05`, `May` ).
month_lookup( `06`, `June` ).
month_lookup( `07`, `July` ).
month_lookup( `08`, `August` ).
month_lookup( `09`, `September` ).
month_lookup( `10`, `October` ).
month_lookup( `11`, `November` ).
month_lookup( `12`, `December` ).
