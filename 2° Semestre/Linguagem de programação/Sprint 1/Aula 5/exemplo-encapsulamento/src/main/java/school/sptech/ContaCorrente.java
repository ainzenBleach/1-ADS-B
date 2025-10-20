package school.sptech;

import org.w3c.dom.ls.LSOutput;

import java.security.PublicKey;
import java.util.concurrent.ThreadLocalRandom;

public class ContaCorrente {
    private String numeroConta;
    private String titular;
    private String telefone;
    private String email;

    //Proibe a modificação sem ser nomesmo arquivo
    // base do encapsulamento (modificador de acesso)
    // Boa pratica é private para evitar modificações e public nos construtores e medotodos
    private Double saldo;

    // Contrutores são utilizados para estruturar mestodos, e ao deixar valores padrões
    // Construtores são codados entre os atributos e os metodos.
    // Contrutores podem ter sobrecarga
    // Contrutores são metodos, seguindo as regras do nome dele ser igual ao nome da classe

    // Construtor
    public ContaCorrente(String titular, String telefone){
        numeroConta = "" + ThreadLocalRandom.current().nextInt(1000, 2000);
        saldo = 0.0;

        // This é usado quando a ambiguidade no codigo com variavei com mesmo nome
        // This pode ser usado como corrente
        // Utilizando como corrente o this deve ser a primeria linha do contrutos
        this.titular = titular;
        this.telefone = telefone;
    }
     public ContaCorrente(String titular,String telefone, String email){
        this(titular, telefone);
        this.email = email;
    }

    public void depositar(Double valorDeposito){
        if (valorDeposito != null && valorDeposito > 0) {
            saldo += valorDeposito;
            System.out.println("Deposito realizado com sucesso");
        } else {
            System.out.println("Valor de deposito invalido");
            return;
        }
    }

    public Double sacar(Double valorDoSaque){
        if(valorDoSaque == null || valorDoSaque <= 0){
            System.out.println("Valor de saque invalido");
            return 0.0;
        }
        if(saldo < valorDoSaque){
            System.out.println("Saldo insuficiente");
            return 0.0;
        }

        saldo -= valorDoSaque;
        System.out.println("Saque realizado com sucesso");
        return valorDoSaque;
    }

    public void exibirInformacoes(){
        System.out.println("""
                -------------------
                Conta Corrente                
                -------------------
                Número: %s    
                Titular: %s
                Telefone: %s
                Saldo: R$ %.2f  
                Email: %s                          
                -------------------
                 """.formatted(numeroConta,titular,telefone,saldo,email));
    }

    // get e set nome dado aos retornos de valores de atributos privade
    // alt + insert: abre o generate

    public Double getSaldo() {
        return saldo;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }


}

