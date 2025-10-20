package school.sptech;

import java.util.Arrays;

public class ExemplosVetores {

    public static void main(String[] args) {




        int[] numeros =  new int[5];
        System.out.println(Arrays.toString(numeros));
        numeros[2] = 56478923;
        System.out.println(numeros[2]);

        Integer[] idades = new Integer[5];
        System.out.println(Arrays.toString(idades));
        idades[2] = 12912239;
        System.out.println(idades[2]);

        // int[] numerosPreenchidos = {2,10,8};
        int[] numerosPreenchidos = new int[] {2,10,8}; // Mais seguro que o de cima
        System.out.println(Arrays.toString(numerosPreenchidos));

        // for tradicional ou for 1
        for (int i = 0; i < numerosPreenchidos.length; i++) {
            int numeroDaVez = numerosPreenchidos[i];
            System.out.println(numeroDaVez);
        }

        // for aprimorado
        for (int numeroDaVez : numerosPreenchidos) {
            System.out.println(numeroDaVez);
        }

        String[] frutas = new String[3];
        frutas[0] = "Mamao";
        System.out.println(Arrays.toString(frutas));

        boolean[] likes = new boolean[10];
        System.out.println(Arrays.toString(likes));


    }
}