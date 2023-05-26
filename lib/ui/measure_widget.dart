import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSize extends SingleChildRenderObjectWidget {
  const MeasureSize({
    required Widget child,
    this.onChange,
    Key? key,
  }) : super(key: key, child: child);

  final OnWidgetSizeChange? onChange;

  @override
  RenderObject createRenderObject(BuildContext context) => _MeasureSizeRenderObject(onChange);
}

class _MeasureSizeRenderObject extends RenderProxyBox {
  _MeasureSizeRenderObject(this.onChange);

  final OnWidgetSizeChange? onChange;
  Size? oldSize;

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize != newSize) {
      oldSize = newSize;
      WidgetsBinding.instance.addPostFrameCallback((_) => onChange?.call(newSize));
    }
  }
}
