// part of chat_screen;

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _textEditingController = TextEditingController();
//   bool notActive = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "dsfdsf",
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios_new_outlined),
//             onPressed: () {
//               // BlocProvider.of<OpenchannelBloc>(context).add(GetAllChannels());
//               // Navigator.pop(context);
//             },
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 print("menu clicked");
//               },
//               icon: const Icon(Icons.menu),
//             )
//           ],
//           backgroundColor: Colors.black,
//           foregroundColor: Colors.white,
//         ),
//         body: Container(
//           decoration: BoxDecoration(color: Colors.black),
//           child: Column(
//             children: [
//               // Expanded(
//               //   child: ListView.builder(
//               //     itemCount:
//               //         state is OpenchannelMessage ? state.messages.length : 0,
//               //     itemBuilder: (context, index) {
//               //       return Container(
//               //         margin: EdgeInsets.only(top: 10),
//               //         child: state is OpenchannelMessage &&
//               //                 state.messages[index].user.user_id == "dev"
//               //             ? Row(
//               //                 mainAxisAlignment: MainAxisAlignment.end,
//               //                 children: [
//               //                   Container(
//               //                     padding: EdgeInsets.only(
//               //                         left: 15, top: 5, bottom: 5, right: 10),
//               //                     margin: EdgeInsets.only(right: 10),
//               //                     width:
//               //                         MediaQuery.of(context).size.width - 100,
//               //                     decoration: BoxDecoration(
//               //                       color: Colors.pink,
//               //                       borderRadius: BorderRadius.only(
//               //                           topLeft: Radius.circular(20),
//               //                           bottomRight: Radius.circular(10),
//               //                           bottomLeft: Radius.circular(20)),
//               //                     ),
//               //                     child: Text(
//               //                       "state.messages[index].message",
//               //                       style: TextStyle(color: Colors.white),
//               //                     ),
//               //                   ),
//               //                 ],
//               //               )
//               //             : Row(
//               //                 crossAxisAlignment: CrossAxisAlignment.end,
//               //                 children: [
//               //                     Container(
//               //                       child: Row(
//               //                         crossAxisAlignment:
//               //                             CrossAxisAlignment.start,
//               //                         children: [
//               //                           // CircleAvatar(
//               //                           //   backgroundImage: NetworkImage(
//               //                           //       state is OpenchannelMessage
//               //                           //           ? state.messages[index].user
//               //                           //               .profile_url
//               //                           //           : ''),
//               //                           // ),
//               //                           SizedBox(width: 5.0),
//               //                           Container(
//               //                             width: MediaQuery.of(context)
//               //                                     .size
//               //                                     .width -
//               //                                 150,
//               //                             decoration: BoxDecoration(
//               //                               color: Color.fromARGB(
//               //                                   115, 110, 110, 110),
//               //                               borderRadius:
//               //                                   BorderRadius.circular(10.0),
//               //                             ),
//               //                             child: Padding(
//               //                               padding: const EdgeInsets.all(8.0),
//               //                               child: Column(
//               //                                 crossAxisAlignment:
//               //                                     CrossAxisAlignment.start,
//               //                                 children: [
//               //                                   Container(
//               //                                     child: Row(
//               //                                       children: [
//               //                                         Text(
//               //                                           "dsfdsf",
//               //                                           style: TextStyle(
//               //                                               color:
//               //                                                   Color.fromARGB(
//               //                                                       115,
//               //                                                       226,
//               //                                                       226,
//               //                                                       226),
//               //                                               fontWeight:
//               //                                                   FontWeight
//               //                                                       .bold),
//               //                                         ),
//               //                                         SizedBox(
//               //                                           width: 20,
//               //                                         ),
//               //                                         Icon(
//               //                                           Icons.circle,
//               //                                           color:
//               //                                           // state
//               //                                               //         is OpenchannelMessage &&
//               //                                               //     state
//               //                                               //         .messages[
//               //                                               //             index]
//               //                                               //         .user
//               //                                               //         .is_active
//               //                                               // ?
//               //                                                Color.fromARGB(
//               //                                                   255,
//               //                                                   10,
//               //                                                   218,
//               //                                                   255)
//               //                                               // : Colors.black,
//               //                                           size: 10,
//               //                                         ),
//               //                                       ],
//               //                                     ),
//               //                                   ),
//               //                                   Container(
//               //                                     padding: EdgeInsets.all(10.0),
//               //                                     decoration: BoxDecoration(
//               //                                       borderRadius:
//               //                                           BorderRadius.circular(
//               //                                               10.0),
//               //                                     ),
//               //                                     child: Text(
//               //                                       state is OpenchannelMessage
//               //                                           ? state.messages[index]
//               //                                               .message
//               //                                           : '',
//               //                                       style: TextStyle(
//               //                                           color: Colors.white),
//               //                                     ),
//               //                                   ),
//               //                                 ],
//               //                               ),
//               //                             ),
//               //                           ),
//               //                         ],
//               //                       ),
//               //                     ),
//               //                     Container(
//               //                       padding:
//               //                           EdgeInsets.symmetric(horizontal: 10.0),
//               //                       child: Text(
//               //                         DateFormat('HH:mm:ss').format(
//               //                           DateTime.fromMillisecondsSinceEpoch(
//               //                               state is OpenchannelMessage
//               //                                   ? state
//               //                                       .messages[index].created_at
//               //                                   : 0),
//               //                         ),
//               //                         style: TextStyle(
//               //                           color: Colors.grey,
//               //                           fontSize: 12.0,
//               //                         ),
//               //                       ),
//               //                     )
//               //                   ]),
//               //       );
//               //     },
//               //   ),
//               // ),
//               const Divider(
//                 height: 4.0,
//                 color: Colors.black,
//               ),
//               Container(
//                   height: 50,
//                   padding: EdgeInsets.symmetric(vertical: 4),
//                   child: Row(
//                     children: [
//                       Container(
//                         child: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Stack(
//                           children: [
                            // TextField(
                            //   controller: _textEditingController,
                            //   onChanged: (value) {
                            //     if (value.isEmpty) {
                            //       setState(() {
                            //         notActive = true;
                            //       });
                            //     } else {
                            //       setState(() {
                            //         notActive = false;
                            //       });
                            //     }
                            //   },
                            //   style: TextStyle(color: Colors.white),
                            //   decoration: const InputDecoration(
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.white),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(50)),
                            //       ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.white),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(50)),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.white),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(50)),
                            //       ),
                            //       hintText: 'Enter a message',
                            //       hintStyle: TextStyle(
                            //           color:
                            //               Color.fromARGB(255, 100, 100, 100)),
                            //       contentPadding: EdgeInsets.symmetric(
                            //           vertical: 10.0, horizontal: 20.0)),
                            // ),
//                             Positioned(
//                                 top: -5,
//                                 bottom: 10,
//                                 right: 5,
//                                 child: IconButton(
//                                   onPressed: () {},
//                                   icon:
//                                       const Icon(Icons.arrow_circle_up_rounded),
//                                   iconSize: 35,
//                                   color: notActive
//                                       ? Color.fromARGB(255, 114, 114, 114)
//                                       : Colors.pink,
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//         ));
//   }
// }
