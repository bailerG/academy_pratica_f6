import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../entities/pessoa.dart';

class TelaEditarCadastro extends StatefulWidget {
  const TelaEditarCadastro({super.key});

  static const routeName = '/editar';

  @override
  State<TelaEditarCadastro> createState() => _TelaEditarCadastroState();
}

class _TelaEditarCadastroState extends State<TelaEditarCadastro> {
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pessoa = ModalRoute.of(context)!.settings.arguments as Pessoa;

    String nome = pessoa.nome;
    String email = pessoa.email;
    String telefone = pessoa.telefone;
    String github = pessoa.github;
    TipoSanguineo novoTipoSanguineo = pessoa.tipoSanguineo;

    return Consumer<EstadoListaDePessoas>(
      builder: (context, estadoPessoas, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Pessoas'),
          backgroundColor: Colors.red[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formState,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: TextFormField(
                    initialValue: pessoa.nome,
                    onSaved: (newValue) => nome = newValue!,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Nome Completo',
                      hintText: 'Digite seu nome e sobrenome',
                      prefixIcon: Icon(Icons.assignment_ind),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Insira seu nome";
                      }
                      if (value!.length < 2) {
                        return "O nome precisa ter pelo menos 3 letras";
                      }
                      if (value.startsWith(RegExp(r'[^A-Z]'))) {
                        return "O nome precisa iniciar com letra maiúscula";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    initialValue: pessoa.email,
                    onSaved: (newValue) => email = newValue!,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Digite seu email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Insira seu Email";
                      }
                      if (!value!.contains(RegExp(r'@'))) {
                        return "Insira um email válido";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    initialValue: pessoa.telefone,
                    onSaved: (newValue) => telefone = newValue!,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      hintText: '(11) 9 9900-0099',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Insira seu telefone";
                      }
                      if (value!.length < 11) {
                        return 'Insira seu numero com DDD';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    initialValue: pessoa.github,
                    onSaved: (newValue) => github = newValue!,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      labelText: 'GitHub',
                      hintText: 'Link do seu GitHub',
                      prefixIcon: Icon(Icons.link),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Obrigatório";
                      }
                      if (!value!.contains('github.com/')) {
                        return 'Insira um link do GitHub';
                      }
                      return null;
                    },
                  ),
                ),
                DropdownButtonFormField<TipoSanguineo>(
                  value: novoTipoSanguineo,
                  icon: const Icon(Icons.water_drop),
                  onChanged: (value) {
                    setState(() {
                      novoTipoSanguineo = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(
                      value: TipoSanguineo.aPositivo,
                      child: Text('A+'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.aNegativo,
                      child: Text('A-'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.bPositivo,
                      child: Text('B+'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.bNegativo,
                      child: Text('B-'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.oPositivo,
                      child: Text('O+'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.oNegativo,
                      child: Text('O-'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.abPositivo,
                      child: Text('AB+'),
                    ),
                    DropdownMenuItem(
                      value: TipoSanguineo.abNegativo,
                      child: Text('AB-'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[900]),
                        ),
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            formState.currentState!.save();
                            final novoCadastro = Pessoa(
                                nome: nome,
                                email: email,
                                telefone: telefone,
                                github: github,
                                tipoSanguineo: novoTipoSanguineo);

                            estadoPessoas.editarCadastro(pessoa, novoCadastro);

                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Salvar'),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[900]),
                        ),
                        onPressed: () {
                          estadoPessoas.excluir(pessoa);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Excluir'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
