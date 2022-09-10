import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,width: 2,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,width: 2,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black87,width: 2,
    ),
  ),
);

ElevatedButton signInButton(String text, Function onTap){
  return ElevatedButton(
    onPressed: (){
      onTap();
      }, 
    child: Text(text, style: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      primary: Colors.black45,
    ),
    );
}

void nextScreen(context, page){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page ));
}



void showSnackbar(context, color, message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message,style: const TextStyle(fontSize: 14),),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(label: "OK",
    onPressed: (){},
    textColor: Colors.white,
    ),
    )
  );
}

String getName(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getId(String res) {
    return res.substring(res.indexOf("_") + 1);
  }
