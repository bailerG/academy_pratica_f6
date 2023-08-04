import 'package:academy_pratica_f6/layouts/lista_pessoas.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Inicio'),
        backgroundColor: Colors.red[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🩸',
            style: TextStyle(fontSize: 80),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 40,
            ),
            child: Title(
                color: const Color.fromARGB(255, 245, 227, 213),
                child: const Text(
                  'App Cadastro Sanguíneo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      TelaDeCadastro.routeName,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red[900]),
                  ),
                  child: const Text('Adicionar Pessoa'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        TelaPessoasCadastradas.routeName,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.red[900]),
                    ),
                    child: const Text('Cadastros')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
