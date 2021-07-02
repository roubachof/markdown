part of 'inline_parser.dart';

//////////////////////////////////////////////////////////////////////////////
///////////////////// ENTERING ARCADE VALLEY MARKDOWN ////////////////////////
//////////////////////////////////////////////////////////////////////////////

class ArcadeValleyLinkSyntax extends LinkSyntax {
  final String elementName;

  ArcadeValleyLinkSyntax(this.elementName, String pattern,
      {Resolver? linkResolver})
      : super(
            linkResolver: linkResolver,
            pattern: pattern,
            startCharacter: $exclamation);

  @override
  Element _createNode(String destination, String? title,
      {required List<Node> Function() getChildren}) {
    var element = Element.empty(elementName);
    var children = getChildren();
    element.attributes['src'] = destination;
    String idInfoPair = children.map((node) => node.textContent).join();
    var splitIdInfo = idInfoPair.split(':');
    element.attributes['id'] = splitIdInfo[0];
    element.attributes['info'] = splitIdInfo[1];
    if (title != null && title.isNotEmpty) {
      element.attributes['title'] =
          escapeAttribute(title.replaceAll('&', '&amp;'));
    }
    return element;
  }
}

class AudioSyntax extends ArcadeValleyLinkSyntax {
  AudioSyntax({Resolver? linkResolver})
      : super(
          'audio',
          r'!aud\[',
          linkResolver: linkResolver,
        );
}

class MusicSyntax extends ArcadeValleyLinkSyntax {
  MusicSyntax({Resolver? linkResolver})
      : super(
          'music',
          r'!mus\[',
          linkResolver: linkResolver,
        );
}

class PodcastSyntax extends ArcadeValleyLinkSyntax {
  PodcastSyntax({Resolver? linkResolver})
      : super(
          'podcast',
          r'!pod\[',
          linkResolver: linkResolver,
        );
}

class NavigationSyntax extends ArcadeValleyLinkSyntax {
  NavigationSyntax({Resolver? linkResolver})
      : super(
          'navigation',
          r'!nav\[',
          linkResolver: linkResolver,
        );
}

class IfSyntax extends ArcadeValleyLinkSyntax {
  IfSyntax({Resolver? linkResolver})
      : super(
          'if',
          r'!if\[',
          linkResolver: linkResolver,
        );
}

class ThenSyntax extends ArcadeValleyLinkSyntax {
  ThenSyntax({Resolver? linkResolver})
      : super(
          'then',
          r'!then\[',
          linkResolver: linkResolver,
        );
}
