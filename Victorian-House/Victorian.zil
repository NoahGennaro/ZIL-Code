"The Victorian House"

<VERSION ZIP>
<CONSTANT RELEASEID 1>

"Main loop"

<CONSTANT GAME-BANNER
"The Victorian House|
A basic IF Practice.|
Original game by Noah Gennaro">

<ROUTINE GO ()
    <CRLF> <CRLF>
    <TELL "____________________________________" CR CR>
    <INIT-STATUS-LINE>
    <V-VERSION> <CRLF>
    <SETG HERE ,FOYER>
    <MOVE ,PLAYER ,HERE>
    <V-LOOK>
    <MAIN-LOOP>>

<INSERT-FILE "parser">

"Objects"

;Basic Room Definition
;CEXIT, UEXIT, NEXIT, DEXIT, and FEXIT (denoted by PER) demonstrated

<ROOM LIVING-ROOM
	(LOC ROOMS)
	(DESC "Living Room")
	(EAST TO KITCHEN)
	(WEST TO STRANGE-PASSAGE IF CYCLOPS-FLED ELSE
		"The wooden door is nailed shut.")
	(DOWN PER TRAP-DOOR-EXIT)
	(UP SORRY "There isn't anything up there.")
	(ACTION LIVING-ROOM-F)
	(FLAGS RLANDBIT ONBIT SACREDBIT)
	(GLOBAL STAIRS)
	(THINGS <> NAILS NAILS-PSEUDO)>

	

;Basic Object Definition
;DESC, FDESC, AND LDESC

<OBJECT LANTERN
	(LOC LIVING-ROOM)
	(SYNONYM LAMP LANTERN LIGHT)
	(ADJECTIVE BRASS)
	(DESC "brass lantern")
	(FLAGS TAKEBIT LIGHTBIT)
	(ACTION LANTERN-F)
	(FDESC "A battery-powered lantern is on the trophy case.")
	(LDESC "There is a battery-powered lantern here.")
	(SIZE 15)>




;Basic Routine Example

<ROUTINE INCREMEMNT-SCORE (NUM)
	<SETG SCORE <+ ,SCORE .NUM>>
	<ROUTINE-B>
	<COND (,SCORE-NOTIFICATION-ON
		<TELL "[Your score has just gone up by " N .NUM ".]" CR>)>>


;"AUX" before an argument means it is not passed, but used locally
;"OPT" means optional arugment, can be passed bu doesn't have to be
; must be written in this order: passed, optional, and aux



;Conditional Examples

<ROUTINE FIND-FOOD ("AUX" FOOD)
	<COND (<IN? ,HAM-SANDWICH ,HERE>
			<SET FOOD ,HAM-SANDWICH>)
		  (<IN? ,CANDY-BAR ,HERE>
			<SET FOOD ,CANDY-BAR>)
		  (T
		   <SET FOOD <>)>
	.FOOD>




;can use <RTRUE> and <RFALSE> to force returning, and not complete
;rest of the function. Can also force return with <RETURN ,VAR>


;Action Routine Example

<ROUTINE CANDY-F ()
	<COND (<VERB? EAT>
		   <REMOVE ,CANDY>
		   <TELL "Yummy candy." CR>)
		   (<VERB? CUT-OPEN>
		   <FSET ,CANDY ,OPENBIT>
		   <MOVE ,CANDY-PIT ,CANDY>
		   <TELL "Here is a candy pit." CR>)>>

;FCLEAR and FSET to set and clear BITS



;,HERE is local variable used to hold current room
; <EQUAL? .... sees if two objects the same
; can have mutliple subsequent variables to compare it against
; ex...

<COND (<IS-OTTO-ON-ELBA?>
      <TEll "He is on Elba." CR>)>

<ROUTINE IS-OTTO-ON-ELBA? ()
	<COND (<EQUAL? <LOC ,UNCLE-OTTO> ,PARIS ,WATERLOO>
		  <RTRUE>)
		   (T
		   <RFALSE>)>>
	

;all global variables, objects, and room names started with comma
;local variables begin with period





