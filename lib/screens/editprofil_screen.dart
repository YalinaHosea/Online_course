import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:online_course/Component/loading_dialog.dart';
import 'package:online_course/Component/text_input.dart';
import 'package:online_course/services/api/repository.dart';
import 'package:online_course/services/constants/constants.dart';
import 'package:online_course/models/user.dart';
import 'package:online_course/services/validator/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfil extends StatefulWidget {
  final User user;
  const EditProfil({Key key, this.user}) : super(key: key);
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> with Validator {
  final formkey = GlobalKey<FormState>();
  DateFormat dateFormat = new DateFormat("dd MMMM yyyy");
  DateFormat datepost = new DateFormat("yyyy-MM-dd");
  // final TextEditingController usercontroller = new TextEditingController();
  final TextEditingController namacontroller = new TextEditingController();
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController alamatcontroller = new TextEditingController();
  final TextEditingController nohpcontroller = new TextEditingController();
  DateTime tanggal;
  final TextEditingController tanggallahircontroller =
      new TextEditingController();
  String provinsi;
  int jk;
  ApiRepository apiRepository = new ApiRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // usercontroller.text = widget.user.iDUser;
    namacontroller.text = widget.user.nama;
    emailcontroller.text = widget.user.email;
    alamatcontroller.text = widget.user.alamat;
    nohpcontroller.text = widget.user.nomorTelpon;
    tanggallahircontroller.text = widget.user.tanggalLahir;
    jk = int.parse(widget.user.jenisKelamin);
    provinsi = widget.user.provinsi;
    tanggal = DateTime.parse(widget.user.tanggalLahir);
  }

  responfunc(error, User user) {
    if (error) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      Navigator.pop(context, user);
    }
  }

  editprofile() async {
    showAlertDialog(context, "Ubah profile ... ");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String username = widget.user.iDUser;
    String nama = namacontroller.text.toString();
    String tgl_lahir = datepost.format(tanggal);
    int kelamin = jk;
    String alamat = alamatcontroller.text.toString();
    String prov = provinsi;
    String nohp = nohpcontroller.text.toString();
    String email = emailcontroller.text.toString();
    bool error = false;
    User user = new User();
    // user.iDUser = username;
    user.nama = nama;
    user.tanggalLahir = tgl_lahir;
    user.jenisKelamin = kelamin.toString();
    user.alamat = alamat;
    user.provinsi = prov;
    user.nomorTelpon = nohp;
    user.email = email;
    User finaluser;

    await apiRepository.editprofile(user).then((value) {
      if (value.result.resultcode != 1) {
        error = true;
      } else {
        finaluser = value.user;
        finaluser.iDUser = username;
        var userjson = finaluser.toJson();
        sharedPreferences.setString("user", userjson.toString());
      }
      Navigator.pop(context);
      showResponse(context, value.result.resultmessage,
          () => responfunc(error, finaluser));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: new Text("Edit Profile",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      Center(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                widget.user.foto,
                                fit: BoxFit.cover,
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: SvgPicture.asset(
                                  "assets/icons/round_edit.svg",
                                  height: 30,
                                  width: 30),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // Txtinput(
                      //   controller: usercontroller,
                      //   label: "Username",
                      //   validator: validateempty,
                      // ),
                      SizedBox(height: 20),
                      Txtinput(
                        controller: namacontroller,
                        label: "Nama",
                        validator: validateempty,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        readOnly: true,
                        controller: tanggallahircontroller,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: tanggal == null
                                            ? DateTime.now()
                                            : tanggal,
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now())
                                    .then((value) => {
                                          if (value == null)
                                            {
                                              if (tanggal == null)
                                                {
                                                  tanggallahircontroller.text =
                                                      ""
                                                }
                                              else
                                                {
                                                  tanggallahircontroller.text =
                                                      dateFormat.format(tanggal)
                                                }
                                            }
                                          else
                                            {
                                              setState(() {
                                                tanggal = value;
                                              }),
                                              tanggallahircontroller.text =
                                                  dateFormat.format(tanggal)
                                            }
                                        });
                              },
                            ),
                            contentPadding: EdgeInsets.all(0),
                            labelText: "Tanggal Lahir",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kGrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kBlueColor),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Jenis Kelamin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                jk = 1;
                              });
                            },
                            child: Container(
                              width: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: jk != 1 ? Colors.black12 : kBlueColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "L",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                jk = 2;
                              });
                            },
                            child: Container(
                              width: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: jk != 2 ? Colors.black12 : Colors.pink,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "P",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Txtinput(
                        controller: alamatcontroller,
                        label: "Alamat",
                        validator: validateempty,
                      ),
                      SizedBox(height: 25),
                      Text(
                        "Provinsi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      DropdownButton(
                        hint: Text("Pilih provinsi"),
                        value: provinsi,
                        items: list_provinsi.map(
                          (value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            provinsi = value;
                          });
                        },
                      ),
                      Txtinput(
                        controller: nohpcontroller,
                        label: "No Telepon",
                        validator: validateempty,
                      ),
                      SizedBox(height: 20),
                      Txtinput(
                        controller: emailcontroller,
                        label: "Email",
                        validator: validateempty,
                      ),
                      SizedBox(height: 20),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                color: kBlueColor,
                                onPressed: () {
                                  editprofile();
                                },
                                child: Text(
                                  "simpan",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ))
                    ]),
              )),
        ));
  }
}
