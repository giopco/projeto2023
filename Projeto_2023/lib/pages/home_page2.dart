// @dart=2.9
import 'package:flutter/material.dart';

class Resumo extends StatelessWidget {
  final String cidade;
  final String descricao;
  final double temperaturaAtual;
  final double temperaturaMaxima;
  final double temperaturaMinima;
  final int numeroIcone;

  const Resumo({
    Key key,
    this.cidade,
    this.descricao,
    this.temperaturaAtual,
    this.temperaturaMaxima,
    this.temperaturaMinima,
    this.numeroIcone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(20)),
        Text(
          cidade,
          style: const TextStyle(fontSize: 17),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/$numeroIcone.png')),
              const Padding(padding: EdgeInsets.all(5)),
              Text(
                '${temperaturaAtual.toStringAsFixed(0)}ºC ',
                style: const TextStyle(fontSize: 40),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${temperaturaMaxima.toStringAsFixed(0)} ºC'),
                  Text('${temperaturaMinima.toStringAsFixed(0)} ºC'),
                ],
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Text(
          descricao,
          style: const TextStyle(fontSize: 16),
        ),
        const Padding(padding: EdgeInsets.all(20)),
      ],
    );
  }
}
