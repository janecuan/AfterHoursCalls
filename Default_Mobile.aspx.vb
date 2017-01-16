Imports System.Collections.Generic
Imports System.Data
Imports System.Web.UI.ClientScriptManager

Partial Class Default_Mobile
    Inherits System.Web.UI.Page
    Dim result As Boolean
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            lblCURRENT_TIME.Text = Now.ToString("MM/dd/yyyy hh:mm tt")
            ddlEMPLYEE_NAME.DataBind()
            ddlEMPLYEE_NAME.Items.Insert(0, New ListItem("Select", ""))
        End If
    End Sub

    Protected Sub btnSuccess_Click(sender As Object, e As EventArgs) Handles btnSuccess.Click
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub

    Protected Sub OKButton_Click(sender As Object, e As EventArgs) Handles OKButton.Click
        mpe.Hide()
    End Sub

    Protected Sub btnSUBMIT_Click(sender As Object, e As EventArgs) Handles btnSUBMIT.Click

        Try
            SqlDataSource2.Insert()

            invisible.Style.Add("display", "none")
            visible.Style.Add("display", "block")
        Catch ex As Exception
            If ddlEMPLYEE_NAME.SelectedIndex = 0 Then
                Err.Text = "Please select a name."
                mpe.Show()
            ElseIf txtCONTACT_NAME.Text = "" Then
                Err.Text = "Please enter the contact name."
                mpe.Show()
            ElseIf txtDESCRIPTION.Text = "" Then
                Err.Text = "Please enter the problem description."
                mpe.Show()
            Else
                Err.Text = "Check your time input"
                mpe.Show()
            End If
        End Try
    End Sub

End Class
