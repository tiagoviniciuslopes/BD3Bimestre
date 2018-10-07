public class Email {
	private int idEmail;
	private String enderecoEmail;
	
	public int getIdEmail() {
		return idEmail;
	}
	public void setIdEmail(int idEmail) {
		this.idEmail = idEmail;
	}
	public String getEnderecoEmail() {
		return enderecoEmail;
	}
	public void setEnderecoEmail(String enderecoEmail) {
		this.enderecoEmail = enderecoEmail;
	}

	public String toString() {
		return "Email: " + this.enderecoEmail + "\n";
	}
	
	
}
