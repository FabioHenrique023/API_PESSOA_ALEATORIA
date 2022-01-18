import 'package:api_pessoa_aleatoria/userData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatefulWidget {
  User user;
  bool isExpanded;
  UserCard({required this.user, required this.isExpanded, Key? key }) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return
    widget.isExpanded == true ?
     SizedBox(
              height: 600,
              width: 500,
              child: Card(
                semanticContainer: true,
                elevation: 4,
                margin: EdgeInsets.all(30),
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(onPressed: () {
              setState(() {
                widget.isExpanded = false;
              });
            }, icon: Icon(Icons.arrow_drop_up),),),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(widget.user.image),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.user.nome + ' - ' + widget.user.idade.toString(),
                          style: GoogleFonts.pacifico(
                              fontSize: 30.0, color: Colors.black),
                        ),
                        const Icon(Icons.info_outline_rounded,
                            color: Colors.pink, size: 18.0),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.mark_email_read_rounded,
                            color: Colors.pink, size: 18.0),
                        Text(widget.user.email,
                            style: GoogleFonts.roboto(fontSize: 25.0, color: Colors.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.home_rounded,
                          color: Colors.pink,
                          size: 20,
                        ),
                        Text(widget.user.local,
                            style: GoogleFonts.roboto(fontSize: 20.0, color: Colors.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.phone_android_outlined,
                          color: Colors.pink,
                          size: 20,
                        ),
                        Text(widget.user.phone,
                            style: GoogleFonts.roboto(fontSize: 20.0, color: Colors.black)),
                      ],
                    )
                  ],
                ),
              ),
            ) : Container(child: Row(children: [Text(widget.user.nome), IconButton(onPressed: () {
              setState(() {
                widget.isExpanded = true;
              });
            }, icon: Icon(Icons.arrow_drop_down),)],),);
  }
}