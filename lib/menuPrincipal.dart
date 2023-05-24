import 'package:flutter/material.dart';
import 'telaProdutos.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _criarBotao(
            context: context,
            icone: Icons.shopping_cart,
            cor: Colors.lightBlue,
            texto: 'Produtos',
          ),
          _criarBotao(
            context: context,
            icone: Icons.people,
            cor: Colors.lightGreen,
            texto: 'Clientes',
          ),
          _criarBotao(
            context: context,
            icone: Icons.attach_money,
            cor: Colors.deepOrangeAccent,
            texto: 'Vendas',
          ),
          _criarBotao(
            context: context,
            icone: Icons.description,
            cor: Colors.indigoAccent,
            texto: 'Documento Fiscal',
          ),
          _criarBotao(
            context: context,
            icone: Icons.bar_chart,
            cor: Colors.purple,
            texto: 'Relatórios',
          ),
          _criarBotao(
            context: context,
            icone: Icons.local_shipping,
            cor: Colors.grey,
            texto: 'Fornecedores',
          ),
          _criarBotao(
            context: context,
            icone: Icons.settings,
            cor: Colors.white70,
            texto: 'Configurações',

          ),
        ],
      ),
    );
  }

  Widget _criarBotao({
    required BuildContext context,
    required IconData icone,
    required Color cor,
    required String texto,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Ação a ser executada quando o botão for pressionado
          if (texto == 'Produtos') {
            // Navegar para a página de produtos
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaProdutos()),
            );
          } else if (texto == 'Clientes') {
            // Exibir um alerta
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Clientes'),
                  content: Text('Aqui vai o conteúdo da tela de clientes'),
                );
              },
            );
          }
          // Adicione mais condições para os outros botões aqui
        },
        child: Ink(
          width: 100.0, // Largura do botão
          height: 100.0, // Altura do botão
          decoration: BoxDecoration(
            color: cor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icone, size: 40.0), // Tamanho do ícone
                SizedBox(height: 8.0),
                Text(
                  texto,
                  style: TextStyle(fontSize: 16.0), // Tamanho do texto
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
