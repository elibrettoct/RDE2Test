%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GRAMATICA
% CONFIGURATION FILE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

i_version( c_trax_posting_settings, `01/08/2019 11:41:56` ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
% TRAX
%///////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
% Enable Trax Process
%-----------------------------------------------------------------------
i_config_param( trax, `enabled` ).

%-----------------------------------------------------------------------
% Trax Posting Script
%-----------------------------------------------------------------------
i_op_param( final_script_file_name, _, _, _, Script ):- bespoke_transfer_settings( `Trax Posting Script`, Script_Raw, Scenario_Dependency ), Script_Raw \= ``, create_string_from_template( Script_Raw, Script ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Posting Script
%-----------------------------------------------------------------------
i_op_param( final_script_function_name, _, _, _, `trax_post` ):- bespoke_transfer_settings( `Trax Posting Script`, Script_Raw, Scenario_Dependency ), Script_Raw \= ``, create_string_from_template( Script_Raw, Script ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Owner Key
%-----------------------------------------------------------------------
i_op_param( trax_owner_key, _, _, _, Key ):- bespoke_transfer_settings( `Trax Owner Key`, Key_Raw, Scenario_Dependency ), Key_Raw \= ``, create_string_from_template( Key_Raw, Key ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Vendor Batch Key
%-----------------------------------------------------------------------
i_op_param( trax_vend_bat_key, _, _, _, Key ):- bespoke_transfer_settings( `Trax Vendor Batch Key`, Key_Raw, Scenario_Dependency ), Key_Raw \= ``, create_string_from_template( Key_Raw, Key ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Transfer Directory
%-----------------------------------------------------------------------
i_op_param( trax_transfer_directory, _, _, _, Directory ):- bespoke_transfer_settings( `Trax Transfer Directory`, Directory_Raw, Scenario_Dependency ), Directory_Raw \= ``, create_string_from_template( Directory_Raw, Directory ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Page Image Resolution
%-----------------------------------------------------------------------
i_op_param( trax_page_image_resolution, _, _, _, Resolution ):- bespoke_transfer_settings( `Trax Page Image Resolution`, Resolution_Raw, Scenario_Dependency ), Resolution_Raw \= ``, create_string_from_template( Resolution_Raw, Resolution ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Thumbnail Width
%-----------------------------------------------------------------------
i_op_param( trax_thumbnail_width, _, _, _, Width ):- bespoke_transfer_settings( `Trax Thumbnail Width`, Width_Raw, Scenario_Dependency ), Width_Raw \= ``, create_string_from_template( Width_Raw, Width ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax Thumbnail Height
%-----------------------------------------------------------------------
i_op_param( trax_thumbnail_height, _, _, _, Height ):- bespoke_transfer_settings( `Trax Thumbnail Height`, Height_Raw, Scenario_Dependency ), Height_Raw \= ``, create_string_from_template( Height_Raw, Height ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax TIF Image Format
%-----------------------------------------------------------------------
i_op_param( tif_image_format, _, _, _, Format ):- bespoke_transfer_settings( `Trax TIF Image Format`, Format_Raw, Scenario_Dependency ), Format_Raw \= ``, create_string_from_template( Format_Raw, Format ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax TIF Image Resolution
%-----------------------------------------------------------------------
i_op_param( tif_image_resolution, _, _, _, Resolution ):- bespoke_transfer_settings( `Trax TIF Image Resolution`, Resolution_Raw, Scenario_Dependency ), Resolution_Raw \= ``, create_string_from_template( Resolution_Raw, Resolution ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax SFTP Server/Host
%-----------------------------------------------------------------------
i_op_param( trax_sftp_server, _, _, _, Host ):- bespoke_transfer_settings( `Trax SFTP Server/Host`, Host_Raw, Scenario_Dependency ), Host_Raw \= ``, create_string_from_template( Host_Raw, Host ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax SFTP Port
%-----------------------------------------------------------------------
i_op_param( trax_sftp_port, _, _, _, Port ):- bespoke_transfer_settings( `Trax SFTP Port`, Port_Raw, Scenario_Dependency ), Port_Raw \= ``, create_string_from_template( Port_Raw, Port ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax SFTP Username
%-----------------------------------------------------------------------
i_op_param( trax_sftp_username, _, _, _, Usernname ):- bespoke_transfer_settings( `Trax SFTP Username`, Usernname_Raw, Scenario_Dependency ), Usernname_Raw \= ``, create_string_from_template( Usernname_Raw, Usernname ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax SFTP Password (encrypted)
%-----------------------------------------------------------------------
i_op_param( trax_sftp_password, _, _, _, decrypt( Password ) ):- bespoke_transfer_settings( `Trax SFTP Password (encrypted)`, Password_Raw, Scenario_Dependency ), Password_Raw \= ``, create_string_from_template( Password_Raw, Password ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax SFTP Fingerprint
%-----------------------------------------------------------------------
i_op_param( trax_sftp_fingerprint, _, _, _, Fingerprint ):- bespoke_transfer_settings( `Trax SFTP Fingerprint`, Fingerprint_Raw, Scenario_Dependency ), Fingerprint_Raw \= ``, create_string_from_template( Fingerprint_Raw, Fingerprint ), sys_call( Scenario_Dependency ).

%-----------------------------------------------------------------------
% Trax SFTP Target Directory
%-----------------------------------------------------------------------
i_op_param( trax_sftp_target_directory, _, _, _, Directory ):- bespoke_transfer_settings( `Trax SFTP Target Directory`, Directory_Raw, Scenario_Dependency ), Directory_Raw \= ``, create_string_from_template( Directory_Raw, Directory ), sys_call( Scenario_Dependency ).
