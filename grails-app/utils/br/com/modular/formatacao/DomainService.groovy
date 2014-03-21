package br.com.modular.formatacao

class DomainService {
	
	public enum InstituicaoType{
		H("Hospital"),
		C("Clínica"),
		L("Laboratório")
 
		final String value;
 
		InstituicaoType(String value) {
			this.value = value;
		}
		String toString(){
			value;
		}
		String getKey(){
			name()
		}
		static list() {
			[H, C, L]
		}
	}
		
	public enum SexoType{
		M("Masculino"),
		F("Feminino"),
		O("Outros")
 
		final String value;
 
		SexoType(String value) {
			this.value = value;
		}
		String toString(){
			value;
		}
		String getKey(){
			name()
		}
		static list() {
			[M, F, O]
		}
	}

	public enum UsuarioType{
		C("Cliente"),
		A("Administrador")
 
		final String value;
 
		UsuarioType(String value) {
			this.value = value;
		}
		String toString(){
			value;
		}
		String getKey(){
			name()
		}
		static list() {
			[C, A]
		}
	}
		
}
