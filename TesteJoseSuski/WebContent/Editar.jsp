<%@page import="CodigoFonte.Cadastro"%>
<%@page import="DAO.CadastroDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
Cadastro cadastro = new Cadastro(); 
CadastroDAO dao = new CadastroDAO();
cadastro.setNome(request.getParameter("nome"));
cadastro.setCpf(request.getParameter("cpf"));
cadastro.setEndereco(request.getParameter("endereco"));
cadastro.setCidade(request.getParameter("cidade"));
cadastro.setTelefone(request.getParameter("telefone"));

cadastro = dao.buscar(cadastro);

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
<title>Editar</title>
</head>
<body>
	<form action="CadastroUsuario" method="post">
		<table>
		<tr>
			<td>Nome: </td>
			<td><input type="text" name="nome" value="<%=cadastro.getNome()%>">
		</tr>
		
		<tr>
			<td>CPF: </td>
			<td><input type="text" name="cpf" value="<%=cadastro.getCpf()%>">
		</tr>
		
		<tr>
			<td>Endereço: </td>
			<td><input type="text" name="endereco" value="<%=cadastro.getEndereco()%>">
		</tr>
		
		<tr>
			<td>Cidade: </td>
			<td><input type="text" name="cidade" value="<%=cadastro.getCidade()%>">
		</tr>
		
		<tr>
			<td>Telefone: </td>
			<td><input type="text" name="telefone" value="<%=cadastro.getTelefone()%>">
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="submit">
		</tr>

		</table>

	</form>

</body>
</html>