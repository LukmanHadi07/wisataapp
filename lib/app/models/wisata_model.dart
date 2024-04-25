
class WisataModel {
    final int? id;
    final String? name;
    final String? description;
    final String? priceHtm;
    final String? imageUrl;
    final String? address;
    final int? userId;
    final int? categoryId;
   
    WisataModel({
        this.id,
        this.name,
        this.description,
        this.priceHtm,
        this.imageUrl,
        this.address,
        this.userId,
        this.categoryId,
        
    });

    factory WisataModel.fromJson(Map<String, dynamic> json) => WisataModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        priceHtm: json["priceHtm"],
        imageUrl: json["imageUrl"],
        address: json["address"],
        userId: json["user_id"],
        categoryId: json["category_id"],
      
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "priceHtm": priceHtm,
        "imageUrl": imageUrl,
        "address": address,
        "user_id": userId,
        "category_id": categoryId,
        
    };
}
