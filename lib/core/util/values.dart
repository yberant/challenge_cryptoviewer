String baseURL = "https://rest.coinapi.io/v1";
String getCoinsPath = "assets";
Function coinHistoryPath =
    (String assetId) => "exchangerate/$assetId/USD/history";
Function coinIconPath = (String iconId) =>
    "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_512/$iconId.png";
