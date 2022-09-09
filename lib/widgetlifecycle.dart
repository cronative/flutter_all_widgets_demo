import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: WidgetLifeCycle()));
}

class WidgetLifeCycle extends StatefulWidget {
  WidgetLifeCycle({Key key}) : super(key: key);

  @override
  _WidgetLifeCycleState createState() => _WidgetLifeCycleState();
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {
  // ignore: todo
  // TODO! call 'initState' on page entered
  @override
  void initState() {
    super.initState();
    print('Widget Lifecycle: initState');
  }

  // ignore: todo
  // TODO! call 'didChangeDependencies' on page entered
  @override
  void didChangeDependencies() {
    print('Widget Lifecycle: didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('Widget Lifecycle: didUpdateWidget');
  }

  // ignore: todo
  // TODO! call 'deactivate' on page leave
  @override
  void deactivate() {
    print('Widget Lifecycle: deactivate');
    super.deactivate();
  }

  // ignore: todo
  // TODO! call 'dispose' on page leave
  @override
  void dispose() {
    print('Widget Lifecycle: dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Widget Lifecycle'),
          backgroundColor: Colors.red[400],
          centerTitle: true,
        ),
        body: Center(child: Text('Widget Lifecycle')),
      ),
    );
  }
}
