import 'package:gdlibrary_d_1686/invoice/model/product.dart';

String getSubTotal(List<Product> products) {
  return products
      .fold(0.0,
          (double prev, element) => prev + (element.amount * element.price))
      .toStringAsFixed(2);
}

String getPPNTotal(List<Product> products) {
  return products
      .fold(
        0.0,
        (double prev, next ) =>
            prev + ((next.price / 100 * next.ppInPercent) * next.amount),
      ) 
      .toStringAsFixed(2);
}