<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>After Hours</title>
    <%--<link rel="shortcut icon" href="/images/icon.ico" type="image/x-icon" />--%> 
    <style type="text/css">
        .body {
            margin: 0px;
            position: relative;
            width: 80%;
            padding-left: 10%;
            padding-top: -20%;
            padding-right: 15%;
            float: left;
            clip: rect(auto, 15%, auto, auto);
            height: 150%;
            background-color: #FFFFFF;
            text-align: center;
            top: 30%;
        }
        .visible {
            margin: auto;
            border-style: solid;
            z-index: auto;
            width: 60%;
            position: relative;
            padding-top: 5%;
            font-size: x-large;
            text-align: center;
            top: 50%;
            padding-bottom: 3%;
        }
        .newStyle1 {
            border-style: solid;
            left: 15%;
            position: inherit;
            top: 25%;
            text-align: left;
            height: 150%;
            width: 50%;
            font-size: x-large;
            padding-left: 20%;
        }
        .modalBackground {
            height: 100%;
            background-color: #EBEBEB;
            filter: alpha(opacity=80);
            opacity: 0.8;
            top: 20%;
            position: fixed;
        }
        .panel {
            border-style: solid;
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            position: absolute;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div id ="invisible" runat ="server" class="body">
        <h1 class="body"> After Hours Call Log<br />
            </h1>
            <br />
        <br />
        <br />
            <div class="newStyle1">
                <br />
                <br />

        <asp:Label ID="lblDATE" runat="server" Text="Date:"></asp:Label>
                <asp:TextBox ID="txtDATE" runat="server" Width="80px"></asp:TextBox>
&nbsp;<ajaxToolkit:CalendarExtender ID="txtDATE_CalendarExtender" runat="server" BehaviorID="txtDATE_CalendarExtender" TargetControlID="txtDATE" />
&nbsp;
                <br />
                <br />

        <asp:Label ID="lblTIME" runat="server" Text="Time:"></asp:Label>
                <asp:DropDownList ID="ddlHOUR" runat="server" Width="50px">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text=":"></asp:Label>
                <asp:DropDownList ID="ddlMINUTE" runat="server" Width="50px">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlPERIOD" runat="server">
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />

        <asp:Label ID="lblEMPLOYEE_NAME" runat="server" Text="Entered By:"></asp:Label>
        <asp:DropDownList ID="ddlEMPLYEE_NAME" runat="server" style="margin-right: 150px" Width="150px" AppendDataBoundItems="True" EnableTheming="True" Font-Bold="False">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblCONTACT_Name" runat="server" Text=" Contact Name:"></asp:Label>
        <asp:TextBox ID="txtCONTACT_NAME" runat="server" style="margin-top: 0px" Width="150px"></asp:TextBox>
                <br />
         <br />
        <asp:Label ID="lblDESCRIPTION" runat="server" Text="Description:"></asp:Label>

        <br />
        <asp:TextBox ID="txtDESCRIPTION" runat="server" Height="176px" style="margin-bottom: 0px" TextMode="MultiLine" Width="462px"></asp:TextBox>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TrackerConnectionString %>" SelectCommand="SELECT [FULL_NAME] FROM [tblTeamMembers]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AfterHoursConnectionString %>" InsertCommand="INSERT INTO Call_log(SYSTEM_DATE, EMPLOYEE_NAME, CONTACT_NAME, DESCRIPTION) VALUES (@time, @eName, @cName, @dsp)" SelectCommand="SELECT * FROM [Call_log]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID ="lblDATE_TIME" Name="time" PropertyName ="Text" />
                        <asp:ControlParameter ControlID="ddlEMPLYEE_NAME" Name="eName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="txtCONTACT_NAME" Name="cName" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtDESCRIPTION" Name="dsp" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblDATE_TIME" runat="server" Visible="False"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSUBMIT" runat="server" Text="Submit" />
        <br />

        <%--popup window--%>
        <asp:label ID="hidForModal" runat="server" Text=" " style="display:none"/>
        <asp:Panel ID="ErrMessage" runat="server" Width="500px" CssClass="panel" Visible ="true" >
            <br />
            <asp:Label ID="Err" runat="server" Text="test" />
            <br />
            <asp:Button ID="OKButton" runat="server" Text="OK" CausesValidation="False" />
            <br />
            <br />
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlID="hidForModal" PopupControlID="ErrMessage" OkControlID="OKButton" BackgroundCssClass="modalBackground" DropShadow="True" />
        <asp:ScriptManager ID="asm" runat="server" />
        <br />
    </div>
        </div>
        <%--success information window--%>
        <div id="visible" runat="server" style="display:none ; top: 243px; height: 82px;" class ="visible">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblSuccess" runat="server" Text="You've successfully submitted the Information!"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnSuccess" runat="server" Text="Close"></asp:Button>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div> 
    </form>
</body>
</html>
