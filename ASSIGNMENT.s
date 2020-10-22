  AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION
    VLDR.F32 s1, = 6 ;  S1 is storing X Of LOG(1+X)
	VLDR.F32 s7, = 1 ;
	VLDR.F32 s9, = 0 ; This Fp will display the result of LOG(1+X)
	MOV R5, #1 ; intitalizing power to 1
	MOV R3, #2 
	MOV R8, #1 
	
	
	MOV R9, #20 ; Number of iterations It will be doing 
mult_	  VMUL.F32 s7,s7,s1 	                                
		
conversion		VCVT.F32.u32 s0,s0
	            VDIV.F32 s4,s7,s0  

pow  udiv r4,R5,r3
	 mls  r4,r4,r3,R5
	 cmp r4, #0 
	 vmov s0,R5
	 beq even
     bne odd
	 
	 
	 
	 

odd  VADD.F32 s9,s9,s4  ;If it is odd here will be adding
	 ADD R5,R5, #1	
	 b iter
	 
even VSUB.F32 s9,s9,s4  ;If it is odd here will be SUBTRACTING
     ADD R5,R5, #1
	 
 
iter SUB R9,R9, #1
	 CMP R9, #0
	 BGT mult_
	 
	 
stop	B stop; stop program	 
		 
     ENDFUNC
     END
	 
;git link https://github.com/opnesh/LOG-SERIES.git	 
