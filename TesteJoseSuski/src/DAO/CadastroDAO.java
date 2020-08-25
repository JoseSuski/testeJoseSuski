package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import CodigoFonte.Cadastro;

public class CadastroDAO {

		public CadastroDAO() {
			
		}

	public boolean inserir(Cadastro c) {
		String sql = "INSERT INTO cadastro(nome, cpf, endereco, cidade, telefone) VALUES(?,?,?,?,?)";
		Boolean retorno = false;
		PreparedStatement pst = Conexao.getPreparedStatement(sql);
		try {
		pst.setString(1, c.getNome());
		pst.setString(2, c.getCpf());
		pst.setString(3, c.getEndereco());
		pst.setString(4, c.getCidade());
		pst.setString(5, c.getTelefone());
		
		if(pst.executeUpdate() > 0) {
			retorno = true;
		}
		}catch (SQLException ex){
			Logger.getLogger(CadastroDAO.class.getName()).log(Level.SEVERE, null, ex);
			retorno = false;
		}
		return retorno;
		
	}
	
	public List<Cadastro>listar() {
		String sql = "SELECT * FROM cadastro where nome=?";
		List<Cadastro> retorno = new ArrayList<Cadastro>();
		PreparedStatement pst = Conexao.getPreparedStatement(sql);
		try {

			ResultSet res = pst.executeQuery();
			while(res.next()) {
				Cadastro item = new Cadastro();
				item.setNome(res.getString("nome"));
				item.setCpf(res.getString("cpf"));
				item.setEndereco(res.getString("endereco"));
				item.setCidade(res.getString("cidade"));
				item.setTelefone(res.getString("telefone"));
				
				retorno.add(item);
			}
			
		}catch (SQLException ex){
			Logger.getLogger(CadastroDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return retorno;
	}
	
	public Cadastro buscar(Cadastro cadastro) {
		String sql = "SELECT * FROM cadastro";
		Cadastro retorno = null;
		PreparedStatement pst = Conexao.getPreparedStatement(sql);
		try {
			pst.setNString(1, cadastro.getNome());
			ResultSet res = pst.executeQuery();
			
			if(res.next()) {
				retorno  = new Cadastro();
				retorno.setNome(res.getString("nome"));
				retorno.setCpf(res.getString("cpf"));
				retorno.setEndereco(res.getString("endereco"));
				retorno.setCidade(res.getString("cidade"));
				retorno.setTelefone(res.getString("telefone"));
			}
			
		}catch (SQLException ex){
			Logger.getLogger(CadastroDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return retorno;
	}
	
	
	public boolean atualizar(Cadastro c) {
		String sql = "UPDATE cadastro set nome=?, cpf=?, endereco=?, cidade=?, telefone=?";
		Boolean retorno = false;
		PreparedStatement pst = Conexao.getPreparedStatement(sql);
		try {
		pst.setString(1, c.getNome());
		pst.setString(2, c.getCpf());
		pst.setString(3, c.getEndereco());
		pst.setString(4, c.getCidade());
		pst.setString(5, c.getTelefone());
		
		if(pst.executeUpdate() > 0) {
			retorno = true;
		}
		}catch (SQLException ex){
			Logger.getLogger(CadastroDAO.class.getName()).log(Level.SEVERE, null, ex);
			retorno = false;
		}
		return retorno;
		
	}
	
	public boolean excluir(Cadastro c) {
		String sql = "DELETE cadastro where nome=?";
		Boolean retorno = false;
		PreparedStatement pst = Conexao.getPreparedStatement(sql);
		try {
		pst.setString(1, c.getNome());
		
		if(pst.executeUpdate() > 0) {
			retorno = true;
		}
		}catch (SQLException ex){
			Logger.getLogger(CadastroDAO.class.getName()).log(Level.SEVERE, null, ex);
			retorno = false;
		}
		return retorno;
		
	}
	
}
