#include "hbclass.ch"

Function Main()
    LOCAL o := TTest():New()

    o:Increment()
    Alert( o:nVar )
Return nil

CLASS TTest
   VAR nVar
   METHOD New CONSTRUCTOR
   METHOD Increment()
ENDCLASS

METHOD New //CLASS TTest /* CLASS clause now optional */
   ::nVar := 0
return Self

METHOD Increment CLASS TTest // () No longer required
Return (++::nVar)
