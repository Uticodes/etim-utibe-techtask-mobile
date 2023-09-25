import 'package:flutter/material.dart';

import '../../data/core/enum/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  ViewState get viewState => _viewState;

  set viewState(ViewState newViewState){
    _viewState = newViewState;
    notifyListeners();
  }
}