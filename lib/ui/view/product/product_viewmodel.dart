import 'package:headyproject/app/locator.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/models/variant_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  ProductModel _productModel;
  VariantModel _variantModel;
  List<VariantModel> _variants = [];

  ProductModel get product => _productModel;
  VariantModel get variant => _variantModel;
  List<CategoryModel> get categories => _apiService.categories;
  List<VariantModel> get variants => _variants;
  int get productsLength => Hive.box('products').length;

  setProduct(ProductModel value) {
    _productModel = value;

    notifyListeners();
    getVarients(value.id);
  }

  setVarient(VariantModel variantModel) {
    print('Varient Color: ${variants[0].color}');
    _variantModel = variantModel;
    notifyListeners();
  }

  getVarients(int id) {
    print('ProductId2: ${Hive.box('categories').values.length}');

    List<VariantModel> _variantModels = [...Hive.box('variants').values];

    if (_variants.length == 0) {
      _variantModels.forEach((variantModel) {
        if (variantModel.productId == id) {
          _variants.add(variantModel);
        }
      });
    }
    _variantModel = _variants[0];
    // notifyListeners();
    print('No of Variants - ${_variants.length}');
    notifyListeners();
  }
}
