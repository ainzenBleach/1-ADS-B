package org.example;

public class EstruturaDecisao {
    public static void main(String[] args) {
        // if, else if, else. operador ternario.
        // > < => <= == != ===

        Integer idade = 10;

        if(idade >= 18){
            System.out.println("Pode dirigir o carro  votar");
        }else if(idade >= 16){
            System.out.println("Pode votar");
        }else{
            System.out.println("Pode nada");
        }

        // operador ternario
        String mensagem = idade >= 18? "Você é maior de idade" : "Baby";
        System.out.println(mensagem);

    }
}
