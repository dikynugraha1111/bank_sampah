import 'package:bank_sampah/common/endpoint/endpoint.dart';
import 'package:bank_sampah/constant/app_colors.dart';
import 'package:bank_sampah/constant/app_text.dart';
import 'package:bank_sampah/widget/button/default_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  final Endpoint endpoint = Endpoint.baseURLAdmin();
  Future<void>? _launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.whatsapp,
                size: 90,
                color: AppColors.greenSheen,
              ),
              const SizedBox(height: 38.0),
              Text(
                "Jika anda mengalami kendala pada aplikasi, silahkan hubungi kami dengan menekan tombol dibawah ini",
                textAlign: TextAlign.center,
                softWrap: true,
                style: AppText.text12.copyWith(
                  color: AppColors.outerSpace,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16.0),
              DefaultButton(
                isFullWidth: true,
                text: "Hubungi Admin",
                onPressed: () {
                  setState(() {
                    _launched = _launchInBrowser(endpoint.callAdmin());
                  });
                },
              ),
              FutureBuilder<void>(
                future: _launched,
                builder: _launchStatus,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.outerSpace,
              ),
            ),
          )
        ],
      ),
    );
  }
}
