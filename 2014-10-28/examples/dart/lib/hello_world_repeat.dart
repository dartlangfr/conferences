import 'package:polymer/polymer.dart';

@CustomTag('hello-world-repeat')
class HelloWorldRepeat extends PolymerElement {

  List<String> friends = ['John Doe', 'Jane Doe', 'Mister X'];

  HelloWorldRepeat.created() : super.created();

}