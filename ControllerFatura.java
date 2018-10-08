import java.io.*;
import java.util.*;
import java.text.*;

public class ControllerFatura{
	DaoFatura daoFatura;

	public ControllerFatura(){
		daoFatura = new DaoFatura();
	}

	public String dataSqlToString(String sqlDate){
		String dataTraduzida = null;
		try{
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sqlDate);
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			dataTraduzida = df.format(date);
	    } catch (ParseException e) {
	    	System.out.println("Erro de conversão de Data");
	    }
	    return dataTraduzida;
	}

	public void consultar() {

		Scanner scanner = new Scanner(System.in);

		System.out.println("\nEntre com o CPF do Cliente: ");
		String cpf = scanner.nextLine();

		Cliente cli = daoFatura.consultarIdCliente(cpf);

		System.out.println("\n*--------------[ INFORMACOES DA FATURA DE "+ cli.getNomeCliente() +" ]--------------*");

		Vector <Hotel> hotel = daoFatura.listarHoteisReservados(cli.getIdCliente());
		Iterator iter = hotel.iterator();

		System.out.println("\n*--------------[ Hotéis Reservados ]-------------*");
		while(iter.hasNext()){
			Hotel item = (Hotel)iter.next();
			System.out.println("\n{ "+item.getNomeHotel()+" }");
			System.out.println("*---------------------------");
			System.out.println("| Check-in: "+dataSqlToString(item.getCheckin()));
			System.out.println("| Check-out: "+dataSqlToString(item.getCheckout()));
			System.out.println("| Valor: R$ "+(String) String.format("%.2f", item.getTotal()));
			System.out.println("*---------------------------");
		}

		Vector <Passeio> pass = daoFatura.listarPasseiosReservados(cli.getIdCliente());
		iter = pass.iterator();

		System.out.println("\n*--------------[ Passeios ]-------------*");
		while(iter.hasNext()){
			Passeio item = (Passeio)iter.next();
			System.out.println("\n{ "+item.getNomePasseio()+" }");
			System.out.println("*---------------------------");
			System.out.println("| Data: "+item.getDataPasseio());
			System.out.println("| Valor: R$ "+item.getTotal());
			System.out.println("*---------------------------");
		}

		Vector <Passagem> pasg = daoFatura.listarPassagensReservadas(cli.getIdCliente());
		iter = pasg.iterator();
		System.out.println("\n*--------------[ Passagens Aéreas ]-------------*");
		while(iter.hasNext()){
			Passagem item = (Passagem)iter.next();
			System.out.println("\n{ "+item.getOrigem()+"-"+item.getDestino()+" }");
			System.out.println("*---------------------------");
			System.out.println("| Cia Aérea: "+item.getCiaAerea());
			System.out.println("| Data: "+item.getData());
			System.out.println("| Hora: "+item.getHora());
			System.out.println("| Valor: R$ "+item.getTotal());
			System.out.println("*---------------------------");
		}
	}
}
