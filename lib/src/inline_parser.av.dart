part of 'inline_parser.dart';

//////////////////////////////////////////////////////////////////////////////
///////////////////// ENTERING ARCADE VALLEY MARKDOWN ////////////////////////
//////////////////////////////////////////////////////////////////////////////

class ArcadeValleyElements {
  static const audio = 'audio';
  static const music = 'media';
  static const video = 'video';
  static const podcast = 'podcast';
  static const navigation = 'navigation';
  static const condition = 'if';
  static const then = 'then';
  static const widget = 'widget';
}

class ArcadeValleyLinkSyntax extends LinkSyntax {
  final String elementName;

  ArcadeValleyLinkSyntax(this.elementName, String pattern,
      {Resolver? linkResolver})
      : super(
            linkResolver: linkResolver,
            pattern: pattern,
            startCharacter: $exclamation);

  @override
  Element createNode(String destination, String? title,
      {required List<Node> Function() getChildren}) {
    final element = Element.empty(elementName);
    final children = getChildren();
    element.attributes['src'] = destination;
    final String idInfoPair = children.map((node) => node.textContent).join();
    final splitIdInfo = idInfoPair.split(':');
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
          ArcadeValleyElements.audio,
          r'!aud\[',
          linkResolver: linkResolver,
        );
}

class MusicSyntax extends ArcadeValleyLinkSyntax {
  MusicSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.music,
          r'!mus\[',
          linkResolver: linkResolver,
        );
}

class VideoSyntax extends ArcadeValleyLinkSyntax {
  VideoSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.video,
          r'!vid\[',
          linkResolver: linkResolver,
        );
}

class PodcastSyntax extends ArcadeValleyLinkSyntax {
  PodcastSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.podcast,
          r'!pod\[',
          linkResolver: linkResolver,
        );
}

class NavigationSyntax extends ArcadeValleyLinkSyntax {
  NavigationSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.navigation,
          r'!nav\[',
          linkResolver: linkResolver,
        );
}

class IfSyntax extends ArcadeValleyLinkSyntax {
  IfSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.condition,
          r'!if\[',
          linkResolver: linkResolver,
        );
}

class ThenSyntax extends ArcadeValleyLinkSyntax {
  ThenSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.then,
          r'!then\[',
          linkResolver: linkResolver,
        );
}

class WidgetSyntax extends ArcadeValleyLinkSyntax {
  WidgetSyntax({Resolver? linkResolver})
      : super(
          ArcadeValleyElements.widget,
          r'!widget\[',
          linkResolver: linkResolver,
        );
}
