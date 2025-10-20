package school.sptech;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //Criar uma instacia de bilheteUnico chamado bilheteUnico1
        BilheteUnico bilheteUnico1 = new BilheteUnico();
        BilheteUnico bilheteUnico2 = new BilheteUnico();

        bilheteUnico1.numero = "00001";
        bilheteUnico1.cor = "Branco";
        bilheteUnico1.saldo = 0.0;
        bilheteUnico1.idoso = false;
        bilheteUnico1.nome = "Chupay pao";
        bilheteUnico2.estudante = true;

        System.out.println("Recarregando bilhete 1");
        bilheteUnico1.regarregar(100.0);

        System.out.println("Passando bilhete");
        bilheteUnico1.passarBilhete(true);

        bilheteUnico2.numero = "00002";
        bilheteUnico2.cor = "Preto";
        bilheteUnico2.saldo = 0.0;
        bilheteUnico2.idoso = true;
        bilheteUnico2.nome = "Chupay pinto";
        bilheteUnico2.estudante = false;

        System.out.println("Recarregando bilhete 2");
        bilheteUnico2.regarregar(30.0);

        System.out.println("Passando bilhete");
        bilheteUnico2.passarBilhete(false);

        System.out.println("Bilhete 1");
        bilheteUnico1.printarInformacoes();

        System.out.println();

        System.out.println("Bilhete 2");
        bilheteUnico2.printarInformacoes();



    }
}