import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FirebaseTestingCrud extends StatefulWidget {
  @override
  _FirebaseTestingCrudState createState() => _FirebaseTestingCrudState();
}

class _FirebaseTestingCrudState extends State<FirebaseTestingCrud> {
 final nameController=TextEditingController();
  final addressOfWorker=Firestore.instance.collection('worker');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //  addressOfWorker.document("-Ls676IY8JHdB5VQhwa6").setData({
  //     'name':"bikash"
  //   });

  }
  addData()async{
  await addressOfWorker.add({
      'name':nameController.text
    });
  }
  fetchData()async{
   var data=await addressOfWorker.document().setData({
     'name':'kalyan'
   });
    return data;

    
  }
  saveddata()async{
   await addressOfWorker.document("-Ls676IY8JHdB5VQhwa6").updateData({
      'name':nameController.text,
    });
  }
  updateData()async{
      var data=await addressOfWorker.document("-Ls676IY8JHdB5VQhwa6");
    data.updateData({
      'name':'narayan',
    });
  }
deleteData()async{
         var data=await addressOfWorker.document("-Ls676IY8JHdB5VQhwa6");
         data.delete();

}

// Create a new user with a first and last name
Map<String, Object> user=<String,Object>{
   
};

// user.put("first", "Ada");
// user.put("last", "Lovelace");
// user.put("born", 1815);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: fetchData(),

             builder: (context,snapshot){
               return      ListView(
           children: <Widget>[
             SizedBox(height: 100,),
             TextField(
               decoration: InputDecoration(
                 hintText: 'enter your text'
               ),
               controller: nameController,
             ),
              RaisedButton(
              onPressed: addData,
              child: Text('add daata to firebase'),
             ),

             RaisedButton(
              onPressed: saveddata,
              child: Text('saved to firebase'),
             ),
              RaisedButton(
              onPressed: updateData,
              child: Text('update to firebase'),
             ),
                RaisedButton(
              onPressed: deleteData,
              child: Text('Delete data'),
             ),
               Text("${snapshot.data['name'].toString()}")
           ],
          );
             },
        ),
      ),
    );
  }
}