#!/bin/bash

# Aqui voy a tratar de simular un juego de combate sencillo al estilo rpg

# Primero vamos a definir los numeros del jugador y del enemigo que manejara el programa
personaje_salud=100
personaje_mana=50
personaje_ataque=15
enemigo_salud=200
enemigo_ataque=10
acto_enemigo=4

# Creamos la funcion de ataque usando Random para darle algo mas de aleatoriedad al juego

rango_ataque(){
    echo $((RANDOM % $1 + 5))
}
# Creamos una funcion para hacer que el enemigo actue de forma aleatoria
rango_enemigo(){
    echo $((RANDOM % $1))
}


# Introduccion del juego
echo -e "\n\n\n\n\n\n"
echo "              ⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡆      "
echo "              ⠉⠹⣿⣷⣀⠀⠀⠀⠀⢰⣶⡤⠀⢤⣴⡶⠀⠀⠀⠀⢀⣼⣿⠟⠉⠁      "
echo "              ⠀⠀⠈⠻⣿⣦⣄⠀⢀⣼⡟⠓⠀⠘⠛⣷⣄⠀⢀⣴⣿⡿⠁⠀⠀⠀      "
echo "              ⠀⠀⠀⠀⠙⢿⣿⣶⣿⠉⠀⠀⠀⠀⠀⠈⢻⣷⣿⡿⠋⠀⠀⠀⠀⠀      "
echo "              ⠀⢀⡀⢀⣠⡾⠿⡹⢆⠠⡀⠀⠀⠀⢀⠔⣡⠞⡹⢷⡄⡀⢀⡀⠀⠀      "
echo "              ⠀⠸⡯⣿⠛⠁⠀⠀⢈⠲⣌⠢⡀⡠⣡⠞⡡⠊⠀⠀⠛⣿⢿⡛⠀⠀      "
echo "              ⠀⠀⠁⠀⠀⠀⠀⠀⠀⠑⢌⡱⢊⡴⢃⠌⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀      "
echo "              ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⠔⢋⢔⠑⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      "
echo "              ⠀⠀⠀⠀⠀⠀⠀⠀⡐⡡⢂⠔⠉⠢⡙⢌⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀      "
echo "              ⠀⠀⠀⠀⠀⠀⡠⠊⠈⡠⠀⠀⠀⠀⠈⠢⡁⠌⢆⠀⠀⠀⠀⠀⠀⠀      "
echo "              ⠀⠀⠀⠀⢀⠔⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⠈⠢⡀⠑⠄⠀⠀⠀⠀⠀      "
echo "              ⠀⠀⠀⡠⠀⡠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠠⡈⢢⠀⠀⠀⠀      "
echo "              ⠀⠀⣔⡠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠢⡡⡀⠀⠀      "
echo "               ⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀      "
echo ""
echo "                ¡ Pelea de Terminal !                                "
echo ""
echo "      Las reglas son simples, derrota a tu enemigo.                   "
echo "      Puedes atacar, lanzar magia o curarte.                         "
echo "      La magia y la curacion consumen Mana.   "
echo "      El Mana se recupera con la accion (Atacar)                                 "
echo "      ¡Ojo el enemigo tambien podra hacer lo mismo!               "
echo ""
read -rp "Introduce tu nombre: " jugador
echo -e "\n"

# Eleccion de clase
while true; do
echo "¡Elige que clase quieres ser!"
echo " "
echo "Elige una para saber mas de ella"
echo " "
echo "(1) Guerrero"
echo "(2) Mago"
echo "(3) Picaro"
read -rp " " clase
# Formula para elegir la clase
if [[ $clase == "1" ]]; then
    echo -e "\n"
    echo "El Guerrero posee una vida mas elevada"
    echo " "
    echo "Eliges Guerrero? S/N "
    read -rp " " eleccion
        if [[ $eleccion == [Ss] ]]; then
            personaje_salud=200
            break
        else continue
        fi
elif [[ $clase == "2" ]]; then
    echo -e "\n"
    echo "El Mago posse una mayor cantidad de Mana inicial"
        echo " "
        echo "Eliges Mago? S/N"
        read -rp " " eleccion
        if [[ $eleccion == [Ss] ]]; then
            personaje_mana=100
            break
        else continue
        fi
elif [[ $clase == "3" ]]; then
    echo -e "\n"
    echo "El Picaro tiene un daño muy alto pero tiene menos vida"
    echo " "
        echo "Eliges Picaro? S/N"
        read -rp " " eleccion
        if [[ $eleccion == [Ss] ]]; then
            personaje_salud=75
            personaje_ataque=$((personaje_ataque*2))
            break
        else continue
        fi
else
    echo "Opcion invalida"
    continue
fi
done

# Eleccion de la dificultad
while true; do
echo " "
echo "Elige la dificultad "
echo "(1) Facil"
echo "(2) Normal"
echo "(3) Dificil"
read -rp " " dificultad
if [[ $dificultad == "1" ]]; then
    # La opcion facil reduce la vida y el ataque del enemigo a la mitad
    enemigo_salud=$((enemigo_salud/2))
    enemigo_ataque=$((enemigo_ataque/2))
    break
elif [[ $dificultad == "2" ]]; then
    # La opcion normal mantiene los valores base
    break
elif [[ $dificultad == "3" ]]; then
    # La opcion dificil duplica la vida y el ataque del enemigo
    enemigo_salud=$((enemigo_salud*2))
    enemigo_ataque=$((enemigo_ataque*2))
    break
else
    # Si la opcion no esta en el bucle se repite
    echo "Opcion invalida"
    echo " "
fi
done
clear
# Mensaje de Bienvenida
# Aqui se encuentra las funciones para que el nombre siempre aprezca ene el centro pero alineado
mensaje="!Buena suerte $jugador!"
ocupado=$((((51-${#mensaje})/2) + ${#mensaje}))
espacios=" "
echo " "
echo   "   |||||---------------------------------------------------|||||"
printf   "   ||  |%$((ocupado))s%$((51-ocupado))s|  ||\n" "$mensaje" "$espacios"
echo   "   |||||---------------------------------------------------|||||"
echo   "   ||                                                         ||"
echo   "   ||                               \O                        ||"
echo  " __||__                              |\                     __||__"
echo "|______|____________________________/_\____________________|______|"
echo " "
# Bucle en el que estaria el juego

readonly vida_fija=$personaje_salud
readonly vida_fija_enemigo=$enemigo_salud
readonly mana_fijo=$personaje_mana


while true; do
    jugador_info="   $jugador $personaje_salud/$vida_fija       Enemigo $enemigo_salud/$vida_fija_enemigo   "
    mana_info="     Mana $personaje_mana/$mana_fijo          "
    # Interfaz
    printf '%.0s-' {1..50}
    echo " "
    # Imprime información del jugador y enemigo centrada
    printf "%*s\n" $(((${#jugador_info}+50)/2)) "$jugador_info"
    # Imprime mana centrado
    printf "%*s\n" $(((${#mana_info}+50)/2)) "$mana_info"
    printf '%.0s-' {1..50}
    echo " "
    echo  "( •_•)                (•_• )"
    echo  "( ง )ง                ୧( ୧ )"
    echo   ' /︶\                   /︶\'
    # Turno del personaje
    echo "Tu turno"
    echo "¿Que quieres hacer?"
    echo "(1) Atacar  [ +  5 Mana]"
    echo "(2) Magia   [ - 20 Mana]"
    echo "(3) Curarte [ - 10 Mana]"
    read -rp " " accion
    echo " "
    clear
    if [[ $accion == "1" ]]; then
        # Ataca el personaje
        echo "Atacas al enemigo"
        ataque_personaje=$(rango_ataque $personaje_ataque)
        echo " "
        echo "( ・∀・) ⊃-[===>"
        echo " "
        echo "Haces $ataque_personaje puntos de daño"
        echo " "
        personaje_mana=$((personaje_mana + 5))
            if [[ $clase == "2" && personaje_mana -gt 75 ]]; then
                personaje_mana=75
            elif [[ personaje_mana -gt 50 ]]; then
                personaje_mana=50
            else
                personaje_mana=$personaje_mana
            fi
        enemigo_salud=$((enemigo_salud - ataque_personaje))
        if [[ $enemigo_salud -le 0 ]]; then
            # Ganas
            echo "¡Ganaste!"
            echo " "
            echo "ᕦ( ᐛ )ᕤ"
            echo " "
            break
        fi
    elif [[ $accion == "2" ]]; then
        # El personaje lanza magia
        echo "Lanzas un hechizo"
        personaje_mana=$((personaje_mana-20))
            if [[ personaje_mana -lt 0 ]]; then
            personaje_mana=$((personaje_mana+20))
            echo "No tienes mana suficiente"
            continue
            fi
        ataque_personaje=$(rango_ataque $personaje_ataque)
        magia=$((ataque_personaje * 3))
        echo " "
        echo "(◡◕⏖◕)ᑐ🝐 ⠁⭒*.✩.*⭒⠁"
        echo " "
        echo "Haces $magia puntos de daño"
        echo " "
        enemigo_salud=$((enemigo_salud - magia))
        if [[ $enemigo_salud -le 0 ]]; then
            # Ganas
            echo "¡Ganaste!"
            echo " "
            echo "ᕦ( ᐛ )ᕤ"
            echo " "
            break
            fi
    elif [[ $accion == "3" ]]; then
        # El personaje se cura
        personaje_mana=$((personaje_mana-10))
            if [[ personaje_mana -lt 0 ]]; then
            personaje_mana=$((personaje_mana+10))
            echo "No tienes mana suficiente"
            continue
            fi
        cura_personaje=$(rango_ataque $personaje_ataque)
        cura=$(( cura_personaje * 2 ))
        personaje_salud=$((personaje_salud + cura))
        echo ""
        echo "⋆˙⟡♡✧˖°"
        echo " "
        echo "Te curas $cura vida"
        echo " "
            if  [[ $clase == "1" && personaje_salud -gt 150 ]]; then
                personaje_salud=150
            elif [[ $clase == "3" && personaje_salud -gt 75 ]]; then
                personaje_salud=75
            elif [[ personaje_salud -gt 100 ]]; then
                personaje_salud=100
            else
                personaje_salud=$personaje_salud
            fi
    else
        # Accion invalida
        echo " "
        echo "Accion invalida"
        echo " "
        continue
    fi

    # Turno del enemigo
    echo "Turno del enemigo"
    accion_enemigo=$(rango_enemigo $acto_enemigo)
    if [[ $accion_enemigo == 0 ]]; then
        # El enemigo ataca
        ataque_enemigo=$(rango_ataque $enemigo_ataque)
        echo " "
        echo "<===]=¤ ༼ ºل͟º ༽"
        echo " "
        echo "El enemigo te hace $ataque_enemigo puntos de daño"
        echo " "
        personaje_salud=$((personaje_salud - ataque_enemigo))
        if [[ $personaje_salud -le 0 ]]; then
            # Pierdes
            echo "¡Perdiste!"
            echo " "
            echo " (x_x)"
            echo " "
            break
        fi
    elif [[ $accion_enemigo == 1 ]]; then
        # El enenmigo hace daño critico
        ataque_enemigo=$(rango_ataque $enemigo_ataque)
        critico=$(( ataque_enemigo * 2 ))
        echo "Critico"
        echo " "
        echo "∋━━o(ఠ益ఠ)"
        echo " "
        echo "El enemigo te hace $critico puntos de daño"
        echo " "
        personaje_salud=$((personaje_salud - critico))
        if [[ $personaje_salud -le 0 ]]; then
            # Pierdes
            echo "¡Perdiste!"
            echo " "
            echo " (x_x)"
            echo " "
            break
            fi
    elif [[ $accion_enemigo == 2 ]]; then
        # El enemigo se cura
        cura_enemigo=$(rango_ataque $enemigo_ataque)
        enemigo_salud=$((enemigo_salud + cura_enemigo))
        echo " "
        echo "ʚ ✮ ɞ"
        echo " "
        echo "El enemigo se cura $cura_enemigo vida"
        echo " "

    else
        # El enemigo no actua
        echo "El enemigo no hace nada"
        echo " "
        echo "༼ ºل͟º ༽"
        echo " "
    fi
done
