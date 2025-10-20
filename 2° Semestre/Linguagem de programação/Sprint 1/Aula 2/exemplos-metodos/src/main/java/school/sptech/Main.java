package school.sptech;

// Nome de classes - PascalCase
// metodos e variaveis - camelCase
// NOme de projeto - kebab-saca
// Utilizar o return para parar o codigo do metodo
// Utilizar o break para parar laços de repetição

public class Main{

    public static void main(String[] args) {
        Auxiliar auxiliar = new Auxiliar();
        auxiliar.exibirBomDia();
        auxiliar.exibirBomDia("Chupei pal " );
        auxiliar.exibirBomDia("allgames_tupra","Kunava ra");

        Double media = auxiliar.calcularMedia(4.5,9.7, 8.8);
        System.out.printf("Sua média é: %.2f \n",media);
        Double notaFinal = media + 1;
        System.out.printf("Sua nota final é: %.2f", notaFinal);


    }



}