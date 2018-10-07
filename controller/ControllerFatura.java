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

		Fatura fat = daoFatura.consultarIdCliente(cpf);

		System.out.println("\n*-----------------------------------[ INFORMACOES DA FATURA DE "+ fat.getNomeCliente() +" ]-----------------------------------*");

	}
}
