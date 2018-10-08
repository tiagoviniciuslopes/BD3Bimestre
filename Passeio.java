public class Passeio {
	private int idPasseio;
	private String nomePasseio;
	private String dataPasseio;
	private double total;
	
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
	public String getDataPasseio() {
		return dataPasseio;
	}
	public void setDataPasseio(String dataPasseio) {
		this.dataPasseio = dataPasseio;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}

	public String toString() {
		return "Passeio: " + this.nomePasseio + "\n";
	}
}
