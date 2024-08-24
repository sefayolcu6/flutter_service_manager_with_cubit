enum StatusCodeEnum {
  success(200, "Başarılı: Veri başarıyla alındı!"),
  badRequest(400, "Geçersiz İstek: İstek geçersiz!"),
  unauthorized(401, "Yetkisiz: Kimlik doğrulama gerekli!"),
  notFound(404, "Bulunamadı: Kaynak bulunamadı!"),
  unknownError(500, "Sunucu Hatası: Sunucuda bir sorun var!");

  final int statusCode;
  final String statusCodeMessage;

  const StatusCodeEnum(this.statusCode, this.statusCodeMessage);
}
