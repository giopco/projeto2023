// @dart=2.9
import 'package:flutter/material.dart';
import 'package:final_project/models/previsao_hora.dart';

class ProximasTemperaturas extends StatelessWidget {
  final List<PrevisaoHora> previsoes;

  const ProximasTemperaturas({Key key, this.previsoes}) : super(key: key);

  Card criarCardPrevisao(int i) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(image: AssetImage('images/${previsoes[i].numeroIcone}.png')),
          const Padding(padding: EdgeInsets.all(1)),
          Text(previsoes[i].horario),
          const Padding(padding: EdgeInsets.all(3)),
          Text('${previsoes[i].temperatura.toStringAsFixed(0)}ºC'),
          const Padding(padding: EdgeInsets.all(3)),
          Text(previsoes[i].descricao),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: previsoes.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return criarCardPrevisao(i);
        },
      ),
    );
  }
}
