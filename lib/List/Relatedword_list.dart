class words {
  final String name;
  final String tag1;
  final String tag2;
  final String tag3;
  final String tag4;
  final String tag5;

  words({
    this.name = '',
    this.tag1 = '',
    this.tag2 = '',
    this.tag3 = '',
    this.tag4 = '',
    this.tag5 = '',
  });

  factory words.fromMap({required Map<String,dynamic> map}){
    return words(
        name: map['name']??'',
        tag1: map['tag1']??'',
        tag2: map['tag2']??'',
        tag3: map['tag3']??'',
        tag4: map['tag4']??'',
        tag5: map['tag5']??'',
    );
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> data = {};
    data['name']=name;
    data['tag1']=tag1;
    data['tag2']=tag2;
    data['tag3']=tag3;
    data['tag4']=tag4;
    data['tag5']=tag5;
    return data;
  }
}