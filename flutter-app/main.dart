import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(CryptoApp());

class CryptoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cripto Monitor',
      home: CryptoListPage(),
    );
  }
}

class Crypto {
  final String name;
  final double price;

  Crypto({required this.name, required this.price});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      price: json['price'],
    );
  }
}

class CryptoListPage extends StatefulWidget {
  @override
  _CryptoListPageState createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  late Future<List<Crypto>> _futureCryptos;

  Future<List<Crypto>> fetchCryptos() async {
    final response = await http.get(Uri.parse('http://localhost:8080/cryptos'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar criptomoedas');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureCryptos = fetchCryptos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criptomoedas")),
      body: FutureBuilder<List<Crypto>>(
        future: _futureCryptos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final crypto = snapshot.data![index];
                return ListTile(
                  title: Text(crypto.name),
                  subtitle: Text("Preço: \$${crypto.price}"),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
