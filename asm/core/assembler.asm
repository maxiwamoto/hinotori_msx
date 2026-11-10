; tniasm10 compatibility macros
; tniasm10's compatibility IM macros match literal tokens, so hex aliases emit
; the exact Z80 ED 46 / ED 56 / ED 5E interrupt-mode opcodes.
%macro IM 00h\%def16 46EDh\ %endmacro
%macro IM 01h\%def16 56EDh\ %endmacro
%macro IM 02h\%def16 5EEDh\ %endmacro
