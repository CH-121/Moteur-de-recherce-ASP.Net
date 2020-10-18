<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rechercher.aspx.cs" Inherits="MiniProjet.Rechercher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Search</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="Image/iconnav.png" />
    <style type="text/css">
        .conteneur {
            height: 353px;
            /*text-align: center;*/
            
        }
        </style>
</head>
<body style="height: 126px">
    <form id="form1" runat="server" >
        <div class="conteneur col justify-content-center">
            <div class="text-center" >
                <img src="Image/search.svg" class="img" style="position: fixed; left: 590px; height:300px; width:300px;"  />
            </div>
            <div class="col-md-4 mx-auto d-block form-group" style="top: 300px">
                <label class="mx-auto d-block" style="font-family: 'Comic Sans MS'; font-size:70px; font-weight: bold; font-style: normal; text-transform: none; color: #9963FF; position: relative; left: 85px; ">Search</label>
               
                 <asp:TextBox ID="txtSearch" runat="server" class="form-control" style="border-radius:20px;" placeholder="Entrer le mot à rechercher..."></asp:TextBox>
                <img src="Image/icon.svg" style="height:30px; width:30px; position:absolute; left:445px; bottom:6px; "/>
                  
            </div>
        </div>
    </form>
    <footer style="background-color: #F5F5F5; font-family: 'Comic Sans MS'; color: #F0BC4F; position: fixed; bottom: 0px; width:100%; height:55px; font-size: 18px;">
        <div style="position: fixed; left: 350px; bottom: 15px">
           &copy; 2020  Faculté des Sciences et Techniques de Tanger  Département Génie-Informatique 
        </div>
    </footer>
</body>
</html>
