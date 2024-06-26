part of '../data_master.dart';

class Greetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Logo(),
          NotificationButton(),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/icon.svg', width: 17.42),
        const SizedBox(width: 8),
        BranchName(),
      ],
    );
  }
}

class BranchName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'BKC ',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Color(0xFF171047),
            ),
          ),
          TextSpan(
            text: 'SUPER BRANCH',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w800,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Color(0xFF225CAB),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(FeatherIcons.mail),
      color: const Color(0xFF225CAB),
    );
  }
}
