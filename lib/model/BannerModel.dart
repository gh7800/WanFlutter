/// desc : "享学~"
/// id : 29
/// imagePath : "https://wanandroid.com/blogimgs/942a5c62-ca87-4e7c-a93d-41ff59a15ba4.png"
/// isVisible : 1
/// order : 0
/// title : "震惊！app为何会突然崩溃？？？"
/// type : 0
/// url : "https://mp.weixin.qq.com/s/Q7OSaginyxgVcjg9C7_BxA"

class BannerModel {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  static BannerModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    BannerModel bannerModelBean = BannerModel();
    bannerModelBean.desc = map['desc'];
    bannerModelBean.id = map['id'];
    bannerModelBean.imagePath = map['imagePath'];
    bannerModelBean.isVisible = map['isVisible'];
    bannerModelBean.order = map['order'];
    bannerModelBean.title = map['title'];
    bannerModelBean.type = map['type'];
    bannerModelBean.url = map['url'];
    return bannerModelBean;
  }

  Map toJson() => {
    "desc": desc,
    "id": id,
    "imagePath": imagePath,
    "isVisible": isVisible,
    "order": order,
    "title": title,
    "type": type,
    "url": url,
  };
}