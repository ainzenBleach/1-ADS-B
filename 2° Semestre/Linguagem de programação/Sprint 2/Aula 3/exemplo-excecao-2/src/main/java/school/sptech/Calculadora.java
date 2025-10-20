package school.sptech;

public class Calculadora {

    // throws lança  a seção e deixa quem chamou tratar
    public Integer dividir(Integer n1, Integer n2) throws NumeroNegativoException {

        if(n1 < 0 || n2 < 0){
            throw new NumeroNegativoException();
        }

        if(n1 < n2){
            throw new DivisaoInvalidaException("Divisor maior que o dividendo");
        }

        return n1/n2;

    }

}
