part of '../home.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
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
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/icon.svg', width: 17.42),
        const SizedBox(width: 8),
        const BranchName(),
      ],
    );
  }
}

class BranchName extends StatelessWidget {
  const BranchName({super.key});

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
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(FeatherIcons.mail),
      color: const Color(0xFF225CAB),
    );
  }
}
