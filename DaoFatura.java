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

	public Cliente consultarIdCliente(int cpfCliente){

		conectar();
		ResultSet rs;

		String comando = "select idCliente from cliente where cpfCliente = "+cpfCliente+";";
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

	public Vector <Transacao> listarTransacoes(int codFatura){
		conectar();
		ResultSet rs;
		Vector<Transacao> resultados = new Vector<Transacao>();
		try{
			rs = st.executeQuery("select * from transacao inner join fatura on Fatura_idFatura = idFatura inner join cataodecredito on CataoDeCredito_idCataoDeCredito = idCataoDeCredito inner join empresa on Empresa_idEmpresa = idEmpresa where idFatura = "+codFatura+";");
			while(rs.next()){
				Transacao trans = new Transacao();
				trans.setIdTransacao(rs.getInt("idTransacao"));
				trans.setDataTransacao(rs.getString("dataTransacao"));
				trans.setNomeEmpresa(rs.getString("nomeEmpresa"));
				trans.setValorTransacao(rs.getDouble("valorTransacao"));
				resultados.add(trans);
			}
		}catch(SQLException e){
			System.out.println("Erro ao executar:"+ e.getMessage());
		}finally{
			desconectar();
		}
		return resultados;
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

	public Vector <Transacao> listarPasseiosReservados(int codCliente){

	}

	public Vector <Transacao> listarPassagensReservadas(int codCliente){

	}
	*/
}
