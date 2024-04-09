String extraerId(String qrCodeData) =>
    qrCodeData.replaceAll(RegExp(r'[^0-9]'), '');
