!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Copyright 2010.  Los Alamos National Security, LLC. This material was    !
! produced under U.S. Government contract DE-AC52-06NA25396 for Los Alamos !
! National Laboratory (LANL), which is operated by Los Alamos National     !
! Security, LLC for the U.S. Department of Energy. The U.S. Government has !
! rights to use, reproduce, and distribute this software.  NEITHER THE     !
! GOVERNMENT NOR LOS ALAMOS NATIONAL SECURITY, LLC MAKES ANY WARRANTY,     !
! EXPRESS OR IMPLIED, OR ASSUMES ANY LIABILITY FOR THE USE OF THIS         !
! SOFTWARE.  If software is modified to produce derivative works, such     !
! modified software should be clearly marked, so as not to confuse it      !
! with the version available from LANL.                                    !
!                                                                          !
! Additionally, this program is free software; you can redistribute it     !
! and/or modify it under the terms of the GNU General Public License as    !
! published by the Free Software Foundation; version 2.0 of the License.   !
! Accordingly, this program is distributed in the hope that it will be     !
! useful, but WITHOUT ANY WARRANTY; without even the implied warranty of   !
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General !
! Public License for more details.                                         !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SUBROUTINE GETCOULE

  USE CONSTANTS_MOD
  USE SETUPARRAY
  USE COULOMBARRAY
  USE MYPRECISION

  IMPLICIT NONE

  INTEGER :: I
  REAL(LATTEPREC) :: VOLUME
  IF (EXISTERROR) RETURN

  ECOUL = ZERO

  DO I = 1, NATS

     ECOUL = ECOUL + DELTAQ(I) * &
          (HUBBARDU(ELEMPOINTER(I))*DELTAQ(I) + COULOMBV(I))

  ENDDO

  ECOUL = HALF*ECOUL
  
  ! Charged system term if we're doing Ewald summation

  IF (ELECMETH .EQ. 0) THEN

     ! Charged system term if we're doing Ewald summation
     
     VOLUME = ABS(BOX(1,1)*(BOX(2,2)*BOX(3,3) - BOX(3,2)*BOX(2,3)) - &
          BOX(1,2)*(BOX(2,1)*BOX(3,3) - BOX(3,1)*BOX(2,3)) + &
          BOX(1,3)*(BOX(2,1)*BOX(3,2) - BOX(3,1)*BOX(2,2)))
     
     ! KECONST = 1/(4*PI*EPSILON_0)
     
     ECOUL = ECOUL - (KECONST*PI/(TWO*VOLUME*CALPHA*CALPHA))*REAL(CHARGE*CHARGE)
     
  ENDIF

  RETURN

END SUBROUTINE GETCOULE

