import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:roipil_base/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class RoipilContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final double height;
  final double width;
  final Function onTap;
  final String link;

  const RoipilContainer(
      {this.child,
      this.padding,
      this.margin,
      this.color,
      this.height,
      this.width,
      this.onTap,
      this.link});

  @override
  _RoipilContainerState createState() => _RoipilContainerState();
}

class _RoipilContainerState extends State<RoipilContainer> with AfterLayoutMixin<RoipilContainer> {
  final EdgeInsets defaultPadding = const EdgeInsets.all(kDefaultMargin);

  double displayHeight;
  double initialHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    displayHeight = widget.height;
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    initialHeight = context.size.height;
    displayHeight = context.size.height;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD called');
    return Builder(
      builder: (BuildContext context) => Material(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        color: widget.color ?? Colors.white,
        child: InkWell(
          // onTap: widget.onTap != null ? widget.onTap : (widget.link != null ? () => _launchURL(widget.link) : null),
          onTap: () => null,
          onHover: (bool isHover) {
            print('CALLED: $isHover | $displayHeight');
            print(context.size.height);
            if (isHover) {
              displayHeight = initialHeight + 20.0;
            } else {
              displayHeight = initialHeight;
            }
            setState(() {

            });
          },
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          child: AnimatedContainer(
            curve: Curves.ease,
            duration: Duration(seconds: 1),
            height: displayHeight,
            width: widget.width,
            margin: widget.margin,
            padding: widget.padding ?? defaultPadding,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    print('1: $url');
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
