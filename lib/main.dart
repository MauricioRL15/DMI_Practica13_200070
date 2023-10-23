// Creado por: Mauricio Ramírez López
// Asignatura: Desarrollo Móvil Integral
// Grado y Grupo: 10°A
// Docente: Ramírez Hernández Marco Antonio
import 'package:flutter/material.dart';
import 'package:dmi_practica12_200070/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'oswald',
          ),
      appBarTheme: AppBarTheme(
        color:
            Color.fromARGB(255, 255, 136, 0), // Color de la barra de aplicación
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(
            255, 233, 198, 3), // Cambia el color de los iconos aquí
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 255, 136, 0),
      ),
    ),
  ));
}
//hola
