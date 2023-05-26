// Aqui van a ser los requests
import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
  }

  void registerHTTPService() {
    GetIt.instance.registerSingleton<HTTPService>(
      HTTPService(),
    );
  }

  Future<Response?> get(String _path) async {
    try {
      // _path == /coins/bitcoin
      // https://api.coingecko.com/api/v3/coins/bitcoin
      String _url = "$_base_url$_path";
      Response? _response =
          await dio.get(_url); // dio es el que hace los requests
      return _response;
    } catch (e) {
      print('HTTPService: Unable to perform get request');
      print(e);
    }
  }
}
