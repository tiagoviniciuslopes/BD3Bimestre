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
		while(iter.hasNext()){
			Hotel item = (Hotel)iter.next();
			System.out.println("\n*--------------[ Hotéis Reservados ]-------------*");
			System.out.println("\n{ "+item.getNomeHotel()+" }");
			System.out.println("*---------------------------");
			System.out.println("| Check-in: "+dataSqlToString(item.getCheckin()));
			System.out.println("| Check-out: "+dataSqlToString(item.getCheckout()));
			System.out.println("| Valor: R$ "+(String) String.format("%.2f", item.getTotal()));
			System.out.println("*---------------------------");
		}

		Vector <Passeio> pass = daoFatura.listarPasseiosReservados(cli.getIdCliente());
		iter = pass.iterator();
		while(iter.hasNext()){
			Passeio item = (Passeio)iter.next();
			System.out.println("\n*--------------[ Passeios ]-------------*");
			System.out.println("\n{ "+item.getNomePasseio()+" }");
			System.out.println("*---------------------------");
			System.out.println("| Data: "+item.getDataPasseio());
			System.out.println("| Valor: R$ "+item.getTotal());
			System.out.println("*---------------------------");
		}

		Vector <Passeio> pass = daoFatura.listarPasseiosReservados(cli.getIdCliente());
		iter = pass.iterator();
		while(iter.hasNext()){
			System.out.println("\n*--------------[ Passagens Aéreas ]-------------*");
			System.out.println("\n{ Foz-Sao Paulo }");
			System.out.println("*---------------------------");
			System.out.println("| Cia Aérea: TAM");
			System.out.println("| Data: 15/10/2010");
			System.out.println("| Hora: 10:00");
			System.out.println("| Valor: R$ 350");
			System.out.println("*---------------------------");
		}
	}
}
