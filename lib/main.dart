import 'package:academy_pratica_f6/layouts/cadastro.dart';
import 'package:academy_pratica_f6/layouts/editar_cadastro.dart';
import 'package:flutter/material.dart';
import 'layouts/home_page.dart';
import 'layouts/lista_pessoas.dart';
import 'package:provider/provider.dart';
import './entities/pessoa.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EstadoListaDePessoas(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TelaDeCadastro.routeName: (context) => const TelaDeCadastro(),
        TelaPessoasCadastradas.routeName: (context) =>
            const TelaPessoasCadastradas(),
        TelaEditarCadastro.routeName: (context) => const TelaEditarCadastro(),
      },
    );
  }
}
