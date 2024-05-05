import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*extension Cuibt on BuildContext {
  AppCubit get appCuibt{
    return read<AppCubit>();
  }
}*/

extension Height on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }
}

extension Width on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }
}

extension IsPhone on BuildContext {
  bool get isPhone {
    return MediaQuery.of(this).size.width < 1300 &&
        MediaQuery.of(this).size.width >= 650;
  }
}

extension IsPortrait on BuildContext {
  bool get isPortrait {
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }
}
