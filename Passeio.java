public class Passeio {
	private int idPasseio;
	private String nomePasseio;
	
	public int getIdPasseio() {
		return idPasseio;
	}
	public void setIdPasseio(int idPasseio) {
		this.idPasseio = idPasseio;
	}
	public String getNomePasseio() {
		return nomePasseio;
	}
	public void setNomePasseio(String nomePasseio) {
		this.nomePasseio = nomePasseio;
	}

	public String toString() {
		return "Passeio: " + this.nomePasseio + "\n";
	}
}
