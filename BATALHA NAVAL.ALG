Algoritmo "Batalha naval"

// Descrição   : Jogo - Batalha Naval
// Autor(a)    : Marcos Camillo Soares Junior
// Data atual  : Inicio em 20/08/2019

Var

   a:inteiro                         //auxilia o desenho dos 2 mapas um ao lado do outro
   b:inteiro                         //auxilia para regação de barcos da maquina (roda 2 vezes a função aleatorio para coseguir as cordenadas)
   j:Inteiro                         //auxilia para varredura das matrizes ( varre as colunas)
   i:inteiro                         //auxilia para varredura das matrizes (varre as linhas )

   adm:inteiro                       //redireciona o usuaria para o menu do administrador
   run:inteiro                       //variavel para travar o jogo rodando ( coloque um valor negarivo para as bonbas para sair do jogo )
   menu:inteiro                      //Trava o jogador no menu ate selecionar um valor valido
   vazio:caractere                   //variavel para travar o programa em pontos expecificos quando a função mustre_tudo estiver ligada
   bomba:inteiro                     //salva uma entrada de cordenada para a colocação das bombas aleatorias da maquina
   barco:inteiro                     //salva uma entrada de cordenada para função aleatoria
   numero_barcos_maquina:inteiro     //auxilia para contagem de quantos barcos a maquina ja colocou ( impede q ela coloque barcos na mesma posição )
   numero_barcos_jogador:inteiro     //auxilia para contagem de quantos barcos o jogador ja colocou ( impede q ela coloque barcos na mesma posição )
   numero_barcos:inteiro             //numero de barcos q serao colocados para o jogador e para a maquina
   validacao_bomba:inteiro           //Indica q a posição selecionada e valida
   pontos_maquina:inteiro            //pontos da maquina
   pontos_jogador:inteiro            //pontos do jogador

   mapa_barco_maquina:vetor[1..9,1..9] de caractere         //armazena as posições dos barcos da maquina
   mapa_barco_jogador:vetor[1..9,1..9] de caractere         //armazena as posições dos barcos do jogador
   mapa_bomba_maquina:vetor[1..9,1..9] de caractere         //armazena as posições das bombas jogadas pela maquina
   mapa_bomba_jogador:vetor[1..9,1..9] de caractere         //armazena as posições das bombas jogadas pelo jogador

   posicoes_validas:vetor[1..81,1..2] de inteiro            //matriz q salva todas as posibilidades possiveis para a maquina jogar
   posicao:inteiro                                          //auxilia na entrada de cordenadas para aplicar na matriz posicoes_validas

   entrada_bomba:vetor[1..2] de inteiro                     //armazena temporariamente a posição da bomba q sera colocada no mapa
   entrada_barco:vetor[1..2] de inteiro                     //armazena temporariamente a posição do barco q seja colocado no mapa

   //funcoes adm
   funcao_adm:caractere
   mvsm:caractere
   mostre_tudo:caractere


Inicio
   //inicialização de variaveis
   numero_barcos_maquina <- 0
   numero_barcos_jogador <- 0
   validacao_bomba <-1
   numero_barcos <- 2
   mostre_tudo <- "O"
   mvsm <- "O"
   adm <-0
   a<-1

   //inicialização dos mapas
   para i de 1 ate 9 faca
      para j de 1 ate 9 faca
         //inicia as matrizes em "_"
         mapa_barco_maquina [i,j] <- " _"
         mapa_barco_jogador [i,j] <- " _"
         mapa_bomba_maquina [i,j] <- " _"
         mapa_bomba_jogador [i,j] <- " _"

      fimpara
   fimpara

   //Menu do jogo
   menu <- 1
   Repita
      escreval("          BATALHA NAVAL")
      escreval("")
      se menu = 1 entao
         escreval("")
      senao
         escreval ("Escreva um numero valido !")
      fimse
      escreval("Informe o numero de barcos para o jogo (de 1 a 20)")
      leia(numero_barcos)
      limpatela
      se numero_barcos <> 1001101 entao
         se numero_barcos>= 1 entao
            se numero_barcos <= 20 entao
               menu <- 1
            senao
               menu <- 0
            fimse
         senao
            menu<-0
         fimse
      senao
         adm <- 1
      fimse


      //menu do adm
      se adm = 1 entao
         menu <- 0
         repita
            escreval("          BATALHA NAVAL")
            escreval("")
            se funcao_adm = "F" entao
               escreval("COMANDO INVALIDO!")
            senao
               escreval("Menu do administrador")
            fimse
            escreva("'A' - MAQUINA VS MAQUINA ")
            se mvsm = "O" entao
               escreval("(Off)")
            senao
               escreval("(ON)")
            fimse
            escreval("           Subistitue o jogador por outra maquina para uma")
            escreval("           demostração dinamica")
            escreva("'B' - MOSTRE TUDO! ")
            se mostre_tudo = "O" entao
               escreval("(Off)")
            senao
               escreval("(ON)")
            fimse
            escreval("           Mostra todas as mtatrizes e escolhas da maquina")
            escreval("           e nao aplima nenhum 'limpatela'")
            escreval("'C' - VOLTAR AO MENU")
            leia (funcao_adm)
            escolha funcao_adm
            caso "A"
               se mvsm = "A" entao
                  mvsm <- "O"
               senao
                  mvsm <- "A"
               fimse
            caso "B"
               se mostre_tudo = "B" entao
                  mostre_tudo <- "O"
               senao
                  mostre_tudo <- "B"
               fimse
            caso "C"
               adm <-0
            outrocaso
               funcao_adm <-"F"
               escreval("Comando invalido")
            fimescolha
            limpatela
         ate adm =0
      fimse

   ate menu =1
   limpatela

   //inicializacao da matriz opções possiveis
   posicoes_validas [1,1] <- 1
   posicoes_validas [1,2] <- 1
   para i de 2 ate 81 faca
      para j de 1 ate 2 faca
         se j =1 entao
            se posicoes_validas [(i-1),2] = 9 entao
               posicoes_validas [i,j] <- posicoes_validas [(i-1),j] + 1
            senao
               posicoes_validas [i,j] <- posicoes_validas [(i-1),j]
            fimse
         senao
            se posicoes_validas [i-1,j] < 9 entao
               posicoes_validas [i,j] <- posicoes_validas [i-1,j] + 1
            senao
               posicoes_validas [i,j] <- 1
            fimse
         fimse

         se mostre_tudo = "B" entao
            escreva (posicoes_validas [i,j])
            se j = 2 entao
               escreval("")
            fimse
         fimse
      fimpara
   fimpara
   se mostre_tudo = "B" entao
      leia(vazio)
   fimse
   //gera os navios para a maquina
   enquanto numero_barcos_maquina < numero_barcos faca //coloca barcos para maquina ate o numero especificado

      aleatorio on
      aleatorio 1,81
      leia(posicao)
      aleatorio off
      para b de 1 ate 2 faca
         entrada_barco[b]<- posicoes_validas [posicao,b]
         se mostre_tudo = "B" entao
            escreva (entrada_barco[b])
         fimse
      fimpara
      se mostre_tudo = "B" entao
         escreval("")
      senao
         limpatela
      fimse

      numero_barcos_maquina <- 0   //zera contagem de barcos
      se mostre_tudo = "B" entao
         escreval("   1 2 3 4 5 6 7 8 9")
      fimse
      para i de 1 ate 9 faca
         para j de 1 ate 9 faca
            se j=1 entao
               se mostre_tudo = "B" entao
                  escreva (i)
               fimse
            fimse

            se entrada_barco[1] = i entao
               se entrada_barco[2]= j entao
                  mapa_barco_maquina [i,j] <- " M"
               fimse
            fimse

            //conta quantos barcos a maquina colocou
            se mapa_barco_maquina [i,j] = " M" entao
               numero_barcos_maquina <- numero_barcos_maquina + 1
            fimse
            se mostre_tudo = "B" entao
               escreva(mapa_barco_maquina[i,j])
            fimse
            se j = 9 entao
               se mostre_tudo = "B" entao
                  escreval ("")
               fimse
            fimse
         fimpara
      fimpara
      se mostre_tudo = "B" entao
         leia(vazio)
      fimse
   fimenquanto
   escreval("")

   //inicio da colocação do barco do jogador

   entrada_barco[1] <- 0    //zera entrada barcos
   entrada_barco[2] <- 0    //zera entrada barcos
   enquanto numero_barcos_jogador < numero_barcos faca //espera o jogador colocar barcos ate o numero especificado

      numero_barcos_jogador <- 0   //zera contagem de barcos

      escreval("   1 2 3 4 5 6 7 8 9")
      para i de 1 ate 9 faca
         para j de 1 ate 9 faca
            se j=1 entao
               escreva (i)
            fimse

            se entrada_barco[1] = i entao
               se entrada_barco[2]= j entao
                  mapa_barco_jogador [i,j] <- " J"
               fimse
            fimse

            //conta quantos barcos a maquina colocou
            se mapa_barco_jogador [i,j] = " J" entao
               numero_barcos_jogador <- numero_barcos_jogador + 1
            fimse

            escreva(mapa_barco_jogador[i,j])

            se j = 9 entao
               escreval ("")
            fimse
         fimpara
      fimpara

      se mvsm = "A" entao
         aleatorio on
         aleatorio 1,81
         leia(posicao)
         aleatorio off
         para b de 1 ate 2 faca
            entrada_barco[b]<- posicoes_validas [posicao,b]
            se mostre_tudo = "B" entao
               escreva (entrada_barco[b])
            fimse
         fimpara
         se mostre_tudo = "B" entao
            escreval("")
         senao
            limpatela
         fimse
      senao
         se numero_barcos_jogador < numero_barcos entao
            escreval("")
            escreval("Digite a casa onde deseja colocar um barco ")
            escreva("Linha: ")
            leia(entrada_barco[1])
            escreva("Coluna: ")
            leia(entrada_barco[2])
            se mostre_tudo = "B" entao
               escreval("")
            senao
               limpatela
            fimse
         fimse
      fimse
   fimenquanto

   //inicio do loop do programa !
   run <- 1
   repita
      validacao_bomba <- 1
      entrada_bomba [1]<-1
      entrada_bomba [2]<-1
      repita//deixa o jogador preso ate realizar uma jogada valida

         se mostre_tudo = "B" entao //testa a função montre_tudo
            escreval("")
         senao
            limpatela//Limpa a tela para redesenhar a matriz em uma condição normal
         fimse

         //iguala o numero de pontos com o numero de barcos (quando a matriz e comparada o numero e atualizado para decidir de o jogo acabou)
         pontos_jogador <- numero_barcos
         pontos_maquina <- numero_barcos

         //mostra ou nao uma caixa de mensagens ao jogador
         se validacao_bomba = 0 entao
            escreval("Posição invalida, jogue novamente !")
            escreval("")
         senao
            escreval("      Bom jogo")
            escreval("")
         fimse

         //Desenha as mratiz dos mapas do jogador e da maquina e combina as posiçoes onde tem um barco e uma bomba
         escreval("       Jogador                      Maquina")
         escreval("   1 2 3 4 5 6 7 8 9           1 2 3 4 5 6 7 8 9")
         para i de 1 ate 9 faca
            para j de 1 ate 18 faca

               se j=1 entao
                  escreva (i)
               fimse

               se j <= 9 entao
                  //checa se na posição do barco tem uma bomba
                  se mapa_barco_jogador [i,j] = " J" entao
                     se mapa_bomba_maquina [i,j] = " *" entao
                        escreva (" X")//escreve X onde tem bomba e barco
                     senao
                        escreva (mapa_barco_jogador [i,j])//Mostra os barcos do jogador
                     fimse
                  senao
                     escreva (mapa_bomba_maquina [i,j])//se nao tem barcos mostra onde a maquina esta jogando bombas
                  fimse
               fimse

               se j >9 entao
                  //checa se na posição do barco tem uma bomba
                  se mapa_barco_maquina [i,a] = " M" entao
                     se mapa_bomba_jogador [i,a] = " *" entao
                        escreva (" X")//escreve X onde tem bomba e barco
                     senao
                        se mostre_tudo = "B" entao
                           escreva (mapa_barco_maquina [i,a])//montra os barcos conforme a função mostre tudo
                        senao
                           escreva (" _")// esconde os barcos da maquina
                        fimse
                     fimse
                  senao
                     escreva (mapa_bomba_jogador [i,a])//se nao tem barcos mostra onde a jogador esta colocando bombas
                  fimse
                  a <- a +1
               fimse

               se j = 9 entao
                  escreva ("        ",i)
               fimse
               se j=18 entao
                  escreval ("")
                  a<-1
               fimse

            fimpara
         fimpara
         escreval("")

         se mvsm = "A" entao
            timer 300
            escreva ("")
            timer 0
         fimse

         se mvsm = "A" entao
            aleatorio on
            aleatorio 1,81
            leia(posicao)
            aleatorio off
            para b de 1 ate 2 faca
               entrada_bomba[b]<- posicoes_validas [posicao,b]
               se mostre_tudo = "B" entao
                  escreva (entrada_bomba[b])
               fimse
            fimpara
            se mostre_tudo = "B" entao
               escreval("")
            senao
               limpatela
            fimse
         senao
            //Pergunta e coleta a cordenada da nova bomba a ser jogada
            escreval("")
            escreval("Digite a casa onde deseja jogar uma bomba  (coque -1 para sair)")
            escreva("Linha: ")
            leia(entrada_bomba[1])
            escreva("Coluna: ")
            leia(entrada_bomba[2])
            escreval("")
         fimse

         //Atualiza a matriz e checa se as informações sao validas( mas nao a desenha)
         para i de 1 ate 9 faca
            para j de 1 ate 9 faca

               //checa se a entrada e um nomero valido
               se entrada_bomba [1] >= 1 entao
                  se entrada_bomba [1]<= 9 entao
                     se entrada_bomba [2] >=1 entao
                        se entrada_bomba [2] <= 9 entao

                           //checa se a cordenada ja foi escolhida
                           se entrada_bomba[1] = i entao
                              se entrada_bomba[2] =j entao
                                 se mapa_bomba_jogador [i,j] = " *" entao
                                    validacao_bomba <- 0 //A posição ja tem uma bomba
                                 senao
                                    //Se a posicao nao tiver bomba coloca-se a nova bomba
                                    mapa_bomba_jogador [i,j] <- " *"

                                    //Valida a informacao para sair do loop do jogador
                                    validacao_bomba <- 1
                                 fimse
                              fimse
                           fimse

                        senao
                           validacao_bomba <-0
                        fimse
                     senao
                        validacao_bomba <-0
                     fimse
                  senao
                     validacao_bomba <-0
                  fimse
               senao
                  validacao_bomba <-0
               fimse

               //atualiza pontos do jogador
               se mapa_barco_jogador [i,j] = " J" entao
                  se mapa_bomba_maquina [i,j] = " *" entao
                     pontos_jogador <- pontos_jogador -1
                  fimse
               fimse

               //atualiza pontos da maquina
               se mapa_barco_maquina [i,j] = " M" entao
                  se mapa_bomba_jogador [i,j] = " *" entao
                     pontos_maquina <- pontos_maquina -1
                  fimse
               fimse
            fimpara
         fimpara

         //fecha o jogo quando alguem perde
         se pontos_maquina = 0 entao
            run <-0
         fimse
         se pontos_jogador = 0 entao
            run <- 0
         fimse

         //fechao jogo quando a cordenada fornecida e -1
         se entrada_bomba[1]<0 entao
            run <-0
            validacao_bomba <-1
         fimse
         se entrada_bomba[2]<0 entao
            run <-0
            validacao_bomba <-1
         fimse

      ate validacao_bomba = 1 //fim do loop do jogador

      //inicia jogada da maquina
      repita //deixa a  maquina jogando ate sair uma jogada valida

         pontos_jogador <- numero_barcos
         pontos_maquina <- numero_barcos

         aleatorio on
         aleatorio 1,81
         leia(posicao)
         aleatorio off
         para b de 1 ate 2 faca
            entrada_bomba[b]<- posicoes_validas [posicao,b]
            se mostre_tudo = "B" entao
               escreva (entrada_bomba[b])
            fimse
         fimpara
         escreval("")
         se mostre_tudo <> "B" entao
            limpatela
         fimse

         //checa se a cordenada ja foi escolhida
         para i de 1 ate 9 faca
            para j de 1 ate 9 faca
               se entrada_bomba[1] = i entao
                  se entrada_bomba[2] =j entao
                     se mapa_bomba_maquina [i,j] = " *" entao
                        validacao_bomba <- 0 //A posição ja tem uma bomba
                     senao
                        //Se a posicao nao tiver bomba coloca-se a nova bomba
                        se entrada_bomba[1] = i entao
                           se entrada_bomba[2] =j entao
                              mapa_bomba_maquina [i,j] <- " *"
                           fimse
                        fimse
                        //Valida a informacao para sair do loop da maquina
                        validacao_bomba <- 1   //A posicao e valida
                     fimse
                  fimse
               fimse

               //atualiza pontos do jogador
               se mapa_barco_jogador [i,j] = " J" entao
                  se mapa_bomba_maquina [i,j] = " *" entao
                     pontos_jogador <- pontos_jogador -1
                  fimse
               fimse

               //atualiza pontos da maquina
               se mapa_barco_maquina [i,j] = " M" entao
                  se mapa_bomba_jogador [i,j] = " *" entao
                     pontos_maquina <- pontos_maquina -1
                  fimse
               fimse
            fimpara
         fimpara
      ate validacao_bomba = 1//fim do turno da maquina

      //fecha o jogo quando alguem perde
      se pontos_maquina = 0 entao
         run <-0
      fimse
      se pontos_jogador = 0 entao
         run <- 0
      fimse

   ate run = 0

   se pontos_maquina = 0 entao
      escreval("     PARABENS! VOCE GANHOU!")
      escreval("")
   senao
      escreval("     Sinto muito, nao foi dessa vez")
      escreval("")
   fimse

   escreval("       Jogador                       Maquina")
   escreval("   1 2 3 4 5 6 7 8 9           1 2 3 4 5 6 7 8 9")
   para i de 1 ate 9 faca
      para j de 1 ate 18 faca

         se j=1 entao
            escreva (i)
         fimse

         se j <= 9 entao
            //checa se na posição do barco tem uma bomba
            se mapa_barco_jogador [i,j] = " J" entao
               se mapa_bomba_maquina [i,j] = " *" entao
                  escreva (" X")//escreve X onde tem bomba e barco
               senao
                  escreva (" J")//em branco para destacar os barcos apos o jogo
               fimse
            senao
               escreva ("  ")//se nao tem barcos mostra onde a maquina esta jogando bombas
            fimse
         fimse

         se j >9 entao
            //checa se na posição do barco tem uma bomba
            se mapa_barco_maquina [i,a] = " M" entao
               se mapa_bomba_jogador [i,a] = " *" entao
                  escreva (" X")//escreve X onde tem bomba e barco
               senao
                  escreva (" M")// esconde os barcos da maquina
               fimse
            senao
               escreva ("  ")//se nao tem barcos mostra onde a jogador esta colocando bombas
            fimse
            a <- a +1
         fimse

         se j = 9 entao
            escreva ("        ",i)
         fimse
         se j=18 entao
            escreval ("")
            a<-1
         fimse

      fimpara
   fimpara
   escreval("")


Fimalgoritmo