class StudentProfileModel {
    String? id;
    String? fullname;
    String? gender;
    String? className;
    String? parents;
    String? address;
    String? dateofbirth;
    String? phone;
    String? username;
    String? password;
    int? v;

    StudentProfileModel({
        this.id,
        this.fullname,
        this.gender,
        this.className,
        this.parents,
        this.address,
        this.dateofbirth,
        this.phone,
        this.username,
        this.password,
        this.v,
    });

    factory StudentProfileModel.fromJson(Map<String, dynamic> json) {
        final userData = json['user'];
        return StudentProfileModel(
            id: userData["_id"],
            fullname: userData["fullname"],
            gender: userData["gender"],
            className: userData["className"],
            parents: userData["parents"],
            address: userData["address"],
            dateofbirth: userData["dateofbirth"],
            phone: userData["phone"],
            username: userData["username"],
            password: userData["password"],
            v: userData["__v"],
        );
    }

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname,
        "gender": gender,
        "className": className,
        "parents": parents,
        "address": address,
        "dateofbirth": dateofbirth,
        "phone": phone,
        "username": username,
        "password": password,
        "__v": v,
    };
}
