! HERE THE SUPER-HUBBLE PERIOD FOR EACH MODE IS DETERMINED
SUBROUTINE FIND_SHS(KMODE)

  USE RKSUITE_90_PREC
  USE PARAMETERS
  USE BACKGROUND_PATH
  USE STOREK

  IMPLICIT NONE

  REAL(WP)::KMODE,TEMP1,EPSILON1

  INTEGER::EFOLD
  LOGICAL::NSHS_NOTFOUND
  

  

  NSHS_NOTFOUND=.TRUE.


  EPSILON1=(KMODE*NSHS_COND/(AI*dEXP(EF(1)))-HUBBLE(1))

  
  
  NSHS_SOLUTION_REGION1:IF(EPSILON1>0.0_WP) THEN
     NSHS_LOOP1: DO EFOLD=2,ESEARCH
        TEMP1=(KMODE*NSHS_COND/(AI*dEXP(EF(EFOLD)))-HUBBLE(EFOLD))
        NSHS=EF(EFOLD)
        IF(TEMP1<0.0_WP) THEN
           NSHS_NOTFOUND=.FALSE.
           EXIT
        END IF
     END DO NSHS_LOOP1
  END IF NSHS_SOLUTION_REGION1
  
  NSHS_SOLUTION_REGION2:IF(EPSILON1<0.0_WP) THEN
     NSHS_LOOP2: DO EFOLD=2,ESEARCH
        TEMP1=(KMODE*NSHS_COND/(AI*dEXP(EF(EFOLD)))-HUBBLE(EFOLD))
        NSHS=EF(EFOLD)
        IF(TEMP1>0.0_WP) THEN
           NSHS_NOTFOUND=.FALSE.
           EXIT
        END IF
     END DO NSHS_LOOP2
  END IF NSHS_SOLUTION_REGION2
  
  
  
  IF(NSHS_NOTFOUND) STOP 'NSHS NOT FOUND:MAYBE OUT OF THE RANGE'
 
END SUBROUTINE FIND_SHS