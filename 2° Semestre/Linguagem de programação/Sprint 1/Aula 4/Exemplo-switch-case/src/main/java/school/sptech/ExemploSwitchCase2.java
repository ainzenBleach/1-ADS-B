package school.sptech;

import java.sql.SQLOutput;
import java.util.Scanner;

public class ExemploSwitchCase2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Digite um numero:");
        Integer numeroUsuario = input.nextInt();
        String mensagem = null;

        // Switch case não aceita numeros quebrados
        switch (numeroUsuario){
            case 1 -> {
                mensagem = "Domingo";
                System.out.println("Domingo");
            }

            case 2 -> mensagem = "Segunda T-T";

            case 3 -> mensagem = "Terça";

            case 4 -> mensagem = "Quarta";

            case 5 -> mensagem = "Quinta";

            case 6 -> mensagem = "Sexta";

            case 7 -> mensagem = "Sabado";

            default -> mensagem = "Coloque um numero entre 1 e 7";

        }
        System.out.println(mensagem);

    }
}
