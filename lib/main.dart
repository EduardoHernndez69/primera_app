import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: PersonList(),
    );
  }
}

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  List<Persona> _personas = [
    Persona('Eduardo', 'Hernandez', '20147819'),
    Persona('Pedro', 'Bravo', '1478569'),
    Persona('Joaquin', 'Ruiz', '7012554'),
  ];

  void agregarPersona() {
    // Agregar una nueva Persona duplicando la primera
    _personas.add(
        Persona(_personas[0].name, _personas[0].lastName, _personas[0].cuenta));
    // Actualizar la interfaz de usuario
    setState(() {});
  }

  void eliminarPersona(int index) {
    _personas.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.people_alt_outlined),
        onPressed: agregarPersona,
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title:
                Text(_personas[index].name + ' ' + _personas[index].lastName),
            subtitle: Text(_personas[index].cuenta),
            leading: CircleAvatar(
              child: Text(_personas[index].name.substring(0, 1)),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                eliminarPersona(index);
              },
            ),
          );
        },
      ),
    );
  }
}

class Persona {
  String name;
  String lastName;
  String cuenta;

  Persona(this.name, this.lastName, this.cuenta);
}
