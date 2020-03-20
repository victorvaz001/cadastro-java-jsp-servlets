package Servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

import beans.BeanCursoJsp;
import dao.DaoUsuario;

@WebServlet("/salvarUsuario")
@MultipartConfig
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DaoUsuario daoUsuario = new DaoUsuario();

	public Usuario() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");
			String user = request.getParameter("user");

			if (acao.equalsIgnoreCase("delete")) {
				daoUsuario.delete(user);

				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);
			} else if (acao.equalsIgnoreCase("editar")) {
				BeanCursoJsp beanCursoJsp = daoUsuario.consultar(user);

				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("user", beanCursoJsp);
				view.forward(request, response);
			} else if (acao.equalsIgnoreCase("listartodos")) {

				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");// indica para qual tela
																								// ira redirecionar
				request.setAttribute("usuarios", daoUsuario.listar()); // seta dentro do atributo de usuarios a lista de
																		// usuarios
				view.forward(request, response); // termina de dar a reposta para o navegador

			}else if(acao.equalsIgnoreCase("download")) {
				BeanCursoJsp usuario = daoUsuario.consultar(user); //consulta no banco
				if( usuario != null) {
					
					String contetTtype = "";
					byte[] fileBytes = null;
					String tipo = request.getParameter("tipo");
					
					if(tipo.equalsIgnoreCase("imagem")) {
						contetTtype = usuario.getContentType();
						
						//Converte a base64 da imagem do banco para byte[]
						fileBytes = new Base64().decodeBase64(usuario.getFotoBase64());   
					}else if(tipo.equalsIgnoreCase("curriculo")) {
						contetTtype = usuario.getContentTyoeCurriculo();
						fileBytes = new Base64().decodeBase64(usuario.getCurriculoBase64());
					}
					
					
					response.setHeader("Content-Disposition", "attachment;filename=arquivo." 
					+ contetTtype.split("\\/")[1]); // para ficar dinamico nos tipos de arquivo
					
					
					  
					
					/*Coloca os bytes no objeto de entrada para processar*/
					InputStream is = new ByteArrayInputStream(fileBytes); //converte os bytes para fluxos de entrada
					
					/*inicio da resposta para o navegador*/
					int read = 0;
					byte[] bytes = new byte[1024];
					OutputStream os = response.getOutputStream();
					
					
					while ((read = is.read(bytes)) != -1) {
						os.write(bytes, 0, read);
					}
					
					os.flush();
					os.close();
				
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equalsIgnoreCase("reset")) {
			try {
				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				view.forward(request, response);// redirecionamento para o navagador, notifica o navegador

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {

			String id = request.getParameter("id");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String nome = request.getParameter("nome");
			String fone = request.getParameter("fone");
			
			String cep = request.getParameter("cep");
			String rua = request.getParameter("rua");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("estado");
			String ibge = request.getParameter("ibge");
			
			

			BeanCursoJsp usuario = new BeanCursoJsp();
			usuario.setId(id !=null && !id.isEmpty() ? Long.parseLong(id) : null);
			usuario.setLogin(login);
			usuario.setSenha(senha);
			usuario.setNome(nome);
			usuario.setFone(fone);
			usuario.setCep(cep);
			usuario.setRua(rua);
			usuario.setBairro(bairro);
			usuario.setCidade(cidade);
			usuario.setEstado(estado);
			usuario.setIbge(ibge);
			

			try {
				
				/*File upload de imagens e pdf*/
				
				if(ServletFileUpload.isMultipartContent(request)) { //VALIDA SE O FORMULARIO e DE UPLOAD
					
					Part imagemFoto = request.getPart("foto") ;//request pega os dados que vem pelo formulario
					
						
						if(imagemFoto != null && imagemFoto.getInputStream().available() > 0) {
						String fotoBase64 = new Base64()
						.encodeBase64String(converteStreamParaByte(imagemFoto.getInputStream()));
						
						usuario.setFotoBase64(fotoBase64);
						usuario.setContentType(imagemFoto.getContentType()); //tipo da foto
					}else {
						
						usuario.setFotoBase64(request.getParameter("fotoTemp"));
						usuario.setContentType(request.getParameter("contetType"));
					}
					
					
					/*Processa PDF*/
					Part curriculoPDF = request.getPart("curriculo");
						if(curriculoPDF != null && curriculoPDF.getInputStream().available() > 0) {
						String curriculoBase64 = new Base64()
						.encodeBase64String(converteStreamParaByte(curriculoPDF.getInputStream()));
						
						usuario.setCurriculoBase64(curriculoBase64);
						usuario.setContentTyoeCurriculo(curriculoPDF.getContentType());
						
					}else {
						usuario.setCurriculoBase64(request.getParameter("fotoTempPDF"));
						usuario.setContentTyoeCurriculo(request.getParameter("contetTypePDF"));
					}
				}
				
				/*FIM File upload de imagens e PDF*/
				
				
				String msg = null;
				boolean podeInserir = true;

				if (login == null || login.isEmpty()) {
					msg = "Login deve ser informado";
					podeInserir = false;

				} else if (senha == null || senha.isEmpty()) {
					msg = "Senha deve ser informado";
					podeInserir = false;

				} else if (nome == null || nome.isEmpty()) {
					msg = "Nome deve ser informado";
					podeInserir = false;
					
				} else if (fone == null || fone.isEmpty()) {
					msg = "Telefone deve ser informado";
					podeInserir = false;
				}

				else if (id == null || id.isEmpty() && !daoUsuario.validarLogin(login)) {// validar login existente
					msg = "Usuario ja existe com o mesmo login!";
					podeInserir = false;

				} else if (id == null || id.isEmpty() && !daoUsuario.validarSenha(senha)) {// quando for usuario novo
					msg = "\n A senha ja existe para outro usuario!";
					podeInserir = false;
				}

				if (msg != null) {
					request.setAttribute("msg", msg);
				} else if (id == null || id.isEmpty() && daoUsuario.validarLogin(login) && podeInserir) {

					daoUsuario.Salvar(usuario);

					//msg = "\nSalvo com sucesso!";

				} else if (id != null && !id.isEmpty() && podeInserir) {

					if (!daoUsuario.validarLoginUpdate(login, id)) {
						request.setAttribute("msg", "Login j� existe para outro usuario");
						podeInserir = false;

					} else if (!daoUsuario.validarSenhaUpdate(senha, id)) {
						request.setAttribute("msg", "Senha j� existe para outro usuario");
						podeInserir = false;

					} else {
						daoUsuario.atualizar(usuario);
					}
				}

				if (!podeInserir) {
					request.setAttribute("user", usuario);// tera os dados que veio da tela, volta com todos os
															// atributos
				}

				if (msg != null) {
					request.setAttribute("msg", msg);
				}



				RequestDispatcher view = request.getRequestDispatcher("/cadastroUsuario.jsp");
				request.setAttribute("usuarios", daoUsuario.listar());
				request.setAttribute("msg", "Salvo com sucesso");
				view.forward(request, response);// redirecionamento

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/*Converte a entrada de fluxo de dados da imagem para byte[]*/
	private byte[] converteStreamParaByte(InputStream imagem) throws Exception{
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		int reads = imagem.read();
		while(reads != -1) { //enquanto tiver dados
			baos.write(reads); //da  o start na leitura
			reads = imagem.read(); //lentdo a imagme
		}
		
		return baos.toByteArray(); //retorna um array de bytes
	}
}
