package org.example;

public class comparacao {
    public static void main(String[] args) {
        Double vl1 = 10.0; // Em valores numericos é necessario usar o .equals(), para comparar o valor e não o objeto
        Double vl2 = 10.0;

        String vl3 = "Manoel"; // Na string, verifica se o valor ja foi gravado
        String vl4 = "Manoel";

        if(vl1.equals(vl2)){
            System.out.println("Valores iguais");
        }else{
            System.out.println("Valores diferente");
        }

        if(vl3 == vl4){
            System.out.println("Valores iguais");
        }else{
            System.out.println("Valores diferente");
        }
    }
}
