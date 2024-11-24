import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myprofile/splash_screen.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      // animasi splash screen
      home: const SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.indigo.shade400,
              centerTitle: true,
              // google fonts
              title: Text(
                '',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text(
                      'Ardiansyah Rukua',
                      style: TextStyle(color: Colors.white),
                    ),
                    accountEmail: const Text('ardiansyahrukua07@gmail.com',
                        style: TextStyle(color: Colors.white)),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          fit: BoxFit.cover,
                          'assets/logo.jpg',
                          width: 90,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.cyan,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/kyoto.jpg")
                        )
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    // font awesome icon
                    leading: const Icon(FontAwesomeIcons.github),
                    title: const Text('Github'),
                    onTap: () async {
                      final Uri url =
                      Uri.parse('https://github.com/Rettorio');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  ListTile(
                    // font awesome icon
                    leading: const Icon(FontAwesomeIcons.facebook),
                    title: const Text('Facebook'),
                    onTap: () async {
                      final Uri url =
                      Uri.parse('https://www.facebook.com/profile.php?id=100046413733640');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content:
                            const Text('Apakah anda yakin ingin keluar?'),
                            actions: [
                              TextButton(
                                  child: const Text('Batal'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              TextButton(
                                  child: const Text(
                                    'Keluar',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  }),
                            ]),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  // animated logo
                  const AnimatedLogo(),
                  const SizedBox(
                    height: 25,
                  ),
                  // google fonts
                  Text(
                    'ARDIANSYAH PUTRAMAN RUKUA',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Self taught developer :3",
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Language",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListView(
                            children: const [
                              TechStackItem(stackExpertise: "Advanced", stackImage: "assets/techstacks/js.png", stackName: "Javascript"),
                              TechStackItem(stackExpertise: "Advanced", stackImage: "assets/techstacks/php.png", stackName: "PHP"),
                              TechStackItem(stackExpertise: "Intermediate", stackImage: "assets/techstacks/kotlin.png", stackName: "Kotlin"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Backend",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListView(
                            children: const [
                              TechStackItem(stackExpertise: "Advanced", stackImage: "assets/techstacks/laravel.png", stackName: "Laravel"),
                              TechStackItem(stackExpertise: "Intermediate", stackImage: "assets/techstacks/spring.png", stackName: "Spring Boot"),
                              TechStackItem(stackExpertise: "Intermediate", stackImage: "assets/techstacks/supabase.png", stackName: "Supabase"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Frontend",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            )),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 380,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ListView(
                            children: const [
                              TechStackItem(stackExpertise: "Advanced", stackImage: "assets/techstacks/bootstrap.png", stackName: "Bootstrap"),
                              TechStackItem(stackExpertise: "Beginer", stackImage: "assets/techstacks/sass.png", stackName: "Sass style sheet"),
                              TechStackItem(stackExpertise: "Intermediete", stackImage: "assets/techstacks/tailwindcss.png", stackName: "Tailwind CSS"),
                              TechStackItem(stackExpertise: "Intermediete", stackImage: "assets/techstacks/sveltejs.png", stackName: "Svelte"),
                              TechStackItem(stackExpertise: "Intermediete", stackImage: "assets/techstacks/jquery.png", stackName: "Jquery"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
        );
      }),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isZoomed = !isZoomed;
            });
          },
          child: AnimatedScale(
            scale: isZoomed ? 1.3 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
                // Menambahkan border tipis agar terlihat lebih bagus
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
                child: Image.asset(
                  fit: BoxFit.cover,
                  'assets/logo.jpg',
                  width: 150,
                  height: 150, // Menambahkan height agar gambar tetap persegi
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class TechStackItem extends StatefulWidget {
  const TechStackItem({
    super.key,
    required this.stackExpertise,
    required this.stackImage,
    required this.stackName
  });

  final String stackImage;
  final String stackName;
  final String stackExpertise;

  @override
  State<StatefulWidget> createState() => _TechStackItemState();
}

class _TechStackItemState extends State<TechStackItem> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade50,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(color: Colors.indigo.shade50, shape: BoxShape.circle),
          ),
          Image.asset(
            widget.stackImage, // Your image asset
            width: 32, // Size of the image
            height: 32,
            fit: BoxFit.scaleDown, // Ensure the image fits within the circle
          ),
        ],
      ),
      title: Text(widget.stackName),
      subtitle: Text(
        widget.stackExpertise,
        style: GoogleFonts.poppins(
            fontSize: 12
        ),
      ),
    );
  }
}
