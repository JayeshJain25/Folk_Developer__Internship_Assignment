class RoomModel {
  final String assetsImage;
  final String roomName;
  final String light;

  const RoomModel(
      {required this.assetsImage, required this.roomName, required this.light});
}

const List<RoomModel> roomModelList = [
  const RoomModel(
      assetsImage: "lib/assets/bed.png",
      roomName: "Bed Room",
      light: "4 Lights"),
  const RoomModel(
      assetsImage: "lib/assets/room.png",
      roomName: "Living Room",
      light: "2 Lights"),
  const RoomModel(
      assetsImage: "lib/assets/kitchen.png",
      roomName: "Kitchen",
      light: "5 Lights"),
  const RoomModel(
      assetsImage: "lib/assets/bathtube.png",
      roomName: "Bathroom",
      light: "1 Light"),
  const RoomModel(
      assetsImage: "lib/assets/house.png",
      roomName: "Outdoor",
      light: "5 Lights"),
  const RoomModel(
      assetsImage: "lib/assets/balcony.png",
      roomName: "Balcony",
      light: "2 Lights")
];
