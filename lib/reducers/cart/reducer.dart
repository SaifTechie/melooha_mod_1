import 'package:flutter/material.dart';
import '../../data/models/purchase_plan_model.dart';
import 'actions.dart';

class AppState {
  final List<int> cart;
  final List<PurchasePlan> productData;
  final Color? borderColor;

  AppState({
    required this.cart,
    required this.productData,
    this.borderColor,
  });
}

List<int> cartReducer(List<int> state, dynamic action) {
  if (action is AddToCartAction) {
    return List.from(state)..add(action.productId);
  } else if (action is RemoveFromCartAction) {
    return List.from(state)..remove(action.productId);
  }
  return state;
}

List<PurchasePlan> productDataReducer(List<PurchasePlan> state, dynamic action) {
  if (action is InitProductDataAction) {
    return action.productData;
  }
  return state;
}

Color? borderColorReducer(Color? state, dynamic action) {
  if (action is UpdateBorderColorAction) {
    return action.borderColor;
  }
  return state;
}


AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
    cart: cartReducer(state.cart, action),
    productData: productDataReducer(state.productData, action),
    borderColor: borderColorReducer(state.borderColor, action),
  );
}
