import 'package:redux/redux.dart';
import 'reducer.dart';

final store = Store<AppState>(
  appStateReducer,
  initialState: AppState(cart: [], productData: [], borderColor: null),
);
