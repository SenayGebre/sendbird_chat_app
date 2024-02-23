part of chat_screen;

class _AppBar extends AppBar {
  final String chatTitle;

  _AppBar(
    BuildContext context, {
    required this.chatTitle,
  }) : super(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: AppColors.othersWhite,
            onPressed: () {},
          ),
          title: Text(
            chatTitle,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppColors.othersWhite,
                  fontWeight: FontWeight.w300,
                ),
          ),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              color: AppColors.othersWhite,
              onPressed: () {},
            ),
          ],
        );
}
