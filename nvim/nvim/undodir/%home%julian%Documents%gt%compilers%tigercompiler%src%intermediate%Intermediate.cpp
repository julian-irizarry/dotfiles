Vim�UnDo� B��v�/MEj�d3���4�S�ZZ�S�\�g               1      1       1   1   1    eCw�   I _�                             ����                                                                                                                                                                                                                                                                                                                                                             eC>�    �                        // TODO5��                                               5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                             eC>�    �               5        TigerUtils::SaveCFGToGraph(parsed_args.file);5��       3                  �                     �       7                  �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             eCD�     �                5��                          �                     �                         �                     �                         �                     �                     	   �             	       �       
                  �                     �       	                  �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                        �                    �                                              �                     	                 	       �                        	                     �                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCE     �               	for 5��                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCE     �               	for ()5��                                              �       !                  +                     5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             eCE     �               "	for (const auto& container : ir) 5��       "                  ,                     5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             eCE     �               #	for (const auto& container : ir) {�                	}�               $	for (const auto& container : ir) {}5��       #                 -                     �       #                 -                     �                      	   .             	       5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             eCE�     �                	}5��                        9                    �                        9                    �                         :                     �                         9                     5�_�      
           	      	    ����                                                                                                                                                                                                                                                                                                                                                             eCGw     �                			CFG cfg5��       	                  7                     5�_�   	              
      
    ����                                                                                                                                                                                                                                                                                                                                                             eCGw     �                		CFG cfg{}5��       	                  7                     �       	                  7                     5�_�   
                    	    ����                                                                                                                                                                                                                                                                                                                                                             eCGx     �                			CFG cfg5��       	                  7                     5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             eCGy     �                		CFG cfg()5��       
                  8                     �       
                  8                     �       	                  7                     �       	                  7                     5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             eCG{     �                			CFG cfg5��       	                  7                     5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                             eCG{     �                		CFG cfg{}5��       
                  8                     �       
              	   8             	       �       
       	          8      	              �       
              	   8             	       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�    �                		CFG cfg{container}5��                         B                     �                         D                     �                         C                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�     �                		CFG cfg{container};5��                        C                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�     �         !      		5��                         F                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�     �         !      		{}5��                         G                     �                         G                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�   
 �         !      		{}5��                         F                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�    �                �Intermediate::Intermediate(TigerUtils::CommandLineArgs parsed_args, TigerParser* parser, antlr4::tree::ParseTreeWalker* walker, TigerParser::TigerProgramContext* tree)�      
   !      void Intermediate::Execute() {       #    IRListener ir_listener{parser};�         !      ;    std::vector<IRContainer> ir = ir_listener.ir_container;   	std::vector<CFG> cfgs;�         !      	std::vector<CFG> cfgs;   #	for (const auto& container : ir) {�         !      #	for (const auto& container : ir) {   		CFG cfg{container};�         !      		CFG cfg{container};   		}�         !      		}   	       if (parsed_args.save_ir) {5��                      G                    �                      C                    �       #               -             	       �                      	                    �       ;               �                    �                      `                    �       X                �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�    �         "      		cfgs.push_back�         !              CFG cfg{container};5��                        i                     �                         l                     �                         r                     �                     	   q             	       �              	          q      	              �                                              �                         ~                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCG�    �         "      		cfgs.push_back(cfg)5��                                              �                         �                     �                         �                     5�_�                       7    ����                                                                                                                                                                                                                                                                                                                                                             eCG�    �         "      9        TigerUtils::SaveCFGToGraph(parsed_args.file, ir);5��       6                  [                     �       5                 Z                    �       :                  _                     �       9                  ^                     5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             eCQ�     �         "      &    for (const auto& container : ir) {5��              
           @      
               �                         ?                     �                         >                     �                         =                     �                         <                     �                         ;                     �                         :                     �                         9                     �                         8                     �                         7                     �                         6                     �                         5                     �                         4                     �                         3                     �                         2                     �       
                  1                     �       	                 0                    �                         6                     �                     !   5             !       �       .                  U                     5�_�                       /    ����                                                                                                                                                                                                                                                                                                                                                             eCQ�    �         "      1    for (auto container = std::next(ir.begin()) {5��       /                  V                     �       C              	   j             	       �       G                 n                    �       I                 p                    �       M                  t                     5�_�                       1    ����                                                                                                                                                                                                                                                                                                                                                             eCQ�    �         "      O    for (auto container = std::next(ir.begin()); it != ir.end(); ++container) {5��       1                 X                    �       :                  a                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCQ�     �         "              CFG cfg{container};5��                        �                    �                         �                     �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCQ�    �         "              CFG cfg(container};5��                        �                    �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCQ�   ! �         "              CFG cfg(container);5��                         �                     �                         �                     �                        �                    �                         �                     �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             eCR    % �         "              CFG cfg(&container);5��                         �                     5�_�      !                     ����                                                                                                                                                                                                                                                                                                                                                             eCR   ) �         "              CFG cfg(container);5��                         �                     �                         �                     5�_�      "           !          ����                                                                                                                                                                                                                                                                                                                                                             eCR     �         "              CFG cfg(container.);5��                        �                    �                         �                     �                         �                     5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                             eCR     �         "              CFG cfg(container);5��                         �                     �                         �                     5�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                                                v       eCR$     �         "    �         "              CFG cfg(container.);�         "      V    for (auto container = std::next(ir.begin()); container != ir.end(); ++container) {5��              	           5      	               �       (       	           O      	               �       8       	           _      	               �              	           s      	               �               ;       ;   '      ;       ;       �                         c                    5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                                v       eCR$   , �         "              CFG cfg(.);�                ;    for (auto  = std::next(ir.begin());  != ir.end(); ++) {�         "    �         "    �         "    5��                         s                     �               ;       >   '      ;       >       �                         f                    �               >       A   '      >       A       �                         i                    �               A       D   '      A       D       �                         l                    �                         ~                     �               D       A   '      D       A       �                         i                    5�_�   $   &           %          ����                                                                                                                                                                                                                                                                                                                                                    v       eCR'   3 �         "              CFG cfg(it.);5��                         {                     �                        y                    �                         {                     �                         z                     �                        y                    �                         |                     5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                    v       eCR;     �         "              CFG cfg(*it);�         "    5��                         y                     �                        x                    5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                    v       eCR=   5 �         "              CFG cfg{ *it };�         "              CFG cfg{ *it };   		cfgs.push_back(cfg);5��                      �             	       �                         }                     �                         y                     5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                V       eCZ�     �         "      A    for (auto it = std::next(ir.begin()); it != ir.end(); ++it) {           CFG cfg{*it};           cfgs.push_back(cfg);       }5��                         '      {       �       5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                V       eCZ�   9 �         #      	// �         "    5��                          '                     �                         *                     �                         )                     �                        (                    �                        6                    �                         D                     �                         C                     5�_�   )   +           *          ����                                                                                                                                                                                                                                                                                                                                                V       eCp!   ; �         #      D    // for (auto it = std::next(ir.begin()); it != ir.end(); ++it) {       //     CFG cfg{*it};       //     cfgs.push_back(cfg);       // }5��                         D      �       {       5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                V       eCp$   > �                	cfgs.push_back(CFG{ir[1]});5��                          '                     5�_�   +   -           ,       1    ����                                                                                                                                                                                                                                                                                                                                                V       eCv�   B �      !   "      3        TigerUtils::SaveSetsOfIR(parsed_args.file);5��       1                  �                     �       7                  �                     5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                V       eCw8     �                        // TODO5��                          0                     5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                V       eCw9   F �                        // TODO5��                          �                     5�_�   .   0           /           ����                                                                                                                                                                                                                                                                                                                                                V       eCw~     �                   &#include "intermediate/Intermediate.h"       XIntermediate::Intermediate(TigerUtils::CommandLineArgs parsed_args, TigerParser* parser,   i                           antlr4::tree::ParseTreeWalker* walker, TigerParser::TigerProgramContext* tree)   N    : parsed_args{parsed_args}, parser{parser}, walker{walker}, tree{tree} {};        Intermediate::~Intermediate() {}       void Intermediate::Execute() {   #    IRListener ir_listener{parser};       -    walker->DEFAULT.walk(&ir_listener, tree);       ;    std::vector<IRContainer> ir = ir_listener.ir_container;       std::vector<CFG> cfgs;   A    for (auto it = std::next(ir.begin()); it != ir.end(); ++it) {           CFG cfg{*it};           cfgs.push_back(cfg);       }           if (parsed_args.save_ir) {   7        TigerUtils::SaveIRToFile(ir, parsed_args.file);       }       .    if (parsed_args.save_control_flow_graph) {   ;        TigerUtils::SaveCFGToGraph(parsed_args.file, cfgs);       }            if (parsed_args.save_sets) {   9        TigerUtils::SaveSetsOfIR(parsed_args.file, cfgs);       }   }5�5�_�   /   1           0           ����                                                                                                                                                                                                                                                                                                                                                   V        eCw�     �                <<<<<<< Updated upstream   3        TigerUtils::SaveSetsOfIR(parsed_args.file);   =======5��                          �      U               5�_�   0               1           ����                                                                                                                                                                                                                                                                                                                                                  V        eCw�   I �                >>>>>>> Stashed changes5��                          �                     5�_�              !          	    ����                                                                                                                                                                                                                                                                                                                                                             eCR   ' �         "      ]    for (IRContianer container = std::next(ir.begin()); container != ir.end(); ++container) {5��       	                 0                    �                         ;                     5��