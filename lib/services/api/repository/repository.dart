import 'package:countries_restful/models/country.dart';
import 'package:countries_restful/services/api/api_provider.dart';

class Repository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<Country>> getAllCountries() => apiProvider.getAllCountries();
}
