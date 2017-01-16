Imports System.Collections.Generic
Imports System.Data
Imports System.Web.UI.ClientScriptManager

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim callDate As String
    Dim hour As String
    Dim minute As String
    Dim period As String
    Dim dateTime As DateTime
    Protected Sub btnSUBMIT_Click(sender As Object, e As EventArgs) Handles btnSUBMIT.Click
        Try
            callDate = txtDATE.Text
            hour = ddlHOUR.SelectedValue
            minute = ddlMINUTE.SelectedValue
            period = ddlPERIOD.SelectedValue
            Dim dateTimeString As String = callDate + " " + hour + ":" + minute + ":" + "00" + " " + period
            lblDATE_TIME.Text = dateTimeString

            SqlDataSource2.Insert()

            invisible.Style.Add("display", "none")
            visible.Style.Add("display", "block")

        Catch ex As Exception
            If ddlEMPLYEE_NAME.SelectedIndex = 0 Then
                Err.Text = "Error: Please select a name."
                mpe.Show()
            ElseIf txtCONTACT_NAME.Text = "" Then
                Err.Text = "Error: Please enter your name."
                mpe.Show()
            ElseIf txtDESCRIPTION.Text = "" Then
                Err.Text = "Error: Please enter the problem description."
                mpe.Show()
            Else
                Err.Text = "Error: Check the time you entered."
                mpe.Show()
            End If
        End Try
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        
        If Not IsPostBack Then
            Dim strUserAgent As String = Request.UserAgent.ToString().ToLower

            If Request.Browser.IsMobileDevice Or strUserAgent.Contains("iphone") Or strUserAgent.Contains("blackberry") Or strUserAgent.Contains("mobile") Or strUserAgent.Contains("windows ce") Or strUserAgent.Contains("opera mini") Or strUserAgent.Contains("palm") Then
                Response.Redirect("Default_Mobile.aspx")
                Return
            End If

            'Initialize what to be showed in time area
            hour = Now.ToString("hh")
            minute = Now.ToString("mm")
            period = Now.ToString("tt")
            ddlHOUR.SelectedValue = hour
            ddlMINUTE.Items.Insert(0, minute)
            ddlPERIOD.SelectedValue = period


            'initialize what to be showed in employee name dropdownlist (alphebatically, acsending )
            Dim ddList As New List(Of String)
            Dim dv As DataView = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
            For Each rowView As DataRowView In dv
                ddList.Add(rowView.Row(0).ToString)
            Next
            ddList.Sort()
            ddlEMPLYEE_NAME.DataSource = ddList
            ddlEMPLYEE_NAME.DataBind()
            ddlEMPLYEE_NAME.Items.Insert(0, "Select")


            txtDATE.Text = Now.ToString("MM/dd/yyyy")
        End If


        
    End Sub

    Protected Sub btnSuccess_Click(sender As Object, e As EventArgs) Handles btnSuccess.Click
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub

    Protected Sub OKButton_Click(sender As Object, e As EventArgs) Handles OKButton.Click
        mpe.Hide()
    End Sub

End Class
