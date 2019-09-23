import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();
final List users = [{'test' : 'test', 'jlebourg': '1'}];

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    if (username== 'test') {
      return 'token';
    }
    else return '';
  }
  Future <bool> verify({@required String token})
  async {
    await Future.delayed(Duration(seconds: 1));
    if (token=='token') return true;
    return false;
  }
  
  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    String storedToken = await storage.read(key: 'token');
    if (storedToken != token) { await storage.write(key: 'token',value: token);}
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    String token = await storage.read(key: 'token');
    /// read from keystore/keychain
    //print (token);
    await Future.delayed(Duration(seconds: 1));
    return await verify(token:token);
    
  }
}
