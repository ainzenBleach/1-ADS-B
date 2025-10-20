package school.sptech;

import java.util.Scanner;

public class ExemploSwitchVariosCases {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Digite um numero:");
        Integer numeroUsuario = input.nextInt();

        String mensagem =
                switch (numeroUsuario) {
                    case 1:
                    case 7:
                        yield "Final de semana bb!";
                    default:
                        yield "Dia util";

                };
        String mensagem2 =
                switch (numeroUsuario) {
                    case 1, 7:
                        yield "Final de semana bb!";
                    default:
                        yield "Dia util";

                };
        String mensagem3 =
                switch (numeroUsuario) {
                    case 1, 7 -> "Final de semana bb!";
                    default ->  "Dia util";

                };
        System.out.println(mensagem + mensagem3 +  mensagem2);
    }
}
