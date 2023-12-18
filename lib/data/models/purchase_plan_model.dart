class PurchasePlan {
  final int id;
  final String title;
  final bool isTrending;
  final int offerPer;
  final String subTitle1;
  final String subTitle2;
  final int numOfQuestion;
  final int offerPrice;
  final int originalPrice;
  final String planBannerAddress;

  PurchasePlan({
    required this.id,
    required this.title,
    required this.isTrending,
    required this.offerPer,
    required this.subTitle1,
    required this.subTitle2,
    required this.numOfQuestion,
    required this.offerPrice,
    required this.originalPrice,
    required this.planBannerAddress,
  });
}