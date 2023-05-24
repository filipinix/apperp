import 'package:flutter/material.dart';
import 'menuPrincipal.dart';

void main() {
  runApp(const MyApp());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        // Conteúdo da tela de login
      ),
    );
  }
}


// Crie um método para exibir o alerta
void exibirAlerta(BuildContext context, String texto) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alerta'),
        content: Text(texto),
        actions: [
          TextButton(
            onPressed: () {
              // Ação a ser executada quando o botão for pressionado
              Navigator.of(context).pop(); // Fechar o alerta
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERP MOBILE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyLoginPage(title: 'ERP MOBILE'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
   
  
  final senha = TextEditingController();
  final user = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
                  bottomLeft: const Radius.circular(40.0),
                  bottomRight: const Radius.circular(40.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),


          padding: EdgeInsets.all(16.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Usuário',
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: senha,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Senha',
                ),
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  if(user.text == 'admin' && senha.text == 'admin'){

                    //exibirAlerta(context, 'Bem Vindo \n' + user.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (MenuPrincipal())),
                    );

                  }
                  else{
                    exibirAlerta(context, 'Usuário ou Senha Inválidos');
                  }

                  // Lógica de autenticação aqui
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      )
    );
  }
}
class PaginaEmBranco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Aplicativo'),
        actions: [
          PopupMenuButton<String>(
            child: Icon(Icons.menu),

            onSelected: (String result) {
              // Ação a ser executada quando uma opção é selecionada
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Opção 1',
                child: Text('Opção 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Opção 2',
                child: Text('Opção 2'),
              ),
              const PopupMenuItem<String>(
                value: 'Opção 3',
                child: Text('Opção 3'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('Página em Branco'),
      ),
    );
  }
}