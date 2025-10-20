package school.sptech;

import java.util.InputMismatchException;
import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args){
        // Exceptions - Consigo tratar em tempo de execução
        // - NullPointerExecption
        // - ClassCastException
        // - ArrayIndexOutOfBoundsException
        // - IOException
        //
        // Unchecked Exception
        // - Não sou obrigado a tratar
        // Checked Exceptiion
        //  - Obrigaod a tratar
//----------------------------------------------------------------------------------/
        // Errors - Não consgio tratar em tempo de execução
        // - StackOverFlowError
        // - OutOdMemoryError

        Calculadora calculadora = new Calculadora();

        Scanner input = new Scanner(System.in);
        // TryCatch - trata erro do exception
        try{

        System.out.println("Digite o número 1:");
        Integer n1 = input.nextInt();

        System.out.println("Digite o número 2:");
        Integer n2 = input.nextInt();

        System.out.println("Divisão:" + calculadora.dividir(n1, n2));

        // Dentro do catch coloca a exception que você quer tratar
        } catch (InputMismatchException e) {
            System.out.println("Caractares digitados invalidos, digite apenas números");

        } catch (NumeroNegativoException e){
            System.out.println("Não é possivel dividir com números negativos");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println("Erro desconhecido");;
        }
    }
}
