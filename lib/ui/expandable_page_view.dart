// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers

import 'dart:core';

import 'package:flutter/material.dart';

import 'measure_widget.dart';

class ExpandablePageView extends StatefulWidget {
  const ExpandablePageView({
    required this.children,
    this.controller,
    this.onScrollDown,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 400),
    super.key,
  });

  final List<Widget> children;
  final PageController? controller;
  final Curve curve;
  final Duration duration;
  final VoidCallback? onScrollDown;

  @override
  _ExpandablePageViewState createState() => _ExpandablePageViewState();
}

class _ExpandablePageViewState extends State<ExpandablePageView> with TickerProviderStateMixin {
  late PageController _pageController;
  late List<double> _heights;
  int _currentPage = 0;
  int _previusPage = 0;

  double get _currentHeight => _heights[_currentPage];
  double get _previusHeight => _heights[_previusPage];

  void _onPageChange() {
    final _previusPage = _currentPage;
    final _newPage = _pageController.page!.round();
    if (_currentPage != _newPage) {
      setState(() {
        _currentPage = _newPage;
        this._previusPage = _previusPage;
      });
    }
  }

  int get _index {
    int index;
    try {
      index = _pageController.page?.toInt() ?? 0;
    } catch (_) {
      index = 0;
    }

    return index;
  }

  void _onEnd() {
    if (_currentHeight > _previusHeight) {
      widget.onScrollDown?.call();
    }
  }

  @override
  void initState() {
    _heights = widget.children.map((e) => 0.0).toList();
    _pageController = widget.controller ?? PageController()
      ..addListener(_onPageChange);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() => _currentPage = _index));

    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    if (oldWidget != widget) {
      final needAddHeightsCount = widget.children.length - _heights.length;

      for (int i = 0; i < needAddHeightsCount; i++) {
        _heights.add(0);
      }
    }

    super.didUpdateWidget(widget);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    if (widget.controller == null) {
      _pageController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: widget.curve,
      duration: widget.duration,
      onEnd: _onEnd,
      tween: Tween<double>(begin: _heights[_index], end: _currentHeight),
      builder: (_, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        controller: _pageController,
        children: _sizeReportingChildren.asMap().map(MapEntry.new).values.toList(),
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap()
      .map(
        (index, child) => MapEntry(
          index,
          OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: MeasureSize(
              onChange: (size) {
                setState(() => _heights[index] = size.height);
              },
              child: Align(child: child),
            ),
          ),
        ),
      )
      .values
      .toList();
}
