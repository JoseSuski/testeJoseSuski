<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teste José Suski</title>
</head>
<body>
	<form action="Cadastro.jsp" method="get">
		Nome: <input type="text" name="nome" /> 
		<br>
		Endereço: <input type="text" name="endereco" /> 
		<br>
		CPF: <input type="text" name="cpf" />
		<br> 
		Cidade: <input type="text" name="cidade" /> 
		<br>
		Telefone: <input type="text" name="telefone" /> 
		<br>
		<input type="submit" value="Enviar">
		<br>
	</form>

	<%@page import="java.util.ArrayList"%>
	<%
		String nome = request.getParameter("nome");
	String endereco = request.getParameter("endereco");
	String cpf = request.getParameter("cpf");
	String cidade = request.getParameter("cidade");
	String telefone = request.getParameter("telefone");

	Cadastro c = new Cadastro();

	c.setNome(nome);
	c.setEndereco(endereco);
	c.setCPF(cpf);
	c.setCidade(cidade);
	c.setTelefone(telefone);

	ArrayList<Cadastro> cadastro = new ArrayList<Cadastro>();

	if (nome != null && nome != "" && endereco != "" && endereco != null && cpf != "" && cpf != null && cidade != ""
			&& cidade != null && telefone != "" && telefone != null) {
		cadastro.add(c);
		out.print(c);
	} else {
		out.print("Complete as informções");
	}
	%>
</body>
</html>