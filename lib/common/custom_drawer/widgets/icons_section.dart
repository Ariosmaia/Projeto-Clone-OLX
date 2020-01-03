import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/widgets/icon_tile.dart';

class IconsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {},
          highLighted: true,
        ),
        IconTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {},
          highLighted: false,
        ),
        IconTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {},
          highLighted: false,
        ),
        IconTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {},
          highLighted: false,
        ),
        IconTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {},
          highLighted: false,
        ),
      ],
    );
  }
}
