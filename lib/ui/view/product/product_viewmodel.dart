import 'package:headyproject/app/locator.dart';
import 'package:headyproject/models/category_model.dart';
import 'package:headyproject/models/product_model.dart';
import 'package:headyproject/models/variant_model.dart';
import 'package:headyproject/services/api_service.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  ProductModel _productModel;
  VariantModel _variantModel;

  ProductModel get product => _productModel;
  VariantModel get varient => _variantModel;
  List<CategoryModel> get categories => _apiService.categories;
  List<VariantModel> get variants => [
        ..._apiService.variants
            .where((element) => (element.productId == product.id))
      ];

  setProduct(ProductModel value) {
    _productModel = value;
    _variantModel = variants[0];
    notifyListeners();
  }

  setVarient() {
    print('Varient Color: ${variants[0].color}');
  }

  getVarients(String id) {
    // return categories.
  }
}
