<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AggiungiCliente.aspx.cs" Inherits="MonteDeiPeschi.AggiungiCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
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
        <div class="container-fluid">
            <div class="row mt-5 text-center">
                <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
                <h3 style="color:green;font-weight: bold;">Compila i Campi <i class="fas fa-feather-alt"  style="color:darkorange"></i></h3>
                <div class="col-6 text-center border border-success">
                    <h4 style="color:green;font-weight: bold;"><i class="fab fa-wpforms" style="color:darkorange"></i> Info Cliente</h4>
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Cognome" runat="server" placeholder="Cognome" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Nome" runat="server" placeholder="Nome" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Indirizzo" runat="server" placeholder="Indirizzo" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Telefono" runat="server" placeholder="Telefono" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Email" runat="server" placeholder="Email" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="Età" runat="server" placeholder="Età" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="CodiceFiscale" runat="server" placeholder="Codice Fiscale" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-3" ID="PartitaIva" runat="server" placeholder="Partita Iva" Width="600px"></asp:TextBox>
                </div>
                <div class="col-6 text-center  border border-success">
                    <h4 style="color:green;font-weight: bold;"> <i class="fab fa-wpforms" style="color:darkorange"></i> Info Conto </h4>
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-2" ID="NumeroConto" runat="server" placeholder="Numero Conto" Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-2" ID="Saldo" runat="server" placeholder="Saldo"  Width="600px"></asp:TextBox><br />
                    <i class="fas fa-chevron-circle-right" style="color:darkorange"></i><asp:TextBox CssClass="btn btn-success m-2" ID="Fido" runat="server" placeholder="Fido" Width="600px"></asp:TextBox><br />
                    <p style="color:green;font-weight: bold;">Data di apertura:</p>
                    <asp:Calendar  CssClass="table table-success text-light opacity-50 text-center table-hover rounded" ID="DataApertura" runat="server"></asp:Calendar>
                    <br />
                </div>
            </div>
            <div class=" text-center my-2">
                <asp:Button CssClass="btn m-2" ID="AggiungiClientebtn" runat="server" Text="Aggiungi Cliente" style="background-color:darkorange; color:white; font-size:20px; font-weight: bold;" OnClick="AggiungiClientebtn_Click" Width="700px" Height="70px" />
            </div>
            </div>  
        <asp:Label ID="IdCorr" runat="server" Text="Label" Visible="false" style="font-size:30px;font-weight:bold"></asp:Label>
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
