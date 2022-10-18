import 'package:fetchapi/model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
void fetch({Map<String, dynamic> ty}) async{
  Response response;
  var dio =Dio();
  response= await dio.post('https://jsonplaceholder.typicode.com/posts',
      data: ty);
  print(response.statusCode);
  print(response.data.toString());

}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _name =TextEditingController();
  TextEditingController _password =TextEditingController();
  Models baba = Models();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter Your Name ',
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      hintText: 'Enter Your Password ',
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    baba.name=_name.text;
                    baba.password=_password.text;
                    fetch(ty: baba.toJson());
                  }, child:Text('preaa') ,),
                ],
              ),
            ),
          ),
    );
  }
}

