package school.sptech;

import java.util.Scanner;

public class ExemploScanner {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.printf("digite seu nome:");
        String nome = input.nextLine();
        System.out.printf("Você é o %s \n", nome);

        System.out.println("Digite sua idade:");
        Integer idade = input.nextInt();
        System.out.printf("você tem %d anos \n", idade);

        System.out.println("Digite sua altura:");
        Double altura = input.nextDouble();
        System.out.printf("A sua aoltura é %.2f", altura);

        input.close();
    }
}
