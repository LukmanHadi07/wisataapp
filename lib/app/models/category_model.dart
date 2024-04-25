

class CategoryModel {
    final int? id;
    final String? name;
    final String? imageCategory;
    

    CategoryModel({
        this.id,
        this.name,
        this.imageCategory,
       
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        imageCategory: json["imageCategory"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageCategory": imageCategory,
    };
}
