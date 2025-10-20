package school.sptech;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        Aluno aluno1 = new Aluno("0001000", "chupay pall");

        aluno1.setNotaAc1(8.0);
        aluno1.setNotaAc2(9.0);
        aluno1.setNotaAc3(10.0);

        System.out.println("Nota: %.2f".formatted(aluno1.mediaFinal()));

        AlunoPos aluno2 = new AlunoPos("0001001", "chupay pinto");
        aluno2.setNotaAc1(7.5);
        aluno2.setNotaAc2(8.6);
        aluno2.setNotaAc3(9.1);
        aluno2.setNotaTCC(10.0);

        System.out.println("nota: %.2f".formatted(aluno2.mediaFinal()));

        Faculdade faculdade1 = new Faculdade("Sptech");
        // faculdade1.matricularAluno(aluno1);
        faculdade1.matricularAluno(aluno2);
        faculdade1.exibirAlunos();
        faculdade1.exibirMedias();
        faculdade1.exibirNotasTCC();








    }
}