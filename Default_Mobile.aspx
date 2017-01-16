<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default_Mobile.aspx.vb" Inherits="Default_Mobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mobile Test</title>
    <%--<link rel="shortcut icon" href="/images/icon.ico" type="image/x-icon" />--%> 
    <style type="text/css">
        .body {
            padding: 0%;
            margin: 0px;
            position: static;
            width: 100%;
            float: left;
            clip: rect(auto, 15%, auto, auto);
            height: 150%;
            background-color: #FFFFFF;
            text-align: center;
        }
        .visible {
            border-style: solid;
            z-index: auto;
            position: static;
            padding-top: 5%;
            font-size: x-large;
            text-align: center;
            padding-bottom: 5%;
            top: 100%;
            margin-top: 20%;
            margin-right: 20%;
            margin-left: 20%;
        }
        .newStyle1 {
            border-style: solid;
            position: static;
            top: 20%;
            text-align: left;
            font-size: 50px;
            overflow: auto;
        }
        .modalBackground {
            height: 100%;
            background-color: #EBEBEB;
            filter: alpha(opacity=90);
            opacity: 0.9;
            top: -20%;
            position: fixed;
        }
        .panel {
            border-style: solid;
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            position: static;
            top: -30px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="body" style="text-align: center"> After Hours Call Log (Mobile)<br />
            </h1>
        <br />
        <br />
        <div id ="invisible" runat ="server" class="body">
            <br />
        <br />
            <div class="newStyle1">
        &nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblTIME" runat="server" Text="Time:" ></asp:Label>
                <asp:Label ID="lblCURRENT_TIME" runat="server"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblEMPLOYEE_NAME" runat="server" Text="Entered By:"></asp:Label>
        <asp:DropDownList ID="ddlEMPLYEE_NAME" runat="server" style="margin-right: 150px" Width="200px" AppendDataBoundItems="True" EnableTheming="True" Font-Bold="False" DataSourceID="SqlDataSource1" DataTextField="FULL_NAME" DataValueField="FULL_NAME" Font-Size="X-Large" >
        </asp:DropDownList>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCONTACT_NAME" runat="server" Text="Contact Name:"></asp:Label>
        <asp:TextBox ID="txtCONTACT_NAME" runat="server" style="margin-top: 0px" Width="150px" Font-Size="X-Large" ></asp:TextBox>

                <br />
         <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblDESCRIPTION" runat="server" Text="Description:"></asp:Label>

        <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="txtDESCRIPTION" runat="server" Height="176px" style="margin-bottom: 0px" TextMode="MultiLine" Width="400px" Font-Size="Large"></asp:TextBox>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TrackerConnectionString %>" SelectCommand="SELECT [FULL_NAME] FROM [tblTeamMembers] ORDER BY [FULL_NAME]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfterHoursConnectionString1 %>" SelectCommand="SELECT [EMPLOYEE_NAME], [CONTACT_NAME], [DESCRIPTION] FROM [Call_log]" InsertCommand="INSERT INTO Call_log(EMPLOYEE_NAME, CONTACT_NAME, DESCRIPTION, SYSTEM_DATE) VALUES (@eName, @cName, @dsp, @time)">
            <InsertParameters>
                <asp:ControlParameter ControlID="ddlEMPLYEE_NAME" Name="eName" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtCONTACT_NAME" Name="cName" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtDESCRIPTION" Name="dsp" PropertyName="Text" />
                <asp:ControlParameter ControlID="lblCURRENT_TIME" Name="time" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSUBMIT" runat="server" Text="Submit" CssClass="newStyle2" Font-Size="Large" />
        <br />

        <%--popup window--%>
        <asp:label ID="hidForModal" runat="server" Text=" " style="display:none"/>
        <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlID="hidForModal" PopupControlID="ErrMessage" OkControlID="OKButton" BackgroundCssClass="modalBackground" DropShadow="True" />
        <asp:ScriptManager ID="asm" runat="server" />
        <br />
    </div>
        </div>
        <%--success window--%>
        <div id="visible" runat="server" style="display:none ; top: 243px; height: 82px;" class ="visible">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblSuccess" runat="server" Text="You've successfully submitted the Information!" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
        <asp:Button ID="btnSuccess" runat="server" Text="Close" Font-Size="Large"></asp:Button>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div> 
        <asp:Panel ID="ErrMessage" runat="server" Width="500px" CssClass="panel" Visible ="true" >
            <br />
            <asp:Label ID="Err" runat="server" Text="test" />
            <br />
            <asp:Button ID="OKButton" runat="server" Text="OK" CausesValidation="False" />
            <br />
            <br />
        </asp:Panel>
    </form>
</body>
</html>
