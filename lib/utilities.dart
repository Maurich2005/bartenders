import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // If canceled, return null
    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    // Handle error, could log the error or display a message to the user
    print(e.message);
    return null;
  }
}


class DividerWithText extends StatelessWidget {
  final String text;

  const DividerWithText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
          color: Colors.black, // Background color of the divider
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class SignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SignInButton(
          assetName: 'assets/apple_logo.svg',
          text: 'Continue with Apple',
          color: Colors.black,
          textColor: Colors.white,
          onPressed: () {
            // Implement your Firebase Authentication logic for Apple sign-in here
          },
        ),
        SizedBox(height: 8), // Spacing between buttons
        SignInButton(
          assetName: 'assets/google_logo.svg',
          text: 'Continue with Google',
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () async {
            UserCredential? userCredential = await signInWithGoogle();
              if (userCredential != null && userCredential.user != null ) {
                userCredential.user?.email;
                // The user is signed in
                // Navigate to your app's home screen or another appropriate screen
              }
          },
        ),
        SizedBox(height: 12),
        DividerWithText( text:'Or' ),
        SizedBox(height: 12),
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  final String assetName;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const SignInButton({
    Key? key,
    required this.assetName,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(
        assetName,
        height: 24, // Logo size
        width: 24,
      ),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: textColor,
        minimumSize: Size(double.infinity, 50), // Button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: Colors.grey, width: 1), // Rounded corners
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class FileUploadBox extends StatefulWidget {
  @override
  _FileUploadBoxState createState() => _FileUploadBoxState();
}

class _FileUploadBoxState extends State<FileUploadBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10), // Provide some spacing
        DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.grey.shade700,
          radius: Radius.circular(12),
          dashPattern: [8, 4],
          strokeWidth: 2,
          child: Container(
            width: double.infinity,
            height: 60,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();

                  if (result != null) {
                    PlatformFile file = result.files.first;

                    // Use the file
                  } else {
                    // User canceled the picker
                  }
                },
                icon: Icon(Icons.upload_file),
                label: Text('Drag & drop or Browse'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set the button background to transparent
                  onPrimary: Colors.white,
                  shadowColor: Colors.transparent,
                  onSurface: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
