package org.example;

import java.util.concurrent.ThreadLocalRandom;

public class exemplo7 {


    public static void main(String[] args) {
        // Double numeroAleatorio = Math.random() * 10 + 10;
        Integer numeroAleatorio =  ThreadLocalRandom.current().nextInt(0,11);
        System.out.printf("Numero aleatorio: %d", numeroAleatorio);
        System.out.println();
        Double DoubleAleatorio = ThreadLocalRandom.current().nextDouble(0, 11);
        System.out.printf("Double aleatorio: %.2f", DoubleAleatorio);
    }

}


