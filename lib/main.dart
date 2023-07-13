import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'BMI Calculator' ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var htFeetController = TextEditingController();
  var result='';
  var htInchController = TextEditingController();
  var bgclr = Colors.white;
  var suggetion = '';
  var btn= 'Calculate';
  var show = false ;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(
       centerTitle: true,
       // shape: RoundedRectangleBorder(
       //   borderRadius: BorderRadius.vertical(
       //     bottom: Radius.circular(30)
       //   )
       // ),
       title: Text('BMI Calculator',style: TextStyle(fontSize: 30, color: Colors.deepOrange)),
     ),
     body: Container(
       width: double.infinity,
       color: bgclr,
       child: Center(
         child: Container(
           width: 300,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Enter your Detail to calculate BMI',style: TextStyle(fontSize: 20, color: Colors.deepOrange),),
               SizedBox(height: 40,),
               TextField(
                 controller: wtController,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   fillColor: Colors.white,
                   labelText: 'Enter Your Weight',
                   labelStyle: TextStyle(color: Colors.deepOrange),
                   prefixIcon: Icon(Icons.line_weight,color: Colors.deepOrange,),
                   focusedBorder: OutlineInputBorder(
                     borderSide: const BorderSide(color: Colors.deepOrange, width: 2.0),
                     borderRadius: BorderRadius.circular(25.0),
                   )
                 ),
               ),
               SizedBox(height: 50,),
               TextField(
                 controller: htFeetController,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                   fillColor: Colors.white,
                   labelStyle: TextStyle(color: Colors.deepOrange),
                   labelText: 'Enter Your Height (feet)',
                   prefixIcon: Icon(Icons.height, color: Colors.deepOrange,),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepOrange,width: 2),
                     borderRadius: BorderRadius.circular(25)
                   )
                 ),
               ),
               SizedBox(height: 40,),
               TextField(
                 controller: htInchController,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                     fillColor: Colors.white,
                     labelStyle: TextStyle(color: Colors.deepOrange),
                     labelText: 'Enter Your Height (inches)',
                     prefixIcon: Icon(Icons.height, color: Colors.deepOrange,),
                     focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.deepOrange,width: 2),
                         borderRadius: BorderRadius.circular(25)
                     )
                 ),
               ),
               SizedBox(height: 50,),
               ElevatedButton(onPressed:(){
                    var wt = wtController.text.toString();
                    var ht1 = htFeetController.text.toString();
                    var ht2 = htInchController.text.toString();
                    if (wt!= '' && ht1!= '' && ht2!= ''){
                      //
                      var weight = int.parse(wt);
                      var feet = int.parse(ht1);
                      var inch = int.parse(ht2);
                      var total_height = (feet*12)+inch;
                      var hcm = (total_height*2.54)/100;
                      var bmi = weight/(hcm*hcm);
                      if (bmi < 18){
                        setState(() {
                          suggetion= 'You are Underweight';
                          bgclr= Colors.red;
                        });
                      }
                      else if(bmi > 25){
                        suggetion = "You are Overweight";
                        bgclr = Colors.red;
=                      }
                      else{
                        suggetion = 'You are Perfect';
                        bgclr= Colors.green;
                      }
                      setState(() {
                        result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
=                      });
                    }
                    else{
                      setState(() {
                        result = 'Please fill all the Entries';
                      });
                    }

               } , child: Text(btn,style: TextStyle(color: Colors.deepOrange),),),
               SizedBox(height: 40,),
               Text(suggetion,style: TextStyle(
                 fontSize: 20, fontWeight: FontWeight.bold
               ),),
               SizedBox(height: 40,),
               Text(result),
             ],
           ),
         ),
       ),
     ),
   );
  }
}