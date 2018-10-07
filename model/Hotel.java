package model;

import java.util.ArrayList;
import java.lang.StringBuffer;

public class Hotel {
	private int idHotel;
	private String nomeHotel;
	private String cnpjHotel;
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
	public int getIdHotel() {
		return idHotel;
	}
	public void setIdHotel(int idHotel) {
		this.idHotel = idHotel;
	}
	public String getNomeHotel() {
		return nomeHotel;
	}
	public void setNomeHotel(String nomeHotel) {
		this.nomeHotel = nomeHotel;
	}
	public String getCnpjHotel() {
		return cnpjHotel;
	}
	public void setCnpjHotel(String cnpjHotel) {
		this.cnpjHotel = cnpjHotel;
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
		retorno.append(this.nomeHotel);
		retorno.append("\nCnpj: ");
		retorno.append(this.cnpjHotel);
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
