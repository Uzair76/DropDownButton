import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

import 'call_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _genderController=TextEditingController();
  String? value='';
  String selected= 'Select Gender';

  String dropdownvalue = 'Audio Call';
  var items = [
    'Audio Call',
    'Video Call',
    'Text Call',

  ];


  List<String> _gender=[
    'Male',
    'Female',
    'Other'
  ];
  bool isOpen= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text('Gender'),
                DropdownButtonFormField(
                    isDense: true,
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.black),
                    decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.blue)
                    ),
                  ),
                    borderRadius: BorderRadius.circular(16),
                    hint: Text("Select Gender"),
                    items: _gender.map((String gender) {
                      return  DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        value = newValue!;
                      });
                    }

                    ),
                SizedBox(height: 20,),
                DropdownButtonFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.blue)
                  ),
                ),
                    borderRadius: BorderRadius.circular(16),
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        if(dropdownvalue ==  'Audio Call'){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CallScreen(
                            title: 'Audio Call',)));
                        }
                        else if(dropdownvalue ==  'Video Call'){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CallScreen(
                            title: 'Video Call',)));
                        }
                        else if(dropdownvalue ==  'Text Call'){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CallScreen(
                            title: 'Text Call',)));
                        }
                      });
                    }
                )





                // SizedBox(height: 20,),
                // Text("DropDown"),
                //_textfield(),
                // SizedBox(height: 20,),

          ]
        ),
      )
    );

  }


  // Widget _textfield(){
  //   return Column(
  //     children: [
  //       TextFormField(
  //         //readOnly: true,
  //         controller: _genderController,
  //         decoration: InputDecoration(
  //           // labelText: "Select Gender",
  //           hintText: selected,
  //           suffixIcon: InkWell(
  //               onTap: (){
  //                 isOpen= !isOpen;
  //                 setState(() {
  //                 });
  //               },
  //               child: Icon(Icons.keyboard_arrow_down_rounded)
  //           ),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(32),
  //             borderSide: BorderSide(color: Colors.grey),
  //           ),
  //
  //         ),
  //       ),
  //       if(isOpen)
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 color: Colors.grey.shade50,
  //               borderRadius: BorderRadius.circular(10),
  //               border: Border.all(color: Colors.grey)
  //             ),
  //             child: ListView(
  //               primary: true,
  //               shrinkWrap: true,
  //               children: _gender.map((e) => Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
  //                 child: InkWell(
  //                     onTap: (){
  //                       selected= e;
  //                       setState(() {
  //                         isOpen=false;
  //                       });
  //                     },
  //                     child: Text(e)),
  //               )).toList(),
  //             ),
  //           ),
  //         )
  //     ],
  //   );
  // }

}


