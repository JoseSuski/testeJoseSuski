<%@page import="CodigoFonte.Cadastro"%>
<%@page import="DAO.CadastroDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
Cadastro cadastro = new Cadastro(); 

cadastro.setNome(request.getParameter("nome"));
cadastro.setCpf(request.getParameter("cpf"));
cadastro.setEndereco(request.getParameter("endereco"));
cadastro.setCidade(request.getParameter("cidade"));
cadastro.setTelefone(request.getParameter("telefone"));

CadastroDAO dao = new CadastroDAO();

Boolean ret =  dao.inserir(cadastro);
String msg;
if(ret==true){
	msg="Registro cadastrado com sucesso";
}else{
	msg="Erro ao cadastrar";
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar</title>
</head>
<body>
	<form action="CadastroUsuario" method="post">
		<table>
		<tr>
		<td>Nome: </td>
		<td><input type="text" name="nome">
		</tr>
				<tr>
		<td>CPF: </td>
		<td><input type="text" name="cpf">
		</tr>
				<tr>
		<td>Endere�o: </td>
		<td><input type="text" name="endereco">
		</tr>
				<tr>
		<td>Cidade: </td>
		<td><input type="text" name="cidade">
		</tr>
				<tr>
		<td>Telefone: </td>
		<td><input type="text" name="telefone">
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="submit">
		</tr>
		
		
		<tr>
			<td colspan="2"><a href="Pesquisa.jsp">Pesquisar</a></td>
			<input type="submit">
		</tr>
		</table>

	</form>

</body>
</html>