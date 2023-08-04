import 'package:academy_pratica_f6/layouts/editar_cadastro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../entities/pessoa.dart';

class TelaPessoasCadastradas extends StatelessWidget {
  const TelaPessoasCadastradas({super.key});

  static const routeName = '/listaDeCadastros';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoas Cadastradas'),
        backgroundColor: Colors.red[900],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: PessoaListBuilder(),
      ),
    );
  }
}

class PessoaListBuilder extends StatelessWidget {
  const PessoaListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EstadoListaDePessoas>(
      builder: (context, estadoPessoas, child) => ListView.builder(
        itemCount: estadoPessoas.pessoas.length,
        itemBuilder: (context, index) {
          return PessoaListTile(
            pessoa: estadoPessoas.pessoas[index],
          );
        },
      ),
    );
  }
}

class PessoaListTile extends StatelessWidget {
  const PessoaListTile({required this.pessoa, super.key});

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ListTile(
            isThreeLine: true,
            onTap: () => Navigator.of(context).pushNamed(
              TelaEditarCadastro.routeName,
              arguments: pessoa,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            title: Text(
              pessoa.nome,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              '\nEmail: ${pessoa.email}\n'
              'Telefone: ${pessoa.telefone}\n'
              'GitHub: ${pessoa.github}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: switch (pessoa.tipoSanguineo) {
              TipoSanguineo.aNegativo => const Text(
                  'A-',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.aPositivo => const Text(
                  'A+',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.abNegativo => const Text(
                  'AB-',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.abPositivo => const Text(
                  'AB+',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.bNegativo => const Text(
                  'B-',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.bPositivo => const Text(
                  'B+',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.oNegativo => const Text(
                  'O-',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              TipoSanguineo.oPositivo => const Text(
                  'O+',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
            },
            tileColor: switch (pessoa.tipoSanguineo) {
              TipoSanguineo.aNegativo => Colors.red[400],
              TipoSanguineo.aPositivo => Colors.blue[200],
              TipoSanguineo.abNegativo => Colors.white60,
              TipoSanguineo.abPositivo => Colors.cyan[300],
              TipoSanguineo.bNegativo => Colors.orange[300],
              TipoSanguineo.bPositivo => Colors.purple[300],
              TipoSanguineo.oNegativo => Colors.yellow[200],
              TipoSanguineo.oPositivo => Colors.green[200],
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
