package org.example;

public class variaveis {
    public static void main(String[] args) {

        // Variaveis primitivas
        String nome = "Samuel";
        int idade = 80;
        long valorGrande = 1000L;
        double peso = 90.2;
        float altura = 1.80f;
        char letra = 'a';
        boolean temCarro = false;

        //variaveis waper
        Integer oIdade = 10; // A diferença com a variavel int
        // é a possibilidade de modificar caracteristicas. Aceita valores nulos
        Long oVAlorGrande = 10000000L;
        Float oAltura = 1.9f;
        Double oPeso = 87.91;
        Character oLetra = 'C';
        Boolean oTemCarro = false;

        System.out.println("Nome:" + nome);
        System.out.println("Idade:" + idade);
        System.out.println("Altura:" + oAltura);

    }
}
