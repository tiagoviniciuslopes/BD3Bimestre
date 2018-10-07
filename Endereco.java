public class Endereco {
	private int idEndereco;
	private String cepEndereco;
	private String numeroEndereco;
	private String complementoEndereco;
	private Cidade cidade = new Cidade();
	private Rua rua = new Rua();
	private Bairro bairro = new Bairro();
	
	public int getIdEndereco() {
		return idEndereco;
	}
	public void setIdEndereco(int idEndereco) {
		this.idEndereco = idEndereco;
	}
	public String getCepEndereco() {
		return cepEndereco;
	}
	public void setCepEndereco(String cepEndereco) {
		this.cepEndereco = cepEndereco;
	}
	public String getNumeroEndereco() {
		return numeroEndereco;
	}
	public void setNumeroEndereco(String numeroEndereco) {
		this.numeroEndereco = numeroEndereco;
	}
	public String getComplementoEndereco() {
		return complementoEndereco;
	}
	public void setComplementoEndereco(String complementoEndereco) {
		this.complementoEndereco = complementoEndereco;
	}
	public Cidade getCidade() {
		return cidade;
	}
	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	public void setCidade(int idCidade, String nomeCidade) {
		cidade.setIdCidade(idCidade);
		cidade.setNomeCidade(nomeCidade);
	}
	public Rua getRua() {
		return rua;
	}
	public void setRua(Rua rua) {
		this.rua = rua;
	}
	public void setRua(int idRua, String nomeRua) {
		rua.setIdRua(idRua);
		rua.setNomeRua(nomeRua);
	}
	public Bairro getBairro() {
		return bairro;
	}
	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}
	public void setBairro(int idBairro, String nomeBairro) {
		bairro.setIdBairro(idBairro);
		bairro.setNomeBairro(nomeBairro);
	}

	public String toString() {
		return  cidade.toString() + bairro.toString() + rua.toString() + "\nNumero: " + this.numeroEndereco + "\nCEP: " + this.cepEndereco + "\nComplemento: " + this.complementoEndereco + "\n";
	}
}
