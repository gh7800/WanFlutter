class StringUtil {
  ///过滤html标签
  static replaceHtmlTag(String string) {
    String str;
    if (string.contains('&')) {
      str = string.replaceAll("&mdash;", "'");
      str = str.replaceAll("&quot;", "'");
      str = str.replaceAll("&ldquo;", "'");
      str = str.replaceAll("&rdquo;", "'");
      return str;
    } else {
      return string;
    }
  }
}
