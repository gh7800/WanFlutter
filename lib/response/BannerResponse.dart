
/// data : [{"desc":"享学~","id":29,"imagePath":"https://wanandroid.com/blogimgs/7afbd760-8b30-4c7b-8353-25b38fc65908.jpeg","isVisible":1,"order":0,"title":"&ldquo;你能做个淘宝、微信吗？&rdquo;","type":0,"url":"https://mp.weixin.qq.com/s/ledHfZJo64nfXjqsbzT0Dg"},{"desc":"","id":6,"imagePath":"https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png","isVisible":1,"order":1,"title":"我们新增了一个常用导航Tab~","type":1,"url":"https://www.wanandroid.com/navi"},{"desc":"一起来做个App吧","id":10,"imagePath":"https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png","isVisible":1,"order":1,"title":"一起来做个App吧","type":1,"url":"https://www.wanandroid.com/blog/show/2"},{"desc":"","id":20,"imagePath":"https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png","isVisible":1,"order":2,"title":"flutter 中文社区 ","type":1,"url":"https://flutter.cn/"}]
/// errorCode : 0
/// errorMsg : ""

class BannerResponse {
  List<Data> data;
  int errorCode;
  String errorMsg;

  BannerResponse({this.data, this.errorCode, this.errorMsg});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class Data {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  Data({this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url});

  Data.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    id = json['id'];
    imagePath = json['imagePath'];
    isVisible = json['isVisible'];
    order = json['order'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['id'] = this.id;
    data['imagePath'] = this.imagePath;
    data['isVisible'] = this.isVisible;
    data['order'] = this.order;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
