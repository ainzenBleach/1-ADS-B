package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Playlist {
    private String nome;
    private Usuario usuario;
    private List<Musica> musicas;

    public Playlist(String nome, Usuario usuario){
        this.nome = nome;
        this.usuario = usuario;
        this.musicas = new ArrayList<>();
    }

    public void adicionarMusica(Musica novaMusica){
        musicas.add(novaMusica);
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public List<Musica> getMusicas() {
        return musicas;
    }

    @Override
    public String toString() {
        return "Playlist{" +
                "nome='" + nome + '\'' +
                ", usuario=" + usuario +
                ", musicas=" + musicas +
                '}';
    }
}
