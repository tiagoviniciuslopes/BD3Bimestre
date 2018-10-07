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
		int cpf = scanner.nextInt();

		Cliente cli = daoFatura.consultarIdCliente(cpf);

		System.out.println("\n*--------------[ INFORMACOES DA FATURA DE "+ "VICTOR HUGO" +" ]--------------*");
		System.out.println("\n*--------------[ Hotéis Reservados ]-------------*");
		System.out.println("\n{ "+hotel.getNomeHotel()+" }");
		System.out.println("*---------------------------");
		System.out.println("| Check-in: "+hotel.getCheckIn());
		System.out.println("| Check-out: "+hotel.getCheckOut());
		System.out.println("| Valor: R$ "+hotel.getTotal());
		System.out.println("*---------------------------");

		System.out.println("\n*--------------[ Passeios ]-------------*");
		System.out.println("\n{ Cataratas }");
		System.out.println("*---------------------------");
		System.out.println("| Data: 10/10/2010");
		System.out.println("| Valor: R$ 150");
		System.out.println("*---------------------------");

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
