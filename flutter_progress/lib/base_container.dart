
import 'package:flutter/cupertino.dart';

class BaseContainer extends StatefulWidget {

  final Widget body;
  final bool showProgress;

  const BaseContainer({Key key, this.body, this.showProgress}) : super(key: key);

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Stack(
          children: <Widget>[
            widget.body,
            Visibility(
              visible: widget.showProgress,
              child: Container(
                color: Color(0x42E91E63),
                child: Center(
                  child: Text('Loading'),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
