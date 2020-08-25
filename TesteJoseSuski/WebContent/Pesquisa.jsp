<%@page import="CodigoFonte.Cadastro"%>
<%@page import="DAO.CadastroDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
CadastroDAO dao = new CadastroDAO();
List<Cadastro>lista;
lista=dao.listar();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Pesquisa</title>
</head>
<body>
	<a href= "Cadastro.jsp">+ Novo Usuario</a><br/>
	<input type="text" name="pesquisar"/><input type="submit" value="Pesquisar"/><br/>
	<tr>
		<th>Nome</th>
		<th>CPF</th>
		<th>Endereço</th>
		<th>Cidade</th>
		<th>Telefone</th>
	</tr>
	<%for(Cadastro registro:lista){
				
	%>
	<tr>
		<td><%=registro.getNome() %></td>
		<td><%=registro.getCpf() %></td>
		<td><%=registro.getEndereco() %></td>
		<td><%=registro.getCidade() %></td>
		<td><%=registro.getTelefone() %></td>
		<td><a href="Editar.jsp?nome=<%=registro.getNome() %>">Editar</a>
		<a href="Exclusao.jsp?nome=<%=registro.getNome() %>">Excluir</a></td>
	</tr>
	<%
	}
	%>	
</body>
</html>