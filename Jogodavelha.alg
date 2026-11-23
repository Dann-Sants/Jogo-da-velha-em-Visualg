Algoritmo "jogo_da_velha"

Var
   matriz: vetor[1..3, 1..3] de caractere
   jogada, jogador_atual, vencedor: caractere
   cont, l, c, turno: inteiro
   jogada_valida, vitoria: logico

Inicio
   cont <- 0
   jogador_atual <- "X"
   vencedor <- ""
   turno <- 0

   para l <- 1 ate 3 faca
      para c <- 1 ate 3 faca
         cont <- cont + 1
         matriz[l,c] <- NumPCarac(cont)
      fimpara
   fimpara

   repita
      para l <- 1 ate 3 faca
         escreval("+--++--++--+")
         para c <- 1 ate 3 faca
            escreva("|", matriz[l,c]:2, "|")
         fimpara
         escreval("")
      fimpara
      escreval("+--++--++--+")

      escreva("Em qual posicao voce quer o [", jogador_atual, "]? ")
      leia(jogada)
      limpatela

      jogada_valida <- falso
      vitoria <- falso

      para l <- 1 ate 3 faca
         para c <- 1 ate 3 faca
            se (jogada = matriz[l,c]) e (matriz[l,c] <> "X") e (matriz[l,c] <> "O") entao
               jogada_valida <- verdadeiro
               matriz[l,c] <- jogador_atual
               turno <- turno + 1
            fimse
         fimpara
      fimpara

      para l <- 1 ate 3 faca
         se (matriz[l,1] = matriz[l,2]) e (matriz[l,2] = matriz[l,3]) entao
            vitoria <- verdadeiro
         fimse
      fimpara

      para c <- 1 ate 3 faca
         se (matriz[1,c] = matriz[2,c]) e (matriz[2,c] = matriz[3,c]) entao
            vitoria <- verdadeiro
         fimse
      fimpara

      se (matriz[1,1] = matriz[2,2]) e (matriz[2,2] = matriz[3,3]) entao
         vitoria <- verdadeiro
      fimse

      se (matriz[1,3] = matriz[2,2]) e (matriz[2,2] = matriz[3,1]) entao
         vitoria <- verdadeiro
      fimse

      se (jogada_valida = falso) entao
         escreval("Jogada INVALIDA!")
      senao
         se (vitoria = verdadeiro) entao
            vencedor <- jogador_atual
            turno <- turno + 10
         senao
            se (jogador_atual = "X") entao
               jogador_atual <- "O"
            senao
               jogador_atual <- "X"
            fimse
         fimse
      fimse
   ate (turno >= 9)

   para l <- 1 ate 3 faca
      escreval("+--++--++--+")
      para c <- 1 ate 3 faca
         escreva("|", matriz[l,c]:2, "|")
      fimpara
      escreval("")
   fimpara
   escreval("+--++--++--+")

   se (vencedor <> "") entao
      Escreval("FIM DE JOGO!!")
      Escreval("O jogador ", vencedor, " venceu!")
   senao
      Escreval("FIM DE JOGO!!")
      Escreval("Deu velha! O jogo terminou empatado.")
   fimse
Fimalgoritmo