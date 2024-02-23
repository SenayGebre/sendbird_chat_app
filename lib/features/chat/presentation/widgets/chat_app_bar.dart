part of chat_screen;

class _AppBar extends AppBar {
  _AppBar(BuildContext context)
      : super(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: AppColors.othersWhite,
            onPressed: () {},
          ),
          title: Text(""),
          centerTitle: false,
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
