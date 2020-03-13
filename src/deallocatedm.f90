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

SUBROUTINE DEALLOCATEDM

  USE CONSTANTS_MOD
!  USE XBOARRAY
!  USE SPINARRAY
  USE MYPRECISION
  USE DMARRAY

  IMPLICIT NONE

  IF (EXISTERROR) RETURN

  !
  ! This depends on whether we're propagating the
  ! on-site H matrix elements (in the case of LCN calculations)
  ! or the atomic partial charges (full SCC-TB)


  DEALLOCATE(PNO,PO_0, PO_1, PO_2, PO_3)
  DEALLOCATE(PO_4, PO_5, PO_6, PO_7)
  DEALLOCATE(POrth, DOrth, DOrth_old, IXMAT)
  DEALLOCATE(H_INDEX_START, H_INDEX_END, DELTAQDM, DFTB_U)
  DEALLOCATE(PS, SU, Delta_DS)
  DEALLOCATE(HubForce,AHub)

  RETURN

END SUBROUTINE DEALLOCATEDM

