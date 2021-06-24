import 'dart:ffi';

class TypesHelper {
  static int toInt( num val){
    try{
      if(val == null){

        return 0;
      }
      if(val == int){
        return val;

      }else{
        return val.toInt();
      }


    }catch(error){
      print(error);
      return 0;




    }


  }

static double todouble(num val){
    try{
      if(val == null){

        return 0 ;
      }
      if(val is double){
        return val;
      }else{

        return val.toDouble();
      }



    }catch(error){

     return 0;

    }



}

}