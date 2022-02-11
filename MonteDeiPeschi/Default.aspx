

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MonteDeiPeschi.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://kit.fontawesome.com/e275ee0ca7.js" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>

    <form id="form1" runat="server">
   <nav class="navbar navbar-expand-lg text-white navbar-light bg-success" style="height: 120px">
            <div class="container-fluid">
                <h1 class="navbar-brand mx-4" style="color:white; font-size:60px" href="#">Intesa SanPaolo <img src="img/logoint.jpg" widht="80px" height="80px"/></h1>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="text-end">
                <div class="collapse navbar-collapse"  id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active mx-5" style="color:white; font-size:30px" aria-current="page" href="Default.aspx">Ricerca</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active mx-5" style="color:white;font-size:30px" aria-current="page" href="AggiungiCliente.aspx">Aggiungi Conto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active mx-5" style="color:white; font-size:30px" aria-current="page" href="EffettuaOperazione.aspx">Effettua Operazione</a>
                        </li>
                    </ul>
                </div>
                 </div>
            </div>
        </nav>
        <div class="container-fluid text-center">
           
            <div class=" my-5" > 
                <h2 style="color:green; font-weight: bold;">Report ContiCorrenti <i class="fas fa-money-check" style="color:darkorange"></i> </h2>
                <hr style="color:forestgreen; height:2px"/>
               <i class="fas fa-caret-square-down"  style="color:darkorange; font-size:25px"></i><asp:DropDownList CssClass="btn btn-success m-3" ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" Width="700px" Height="50px">
                <asp:ListItem CssClass="btn btn-success m-3" Value="0" Text="Scegli Tipo Ricerca"></asp:ListItem>
                <asp:ListItem CssClass="btn btn-success m-3" Value="1" Text="Movimentazioni tra due date"></asp:ListItem>
                <asp:ListItem CssClass="btn btn-success m-3" Value="2" Text="Movimentazioni in data di un conto"></asp:ListItem>
                <asp:ListItem CssClass="btn btn-success m-3" Value="3" Text="Conti Correnti < 0 Fido Ok"></asp:ListItem>
                <asp:ListItem CssClass="btn btn-success m-3" Value="4" Text="Conti Correnti < 0 Fido Esaurito"></asp:ListItem>
            </asp:DropDownList><br />
            <i class="fas fa-chevron-circle-right" style="color:darkorange" ID="ContoCorrente1" runat="server" Visible="false"></i><asp:TextBox CssClass="btn btn-success m-3" ID="ContoCorrente" placeholder="Conto Corrente" runat="server" Visible="false" Width="700px" Height="50px"></asp:TextBox>
                <h4 style="color:green; font-weight: bold;" runat="server" ID="tit" visible="false">Data 1</h4>
            <asp:Calendar CssClass="table table-success text-light opacity-50 text-center table-hover rounded" ID="Calendar1" runat="server" Visible="false" ></asp:Calendar><br />
                 <h4 style="color:green ; font-weight: bold;" runat="server" ID="tit2" visible="false">Data 2</h4>
            <asp:Calendar CssClass="table table-success text-light opacity-50 text-center table-hover rounded" ID="Calendar2" runat="server" Visible="false"></asp:Calendar><br />
            <asp:Button CssClass="btn " ID="Cerca" runat="server" Text="Cerca" OnClick="Cerca_Click" Width="350px" Height="50px" style="background-color:darkorange; color:white; font-size:20px; font-weight: bold; margin-bottom:70px"/>
                <asp:GridView CssClass="table table-success  text-center table-hover" ID="GridView1" runat="server">
            </asp:GridView>
                 <h2 style="color:green; font-weight: bold;">Controllo Saldo ContiCorrenti <i class="fas fa-money-check" style="color:darkorange"></i> </h2>
                <hr style="color:forestgreen; height:2px"/>
            <i class="fas fa-chevron-circle-right " style="color:darkorange ;font-size:25px"></i><asp:TextBox CssClass="btn btn-success m-3" ID="NumConto" runat="server" placeholder="Numero Conto" Width="700px" Height="50px"></asp:TextBox><br />
            <i class="fas fa-chevron-circle-right" style="color:darkorange; font-size:25px"></i><asp:TextBox CssClass="btn btn-success m-3" ID="CF" runat="server" placeholder="Codice Fiscale" Width="700px" Height="50px"></asp:TextBox><br />
            <asp:Button CssClass="btn m-3" ID="StampaSaldo" runat="server" Text="Stampa Saldo" OnClick="StampaSaldo_Click1" Width="350px" Height="50px" style="background-color:darkorange; color:white; font-size:20px; font-weight: bold;"/><br />
            <asp:Label CssClass="btn btn-success m-3" ID="totSaldo" runat="server" Width="600px" visible="false"></asp:Label>
            </div>
            
        </div>
        <footer class="blockquote-footer" style="position:relative; margin-top:1rem">
            <div class="row pt-5 bg-success text-light">
                <div class="col align-self-center" style="text-align:center;">
                    <h5>Contatti e Recapiti</h5>
                       <p> Banca Intesa SanPaolo.<br />
                           <i class="fas fa-balance-scale" style="color:darkorange; font-size:15px"></i>  GRUPPO ISP s.p.a. - Partita Iva 1554842558<br />
                           <i class="fas fa-phone-alt" style="color:darkorange; font-size:15px"></i>  02.3652145<br />
                           <i class="fas fa-envelope-open-text" style="color:darkorange; font-size:15px"></i>  info.assistenza@intesa.it
                         </p>
                </div>
            </div>
        </footer>
    </form>
</body>
</html>
