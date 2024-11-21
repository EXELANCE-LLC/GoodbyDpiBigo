# GoodbyeDPIBigo

GoodbyeDPIBigo, DPI (Deep Packet Inspection) engellemelerini aşmak için geliştirilmiş bir Windows uygulamasıdır. Bu program, internet servis sağlayıcılarının uyguladığı DPI tabanlı engelleme ve sansür yöntemlerini atlatmanıza yardımcı olur.

## Özellikler

- DPI tabanlı engelleri aşma
- DNS üzerinden tünel desteği
- IPv4 ve IPv6 desteği
- Blacklist/Whitelist desteği
- Windows servisi olarak çalışabilme
- Düşük sistem kaynağı kullanımı

## Gereksinimler

- Windows 7/8/10/11 (32-bit veya 64-bit)
- WinDivert sürücüsü (program ile birlikte gelir)
- Administrator (yönetici) hakları

## Kurulum

1. En son sürümü [releases](https://github.com/EXELANCE-LLC/GoodbyDpiBigo/releases) sayfasından indirin
2. Arşivi istediğiniz bir konuma çıkartın
3. Komut istemini (cmd.exe) yönetici olarak çalıştırın
4. Program dizinine gidin ve programı çalıştırın
5. install_service.bat dosyasını yönetici olarak çalıştırın. Artık arkaplanda ve windows her açılışta otomatik çalışacaktır.

## Kullanım

Basit kullanım:
```cmd
goodbyedpibigo.exe
```

Gelişmiş kullanım: (Buna gerek yok artık! Normal şekilde açtığınızda dahi en iyi şekilde çalışacaktır.)
```cmd
goodbyedpibigo.exe -5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff::1253
```

### Parametreler

- `-1`: Tüm DPI bypass yöntemlerini etkinleştirir
- `--dns-addr`: Özel DNS sunucusu adresi
- `--dns-port`: DNS sunucusu port numarası
- `--dnsv6-addr`: IPv6 DNS sunucusu adresi
- `--blacklist`: Blacklist dosyası yolu
- `--whitelist`: Whitelist dosyası yolu

## Derleme

MinGW-w64 ile derleme:

```bash
mingw32-make clean
mingw32-make
```

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## Güvenlik

Bu program, sistem seviyesinde çalıştığı için yönetici hakları gerektirir. Güvenilir kaynaklardan indirdiğinizden emin olun.

## Katkıda Bulunma

1. Bu depoyu fork edin
2. Feature branch'i oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## Referanslar

Bu proje [ValdikSS/GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI) projesinden esinlenilerek geliştirilmiştir.
