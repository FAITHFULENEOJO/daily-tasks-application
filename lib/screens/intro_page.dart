import 'package:daily_planner/screens/task_page.dart';
import 'package:flutter/material.dart';
import 'package:daily_planner/screens/intro_page2.dart';


class IntroPage1 extends StatefulWidget{
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1();
}

class _IntroPage1 extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown ,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),

              Center(
                child: Image.asset(
                  'assets/images/todo.jpg',
                  width: 270,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  "Always Plan Your Day First",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ) ,

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  "Plan In A More Relaxing Way",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ) ,

              const SizedBox(height: 200,),

             Row(
               children: [
                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context, MaterialPageRoute(builder : (context) => TaskPage()),
                     );
                   },
                   child: Text("Skip",
                   style: TextStyle(
                     fontSize: 30,
                     fontWeight: FontWeight.w400,
                    ),
                   ),
                 ),

                 const SizedBox(width: 240),

                 InkWell(
                   onTap: (){
                     Navigator.push(
                       context, MaterialPageRoute(builder : (context) => IntroPage2()),
                     );
                   },
                   child: Text("Next",
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                 ),
               ],
             )

            ],
          ),
        ),
      ),
    );
  }
}