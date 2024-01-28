class Product {
  String number;
  String title;
  String price;
  String imageurl;
  String search;

  Product({
    required this.number,
    required this.title,
    required this.price,
    required this.imageurl,
    required this.search
  });
}

List<Product> products = [
  Product(number: '1', title: 'GasCanister', price: '0.050', imageurl: "assets/images/가스통.png", search: "가스통gascanister"),
  Product(number: '2', title: 'Stair', price: '0.040', imageurl: "assets/images/계단.png", search: "계단stair"),
  Product(number: '3', title: 'Framework', price: '0.080', imageurl: "assets/images/골조1.png", search: "골조framework"),
  Product(number: '4', title: 'Equipment1', price: '0.100', imageurl: "assets/images/공정장비1.png", search: "공정장비1equipment1"),
  Product(number: '5', title: 'Equipment2', price: '0.100', imageurl: "assets/images/공정장비2.png", search: "공정장비2equipment2"),
  Product(number: '6', title: 'Equipment3', price: '0.100', imageurl: "assets/images/공정장비3.png", search: "공정장비3equipment3"),
  Product(number: '7', title: 'AirConditioner1', price: '0.090', imageurl: "assets/images/공조기1.png", search: "공조기1airconditioner1"),
  Product(number: '8', title: 'AirConditioner2', price: '0.090', imageurl: "assets/images/공조기2.png", search: "공조기2airconditioner2"),
  Product(number: '9', title: 'AirConditioner3', price: '0.090', imageurl: "assets/images/공조기3.png", search: "공조기2airconditioner3"),
  Product(number: '10', title: 'Drum', price: '0.020', imageurl: "assets/images/드럼통.png", search: "드럼통drum"),
  Product(number: '11', title: 'Robotic Arm1', price: '0.050', imageurl: "assets/images/로봇팔1.png", search: "로봇팔1roboticarm1"),
  Product(number: '12', title: 'Robotic Arm2', price: '0.050', imageurl: "assets/images/로봇팔2.png", search: "로봇팔2roboticarm2"),
  Product(number: '12', title: 'Robot Arm Engine Processs1', price: '0.050', imageurl: "assets/images/로봇팔엔진공정1.png", search: "로봇팔엔진공정1robotarmengineprocesss1"),
  Product(number: '13', title: 'Robot Arm Engine Processs2', price: '0.050', imageurl: "assets/images/로봇팔엔진공정2.png", search: "로봇팔엔진공정2robotarmengineprocesss2"),
  Product(number: '14', title: 'Robot Arm Engine Processs3', price: '100.00', imageurl: 'assets/images/로봇팔엔진공정3.png', search:'로봇팔엔진공정3robotarmengineprocesss3'),
  Product(number: '15', title: 'Robot Arm Exterior Process', price: '80.00', imageurl: 'assets/images/로봇팔외부샷시공정.png', search:'로봇팔외부샷시공정robotarmexteriorprocess'),
  Product(number: '16', title: 'Robot Arm Stop', price: '50.00', imageurl: 'assets/images/로봇팔정지.png', search:'로봇팔정지robotarmstop'),
  Product(number: '17', title: 'Rooftop Workspace', price: '200.00', imageurl: 'assets/images/루프탑작업공간.png', search:'루프탑작업공간rooftopworkspace'),
  Product(number: '18', title: 'Module', price: '150.00', imageurl: 'assets/images/모듈.png', search:'모듈module'),
  Product(number: '19', title: 'Motor1', price: '30.00', imageurl: 'assets/images/모터1.png', search:'모터1motor1'),
  Product(number: '20', title: 'Motor2', price: '35.00', imageurl: 'assets/images/모터2.png', search:'모터2motor2'),
  Product(number: '21', title: 'Box', price: '10.00', imageurl:'assets/images/박스더미.png', search:'박스box'),
  Product(number: '22', title: 'Industrial Air Purifier', price:'0.400', imageurl: 'assets/images/산업용공기청정기.png', search:'산업용공기청정기industrialairpurifier'),
  Product(number: '23', title: 'Ndustrial Air Conditioner', price: '0.400', imageurl: 'assets/images/산업용에어컨.png', search:'산업용에어컨ndustrialairconditioner'),
  Product(number: '24', title: 'Drawer', price: '20.00', imageurl: 'assets/images/서랍.png', search:'서랍drawer'),
  Product(number: '25', title: 'Shelf1', price: '25.00', imageurl: 'assets/images/선반1.png', search:'선반1shelf1'),
  Product(number: '26', title: 'Shelf2', price: '28.00', imageurl: 'assets/images/선반2.png', search:'선반2shelf2'),
  Product(number: '27', title: 'Shelf3', price: '30.00', imageurl: 'assets/images/선반3.png', search:'선반3shelf3'),
  Product(number: '28', title: 'Shelf4', price: '32.00', imageurl: 'assets/images/선반4.png', search:'선반4shelf4'),
  Product(number: '29', title: 'Socket', price: '32.00', imageurl: 'assets/images/소켓.png', search:'소켓socket'),
  Product(number: '30', title: 'Ladder Truck', price: '0.600', imageurl: 'assets/images/실내사다리차.png', search:'실내사다리차laddertruck'),
  Product(number: '42', title: 'Cable1', price: '0.020', imageurl: "assets/images/케이블1.png", search: "케이블cable1"),
  Product(number: '43', title: 'Cable2', price: '0.020', imageurl: "assets/images/케이블2.png", search: "케이블cable2"),
  Product(number: '44', title: 'Tire', price: '0.060', imageurl: "assets/images/타이어.png", search: "타이어tire"),
  Product(number: '45', title: 'Tray1', price: '0.030', imageurl: "assets/images/트레이1.png", search: "트레이tray"),
  Product(number: '46', title: 'Tray2', price: '0.030', imageurl: "assets/images/트레이2.png", search: "트레이tray"),
  Product(number: '47', title: 'Tray3', price: '0.030', imageurl: "assets/images/트레이3.png", search: "트레이tray"),
  Product(number: '48', title: 'Tray Transporter', price: '0.150', imageurl: "assets/images/트레이운반기.png", search: "트레이운반기traytransporter"),
  Product(number: '49', title: 'Pipe', price: '0.040', imageurl: "assets/images/파이프1.png", search: "파이프pipe"),
  Product(number: '50', title: 'Propeller', price: '0.012', imageurl: "assets/images/프로펠러.png", search: "프로펠러propeller"),
 ];