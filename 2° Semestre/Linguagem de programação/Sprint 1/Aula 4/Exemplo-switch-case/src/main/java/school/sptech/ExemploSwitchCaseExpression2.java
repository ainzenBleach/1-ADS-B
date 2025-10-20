package school.sptech;

import java.util.Scanner;

public class ExemploSwitchCaseExpression2 {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Digite um numero:");
        Integer numeroUsuario = input.nextInt();

        String mensagem =
                switch (numeroUsuario) {
                    case 1 -> "Domingo";

                    case 2 -> "Segunda T-T";

                    case 3 -> "Terça";

                    case 4 -> "Quarta";

                    case 5 -> "Quinta";

                    case 6 -> "Sexta";

                    case 7 -> "Sabado";

                    default -> null;

                };
        System.out.println(mensagem);
    }
}
