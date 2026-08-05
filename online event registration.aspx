<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblMessage.Text = "Form submitted successfully!";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            ClearControls();
        }
        else
        {
            lblMessage.Text = "";
        }
    }

    private void ClearControls()
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;
        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;

        RadioButton2.Checked = false;
        RadioButton3.Checked = false;

        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
    }

    protected void CustomValidatorGender_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = RadioButton2.Checked || RadioButton3.Checked;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <style type="text/css">
        .error {
            color: red;
            font-size: 14px;
            font-weight: normal;
            margin-left: 8px;
        }
        .success-msg {
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</head>
<body style="font-weight: 700">
    <form id="form1" runat="server">

        <p>
            <strong>NAME :
            <asp:TextBox ID="TextBox1" runat="server" Height="32px" Width="176px"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="rfvTextBox1" runat="server" ControlToValidate="TextBox1" 
                ErrorMessage="Name is required." CssClass="error" Display="Dynamic">Name is required!</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" 
                ValidationExpression="^[a-zA-Z\s]+$" ErrorMessage="Name can only contain letters." 
                CssClass="error" Display="Dynamic">Letters only!</asp:RegularExpressionValidator>
        </p>

        <p>
            <strong>ENR NO :&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="31px" Width="152px"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="rfvTextBox2" runat="server" ControlToValidate="TextBox2" 
                ErrorMessage="Enrollment No is required." CssClass="error" Display="Dynamic">ENR NO is required!</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvTextBox2" runat="server" ControlToValidate="TextBox2" 
                Operator="DataTypeCheck" Type="Integer" ErrorMessage="Enrollment No must be numeric." 
                CssClass="error" Display="Dynamic">Must be numeric!</asp:CompareValidator>
        </p>

        <p>
            <strong>COURSE :&nbsp; 
            <asp:TextBox ID="TextBox3" runat="server" Height="31px" Width="158px"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="rfvTextBox3" runat="server" ControlToValidate="TextBox3" 
                ErrorMessage="Course is required." CssClass="error" Display="Dynamic">Course is required!</asp:RequiredFieldValidator>
        </p>

        <p>
            <strong>CLASS :&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Height="31px" Width="167px"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="rfvTextBox4" runat="server" ControlToValidate="TextBox4" 
                ErrorMessage="Class is required." CssClass="error" Display="Dynamic">Class is required!</asp:RequiredFieldValidator>
        </p>

        <p>
            <strong>GR NO :&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Height="27px" Width="176px"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="rfvTextBox5" runat="server" ControlToValidate="TextBox5" 
                ErrorMessage="GR No is required." CssClass="error" Display="Dynamic">GR NO is required!</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvTextBox5" runat="server" ControlToValidate="TextBox5" 
                Operator="DataTypeCheck" Type="Integer" ErrorMessage="GR No must be numeric." 
                CssClass="error" Display="Dynamic">Must be numeric!</asp:CompareValidator>
        </p>

        <p>
            <strong>GENDER :&nbsp;&nbsp; </strong>
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="GN" Text="MALE" />
            &nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="RadioButton3" runat="server" GroupName="GN" Text="FEMALE" />
            <asp:CustomValidator ID="cvGender" runat="server" 
                ErrorMessage="Please select Gender." OnServerValidate="CustomValidatorGender_ServerValidate" 
                CssClass="error" Display="Dynamic">Please select Gender!</asp:CustomValidator>
        </p>

        <p>
            <strong>CITY:&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="193px">
                <asp:ListItem Value="">-- SELECT CITY --</asp:ListItem>
                <asp:ListItem Value="RAJKOT">RAJKOT</asp:ListItem>
                <asp:ListItem Value="AHMEDABAD">AHMEDABAD</asp:ListItem>
                <asp:ListItem Value="SURAT">SURAT</asp:ListItem>
                <asp:ListItem Value="PORBANDAR">PORBANDAR</asp:ListItem>
            </asp:DropDownList>
            </strong>
            <asp:RequiredFieldValidator ID="rfvDropDownList1" runat="server" ControlToValidate="DropDownList1" 
                InitialValue="" ErrorMessage="Please select City." CssClass="error" Display="Dynamic">Please select City!</asp:RequiredFieldValidator>
        </p>

        <p>
            <strong>
            <asp:Label ID="Label1" runat="server" Text="EVENT NAME :"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Value="">-- SELECT EVENT --</asp:ListItem>
                <asp:ListItem Value="AI SMASHER">AI SMASHER</asp:ListItem>
                <asp:ListItem Value="CODING NINJA">CODING NINJA</asp:ListItem>
                <asp:ListItem Value="HACK IT DOWN">HACK IT DOWN</asp:ListItem>
                <asp:ListItem Value="SWEET SERVER">SWEET SERVER</asp:ListItem>
            </asp:DropDownList>
            </strong>
            <asp:RequiredFieldValidator ID="rfvDropDownList2" runat="server" ControlToValidate="DropDownList2" 
                InitialValue="" ErrorMessage="Please select Event Name." CssClass="error" Display="Dynamic">Please select Event!</asp:RequiredFieldValidator>
        </p>

        <p>
            <strong>
            <asp:Label ID="Label2" runat="server" Text="EVENT DATE :"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox6" runat="server" Height="28px" TextMode="Date"></asp:TextBox>
            </strong>
            <asp:RequiredFieldValidator ID="rfvTextBox6" runat="server" ControlToValidate="TextBox6" 
                ErrorMessage="Please select Event Date." CssClass="error" Display="Dynamic">Date is required!</asp:RequiredFieldValidator>
        </p>

        <p>
            <asp:Button ID="Button1" runat="server" Text="SUBMIT" ForeColor="Blue" OnClick="Button1_Click" />
        </p>

        <p>
            <asp:Label ID="lblMessage" runat="server" CssClass="success-msg"></asp:Label>
        </p>

    </form>
</body>
</html>