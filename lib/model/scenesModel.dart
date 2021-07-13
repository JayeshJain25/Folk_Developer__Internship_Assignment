class ScenesModel {
  final String assetsImage;
  final String scenesName;
  final List<String> colorCode;

  const ScenesModel(
      {required this.assetsImage, required this.scenesName, required this.colorCode});
}

const List<ScenesModel> scenesModelList = [
  const ScenesModel(
      assetsImage: "lib/assets/surface2.png",
      scenesName: "Birthday",
      colorCode: ["#ff9b9d","#feb596"]),
  const ScenesModel(
      assetsImage: "lib/assets/surface2.png",
      scenesName: "Party",
      colorCode: ["#a395e6","#cf95e6"]),

  const ScenesModel(
      assetsImage: "lib/assets/surface2.png",
      scenesName: "Relax",
      colorCode: ["#8acae9","#8adbeb"]),
  const ScenesModel(
      assetsImage: "lib/assets/surface2.png",
      scenesName: "Fun",
      colorCode: ["#88df99","#b6e899"]),
];
