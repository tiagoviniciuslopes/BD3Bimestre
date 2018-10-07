import java.util.Scanner;

public class principal{
	
		public static void main(String [] args) throws Exception{
			principal p = new principal();
			p.menuPrincipal();
		}
		
		public void menuPrincipal(){
			Scanner scanner = new Scanner(System.in);
			int opcao = -1;
			
			while(opcao != 0 ){
				System.out.println("\n*-----------------------------------------------*");
				System.out.println("| [1] - Consultar Fatura Cliente");
				System.out.println("*-----------------------------------------------*");
				System.out.println("| [0] - Sair");
				System.out.println("*-----------------------------------------------*\n");
				System.out.print("ESCOLHA: ");

				opcao = Integer.parseInt(scanner.nextLine());
				if (opcao == 1){
					ControllerFatura controllerFatura = new ControllerFatura();
					controllerFatura.consultar();
				}else if(opcao == 0){
					System.out.println("Ate Logo...");
				}else{
					System.out.println("Opcao Invalida");
				}
				System.out.println("\nPressione uma Tecla para continuar...");
				scanner.nextLine();
			}
		}
}
