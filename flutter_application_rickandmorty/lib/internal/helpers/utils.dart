import '../../../../internal/helpers/color_helper.dart';

getStatusColor(String status) {
  switch (status) {
    case 'Alive':
      return ColorHelper.cardStatusColorGreen;

    case 'Dead':
      return ColorHelper.cardStatusColorRed;

    default:
      return ColorHelper.cardNameColor;
  }
}
