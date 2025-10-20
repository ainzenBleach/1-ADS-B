package school.sptech;

import java.util.Scanner;

public class ExemploScanner2 {
    public static void main(String[] args) {
        Scanner inputString = new Scanner(System.in);
        Scanner inputInteger = new Scanner(System.in);

        System.out.println("Digite sua idade:");
        Integer idade = inputInteger.nextInt();

        System.out.println("Digite seu nome:");
        String nome = inputString.nextLine();

        System.out.printf("Você é o %s e tem %d anos", nome, idade);
    }
}
