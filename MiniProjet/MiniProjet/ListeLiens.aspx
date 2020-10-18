<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListeLiens.aspx.cs" Inherits="MiniProjet.ListeLiens" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Search</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="Image/iconnav.png" />
    <style type="text/css">
        .auto-style1 {
            height: 331px;
            text-align: center;
        }
        .auto-style2 {
            color: #CC0000;
        }
    </style>
</head>
<body style="background-image: url('Image/back4.jpg'); background-attachment: fixed; background-position: center center; background-repeat: no-repeat; background-size: cover;">
    <form id="form1" runat="server" >
        <div class="auto-style1 col align-content-center">
            <br />
            <br />
            
           <div class="col-md-4 mx-auto d-block align-content-center" >
               <label class="mx-auto d-block" style="font-family: 'Comic Sans MS'; font-size:45px; font-weight: bold; font-style: normal; text-transform: none; color: #9963FF;  left:350px; top:94px; ">Search</label>
               <asp:TextBox ID="txtResRecherche" class="form-control" style="border-radius:20px; " placeholder="Entrer le mot à rechercher..." runat="server"></asp:TextBox>
               <img src="Image/icon.svg" style="height:30px; width:30px; position:absolute; left:440px; bottom:6px; "/>
            </div>
            
            <br />
            <br />
            <strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Text="Label" Visible="False"></asp:Label>
            </strong>
            
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#FFCC00" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" ShowHeader="False" Visible="False" Height="85px" Width="60%" AutoGenerateColumns="False" HorizontalAlign="Center" PageSize="20"  EnableViewState="False"   Font-Size="Large">
              
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />

               <Columns>
                    <asp:BoundField DataField="IdLien"  Visible="true" ItemStyle-ForeColor="White" />
                         <asp:TemplateField >
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="btnUrl"
                                    Text='<%# Eval("URL") %>'  
                                      OnClick="btnUrl_Click" 
                                    CommandArgument='<%# Eval("IdLien") %>'  CommandName="Select" >
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                   
                    <asp:BoundField DataField="Description" ItemStyle-Width="80%" />
                     <asp:BoundField />
                </Columns>
                
            </asp:GridView>
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        
    </form>
</body>
</html>
