import 'package:flutter/material.dart';

class CalculaPage extends StatefulWidget {
  @override
  _CalculaPageState createState() => _CalculaPageState();
}

class _CalculaPageState extends State<CalculaPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text("Calculadora de IMC"),
      ),
      backgroundColor:  Color.fromARGB(235, 202, 203, 207),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: "Nome"
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Peso (kg)"),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura (m)"),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultado = _calcularIMC();
                  });
                },
                child: Text("Calcular"),
              ),
              SizedBox(height: 16.0),
              Text(_resultado),
            ],
          ),
        ),
      ),
    );
  }

  String _calcularIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0.0;
    double altura = double.tryParse(_alturaController.text) ?? 0.0;
    if (peso == 0.0 || altura == 0.0) {
      return "Erro: valores inválidos";
    }
    double imc = peso / (altura * altura);

    if (imc < 16.0) {
      return "Magreza grave";
    } else if (imc >= 16.0 && imc < 17) {
      return "Magreza moderada";
    } else if (imc >= 17.0 && imc < 18.5) {
      return "Magreza Leve";
    } else if (imc >= 18.5 && imc < 25.0) {
      return "Saudável";
    } else if (imc >= 25.0 && imc < 30.0) {
      return "Sobrepeso";
    } else if (imc >= 30.0 && imc < 35.0) {
      return "Obesidade Grau 1";
    } else if (imc >= 35.0 && imc < 40.0) {
      return "Obesidade Grau 2";
    } else {
      return "Obesidade Grau 3";
    }
  }
}
