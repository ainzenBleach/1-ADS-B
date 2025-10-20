package school.sptech;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        Usuario usuario01 = new Usuario(
                "Samuel","Samuel.barros@sptech.school","11 940028922"
        );

        Musica musica01 = new Musica("Better place","NSYNC","300");
        Musica musica02 = new Musica("Rap hashirama","7 MInutos","240");
        Musica musica03 = new Musica("Smooth crimanl","Michael jackson","300");

        Playlist playlist01 = new Playlist(
                "Treino pesado 2022 atualizado",
                usuario01);

        playlist01.adicionarMusica(musica01);
        playlist01.adicionarMusica(musica02);
        playlist01.adicionarMusica(musica03);

        System.out.println("Musica da Playlist 01:" + playlist01.getMusicas() );

        System.out.println("Playlist 1" + playlist01);
    }

}