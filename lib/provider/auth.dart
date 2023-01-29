
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop/models/http_exception.dart';



class Auth with ChangeNotifier{
    String? _token;
    String ? _userId;
     DateTime? _expiryDate;
     Timer? _authTimer;
   bool get isAuth {
    return token!=null;
   }
   String? get token{
    if(_expiryDate!=null
    &&_expiryDate!.isAfter(DateTime.now()
    )&&_token!=null){ return _token!;}
    return '';
   }
     String get userId {
    return _userId.toString();
  }

     Future<void>_authenticate(String email,String password,urlSegment)  async {
      //https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=[API_KEY]
      
      //'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyC13spCwP_f_SalxEbkB-wjedoF8iYENlQ';
final url =  Uri.parse(
     'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyA-7VKZp9A7hvodA-XG9vHFG8o5cpWnlP4');
     try {
      final response = await http.post(url,body:json.encode({
 'email': email,
  'password': password,
  'returnSecureToken':true
}));
final responseData= json.decode(response.body) ;

if (responseData['error']!=null) {
  throw HttpException(responseData['error']['message']);

}
_token=responseData['idToken'];
_userId = responseData['localId'];
_expiryDate=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
_autoLogout();
notifyListeners();
       
      } catch (error) {
       rethrow;
     } 


  }
  
  Future<void>singup(String email,String password)  async {
     return _authenticate(email, password, 'signUp');
/* final url = Uri.parse(
     'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA-7VKZp9A7hvodA-XG9vHFG8o5cpWnlP4');

final response = await http.post(url,body:json.encode({
 'email': email,
  'password': password,
  'returnSecureToken':true
}));
  print(json.decode(response.body)); */

  }
    Future<void>login(String email,String password)  async {
      return _authenticate(email, password, 'signInWithPassword');
/* final url = Uri.parse(
     'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA-7VKZp9A7hvodA-XG9vHFG8o5cpWnlP4');

final response = await http.post(url,body:json.encode({
 'email': email,
  'password': password,
  'returnSecureToken':true
}));
  print(json.decode(response.body));

  } */
}
void logout(){
  _expiryDate=null;
  _token=null;
  _userId=null;
    if (_authTimer!=null) {
    _authTimer?.cancel();
    _authTimer=null;
  }
  notifyListeners();
}
void _autoLogout(){
  if (_authTimer!=null) {
    _authTimer?.cancel();
  }
  final timetoexpiry=_expiryDate!.difference(DateTime.now()).inSeconds;
  _authTimer=Timer(Duration(seconds: 10 ), logout);

}
}