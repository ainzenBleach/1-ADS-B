package school.sptech;

public class Auxiliar {

    void exibirBomDia(){
        System.out.println("Bom dia, Jovem :) \n");
    }
    // SObrecarga de metodo - quando metodos de mesmo nome tem argumentos diferente(tipos deles e qauntidades nos argumentos)
    void exibirBomDia(String nome){
        System.out.printf("Bom dia, %s:) \n", nome);
    }

    // Não pode
    //void exibirBomDia(String local){
    //    System.out.printf("Bom dia, %s", local);
    //}

    void exibirBomDia(String nome, String local){
        System.out.printf("Bom dia, %s :), você está em %s \n", nome, local);
    }

    Double calcularMedia(Double n1, Double n2, Double n3){
        Double media = (n1 + n2 + n3) / 3.0;
        return media;
    }

    Integer calcularMedia(Integer n1, Integer n2){
        Integer media = (n1 + n2) / 2;
        return media;
    }
}
