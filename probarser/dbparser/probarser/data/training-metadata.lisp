;           Copyright (c) 2004, Daniel M. Bikel.
;                         All rights reserved.
; 
;                Developed at the University of Pennsylvania
;                Institute for Research in Cognitive Science
;                    3401 Walnut Street
;                    Philadelphia, Pennsylvania 19104
; 			
; 
; For research or educational purposes only.  Do not redistribute.  For
; complete license details, please read the file LICENSE that accompanied
; this software.
; 
; DISCLAIMER
; 
; Daniel M. Bikel makes no representations or warranties about the suitability of
; the Software, either express or implied, including but not limited to the
; implied warranties of merchantability, fitness for a particular purpose, or
; non-infringement. Daniel M. Bikel shall not be liable for any damages suffered
; by Licensee as a result of using, modifying or distributing the Software or its
; derivatives.
; 
;; a list of contexts in which children can be considered arguments
;;; (complements)
;;; the syntax is: (arg-contexts <context>+)
;;; where
;;; <context>      ::= (<parent> <child list>)
;;;
;;; <parent>       ::= the symbol of a parent nonterminal
;;;
;;; <child list>   ::= <nt-list> | <head-list>
;;;
;;; <nt-list>      ::= (<nt>+)
;;;                    a list of symbols of child nonterminals s.t. when their
;;;                    parent is <parent>, they are candidates for being
;;;                    relabeled as arguments
;;;
;;; <nt>           ::= a nonterminal label (a symbol), or a match pattern
;;;                    containing Kleene star, such as * or *-A, where the
;;;                    former matches any nonterminal symbol, and the latter
;;;                    matches any nonteminal symbol bearing the "-A"
;;;                    augmentation
;;;
;;; <head-list>    ::= (head <integer>) |
;;;                    (head-pre <search-set>) |
;;;                    (head-post <search-set>)
;;;
;;; <integer>      ::= an integer that is the amount to add to the head index
;;;                    (this integer can also be negative, but not zero)
;;;                    e.g., (head 1) indicates that the first child after the
;;;                    head is a candidate for being relabeled as an argument
;;;
;;; <search-set>   ::= <direction> [<not>] <nt>+
;;;
;;; <direction>    ::= first | last
;;;                    first indicates a left-to-right search of the children
;;;                    of <parent>
;;;                    last indicates a right-to-left search
;;;                    e.g., (head-post first PP NP WHNP) indicates to perform
;;;                    a left-to-right search on the right side of the head,
;;;                    where the first child found whose label is one of
;;;                    {PP, NP, WHNP} will be a candidate for being relabeled
;;;                    as an argument
;;;
;;; <not>          ::= not
;;;                    indicates to search for something not in the set of
;;;                    nonterminals specified by <nt>+
;;;
;(arg-contexts (* (*-SBJ *-OBJ *-DTV *-CLR))
(arg-contexts (* (*-SBJ *-TPC *-OBJ))
	      (VP (SBAR S11 VP))
	      (SBAR (S11))
	      (PP (head 1)))
;             (PP (head-post first not PRN IN , : $ # CC CD DT EX FW JJ JJR JJS -LRB- LS MD NN NNP NNPS NNS PDT POS PRP PRP$ RB RBR RBS RP -RRB- TO UH VB VBD VBG VBN VBP VBZ WDT WP WP$ WRB)))
;;; a list of semantic tags on Penn Treebank nonterminals that prevent
;;; children in the appropriate contexts from being relabeled as arguments
(sem-tag-arg-stop-list (ADV VOC BNF DIR EXT LOC MNR TMP PRP))

;;; a list of nodes to be pruned from training data parse trees
(prune-nodes ('' .))

;;; a set of mappings from the morphological Arabic tags to the original
;;; Penn Treebank tag set
;;; each mapping is a list of two symbols, of the form (<from> <to>)
(tag-map 
    ; PUNC: special handling done int #transformTag(Word)

    ; don't map NUMERIC_COMMA
    (NUMERIC_COMMA NUMERIC_COMMA)

    ; don't map NON_ALPHABETIC

    ; don't map NON_ARABIC

    ; don't map NO_FUNC
    (NO_FUNC NO_FUNC)

    ; don't map OATH
    (OATH OATH)

    ; don't map DISFL-IP
    (DISFL-IP DISFL-IP)

    ; provide some kind of mapping for OBJ tags (don't know what they mean)
    (OBJ:3FS OBJ)
    (OBJ:3MP OBJ)
    (OBJ:3MS OBJ)
    (OBJ:3P OBJ)
    
    ; NP
    (ABBREV NP)
    (NP-SYM NP)

    ; NN
    (ABBREV NN)
    (DET+ABBREV NN)
    (LATIN NN)
    (DET+NOUN NN)
    (DET+NOUN+NSUFF_FEM_SG NN)
    (DET+PART+NOUN NN)
    (NOUN NN)
    (NOUN+NSUFF_FEM_SG NN)
    (NOUN+NSUFF_MASC_SG_ACC_INDEF NN)
    (DEM+NOUN NN)
    (DET+NOUN+CASE_DEF_ACC NN)
    (DET+NOUN+CASE_DEF_GEN NN)
    (DET+NOUN+CASE_DEF_GEN+CASE_DEF_GEN NN)
    (DET+NOUN+CASE_DEF_NOM NN)
    (DET+NOUN+NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (DET+NOUN+NSUFF_FEM_SG+CASE_DEF_GEN NN)
    (DET+NOUN+NSUFF_FEM_SG+CASE_DEF_NOM NN)
    (NOUN+CASE_DEF_ACC NN)
    (NOUN+CASE_DEF_GEN NN)
    (NOUN+CASE_DEF_NOM NN)
    (NOUN+CASE_INDEF_ACC NN)
    (NOUN+CASE_INDEF_GEN NN)
    (NOUN+CASE_INDEF_NOM NN)
    (NOUN+NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (NOUN+NSUFF_FEM_SG+CASE_DEF_GEN NN)
    (NOUN+NSUFF_FEM_SG+CASE_DEF_NOM NN)
    (NOUN+NSUFF_FEM_SG+CASE_INDEF_ACC NN)
    (NOUN+NSUFF_FEM_SG+CASE_INDEF_GEN NN)
    (NOUN+NSUFF_FEM_SG+CASE_INDEF_NOM NN)
    (NEG_PART+NOUN NN)
    (PART+NOUN NN)
    (DET+NEG_PART+CASE_DEF_GEN NN)
    (NOUN+CASE_DEF_GEN+POSS_PRON_3FS NN)
    (CASE_DEF_NOM NN)
    (CASE_INDEF_ACC NN)
    (DET+NEG_PART NN)
    (DET+NEG_PART+NOUN+NSUFF_FEM_SG NN)
    (DET+NOUN+NSUFF_FEM_DU NN)
    (DET+NOUN+NSUFF_MASC_DU NN)
    (DET+NOUN+NSUFF_MASC_DU_ACC_POSS NN)
    (DET+NOUN+NSUFF_MASC_PL NN)
    (DET+NOUN_QUANT+CASE_DEF_ACC NN)
    (DET+NOUN_QUANT+CASE_DEF_GEN NN)
    (DET+NOUN_QUANT+CASE_DEF_NOM NN)
    (DET+NOUN_QUANT+NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (DET+NOUN_QUANT+NSUFF_FEM_SG+CASE_DEF_GEN NN)
    (DET+NOUN_QUANT+NSUFF_FEM_SG+CASE_DEF_NOM NN)
    (NOUN+NSUFF_FEM_SG+POSS_PRON_3FS NN)
    (NOUN_QUANT+CASE_DEF_ACC NN)
    (NOUN_QUANT+CASE_DEF_GEN NN)
    (NOUN_QUANT+CASE_DEF_NOM NN)
    (NOUN_QUANT+CASE_INDEF_ACC NN)
    (NOUN_QUANT+CASE_INDEF_GEN NN)
    (NOUN_QUANT+CASE_INDEF_NOM NN)
    (NOUN_QUANT+NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (NOUN_QUANT+NSUFF_FEM_SG+CASE_DEF_GEN NN)
    (NOUN_QUANT+NSUFF_FEM_SG+CASE_DEF_NOM NN)
    (NOUN_QUANT+NSUFF_FEM_SG+CASE_INDEF_GEN NN)
    (NSUFF_FEM_SG NN)
    (NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (NUM+NSUFF_FEM_SG NN)
    (PREP+DET+NOUN NN)
    (PREP+DET+NOUN+NSUFF_FEM_SG NN)

    ; NNS
    (DET+NOUN+NSUFF_FEM_DU_ACCGEN NNS)
    (DET+NOUN+NSUFF_FEM_DU_ACC NNS)
    (DET+NOUN+NSUFF_FEM_DU_GEN NNS)
    (DET+NOUN+NSUFF_FEM_DU_NOM NNS)
    (DET+NOUN+NSUFF_FEM_DU_GEN_POSS NNS)
    (DET+NOUN+NSUFF_FEM_PL NNS)
    (DET+NOUN+NSUFF_MASC_DU_ACCGEN NNS)
    (DET+NOUN+NSUFF_MASC_DU_ACC NNS)
    (DET+NOUN+NSUFF_MASC_DU_GEN NNS)
    (DET+NOUN+NSUFF_MASC_DU_NOM NNS)
    (DET+NOUN+NSUFF_MASC_DU_GEN_POSS NNS)
    (DET+NOUN+NSUFF_MASC_PL_ACCGEN NNS)
    (DET+NOUN+NSUFF_MASC_PL_ACC NNS)
    (DET+NOUN+NSUFF_MASC_PL_GEN NNS)
    (DET+NOUN+NSUFF_MASC_PL_NOM NNS)
    (DET+NOUN+NSUFF_MASC_PL_GEN_POSS NNS)
    (NOUN+NSUFF_FEM_DU_ACC NNS)
    (NOUN+NSUFF_FEM_DU_ACC_POSS NNS)
    (NOUN+NSUFF_FEM_DU_ACCGEN NNS)
    (NOUN+NSUFF_FEM_DU_ACCGEN_POSS NNS)
    (NOUN+NSUFF_FEM_DU_NOM NNS)
    (NOUN+NSUFF_FEM_DU_NOM_POSS NNS)
    (NOUN+NSUFF_FEM_PL NNS)
    (NOUN+NSUFF_MASC_DU_ACCGEN NNS)
    (NOUN+NSUFF_MASC_DU NNS)
    (NOUN+NSUFF_MASC_DU_ACCGEN_POSS NNS)
    (NOUN+NSUFF_MASC_DU_NOM NNS)
    (NOUN+NSUFF_MASC_DU_NOM_POSS NNS)
    (NOUN+NSUFF_MASC_PL_ACCGEN NNS)
    (NOUN+NSUFF_MASC_PL_ACCGEN_POSS NNS)
    (NOUN+NSUFF_MASC_PL_NOM NNS)
    (NOUN+NSUFF_MASC_PL_NOM_POSS NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_ACCGEN NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_NOM NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_ACC NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_GEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_ACCGEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_GEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_NOM NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_ACCGEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_ACC NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_ACC NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_GEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_NOM NNS)
    (NOUN+NSUFF_FEM_DU_ACC_POSS NNS)
    (NOUN+NSUFF_FEM_DU_GEN_POSS NNS)
    (NOUN+NSUFF_FEM_DU_GEN NNS)
    (NOUN+NSUFF_MASC_DU_ACC NNS)
    (NOUN+NSUFF_MASC_DU_ACC_POSS NNS)
    (NOUN+NSUFF_MASC_DU_GEN NNS)
    (NOUN+NSUFF_MASC_DU_GEN_POSS NNS)
    (NOUN+NSUFF_MASC_DU_NOM NNS)
    (NOUN+NSUFF_MASC_DU_NOM_POSS NNS)
    (NOUN+NSUFF_MASC_PL_ACC NNS)
    (NOUN+NSUFF_MASC_PL_ACC_POSS NNS)
    (NOUN+NSUFF_MASC_PL_GEN NNS)
    (NOUN+NSUFF_MASC_PL_GEN_POSS NNS)
    (NOUN+NSUFF_MASC_PL_NOM NNS)
    (NOUN+NSUFF_MASC_PL_NOM_POSS NNS)
    (NOUN+NSUFF_FEM_DU NNS)
    (NOUN+NSUFF_MASC_PL NNS)
    (NOUN_PROP+NSUFF_FEM_PL+CASE_INDEF_ACC NNS)
    (NOUN_QUANT+NSUFF_MASC_DU_ACC_POSS NNS)
    (NOUN_QUANT+NSUFF_MASC_DU_NOM_POSS NNS)
    (NUM+NSUFF_FEM_DU NNS)
    (NUM+NSUFF_FEM_DU_ACC_POSS NNS)
    (NUM+NSUFF_FEM_DU_NOM_POSS NNS)
    (NUM+NSUFF_FEM_PL NNS)
    (NUM+NSUFF_MASC_DU NNS)
    (NUM+NSUFF_MASC_DU_ACC NNS)
    (NUM+NSUFF_MASC_PL NNS)
    (NUM+NSUFF_MASC_PL_GEN_POSS NNS)

    ; NNP
    (DET+NOUN_PROP NNP)
    (DET+NOUN_PROP+CASE_DEF_ACC NNP)
    (DET+NOUN_PROP+CASE_DEF_GEN NNP)
    (DET+NOUN_PROP+CASE_DEF_NOM NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_ACC NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_GEN NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_NOM NNP)
    (DET+NOUN_PROP+NSUFF_FEM_DU_GEN NNP)
    (DET+NOUN_PROP+NSUFF_FEM_DU_NOM NNP)
    (NOUN_PROP NNP)
    (NOUN_PROP+NSUFF_FEM_SG NNP)
    (NOUN_PROP+NSUFF_MASC_SG_ACC_INDEF NNP)
    (NOUN_PROP+CASE_DEF_ACC NNP)
    (NOUN_PROP+CASE_DEF_GEN NNP)
    (NOUN_PROP+CASE_DEF_NOM NNP)
    (NOUN_PROP+CASE_INDEF_ACC NNP)
    (NOUN_PROP+CASE_INDEF_GEN NNP)
    (NOUN_PROP+CASE_INDEF_NOM NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_GEN NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_ACC NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_NOM NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_INDEF_GEN NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_INDEF_ACC NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_INDEF_NOM NNP)
    (DET+NOUN_PROP+NSUFF_FEM_PL+CASE_DEF_ACC NNP)

    ; NNPS
    (DET+NOUN_PROP+NSUFF_FEM_PL NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_DU_ACCGEN NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_DU_ACC NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_DU_GEN NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_PL_ACCGEN NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_PL_ACC NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_PL_GEN NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_PL_NOM NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_NOM NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_GEN NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_ACC NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_ACC_POSS NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_GEN_POSS NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_NOM_POSS NNPS)
    (NOUN_PROP+NSUFF_FEM_PL NNPS)
    (NOUN_PROP+NSUFF_FEM_PL+CASE_INDEF_ACCGEN NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_ACCGEN NNPS)
    (DET+NOUN_PROP+NSUFF_FEM_PL+CASE_DEF_ACCGEN NNPS)
    (DET+NOUN_PROP+NSUFF_FEM_PL+CASE_DEF_GEN NNPS)
    (NOUN_PROP+NSUFF_FEM_PL+CASE_DEF_GEN NNPS)
    (NOUN_PROP+NSUFF_FEM_PL+CASE_INDEF_GEN NNPS)

    ; JJ
    (ADJ JJ)
    (ADJ+NSUFF_FEM_DU_ACCGEN JJ)
    (ADJ+NSUFF_FEM_DU_ACCGEN_POSS JJ)
    (ADJ+NSUFF_FEM_DU_ACC JJ)
    (ADJ+NSUFF_FEM_DU_GEN JJ)
    (ADJ+NSUFF_FEM_DU_NOM JJ)
    (ADJ+NSUFF_FEM_DU_ACC_POSS JJ)
    (ADJ+NSUFF_FEM_DU_GEN_POSS JJ)
    (ADJ+NSUFF_FEM_DU_NOM_POSS JJ)
    (ADJ+NSUFF_FEM_PL JJ)
    (ADJ+NSUFF_FEM_SG JJ)
    (ADJ+NSUFF_MASC_DU_ACCGEN JJ)
    (ADJ+NSUFF_MASC_DU_ACCGEN_POSS JJ)
    (ADJ+NSUFF_MASC_DU_ACC JJ)
    (ADJ+NSUFF_MASC_DU_GEN JJ)
    (ADJ+NSUFF_MASC_DU_NOM JJ)
    (ADJ+NSUFF_MASC_DU_ACC_POSS JJ)
    (ADJ+NSUFF_MASC_DU_GEN_POSS JJ)
    (ADJ+NSUFF_MASC_DU_NOM_POSS JJ)
    (ADJ+NSUFF_MASC_PL_ACCGEN JJ)
    (ADJ+NSUFF_MASC_PL_ACCGEN_POSS JJ)
    (ADJ+NSUFF_MASC_PL_NOM JJ)
    (ADJ+NSUFF_MASC_PL_NOM_POSS JJ)
    (ADJ+NSUFF_MASC_PL_ACC JJ)
    (ADJ+NSUFF_MASC_PL_ACC_POSS JJ)
    (ADJ+NSUFF_MASC_PL_GEN JJ)
    (ADJ+NSUFF_MASC_PL_GEN_POSS JJ)
    (ADJ+NSUFF_MASC_SG_ACC_INDEF JJ)
    (ADJ_PROP JJ)
    (ADJ_PROP+NSUFF_FEM_SG JJ)
    (ADJ_PROP+NSUFF_MASC_PL_NOM JJ)
    (ADJ_PROP+NSUFF_MASC_SG_ACC_INDEF JJ)
    (DET+ADJ JJ)
    (DET+ADJ+NSUFF_FEM_DU_ACCGEN JJ)
    (DET+ADJ+NSUFF_FEM_DU_NOM JJ)
    (DET+ADJ+NSUFF_FEM_PL JJ)
    (DET+ADJ+NSUFF_FEM_SG JJ)
    (DET+ADJ+NSUFF_MASC_DU_ACCGEN JJ)
    (DET+ADJ+NSUFF_MASC_DU_NOM JJ)
    (DET+ADJ+NSUFF_MASC_PL_ACCGEN JJ)
    (DET+ADJ+NSUFF_MASC_PL_NOM JJ)
    (DET+ADJ+NSUFF_MASC_PL_ACC_POSS JJ)
    (DET+ADJ+NSUFF_MASC_PL_GEN_POSS JJ)
    (DET+ADJ+NSUFF_MASC_PL_NOM_POSS JJ)
    (DET+ADJ_PROP JJ)
    (DET+ADJ_PROP+NSUFF_FEM_SG JJ)
    (DET+ADJ_PROP+NSUFF_MASC_PL_ACCGEN JJ)
    (ADJ+CASE_DEF_ACC JJ)
    (ADJ+CASE_DEF_GEN JJ)
    (ADJ+CASE_DEF_NOM JJ)
    (ADJ+CASE_INDEF_ACC JJ)
    (ADJ+CASE_INDEF_GEN JJ)
    (ADJ+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_FEM_SG+CASE_DEF_ACC JJ)
    (ADJ+NSUFF_FEM_SG+CASE_INDEF_ACC JJ)
    (ADJ+NSUFF_FEM_SG+CASE_INDEF_GEN JJ)
    (ADJ+NSUFF_FEM_SG+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_FEM_PL+CASE_DEF_ACCGEN JJ)
    (ADJ+NSUFF_FEM_PL+CASE_DEF_ACC JJ)
    (ADJ+NSUFF_FEM_PL+CASE_DEF_GEN JJ)
    (ADJ+NSUFF_FEM_PL+CASE_DEF_NOM JJ)
    (ADJ+NSUFF_FEM_PL+CASE_INDEF_ACCGEN JJ)
    (ADJ+NSUFF_FEM_PL+CASE_INDEF_ACC JJ)
    (ADJ+NSUFF_FEM_PL+CASE_INDEF_GEN JJ)
    (ADJ+NSUFF_FEM_PL+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (ADJ+NSUFF_FEM_SG+CASE_DEF_NOM JJ)
    (DET+ADJ JJ)
    (DET+ADJ+CASE_DEF_ACC JJ)
    (DET+ADJ+CASE_DEF_GEN JJ)
    (DET+ADJ+CASE_DEF_NOM JJ)
    (DET+ADJ+NSUFF_FEM_SG JJ)
    (DET+ADJ+NSUFF_FEM_SG+CASE_DEF_ACC JJ)
    (DET+ADJ+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (DET+ADJ+NSUFF_FEM_SG+CASE_DEF_NOM JJ)
    (DET+ADJ+NSUFF_FEM_DU_ACC JJ)
    (DET+ADJ+NSUFF_FEM_DU_GEN JJ)
    (DET+ADJ+NSUFF_FEM_DU_NOM JJ)
    (DET+ADJ+NSUFF_FEM_PL+CASE_DEF_ACCGEN JJ)
    (DET+ADJ+NSUFF_FEM_PL+CASE_DEF_ACC JJ)
    (DET+ADJ+NSUFF_FEM_PL+CASE_DEF_GEN JJ)
    (DET+ADJ+NSUFF_FEM_PL+CASE_DEF_NOM JJ)
    (DET+ADJ+NSUFF_MASC_DU_ACC JJ)
    (DET+ADJ+NSUFF_MASC_DU_GEN JJ)
    (DET+ADJ+NSUFF_MASC_DU_NOM JJ)
    (DET+ADJ+NSUFF_MASC_PL_ACC JJ)
    (DET+ADJ+NSUFF_MASC_PL_GEN JJ)
    (DET+ADJ+NSUFF_MASC_PL_NOM JJ)
    (DET+INTERJ+CASE_DEF_NOM JJ)
    (NEG_PART+ADJ JJ)
    (DET+NEG_PART+ADJ JJ)
    (ADJ_COMP JJ)
    (ADJ_COMP+CASE_DEF_ACC JJ)
    (ADJ_COMP+CASE_DEF_GEN JJ)
    (ADJ_COMP+CASE_DEF_NOM JJ)
    (ADJ_COMP+CASE_INDEF_ACC JJ)
    (ADJ_COMP+CASE_INDEF_GEN JJ)
    (ADJ_COMP+CASE_INDEF_NOM JJ)
    (ADJ_COMP+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (ADJ_COMP+NSUFF_FEM_SG+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_MASC_PL JJ)
    (DET+ADJ_COMP JJ)
    (DET+ADJ_COMP+CASE_DEF_ACC JJ)
    (DET+ADJ_COMP+CASE_DEF_GEN JJ)
    (DET+ADJ_COMP+CASE_DEF_NOM JJ)
    (DET+ADJ_COMP+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (DET+ADJ_COMP+NSUFF_MASC_DU_GEN JJ)
    (DET+ADJ_COMP+NSUFF_MASC_PL_GEN JJ)
    (DET+ADJ+NSUFF_MASC_DU_GEN_POSS JJ)
    (DET+ADJ+NSUFF_MASC_PL JJ)
    (DET+ADJ+NSUFF_MASC_PL_ACCGEN_POSS JJ)
    (DET+ADJ_NUM JJ)
    (DET+ADJ_NUM+CASE_DEF_ACC JJ)
    (DET+ADJ_NUM+CASE_DEF_GEN JJ)
    (DET+ADJ_NUM+CASE_DEF_NOM JJ)
    (DET+ADJ_NUM+NSUFF_FEM_PL+CASE_DEF_NOM JJ)
    (DET+ADJ_NUM+NSUFF_FEM_SG+CASE_DEF_ACC JJ)
    (DET+ADJ_NUM+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (DET+ADJ_NUM+NSUFF_FEM_SG+CASE_DEF_NOM JJ)
    (DET+ADJ_NUM+NSUFF_MASC_DU_ACC JJ)
    (DET+ADJ_NUM+NSUFF_MASC_DU_GEN JJ)
    (PREP+DET+ADJ JJ)

    ; RB
    (ADV RB)
    (ADV+NSUFF_FEM_SG RB)
    (ADV+NSUFF_MASC_SG_ACC_INDEF RB)
    (DET+ADV+NSUFF_FEM_SG RB)
    (ADV+CASE_DEF_ACC RB)
    (ADV+CASE_INDEF_ACC RB)

    ; CC
    (CONJ CC)
    ;(CONJ+NEG_PART CC)
    (CONNEC_PART CC)

    ; DT
    (DEM_PRON_F DT)
    (DEM_PRON_FD DT)
    (DEM_PRON_FS DT)
    (DEM_PRON_MD DT)
    (DEM_PRON_MP DT)
    (DEM_PRON_MS DT)
    (DEM_PRON_MP+CASE_DEF_GEN DT)
    (DET DT)
    (DEM DT)
    ;(DET+NEG_PART DT)
    ;(DET+PREP DT)
    (DEM_PRON DT)
    (DEM_PRON_M DT)
    (DEM_PRON_P DT)
    (DEM_PRON_S DT)

    ; RP
    (EMPHATIC_PARTICLE RP)
    (EMPHATIC_PART RP)
    (EMPH_PART RP)
    (EXCEPT_PART RP)
    (FOCUS_PART RP)
    (INTERROG_PART RP)
    (INTERROG_PART+CASE_DEF_GEN RP)
    (INTERROG_PART+CASE_DEF_NOM RP)
    (INTERROG_PART+NSUFF_FEM_SG+CASE_DEF_GEN RP)
    (NEG_PART RP)
    (NEG_PART+CASE_DEF_GEN RP)
    (NEG_PART+CASE_DEF_NOM RP)
    (NEG_PART+CASE_DEF_ACC RP)
    (NEG_PART+PVSUFF_SUBJ:3MS RP)
    (PART RP)
    (RESULT_CLAUSE_PARTICLE RP)
    (RC_PART RP)
    (SUBJUNC RP)
    (VERB_PART RP)
    (FUT_PART RP)
    (INTERROG_PART+CASE_DEF_ACC RP)
    (INTERROG_PART+CASE_DEF_GEN RP)
    (INTERROG_PART+CASE_DEF_NOM RP)
    (INTERROG_PART+NSUFF_FEM_SG+CASE_DEF_GEN RP)
    (INTERROG_PART+NEG_PART+PVSUFF_SUBJ:3FS RP)
    (INTERROG_PART+NEG_PART+PVSUFF_SUBJ:3MS RP)
    (ACT_PART RP)
    (ACT_PART+SUBJ:2MS RP)
    (ACT_PART+SUBJ:3FS RP)
    (ACT_PART+SUBJ:FS RP)
    (ACT_PART+SUBJ:MS RP)
    (ACT_PART+SUBJ:P RP)
    (EXIST_PART RP)
    (INTERROG RP)
    (INTERROG_PART+IV3MS+IV_PASS RP)
    (INTERROG_PART+NEG_PART RP)
    (INTERROG_PART+PRON_3MS RP)
    (NEG RP)

    ; IN
    (FUNC_WORD IN)
    (PREP IN)
    (PREP+NSUFF_FEM_SG IN)
    (PREP+NSUFF_MASC_SG_ACC_INDEF IN)
    (PREP+NSUFF_FEM_SG+CASE_DEF_ACC IN)
    (PREP+SUB_CONJ+NEG_PART IN)
    (PREP_PROP IN)
    (SUB_CONJ IN)
    (SUB IN)
    (SUB_CONJ+NEG_PART IN)
    ; these next several are errors, but I'm putting them with IN just to
    ; get a mapping for them.  They should really be split at the +s.
    (PREP+PRON_3MP IN)
    (SUB_CONJ+PRON_3MP IN)

    ; VBP (old present tense tag used for imperfect verbs)
    (FUT+IV1P+VERB_IMPERFECT VBP)
    (FUT+IV1S+VERB_IMPERFECT VBP)
    (FUT+IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV2MS+VERB_IMPERFECT VBP)
    (FUT+IV3FS+VERB_IMPERFECT VBP)
    (FUT+IV3MD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV1P+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV1S+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV2D+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV2MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV3FD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (FUT+IV3MS+VERB_IMPERFECT VBP)
    (FUT+IV1P+IV+IVSUFF_MOOD:I VBP)
    (IV1P+IV+IVSUFF_MOOD:I VBP)
    (IV1P+IV+IVSUFF_MOOD:J VBP)
    (IV1P+IV+IVSUFF_MOOD:S VBP)
    (FUT+IV1S+IV+IVSUFF_MOOD:I VBP)
    (IV1S+IV+IVSUFF_MOOD:I VBP)
    (IV1S+IV+IVSUFF_MOOD:J VBP)
    (IV1S+IV+IVSUFF_MOOD:S VBP)
    (FUT+IV2MS+IV+IVSUFF_MOOD:I VBP)
    (FUT+IV2MP+IV+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV3FD+IV+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV3FD+IV+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV3FS+IV+IVSUFF_MOOD:I VBP)
    (IV3FS+IV+IVSUFF_MOOD:I VBP)
    (IV3FS+IV+IVSUFF_SUBJ:3FS VBP)
    (FUT+IV3MD+IV+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV3MD+IV+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV3MP+IV+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (IV3MP+IV+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV3MS+IV+IVSUFF_MOOD:I VBP)
    (IV3MS+IV+IVSUFF_MOOD:I VBP)
    (IV1P+VERB_IMPERFECT VBP)
    (IV1P+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV1P+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV1S+VERB_IMPERFECT VBP)
    (IV1S+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV1S+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV2D+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV2FP+VERB_IMPERFECT+IVSUFF_SUBJ:FP VBP)
    (IV2FS+VERB_IMPERFECT+IVSUFF_SUBJ:2FS_MOOD:SJ VBP)
    (IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (IV2MS+VERB_IMPERFECT VBP)
    (IV2MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV2MS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV3FD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV3FD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV3FP+VERB_IMPERFECT+IVSUFF_SUBJ:FP VBP)
    (IV3FS+VERB_IMPERFECT VBP)
    (IV3MD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV3MD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (IV3MS+VERB_IMPERFECT VBP)
    (FUT+IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV2D+IV+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV2D+IV+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV2FP+IV+IVSUFF_SUBJ:FP VBP)
    (IV2FS+IV+IVSUFF_SUBJ:2FS_MOOD:I VBP)
    (IV2FS+IV+IVSUFF_SUBJ:2FS_MOOD:SJ VBP)
    (IV2MP+IV+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (IV2MP+IV+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (IV2MS+IV+IVSUFF_MOOD:I VBP)
    (IV2MS+IV+IVSUFF_MOOD:J VBP)
    (IV2MS+IV+IVSUFF_MOOD:S VBP)
    (IV3FD+IV+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV3FP+IV+IVSUFF_SUBJ:FP VBP)
    (IV3FS+IV+IVSUFF_MOOD:J VBP)
    (IV3FS+IV+IVSUFF_MOOD:S VBP)
    (IV3MD+IV+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV3MP+IV+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (IV3MS+IV+IVSUFF_MOOD:J VBP)
    (IV3MS+IV+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV1P+VERB_IMPERFECT VBP)
    (SUBJUNC+IV1P+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV1S+VERB_IMPERFECT VBP)
    (SUBJUNC+IV1S+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV3FS+VERB_IMPERFECT VBP)
    (SUBJUNC+IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (SUBJUNC+IV3MS+VERB_IMPERFECT VBP)
    (NEG_PART+PVSUFF_SUBJ:3FS VBP)
    (NEG_PART+PVSUFF_SUBJ:1P VBP)
    (NEG_PART+PVSUFF_SUBJ:3MS VBP)
    (NEG_PART+PVSUFF_SUBJ:3MP VBP)
    (NEG_PART+IV3FS+IV+IVSUFF_MOOD:I VBP)
    (JUS+IV1P+IV+IVSUFF_MOOD:J VBP)
    (JUS+IV2MS+IV+IVSUFF_MOOD:J VBP)
    (JUS+IV2FS+IV+IVSUFF_SUBJ:2FS_MOOD:SJ VBP)
    (JUS+IV3FS+IV+IVSUFF_MOOD:J VBP)
    (JUS+IV3MS+IV+IVSUFF_MOOD:J VBP)
    (JUS+IV3MP+IV+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (JUS+IV3MP+IV+IVSUFF_MOOD:J VBP)
    (SUB+IV1P+IV+IVSUFF_MOOD:S VBP)
    (SUB+IV1S+IV+IVSUFF_MOOD:S VBP)
    (SUB+IV2D+IV+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (SUB+IV2MP+IV+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (SUB+IV2MS+IV+IVSUFF_MOOD:S VBP)
    (SUB+IV3FS+IV+IVSUFF_MOOD:S VBP)
    (SUB+IV3MP+IV+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (SUB+IV3MS+IV+IVSUFF_MOOD:S VBP)
    (FUT+IV1P+IV VBP)
    (FUT+IV1P+IV_PASS+IVSUFF_MOOD:I VBP)
    (FUT+IV1S+IV VBP)
    (FUT+IV2MS+IV VBP)
    (FUT+IV3FS+IV VBP)
    (FUT+IV3FS+IV+IVSUFF_MOOD:S VBP)
    (FUT+IV3MP+IV+IVSUFF_SUBJ:3P VBP)
    (FUT+IV3MP+IV+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (FUT+IV3MS+IV VBP)
    (FUT+IV3MS+IV+IVSUFF_MOOD:J VBP)
    (IV VBP)
    (IV1P+IV VBP)
    (IV1P+IV+IVSUFF_SUBJ:1P VBP)
    (IV1S+IV VBP)
    (IV2FS+IV+IVSUFF_SUBJ:2FS VBP)
    (IV2MP+IV+IVSUFF_SUBJ:P VBP)
    (IV2MS+IV VBP)
    (IV3FS+IV VBP)
    (IV3MP+IV+IVSUFF_MOOD:I VBP)
    (IV3MP+IV+IVSUFF_SUBJ:3MP_MOOD:SJ VBP)
    (IV3MP+IV+IVSUFF_SUBJ:MP VBP)
    (IV3MP+IV+IVSUFF_SUBJ:P VBP)
    (IV3MS+IV VBP)
    (IVSUFF_DO:2FP VBP)
    (IVSUFF_DO:3FP VBP)
    (IVSUFF_DO:3P VBP)
    (NEG_PART+PV+PVSUFF_SUBJ:3FS VBP)
    (NEG_PART+PV+PVSUFF_SUBJ:3MS VBP)
    (SUB+IV1P+IV VBP)
    (VERB VBP)
    (PART+VERB VBP)

    ; VBN (passive verb, using old past participle tag)
    (FUT+IV3FS+VERB_PASSIVE VBN)
    (FUT+IV3MS+VERB_PASSIVE VBN)
    (IV1P+VERB_PASSIVE VBN)
    (IV1S+VERB_PASSIVE VBN)
    (IV2MS+VERB_PASSIVE VBN)
    (IV3FS+VERB_PASSIVE VBN)
    (IV3MP+VERB_PASSIVE+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (IV3MS+VERB_PASSIVE VBN)
    (VERB_PASSIVE VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:1S VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3FS VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3MD VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3MP VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3MS VBN)
    (VERB_PASSIVE+CVSUFF_SUBJ:2FS VBN)
    (FUT+IV3FS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (FUT+IV3FS+VERB_IMPERFECT_PASSIVE VBN)
    (FUT+IV3MD+IV_PASS+IVSUFF_SUBJ:D_MOOD:I VBN)
    (IV3MD+IV_PASS+IVSUFF_SUBJ:D_MOOD:SJ VBN)
    (FUT+IV3MP+VERB_IMPERFECT_PASSIVE+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (FUT+IV3MS+VERB_IMPERFECT_PASSIVE VBN)
    (FUT+IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV3FS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1P+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV2MS+VERB_IMPERFECT_PASSIVE VBN)
    (IV2MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV2MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV3FS+VERB_IMPERFECT_PASSIVE VBN)
    (IV3FS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV3MP+VERB_IMPERFECT_PASSIVE+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (IV3MP+VERB_IMPERFECT_PASSIVE+IVSUFF_SUBJ:MP_MOOD:SJ VBN)
    (IV3MS+VERB_IMPERFECT_PASSIVE VBN)
    (IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3FS VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3FP VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3MD VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3MP VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3MS VBN)
    (SUBJUNC+IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (FUT+IV2MS+IV_PASS+IVSUFF_MOOD:I VBN)
    (FUT+IV3FS+IV_PASS+IVSUFF_MOOD:I VBN)
    (FUT+IV3MP+IV_PASS+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (FUT+IV3MS+IV_PASS+IVSUFF_MOOD:I VBN)
    (FUT+IV3MS+IV_PASS+IVSUFF_MOOD:S VBN)
    (IV1P+IV_PASS+IVSUFF_MOOD:I VBN)
    (IV1P+IV_PASS+IVSUFF_MOOD:S VBN)
    (IV1S+IV_PASS+IVSUFF_MOOD:S VBN)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV3FS+IV_PASS+IVSUFF_MOOD:I VBN)
    (IV3FS+IV_PASS+IVSUFF_MOOD:J VBN)
    (IV3FS+IV_PASS+IVSUFF_MOOD:S VBN)
    (IV2MS+IV_PASS+IVSUFF_MOOD:I VBN)
    (IV2MS+IV_PASS+IVSUFF_MOOD:S VBN)
    (IV2MS+IV_PASS+IVSUFF_MOOD:J VBN)
    (IV3MD+IV_PASS+IVSUFF_SUBJ:D_MOOD:I VBN)
    (IV3MP+IV_PASS+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (IV3MP+IV_PASS+IVSUFF_SUBJ:MP_MOOD:SJ VBN)
    (IV3MS+IV_PASS+IVSUFF_MOOD:I VBN)
    (IV3MS+IV_PASS+IVSUFF_MOOD:J VBN)
    (IV3MS+IV_PASS+IVSUFF_MOOD:S VBN)
    (PV_PASS+PVSUFF_SUBJ:1S VBN)
    (PV_PASS+PVSUFF_SUBJ:1P VBN)
    (PV_PASS+PVSUFF_SUBJ:3FD VBN)
    (PV_PASS+PVSUFF_SUBJ:3FP VBN)
    (PV_PASS+PVSUFF_SUBJ:3FS VBN)
    (PV_PASS+PVSUFF_SUBJ:3MD VBN)
    (PV_PASS+PVSUFF_SUBJ:3MP VBN)
    (PV_PASS+PVSUFF_SUBJ:3MS VBN)
    (SUB+IV3FS+IV_PASS+IVSUFF_MOOD:S VBN)
    (JUS+IV3MS+IV_PASS+IVSUFF_MOOD:J VBN)
    (ASP_PART+IV1P+IV VBN)
    (ASP_PART+IV1P+IV_PASS VBN)
    (ASP_PART+IV1S+IV VBN)
    (ASP_PART+IV2FS+IV VBN)
    (ASP_PART+IV2FS+IV+IVSUFF_SUBJ:2FS VBN)
    (ASP_PART+IV2MP+IV VBN)
    (ASP_PART+IV2MS+IV VBN)
    (ASP_PART+IV3F+IV VBN)
    (ASP_PART+IV3FS+IV VBN)
    (ASP_PART+IV3FS+IV_PASS VBN)
    (ASP_PART+IV3MP+IV+IVSUFF_MOOD:I VBN)
    (ASP_PART+IV3MP+IV+IVSUFF_SUBJ:1P VBN)
    (ASP_PART+IV3MP+IV+IVSUFF_SUBJ:3MP VBN)
    (ASP_PART+IV3MP+IV+IVSUFF_SUBJ:MP VBN)
    (ASP_PART+IV3MP+IV+IVSUFF_SUBJ:P VBN)
    (ASP_PART+IV3MP+IV_PASS+IVSUFF_SUBJ:MP VBN)
    (ASP_PART+IV3MS+IV VBN)
    (ASP_PART+IV3MS+IV_PASS VBN)
    (ASP_PART+IV3P+IV+IVSUFF_SUBJ:3P VBN)
    (FUT+IV3FS+IV_PASS VBN)
    (FUT+IV3FS+IV_PASS+IVSUFF_MOOD:J VBN)
    (FUT+IV3MS+IV_PASS VBN)
    (IV1P+IV_PASS VBN)
    (IV1P+IV_PASS+IVSUFF_MOOD:J VBN)
    (IV1S+IV_PASS+IVSUFF_MOOD:I VBN)
    (IV2D+IV_PASS+IVSUFF_SUBJ:D_MOOD:SJ VBN)
    (IV2MS+IV_PASS VBN)
    (IV3FS+IV_PASS VBN)
    (IV3MS+IV_PASS VBN)
    (IV_PASS VBN)
    (JUS+IV1P+IV VBN)
    (PV VBN)
    (PV_PASS VBN)
    (PV_PASS+PVSUFF_SUBJ:2MS VBN)
    (PV_PASS+PVSUFF_SUBJ:3F VBN)
    (PV+PVSUFF_SUBJ:3F VBN)
    (PV+PVSUFF_SUBJ:3MS+PVSUFF_DO:3FS VBN)
    (PV+PVSUFF_SUBJ:3P VBN)
    (PVSUFF_DO:2FS VBN)
    (PVSUFF_DO:3FP VBN)

    ; UH
    (INTERJ UH)
    (INTERJ+NSUFF_MASC_SG_ACC_INDEF UH)
    (INTERJ+CASE_INDEF_ACC UH)
    (INTERJ+CASE_INDEF_NOM UH)

    ; PRP
    (CVSUFF_DO:3MS PRP)
    (CVSUFF_DO:1P PRP)
    (CVSUFF_DO:1S PRP)
    (CVSUFF_DO:3MP PRP)
    (CVSUFF_DO:2MS PRP)
    (CVSUFF_DO:3FS PRP)
    (IVSUFF_DO:1P PRP)
    (IVSUFF_DO:1S PRP)
    (IVSUFF_DO:2FS PRP)
    (IVSUFF_DO:2MP PRP)
    (IVSUFF_DO:2MS PRP)
    (IVSUFF_DO:3D PRP)
    (IVSUFF_DO:3FS PRP)
    (IVSUFF_DO:3MP PRP)
    (IVSUFF_DO:3MS PRP)
    (PRON PRP)
    (PRON_1P PRP)
    (PRON_1S PRP)
    (PRON_2D PRP)
    (PRON_2FP PRP)
    (PRON_2FS PRP)
    (PRON_2MP PRP)
    (PRON_2MS PRP)
    (PRON_3D PRP)
    (PRON_3FP PRP)
    (PRON_3FS PRP)
    (PRON_3MP PRP)
    (PRON_3MS PRP)
    (PVSUFF_DO:1P PRP)
    (PVSUFF_DO:1S PRP)
    (PVSUFF_DO:2MP PRP)
    (PVSUFF_DO:2MS PRP)
    (PVSUFF_DO:3D PRP)
    (PVSUFF_DO:3FS PRP)
    (PVSUFF_DO:3MP PRP)
    (PVSUFF_DO:3MS PRP)
    (PVSUFF_DO:3MS+CASE_DEF_GEN PRP)
    (PVSUFF_SUBJ:1P PRP)
    (PVSUFF_SUBJ:1S PRP)
    (PVSUFF_SUBJ:3FS PRP)
    (PRON_1MP PRP)
    (PRON_2P PRP)
    (PRON_3P PRP)
    (PERP PRP)

    ; PRP$
    (POSS_PRON_1P PRP$)
    (POSS_PRON_1S PRP$)
    (POSS_PRON_2FP PRP$)
    (POSS_PRON_2FS PRP$)
    (POSS_PRON_2MP PRP$)
    (POSS_PRON_2MS PRP$)
    (POSS_PRON_3D PRP$)
    (POSS_PRON_3FP PRP$)
    (POSS_PRON_3FS PRP$)
    (POSS_PRON_3MP PRP$)
    (POSS_PRON_3MS PRP$)
    (NOUN+POSS_PRON_1P PRP$)
    (NOUN+POSS_PRON_2MP PRP$)
    (NOUN+POSS_PRON_2MS PRP$)
    (NOUN+POSS_PRON_3FS PRP$)
    (NOUN+POSS_PRON_3MP PRP$)
    (NOUN+POSS_PRON_3MS PRP$)
    (POSS_PRON_3P PRP$)

    ; WRB
    (REL_ADV WRB)

    ; WP
    (REL_PRON WP)
    (REL_PRON+NSUFF_MASC_SG_ACC_INDEF WP)
    (REL_PRON+CASE_INDEF_ACC WP)
    (REL_PRON+PREP WP)

    ; VBD
    (VERB_PERFECT VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:1P VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:1S VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:2FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:2MP VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:2MS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FD VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FP VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MD VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MP VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MS VBD)
    (NEG_PART+VERB_PERFECT+PVSUFF_SUBJ:3FS VBD)
    (NEG_PART+VERB_PERFECT+PVSUFF_SUBJ:3MS VBD)
    (PV+PVSUFF_SUBJ:1P VBD)
    (PV+PVSUFF_SUBJ:1S VBD)
    (PV+PVSUFF_SUBJ:2FS VBD)
    (PV+PVSUFF_SUBJ:2MP VBD)
    (PV+PVSUFF_SUBJ:2MS VBD)
    (PV+PVSUFF_SUBJ:3FD VBD)
    (PV+PVSUFF_SUBJ:3FP VBD)
    (PV+PVSUFF_SUBJ:3FS VBD)
    (PV+PVSUFF_SUBJ:3MD VBD)
    (PV+PVSUFF_SUBJ:3MP VBD)
    (PV+PVSUFF_SUBJ:3MS VBD)
    (PV+PVSUFF_SUBJ:3MS+PVSUFF_SUBJ:3FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MS+PVSUFF_SUBJ:3FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MS+PVSUFF_SUBJ:3MS VBD)

    ; VB (used for imperative here)
    (VERB_IMPERATIVE+CVSUFF_SUBJ:2MP VB)
    (VERB_IMPERATIVE+CVSUFF_SUBJ:2MS VB)
    (CV+CVSUFF_SUBJ:2FS VB)
    (CV+CVSUFF_SUBJ:2MP VB)
    (CV+CVSUFF_SUBJ:2MS VB)
    (CV+CVSUFF_SUBJ:2MS+CVSUFF_DO:1P VB)
    (CV+CVSUFF_SUBJ:2MS+CVSUFF_DO:1S VB)
    (CV VB)

    ; CD
    (NUM CD)
    (DET+NUM+CASE_DEF_ACC CD)
    (DET+NUM+CASE_DEF_GEN CD)
    (DET+NUM+NSUFF_FEM_SG+CASE_DEF_ACC CD)
    (DET+NUM+NSUFF_FEM_SG+CASE_DEF_GEN CD)
    (DET+NUM+NSUFF_FEM_SG+CASE_DEF_NOM CD)
    (DET+NUM+NSUFF_MASC_DU_ACC CD)
    (DET+NUM+NSUFF_MASC_DU_GEN CD)
    (DET+NUM+NSUFF_MASC_DU_NOM CD)
    (DET+NUM+NSUFF_MASC_PL_ACC CD)
    (DET+NUM+NSUFF_MASC_PL_GEN CD)
    (DET+NUM+NSUFF_MASC_PL_NOM CD)
    (NUM+CASE_DEF_ACC CD)
    (NUM+CASE_DEF_GEN CD)
    (NUM+CASE_DEF_NOM CD)
    (NUM+CASE_INDEF_ACC CD)
    (NUM+CASE_INDEF_GEN CD)
    (NUM+CASE_INDEF_NOM CD)
    (NUM+NSUFF_FEM_SG+CASE_DEF_ACC CD)
    (NUM+NSUFF_FEM_SG+CASE_DEF_GEN CD)
    (NUM+NSUFF_FEM_SG+CASE_DEF_NOM CD)
    (NUM+NSUFF_FEM_SG+CASE_INDEF_ACC CD)
    (NUM+NSUFF_FEM_SG+CASE_INDEF_GEN CD)
    (NUM+NSUFF_FEM_SG+CASE_INDEF_NOM CD)
    (NUM+NSUFF_FEM_DU_ACC CD)
    (NUM+NSUFF_FEM_DU_GEN CD)
    (NUM+NSUFF_FEM_DU_NOM CD)
    (NUM+NSUFF_FEM_DU_GEN_POSS CD)
    (NUM+NSUFF_FEM_PL+CASE_DEF_GEN CD)
    (NUM+NSUFF_MASC_DU_ACC_POSS CD)
    (NUM+NSUFF_MASC_DU_GEN CD)
    (NUM+NSUFF_MASC_DU_GEN_POSS CD)
    (NUM+NSUFF_MASC_DU_NOM CD)
    (NUM+NSUFF_MASC_DU_NOM_POSS CD)
    (NUM+NSUFF_MASC_PL_ACC CD)
    (NUM+NSUFF_MASC_PL_GEN CD)
    (NUM+NSUFF_MASC_PL_NOM CD)
    (NUM+NSUFF_MASC_PL_ACC_POSS CD)
    (ADJ_NUM CD)
    (ADJ_NUM+CASE_DEF_ACC CD)
    (ADJ_NUM+CASE_DEF_GEN CD)
    (ADJ_NUM+CASE_DEF_NOM CD)
    (ADJ_NUM+CASE_INDEF_ACC CD)
    (ADJ_NUM+CASE_INDEF_GEN CD)
    (ADJ_NUM+CASE_INDEF_NOM CD)
    (ADJ_NUM+NSUFF_FEM_SG+CASE_DEF_GEN CD)
    (ADJ_NUM+NSUFF_FEM_SG+CASE_DEF_NOM CD)
    (ADJ_NUM+NSUFF_FEM_SG+CASE_INDEF_ACC CD)
    (ADJ_NUM+NSUFF_FEM_SG+CASE_INDEF_GEN CD)
    (ADJ_NUM+NSUFF_FEM_SG+CASE_INDEF_NOM CD)
    (DET+NUM CD)
    (DET+NUM+CASE_DEF_NOM CD)
    (DET+NUM+NSUFF_FEM_DU_ACCGEN_POSS CD)
    (DET+NUM+NSUFF_FEM_SG CD)
    (DET+NUM+NSUFF_MASC_DU CD)
    (CONJ+NUM+CASE_INDEF_ACC CD)
    (DET+ADJ_NUM+NSUFF_MASC_PL_GEN CD)

    ; FW
    (DET+FOREIGN FW)
    (DIALECT FW)
    (FOREIGN FW)
    (TRANSERR FW)
    (TYPO FW)
    (GRAMMAR_PROBLEM FW)
    (PARTIAL FW)
)

;;; THE FOLLOWING DATA IS CURRENTLY NOT USED BY danbikel.parser.english.Training

;;; a list of contexts in which baseNP's can occur
;;; the syntax is: (base-np <context>+)
;;; where
;;; <context>    ::= (<parent> (<child>+)) | (<parent> <context>)
;;; <parent>     ::= the symbol of a parent nonterminal
;;; <child>      ::= <childsym> | (not <childsym>)
;;; <childsym>   ::= the symbol of a child nonterminal
;;;
;;; where (not <childsym>) matches any symbol that is not <childsym>.
(base-np (NP ((not NP)))
	 (NP (NP (head POS))))
