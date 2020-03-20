package beans;

public class BeanCursoJsp {

	private String login;

	private String senha;

	private String nome;

	private String fone;
	
	private Long id;
	
	private String cep;
	
	private String rua;
	
	private String bairro;
	
	private String cidade;
	
	private String estado;
	
	private String ibge;
	
	private String fotoBase64;
	
	private String contentType;
	
	private String tempFotoUser;
	
	private String curriculoBase64;
	
	private String contentTyoeCurriculo;
	
	
	
	public String getTempFotoUser() {
		
		tempFotoUser = "data:" + contentType + ";base64," + fotoBase64; //monsta a linha da base64
		
		return tempFotoUser;
	}
	
	public void setCurriculoBase64(String curriculoBase64) {
		this.curriculoBase64 = curriculoBase64;
	}
	
	public String getCurriculoBase64() {
		return curriculoBase64;
	}
	
	public void setContentTyoeCurriculo(String contentTyoeCurriculo) {
		this.contentTyoeCurriculo = contentTyoeCurriculo;
	}
	
	public String getContentTyoeCurriculo() {
		return contentTyoeCurriculo;
	}
	
	public void setFotoBase64(String fotoBase64) {
		this.fotoBase64 = fotoBase64;
	}
	
	public String getFotoBase64() {
		return fotoBase64;
	}
	
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	public String getContentType() {
		return contentType;
	}
	
	public void setCep(String cep) {
		this.cep = cep;
	}
	
	public String getCep() {
		return cep;
	}
	
	

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getIbge() {
		return ibge;
	}

	public void setIbge(String ibge) {
		this.ibge = ibge;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

	public String getFone() {
		return fone;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
