import 'package:flutter/material.dart';
import 'package:sleep_debt_calculator/screens/results.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final formKey = GlobalKey<FormState>();
  var sleep = TextEditingController();
  var target = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sleep Debt Calculator'),),
      ),
      
      body:Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: sleep,
                    decoration: const InputDecoration(
                      labelText: 'e.g 7',
                      hintText: 'Average amount of sleep in a day',
                      prefixIcon: Icon(Icons.nightlife_outlined),
                      border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    validator: (value){
                      if(value!.isEmpty || int.tryParse(value) == null ){
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
          
          
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: target,
                    decoration: const InputDecoration(
                      labelText: 'e.g 9',
                      hintText: 'Target amount of sleep',
                      prefixIcon: Icon(Icons.nightlife_outlined),
                      border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    validator: (value){
                      if(value!.isEmpty || int.tryParse(value) == null ){
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            ),

          ElevatedButton(
            onPressed: (){
              try{

                var isValid = formKey.currentState!.validate();

                if(isValid){
                var sleepAmount = ((int.tryParse(sleep.text))!*7);
                var targetAmount = ((int.tryParse(target.text))!*7);
                var sleepDeficit = targetAmount - sleepAmount;
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Results(results: sleepDeficit.toString())));
                 }
                 else{
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Check your input fields and try again')));
                 }

              }
              catch(e){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
            }, 
            child: const Text('Calculate sleep deficit'))


        ],
      ),
      
      
      );
  }
}