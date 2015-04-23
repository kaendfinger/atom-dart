library atom_dart.views;

import 'dart:html';

class View {
  Element get element => _element;
  Element _element;

  Panel get panel => _panel;
  Panel _panel;

  bool _visible = true;

  build() {
  }

  void bindRightPanel() {
    _panel = atom.workspace.addRightPanel(element);
  }

  void bindLeftPanel() {
    _panel = atom.workspace.addLeftPanel(element);
  }

  void bindBottomPanel() {
    _panel = atom.workspace.addBottomPanel(element);
  }

  void bindTopPanel() {
    _panel = atom.workspace.addTopPanel(element);
  }

  void bindModalPanel() {
    _panel = atom.workspace.addModalPanel(element);
  }

  void toggle() {
    if (_visible) {
      hide();
    } else {
      show();
    }
    _visible = !_visible;
  }

  void show() {
    if (_panel != null) {
      _panel.show();
    }
  }

  void hide() {
    if (_panel != null) {
      _panel.hide();
    }
  }
}

class DartOutlineView extends View {
  List items = [];

  OListElement _listElement;

  DartOutlineView();

  @override
  build() {
    _element = new DivElement()
        ..id = 'dart-outline-view';

    _element.children.add(new HeadingElement.h5()..text = 'Dart Outline');
    _listElement = new OListElement();
    _element.children.add(_listElement);

    for (var item in items) {
      _listElement.children.add(item);
    }
  }

  addItem(String item) {
    items.add(item);
    _listElement.children.add(new LIElement()..text = item);
  }
}

class PubOutputView extends View {
  var _outputElement;

  set text(String val) => _outputElement.text = val;

  PubOutputView();

  @override
  build() {

    _outputElement = new SpanElement();

    _element = new DivElement()
      ..id = 'pub-output-view'
      ..classes = ['padded']
      ..children = [
        new DivElement()
          ..classes = ['panel-heading']
          ..text = 'Pub Output',
        new DivElement()
          ..classes = ['panel-body', 'padded']
          ..children = [
            _outputElement
          ]
      ];
  }
}

class DartIssuesView extends View {
  List<AnalysisError> errors = [];

  DartAutoCompleteView();

  @override
  build() {

  }
}
