import java.sql.*;
import java.util.Vector;

public class DaoFatura{

	private Connection conn;
	private Statement st;
	
	private void conectar(){
		try{
			conn = GerenciadorConexao.pegarConexao();
			st = conn.createStatement();
		}catch(ClassNotFoundException e){
			System.out.println(e.getMessage());
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
	
	private void desconectar(){
		try{
			st.close();
			conn.close();
		}catch(SQLException e){
			System.out.println("OCORREU UM ERRO AO FECHAR A CONEXAO");
		}
	}

	public Cliente consultarIdCliente(String cpfCliente){

		conectar();
		ResultSet rs;

		String comando = "select idCliente,nomeCliente from cliente where cpfCliente = '"+cpfCliente+"';";
		Cliente cli = null;

		try{
			rs = st.executeQuery(comando);
			if(rs.next()){
				cli = new Cliente();
				cli.setIdCliente(rs.getInt("idCliente"));
				cli.setNomeCliente(rs.getString("nomeCliente"));
			}
		}catch(SQLException e){
			System.out.println("Erro ao consultar:"+ e.getMessage());
		}finally{
			desconectar();
		}
		return cli;
	}

	public Vector <Hotel> listarHoteisReservados(int codCliente){
		conectar();
		ResultSet rs;
		Vector<Hotel> resultados = new Vector<Hotel>();
		try{
			rs = st.executeQuery("");
			while(rs.next()){
				Hotel hot = new Hotel();
				hot.setNomeHotel(rs.getString("nomeHotel"));
				hot.setCheckin(rs.getString("dataInicioReserva"));
				hot.setCheckout(rs.getString("dataFinalReserva"));
				hot.setTotal(rs.getDouble("precoHotel"));
				resultados.add(hot);
			}
		}catch(SQLException e){
			System.out.println("Erro ao executar:"+ e.getMessage());
		}finally{
			desconectar();
		}
		return resultados;
	}

	public Vector <Passeio> listarPasseiosReservados(int codCliente){
		conectar();
		ResultSet rs;
		Vector<Passeio> resultados = new Vector<Passeio>();
		try{
			rs = st.executeQuery("");
			while(rs.next()){
				Passeio pass = new Passeio();
				pass.setNomePasseio(rs.getString("setNomePasseio"));
				/*
				pass.setDataPasseio(rs.getString("nomeHotel"));
				pass.setTotal(rs.getDouble("nomeHotel"));
				*/
				resultados.add(pass);
			}
		}catch(SQLException e){
			System.out.println("Erro ao executar:"+ e.getMessage());
		}finally{
			desconectar();
		}
		return resultados;
	}
	/*
	public Vector <Transacao> listarPassagensReservadas(int codCliente){

	}
	*/
}
