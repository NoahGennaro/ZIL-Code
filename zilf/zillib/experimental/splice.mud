<DEFINE SPLICE ("BIND" ENV 'STRUC)
    <SPLICE-IMPL .ENV .STRUC>>

<DEFINE SPLICE-IMPL (ENV STRUC "AUX" (P <PRIMTYPE .STRUC>) (T <TYPE .STRUC>) L)
    <COND (<==? .T SPLICE>
           <EVAL <1 .STRUC> .ENV>)
          (<MEMQ .P '(LIST VECTOR)>
           <CHTYPE <APPLY ,.P !<SPLICE-ELEMS .ENV .STRUC>> .T>)
          (ELSE .STRUC)>>

<DEFINE SPLICE-ELEMS (ENV STRUC)
    <MAPF ,VECTOR
          <FUNCTION (I) <SPLICE-IMPL .ENV .I>>
          .STRUC>>
