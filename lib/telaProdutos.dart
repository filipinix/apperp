import 'package:flutter/material.dart';

class TelaProdutos extends StatefulWidget {
  @override
  _TelaProdutosState createState() => _TelaProdutosState();
}

class _TelaProdutosState extends State<TelaProdutos> {
  final _pesquisaController = TextEditingController();
  List<Map<String, dynamic>> _resultados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Página'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _pesquisaController,
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Lógica de pesquisa aqui
                    setState(() {
                      _resultados = [
                        // Resultados da pesquisa aqui
                        {'Nome': 'Item 1','Estoque':2 , 'Custo': 1.50, 'Preço Venda': 3.0},
                        {'Nome': 'Item 2','Estoque':10 , 'Custo': 2.65, 'Preço Venda': 6.0},
                        {'Nome': 'Item 3','Estoque':5 , 'Custo': 8.99, 'Preço Venda': 19.0},
                        {'Nome': 'Item 4','Estoque':6 , 'Custo': 32.21, 'Preço Venda': 52.0},
                      ];
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Nome')),
                  DataColumn(label: Text('Estoque')),
                  DataColumn(label: Text('Custo')),
                  DataColumn(label: Text('Preço Venda')),
                ],
                rows: _resultados
                    .map(
                      (resultado) => DataRow(cells: [
                    DataCell(Text(resultado['Nome'])),
                    DataCell(Text(resultado['Estoque'].toString())),
                    DataCell(Text(resultado['Custo'].toString())),
                    DataCell(Text(resultado['Preço Venda'].toString())),
                  ]),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: PopupMenuButton<String>(
        child: Icon(Icons.add),
        onSelected: (String result) {
          // Ação a ser executada quando uma opção é selecionada
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Ver',
            child: ListTile(
              leading: Icon(Icons.visibility),
              title: Text('Ver'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'Incluir',
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text('Incluir'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'Editar',
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar'),
            ),
          ),
          PopupMenuItem<String>(
            value: 'Excluir',
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Excluir'),
            ),
          ),
        ],
      ),
    );
  }
}
