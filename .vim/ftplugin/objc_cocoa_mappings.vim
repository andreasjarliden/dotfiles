" File: objc_cocoa_mappings.vim
" Author: Michael Sanders (msanders42 [at] gmail [dot] com)
" Description: Sets up mappings for cocoa.vim.
" Last Updated: December 26, 2009

if exists('b:cocoa_proj') || &cp || version < 700
	finish
endif

com! -buffer ListMethods call objc#method_list#Activate(1)
com! -buffer -nargs=? -complete=customlist,objc#method_builder#Completion BuildMethods call objc#method_builder#Build('<args>')
com! -buffer -nargs=? -complete=custom,objc#man#Completion CocoaDoc call objc#man#ShowDoc('<args>')


