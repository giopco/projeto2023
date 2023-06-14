// @dart=2.9
import 'Emoticons_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:final_project/models/previsao_hora.dart';
import 'package:final_project/services/previsao_service.dart';
import 'package:final_project/widgets/proximas_temperaturas.dart';
import 'package:final_project/pages/home_page2.dart';

class Aplicativo extends StatefulWidget {
  @override
  State<Aplicativo> createState() => _AplicativoState();
}

class _AplicativoState extends State<Aplicativo> {
  Future<List<PrevisaoHora>> ultimasPrevisoes;

  @override
  void initState() {
    super.initState();
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
  }

  @override
  Widget build(BuildContext context) {
    //final tabela = AppDevice.tabela;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 140, 141, 146),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  // Greting rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height:
                                20, // Espaçamento entre texto e parte de cima do app
                          ),
                          Text(
                            'Olá!',
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 252, 252),
                                fontSize: 24,
                                fontWeight: FontWeight
                                    .bold // Edição da parte escrita do cabeaçario
                                ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Tenha um ótimo dia!',
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 252,
                                    252)), // Parte de baixo do texto
                          ),
                        ],
                      ),
                      // Notification
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 197, 203, 207),
                          borderRadius: BorderRadius.circular(
                              12), // Sombra do sino de notificação
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ], // Children
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  // search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 197, 203, 207),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(children: const [
                      Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 27, 26, 26),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 25, 25),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // How do you feel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Como se sente?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 253, 252, 252),
                            fontSize: 18,
                            fontWeight: FontWeight
                                .bold // Edição da parte escrita do cabeaçario
                            ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // bad
                      Column(
                        children: const [
                          EmoticonFace(
                            emoticonFace: '😔',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Ruim',
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 252, 252)),
                          ),
                        ],
                      ),
                      //Fine
                      Column(
                        children: const [
                          EmoticonFace(
                            emoticonFace: '😊',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Bem',
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 252, 252)),
                          ),
                        ],
                      ),
                      // well
                      Column(
                        children: const [
                          EmoticonFace(
                            emoticonFace: '😀',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Ótimo',
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 252, 252)),
                          ),
                        ],
                      ),

                      // execellent
                      Column(
                        children: const [
                          EmoticonFace(
                            emoticonFace: '😆',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Excelente',
                            style: TextStyle(
                                color: Color.fromARGB(255, 253, 252, 252)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(25),
              color: Color.fromARGB(255, 235, 235, 235),
              child: Center(
                child: FutureBuilder<List<PrevisaoHora>>(
                    future: ultimasPrevisoes,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<PrevisaoHora> previsoes = snapshot.data;
                        double temperaturaAtual = previsoes[0].temperatura;
                        double menorTemperatura = double.maxFinite;
                        double maiorTemperatura = double.negativeInfinity;
                        previsoes.forEach((obj) {
                          if (obj.temperatura < menorTemperatura) {
                            menorTemperatura = obj.temperatura;
                          }
                          if (obj.temperatura > maiorTemperatura) {
                            maiorTemperatura = obj.temperatura;
                          }
                        });
                        String descricao = previsoes[0].descricao;
                        int numeroIcone = previsoes[0].numeroIcone;

                        return Column(
                          children: [
                            Resumo(
                              cidade: 'São Paulo - SP',
                              temperaturaAtual: temperaturaAtual,
                              temperaturaMaxima: maiorTemperatura,
                              temperaturaMinima: menorTemperatura,
                              descricao: descricao,
                              numeroIcone: numeroIcone,
                            ),
                            const Padding(padding: EdgeInsets.all(3)),
                            ProximasTemperaturas(
                              previsoes: previsoes.sublist(1, previsoes.length),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return const Text('Erro ao carregar as previsões');
                      }

                      return const CircularProgressIndicator();
                    }),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
