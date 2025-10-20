package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Faculdade {
    private String nome;
    private final List<Aluno> alunos;

    public Faculdade(String nome) {
        this.nome = nome;
        this.alunos = new ArrayList<>();
    }

    public void matricularAluno(Aluno aluno){
        this.alunos.add(aluno);
    }

    public void exibirMedias(){
        System.out.println("Medias dos alunos:");
        for (Aluno aluno : alunos) {
            System.out.println(aluno.mediaFinal());
        }
    }
// instanceof compara o objeto é uma instancia de uma determinada classe

    public void exibirNotasTCC(){
        System.out.println("Notas TCC:");
        for (Aluno aluno : alunos) {
           // if(aluno instanceof AlunoPos){
           // AlunoPos alunoPos = (AlunoPos) aluno;
           // System.out.println(alunoPos.getNotaTCC());
           // }

            if (aluno instanceof AlunoPos alunoPos){
                System.out.println(alunoPos.getNotaTCC());
            }

        }
    }

    public void exibirAlunos(){
        System.out.println("Alunos da" + this.nome);
        for (Aluno aluno : alunos) {
            System.out.println(aluno);
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Aluno> getAlunos() {
        return alunos;
    }
}
