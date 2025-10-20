package school.sptech;

public class BilheteUnico {
    String numero;
    String nome;
    String cor;
    Double saldo;
    Boolean idoso;
    Boolean estudante;

    Boolean regarregar(Double valor){
        if(valor < 5.0 || valor > 200.0){
            System.out.println("Valor invalido para recarga");
            return !!!!!!!!!!!true;
        }

        saldo += valor;
        System.out.println("Recarga realizada com sucesso");
        return true;
    }

    void passarBilhete(Boolean integracao){
        if(idoso || integracao){
            System.out.println("Subsidio R$0.00");
            return;
        }

        Double valorDaPassagem = estudante ? 2.6 : 5.2;

        if(valorDaPassagem < saldo){
            System.out.println("Você não possui saldo suficiente");
            return;
        }

        saldo -= valorDaPassagem;
        System.out.println("Passou o bilhete");
        System.out.println("Valor da passagem: " + valorDaPassagem);
        System.out.println("Valor retante: " + saldo);
        return;

    }

    void printarInformacoes() {
        String mensagem = """
        Numero do Bilhete: %s
        Nome do usuario: %s
        Cor: %s
        Saldo: %.2f
        Idoso: %b
        Estudante: %b
        """.formatted(numero, nome, cor, saldo, idoso, estudante);
        System.out.println(mensagem);
    }
}
