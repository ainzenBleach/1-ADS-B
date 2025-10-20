package school.sptech;

import java.util.Scanner;

public class ExemploSwitchCase {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Digite um numero:");
        Integer numeroUsuario = input.nextInt();


        // Switch case não aceita numeros quebrados
        switch (numeroUsuario){
            case 1:
                System.out.println("Domingo");
                break;
            case 2:
                System.out.println("Segunda T-T");
                break;
            case 3:
                System.out.println("Terça");
                break;
            case 4:
                System.out.println("Quarta");
                break;
            case 5:
                System.out.println("Quinta");
                break;
            case 6:
                System.out.println("Sexta");
                break;
            case 7:
                System.out.println("Sabado");
                break;
            default:
                System.out.println("Coloque um numero entre 1 e 7");
                break;
        }

    }
}
