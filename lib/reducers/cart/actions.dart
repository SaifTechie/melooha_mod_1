import 'dart:ui';
import '../../data/models/purchase_plan_model.dart';

class AddToCartAction {
  final int productId;

  AddToCartAction(this.productId);
}

class RemoveFromCartAction {
  final int productId;

  RemoveFromCartAction(this.productId);
}

class InitProductDataAction {
  final List<PurchasePlan> productData;

  InitProductDataAction(this.productData);
}

class UpdateBorderColorAction {
  final Color? borderColor;

  UpdateBorderColorAction(this.borderColor);
}
