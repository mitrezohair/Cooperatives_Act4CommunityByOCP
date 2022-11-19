import 'package:cloud_firestore/cloud_firestore.dart';

class CooperativeModel{
  late String adresse ,  description, email, image, name, telephone, urlfacebook ;


  CooperativeModel(
      {required this.adresse,
        required this.description,
        required this.email,
        required this.image,
        required this.name,
        required this.telephone,
        required this.urlfacebook});

  CooperativeModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    adresse = documentSnapshot["adresse"];
    description = documentSnapshot["description"];
    email = documentSnapshot["email"];
    image = documentSnapshot["image"];
    name = documentSnapshot["name"];
    telephone = documentSnapshot["telephone"];
    urlfacebook = documentSnapshot["urlfacebook"];
  }

  CooperativeModel.fromJson(Map<dynamic , dynamic> map){
    if(map == null){
      return;
    }else{
      adresse=map['adresse'];
      description=map['description'];
      email=map['email'];
      image=map['image'];
      name=map['name'];
      telephone=map['telephone'];
      urlfacebook=map['urlfacebook'];
    }
  }

  toJson(){
    return {
      'adresse':adresse,
      'description' : description,
      'email' : email,
      'image' : image,
      'name' : name,
      'telephone' : telephone,
      'urlfacebook' : urlfacebook,
    };
  }
}