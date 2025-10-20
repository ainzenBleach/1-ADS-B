package school.sptech;

public class AlunoPos extends Aluno {

    private Double notaTCC;

    public AlunoPos(String RA, String nome) {
        super(RA, nome);
    }

    // polimorfismo usar o mesmo medotodo em diferentes classes

    @Override
    public Double mediaFinal(){
        return getNotaAc1() * 0.1 + getNotaAc2() * 0.15 + getNotaAc3() * 0.25 + notaTCC * 0.5;
    }

    public Double getNotaTCC() {
        return notaTCC;
    }

    public void setNotaTCC(Double notaTCC) {
        this.notaTCC = notaTCC;
    }



    @Override
    public String toString() {
        return "AlunoPos{" +
                "notaTCC=" + notaTCC +
                "} " + super.toString();
    }
}
