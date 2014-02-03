library parent_child_test;

import 'package:unittest/unittest.dart';
import 'dart:html';
import 'dart:async';
import 'package:polymer/polymer.dart';

main() {
  // Ensure Polymer is looking for bound variables...
  addXParent();
  initPolymer();
  removeXParent();

  setUp(addXParent);
  tearDown(removeXParent);

  group("[updates]", (){
    test('updates the parent', (){
      new Timer(
        new Duration(milliseconds: 2500),
        expectAsync0((){
          expect(
            query('x-parent').shadowRoot.text,
            contains('Count: 1')
          );
        })
      );
    });

    test("updates the child", (){
      new Timer(
        new Duration(milliseconds: 2500),
        expectAsync0((){
          expect(
            query('x-parent').shadowRoot.query('x-child').shadowRoot.text,
            contains('Count: 1')
          );
        })
      );
    });
  });
}

addXParent() {
  document.body.append(createElement('<x-parent></x-parent>'));
}

removeXParent() {
  queryAll('x-parent').forEach((el)=> el.remove());
}

createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}
