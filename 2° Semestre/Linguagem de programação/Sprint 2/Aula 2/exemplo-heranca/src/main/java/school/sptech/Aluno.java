package school.sptech;

public class Aluno {
    // Final antes da variavel define que ela ser imutavel

    private final String RA;
    private final String nome;
    private Double notaAc1;
    private Double notaAc2;
    private Double notaAc3;

    public Aluno(String RA, String nome) {
        this.RA = RA;
        this.nome = nome;
    }

    public Double mediaFinal(){
        return (notaAc1 * 0.25) + (notaAc2 * 0.35) + (notaAc3 * 0.40);
    }


    public String getRA() {
        return RA;
    }

    public String getNome() {
        return nome;
    }

    public Double getNotaAc1() {
        return notaAc1;
    }

    public void setNotaAc1(Double notaAc1) {
        this.notaAc1 = notaAc1;
    }

    public Double getNotaAc2() {
        return notaAc2;
    }

    public void setNotaAc2(Double notaAc2) {
        this.notaAc2 = notaAc2;
    }

    public Double getNotaAc3() {
        return notaAc3;
    }

    public void setNotaAc3(Double notaAc3) {
        this.notaAc3 = notaAc3;
    }

    @Override
    public String toString() {
        return "Aluno{" +
                "RA='" + RA + '\'' +
                ", nome='" + nome + '\'' +
                ", notaAc1=" + notaAc1 +
                ", notaAc2=" + notaAc2 +
                ", notaAc3=" + notaAc3 +
                '}';

    }
}