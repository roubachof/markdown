part of 'inline_parser.dart';

//////////////////////////////////////////////////////////////////////////////
///////////////////// ENTERING ARCADE VALLEY MARKDOWN ////////////////////////
//////////////////////////////////////////////////////////////////////////////

class AudioSyntax extends LinkSyntax {
  AudioSyntax({Resolver? linkResolver})
      : super(linkResolver: linkResolver, pattern: r'!a\[', startCharacter: $exclamation);

  @override
  Element _createNode(String destination, String? title, {required List<Node> Function() getChildren}) {
    var element = Element.empty('audio');
    var children = getChildren();
    element.attributes['src'] = destination;
    element.attributes['id'] = children.map((node) => node.textContent).join();
    if (title != null && title.isNotEmpty) {
      element.attributes['title'] = escapeAttribute(title.replaceAll('&', '&amp;'));
    }
    return element;
  }
}

class NavigationSyntax extends LinkSyntax {
  NavigationSyntax({Resolver? linkResolver})
      : super(linkResolver: linkResolver, pattern: r'!aud\[', startCharacter: $exclamation);

  @override
  Element _createNode(String destination, String? title, {required List<Node> Function() getChildren}) {
    var element = Element.empty('audio');
    var children = getChildren();
    element.attributes['src'] = destination;
    element.attributes['id'] = children.map((node) => node.textContent).join();
    if (title != null && title.isNotEmpty) {
      element.attributes['title'] = escapeAttribute(title.replaceAll('&', '&amp;'));
    }
    return element;
  }
}
