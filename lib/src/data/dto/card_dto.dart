class CardDataDTO {
  int id;
  String text="";
  int groupId;

  CardDataDTO ({
    this.id,
    this.text,
    this.groupId
  });

  factory CardDataDTO.fromJson(Map<String, dynamic> json) {
    return CardDataDTO(
      id: json["id"],
      text: json["text"],
      groupId: int.parse(json["row"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "person_id": groupId
  };

}