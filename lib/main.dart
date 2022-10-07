import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc',
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
   ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
        centerTitle: true,

      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => 
         AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: Duration(milliseconds: 900)),
        ),
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                _bloc.add(RedColorEvent());
              }),
              SizedBox(width: 10,),
              FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () {
                _bloc.add(GreenColorEvent());
              }),
            
          ],
        ),
    );
  }
}