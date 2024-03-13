Vim�UnDo� �qb+V�?��7�K 4p�)�t�^{���ӱ�   +   C        FrontendObjects Tokenizer(FrontendObjects frontend_object);   #   1                       e<�0    _�                     $       ����                                                                                                                                                                                                                                                                                                                                                             e<�&     �   #   %   ,      /		void Parser(FrontendObjects frontend_object);5��    #                     �                     �    #                     �                     5�_�                    #   1    ����                                                                                                                                                                                                                                                                                                                                                             e<�,    �   "   $   ,      C        FrontendObjects Tokenizer(FrontendObjects frontend_object);5��    "   1                  �                     �    "   3                  �                     5�_�                     #   2    ����                                                                                                                                                                                                                                                                                                                                                             e<�/    �         ,      #include <memory>   #include <string>   #include <unordered_map>   #include <cstdlib>       #include "antlr4-runtime.h"   #include "TigerParser.h"   #include "TigerLexer.h"       ##include "frontend/ErrorListener.h"   )#include "frontend/SymbolTableListener.h"    #include "utils/CompilerError.h"   #include "utils/TigerUtils.h"�         ,      struct FrontendObjects {   #	std::unique_ptr<TigerLexer> lexer;�         ,      (    std::unique_ptr<TigerParser> parser;   1	std::unique_ptr<antlr4::ANTLRInputStream> input;�         ,      1	std::unique_ptr<antlr4::ANTLRInputStream> input;   3	std::unique_ptr<antlr4::CommonTokenStream> tokens;�         ,      class Frontend {       public:�         ,          public:   .        Frontend(TigerUtils::CommandLineArgs);�         ,      .        Frontend(TigerUtils::CommandLineArgs);           ~Frontend();�          ,              ~Frontend();           void Execute();�      "   ,              void Execute();           private:�       #   ,          private:   		// Methods�   !   $   ,      		// Methods   E        FrontendObjects Tokenizer(FrontendObjects&& frontend_object);�   "   %   ,      E        FrontendObjects Tokenizer(FrontendObjects&& frontend_object);   1		void Parser(FrontendObjects&& frontend_object);�   #   '   ,      1		void Parser(FrontendObjects&& frontend_object);       		// Attributes�   %   (   ,      		// Attributes   0        TigerUtils::CommandLineArgs parsed_args;�   &   *   ,      0        TigerUtils::CommandLineArgs parsed_args;       ,        // Extended listener to catch errors�   (   +   ,      ,        // Extended listener to catch errors   >        std::unique_ptr<ExtendedErrorListener> error_listener;�   )   ,   ,      >        std::unique_ptr<ExtendedErrorListener> error_listener;   ;        TigerUtils::CompilerErrorCollector semantic_errors;5��    )   >               �      	              �    (   ,               q      	              �    &   0               C      
              �    %                        	              �    #   1                                   �    "   E               �                    �    !                  �      	              �                       |                    �                      n                    �                      V      	              �       .               A      	              �                            	              �                                          �       1               �                    �       (               �                    �                      S                    �                              +      *      5��