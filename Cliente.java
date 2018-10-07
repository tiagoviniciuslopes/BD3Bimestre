import java.util.ArrayList;
import java.lang.StringBuffer;

public class Cliente {
	private int idCliente;
	private String nomeCliente;
	private String cpfCliente;
	private String rgCliente;
	private Endereco endereco = new Endereco();
	private ArrayList<Telefone> telefones = new ArrayList<Telefone>();
	private ArrayList<Email> emails = new ArrayList<Email>();
	
	public ArrayList<Telefone> getTelefones() {
		return telefones;
	}
	public void setTelefones(ArrayList<Telefone> telefones) {
		this.telefones = telefones;
	}
	public void addTelefone(Telefone telefone) {
		this.telefones.add(telefone);
	}
	public ArrayList<Email> getEmails() {
		return emails;
	}
	public void setEmails(ArrayList<Email> emails) {
		this.emails = emails;
	}
	public void addEmail(Email email) {
		this.emails.add(email);
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNomeCliente() {
		return nomeCliente;
	}
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}
	public String getRgCliente() {
		return this.rgCliente;
	}
	public void setRgCliente(String rgCliente) {
		this.rgCliente = rgCliente;
	}
	public String getCpfCliente() {
		return cpfCliente;
	}
	public void setCpfCliente(String cpfCliente) {
		this.cpfCliente = cpfCliente;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public void setEndereco(int idEndereco, String cepEndereco, String numeroEndereco, String complementoEndereco, int idCidade, String nomeCidade, int idRua, String nomeRua, int idBairro, String nomeBairro ) {
		endereco.setIdEndereco(idEndereco);
		endereco.setCepEndereco(cepEndereco);
		endereco.setNumeroEndereco(numeroEndereco);
		endereco.setComplementoEndereco(complementoEndereco);
		endereco.setCidade(idCidade, nomeCidade);
		endereco.setRua(idRua, nomeRua);
		endereco.setBairro(idBairro, nomeBairro);
	}

	public String toString(){
		StringBuffer retorno = new StringBuffer("Nome: ");
		retorno.append(this.nomeCliente);
		retorno.append("\nCpf: ");
		retorno.append(this.cpfCliente);
		retorno.append("\nRg: ");
		retorno.append(this.rgCliente);
		retorno.append("\n");
		retorno.append(endereco.toString());

		for (Telefone telefone : telefones) {
				retorno.append(telefone.toString());
		}for (Email email : emails) {
				retorno.append(email.toString());
		}
		for (Telefone telefone : telefones) {
				retorno.append(telefone.toString());
		}
		return retorno.toString();
	}
	
}
