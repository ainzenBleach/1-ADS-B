package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class ExemploLista {
    public static void main(String[] args) {
        // List não aceita tipos primitivos
        List<Integer> numeros = new ArrayList<>();
        numeros.add(20);
        // VAi dar exception
        // numeros.remove(-1);
        Integer paraRemover = 20;
        numeros.remove(paraRemover);

        System.out.println(numeros);
        System.out.println("Tamanho:" + numeros.size());


        // List.of é uma lista imutável
        List<String> frutasIniciais = List.of("Maca","Banana","Pera","Goiaba");
        // Array list é uma lista mutável
        List<String> frutas = new ArrayList<>(frutasIniciais);
        System.out.println(frutas.get(0));
        frutas.add("Abacaxi");
        frutas.remove("Banana");
        frutas.remove(0);
        System.out.println(frutas);

        // Atualiza os valores
        frutas.set(1,"Manga");
        // Adiciona no indice 0
        frutas.addFirst("Morango");
        // Adicionar varios elementos
        frutas.addAll(List.of("Siriguela", "Fruta pão", "Carambola"));
        // Remover varios
        frutas.removeAll(List.of("Morango","Manga"));
        System.out.println(frutas);

        // Não podemos alterar o ArrayList no enchaced for
        System.out.println("For indo");
        for (String frutaDaVez : frutas) {
            System.out.println(frutaDaVez);
        }

        System.out.println("For votando");
        for (int i = frutas.size() - 1; i >= 0; i--) {
            System.out.println(frutas.get(i));
        }

        //Limpar frutas
        frutas.clear();

        // ArrayList é uma classe que possui metodos e é dinamico

    }
}
