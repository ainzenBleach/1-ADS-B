package school.sptech;

import java.util.Scanner;

public class ExemploSwitchCaseExpression {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Digite um numero:");
        Integer numeroUsuario = input.nextInt();

        String mensagem =
        switch (numeroUsuario) {
            case 1:
                yield "Domingo";

            case 2:
                yield "Segunda T-T";

            case 3:
                yield "Terça";

            case 4:
                yield "Quarta";

            case 5:
                yield "Quinta";

            case 6:
                yield "Sexta";

            case 7:
                yield "Sabado";

            default:
                yield null;

        };
        System.out.println(mensagem);
    }
}
