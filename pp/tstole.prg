#define CRLF Chr( 13 ) + Chr( 10 )

PROCEDURE MAIN()

   LOCAL nOption

      Excel()
      MsWord()
      IEXplorer()
      Outlook()

RETURN

//--------------------------------------------------------------------

STATIC PROCEDURE Excel()

   LOCAL oExcel, oAS

   oExcel := CreateObject( "Excel.Application" )

   oExcel:WorkBooks:Add()

   oAS := oExcel:ActiveSheet()

   oAS:Cells:Font:Name := "Arial"
   oAS:Cells:Font:Size := 12

   oAS:Cells( 3, 1 ):Value := "Text:"
   oAS:Cells( 3, 2 ):Value := "Here is some text"
   oAS:Cells( 4, 1 ):Value := "Numeric:"
   oAS:Cells( 4, 2 ):NumberFormat := "#.##0,00"
   oAS:Cells( 4, 2 ):Value := 1234.50
   oAS:Cells( 5, 1 ):Value := "Logical:"
   oAS:Cells( 5, 2 ):Value := .T.
   oAS:Cells( 6, 1 ):Value := "Date:"
   oAS:Cells( 6, 2 ):Value := DATE()

   oAS:Columns( 1 ):Font:Bold := .T.
   oAS:Columns( 2 ):HorizontalAlignment := -4152  // xlRight

   oAS:Columns( 1 ):AutoFit()
   oAS:Columns( 2 ):AutoFit()

   oAS:Cells( 1, 1 ):Value := "OLE from XBScript"
   oAS:Cells( 1, 1 ):Font:Size := 16
   oAS:Range( "A1:B1" ):HorizontalAlignment := 7

   oAS:Cells( 1, 1 ):Select()

   oAS:End()

   oExcel:Visible := .T.
   oExcel:End()

RETURN

//--------------------------------------------------------------------

STATIC PROCEDURE MsWord()

   LOCAL oWord, oText

   oWord:=TOleAuto():New( "Word.Application" )

   oWord:Documents:Add()

   oText := oWord:Selection()

   oText:Text := "OLE from XBScript" + CRLF
   oText:Font:Name := "Arial"
   oText:Font:Size := 48
   oText:Font:Bold := .T.

   oWord:Visible := .T.
   oWord:WindowState := 1  // Maximize

   oText:End()
   oWord:End()

RETURN

//--------------------------------------------------------------------

STATIC PROCEDURE IEXPLORER()

   LOCAL oIE

   oIE:=TOleAuto():New( "InternetExplorer.Application" )

   oIE:Visible := .T.

   oIE:Navigate( "http://www.xbasescript.com" )

   oIE:End()

RETURN

//--------------------------------------------------------------------

STATIC PROCEDURE OUTLOOK()

   LOCAL oOL, oList, oMail, i

   oOL := TOleAuto():New( "Outlook.Application.9" )

   oMail := oOL:CreateItem( 0 )  // olMailItem

   oList := oOL:CreateItem( 7 )  // olDistributionListItem
   oList:DLName := "Distribution List"
   oList:Display( .F. )

   oMail:End()
   oList:End()
   oOL:End()

RETURN

//--------------------------------------------------------------------
