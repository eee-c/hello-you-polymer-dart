import 'package:polymer/polymer.dart';
import 'dart:math';

final colors = ['red', 'blue', 'green'];

@CustomTag('hello-you')
class HelloYou extends PolymerElement {
  @published String your_name;
  HelloYou.created(): super.created();

  feelingLucky() {
    var num = new Random().nextInt(colors.length);
    shadowRoot.
      query('h2').
      style.color = colors[num];
  }
}
