<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EffettuaOperazione.aspx.cs" Inherits="MonteDeiPeschi.EffettuaOperazione" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://kit.fontawesome.com/e275ee0ca7.js" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
        <div class="container text-center">
            <asp:Label ID="Label2" runat="server" Text="Label" Visible="false" style="font-size:30px;font-weight:bold"></asp:Label>
                <div class="border border-success p-3 my-5">
                    <i class="fas fa-chevron-circle-right" style="color:darkorange; font-size:25px"></i><asp:TextBox CssClass="btn btn-success m-3" ID="NumeroConto" runat="server" placeholder="Numero Conto" Width="700px" Height="50px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange; font-size:25px"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Importo" runat="server" placeholder="Importo" Width="700px" Height="50px"></asp:TextBox><br />
                     <i class="fas fa-caret-square-down"  style="color:darkorange; font-size:25px"></i><asp:DropDownList CssClass="btn btn-success m-3" ID="TipoMovimento" runat="server" Width="700px" Height="50px">
                        <asp:ListItem Value="1" Text="Tipo Movimento"></asp:ListItem>
                        <asp:ListItem Value="1" Text="Entrata"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Uscita"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Calendar CssClass="table table-success text-light opacity-50 text-center table-hover rounded" ID="Calendar1" runat="server" >
                    </asp:Calendar>

                    <asp:Button CssClass="btn  m-3" ID="EffettuaMovimento" style="background-color:darkorange; color:white; font-size:20px; font-weight: bold;" runat="server" Text="Effettua Movimento" OnClick="EffettuaMovimento_Click" Width="350px" Height="50px"/>
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
