package school.sptech;

public class Musica {
    private String nome;
    private String artista;
    private String duracao;

    public Musica(String nome, String artista, String duracao) {
        this.nome = nome;
        this.artista = artista;
        this.duracao = duracao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getDuracao() {
        return duracao;
    }

    public void setDuracao(String duracao) {
        this.duracao = duracao;
    }

    // Override -> Sobrescrever a
    @Override
    public String toString() {
        return "Musica{" +
                "nome='" + nome + '\'' +
                ", artista='" + artista + '\'' +
                ", duracao='" + duracao + '\'' +
                '}';
    }
}
