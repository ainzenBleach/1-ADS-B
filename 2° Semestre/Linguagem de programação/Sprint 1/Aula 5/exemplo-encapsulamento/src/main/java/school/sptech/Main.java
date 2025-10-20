package school.sptech;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {

        ContaCorrente conta1 = new ContaCorrente(
                "Jalim Rabey", "11 4002-8922"
        );

       // conta1.titular = "Jalim Rabey";
       // conta1.telefone = "11 4002-8922";

        // Escapsulamento é uma proteção nos dados

        conta1.depositar(50.0);
        conta1.sacar(10.0);
        conta1.exibirInformacoes();
        System.out.println("O saldo da minha conta é:" + conta1.getSaldo());

        ContaCorrente conta2 = new ContaCorrente(
                "Jalan bipao", "11 4002-8922", "Pauzitos@email.com"
        );

       // conta1.titular = "Jalim Rabey";
       // conta1.telefone = "11 4002-8922";

        conta2.depositar(50000.0);
        conta2.sacar(100.0);
        conta2.exibirInformacoes();
    }
}