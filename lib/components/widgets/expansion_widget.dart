import 'package:flutter/material.dart';

const Duration _kExpand = const Duration(milliseconds: 200);

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    Key key,
    this.leading,
    this.title,
    this.backgroundColor,
    this.iconData,
    this.onExpansionChanged,
    this.children: const <Widget>[],
    this.initiallyExpanded: true,
  })  : assert(initiallyExpanded != null),
        super(key: key);

  final Widget leading;
  final Widget title;
  final IconData iconData;
  final ValueChanged<bool> onExpansionChanged;
  final List<Widget> children;
  final Color backgroundColor;
  final bool initiallyExpanded;

  @override
  AppExpansionTileState createState() => AppExpansionTileState();
}

class AppExpansionTileState extends State<AppExpansionTile>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  CurvedAnimation _easeOutAnimation;
  CurvedAnimation _easeInAnimation;
  ColorTween _borderColor;
  ColorTween _headerColor;
  ColorTween _iconColor;
  ColorTween _backgroundColor;
  Animation<double> _iconTurns;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: _kExpand, vsync: this);
    _easeOutAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _easeInAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = ColorTween();
    _headerColor = ColorTween();
    _iconColor = ColorTween();
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
    _backgroundColor = ColorTween();

    _isExpanded =
        PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    _setExpanded(!_isExpanded);
  }

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded)
          _controller.forward();
        else
          _controller.reverse().then<void>((value) {
            setState(() {});
          });
        PageStorage.of(context)?.writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged(_isExpanded);
      }
    }
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Container(
      color: _backgroundColor.evaluate(_easeOutAnimation) ?? Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme.merge(
            data: IconThemeData(color: _iconColor.evaluate(_easeInAnimation)),
            child: InkWell(
              splashColor: Colors.green[200],
              onTap: toggle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.leading,
                  Flexible(child: widget.title),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: RotationTransition(
                          turns: _iconTurns,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              widget.iconData,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClipRect(
            child: Align(
              heightFactor: _easeInAnimation.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.subtitle1.color
      ..end = theme.accentColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColor.end = widget.backgroundColor;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
