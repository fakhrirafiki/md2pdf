# md2pdf

**md2pdf** adalah aplikasi CLI sederhana untuk mengonversi file Markdown (`.md`) menjadi PDF dan (opsional) LaTeX (`.tex`) menggunakan Pandoc dan XeLaTeX dengan dukungan tema dan ukuran kertas dinamis.

---

## Fitur Utama

- Konversi Markdown ke PDF dan LaTeX dengan satu perintah
- Pilihan tema/custom template LaTeX
- Pilihan interaktif ukuran kertas (smartphone, A5, B5) beserta margin (top, bottom, left, right)
- Parsing quotes dan gambar Markdown khusus untuk format PDF yang rapi
- Mendukung ekspor ke LaTeX (`.tex`) dengan opsi `--latex`
- Otomatis menempatkan hasil output di folder `result` yang berada satu direktori dengan file `.md`
- Menggunakan XeLaTeX sebagai PDF engine untuk dukungan font dan layout kompleks

---

## Prasyarat

- [Pandoc](https://pandoc.org/installing.html) versi terbaru
- [TeX Live](https://www.tug.org/texlive/) dengan XeLaTeX terinstall dan dapat diakses dari terminal
- [dialog](https://invisible-island.net/dialog/) (untuk menu interaktif di terminal)
- Bash shell (Linux, macOS)

---

## Instalasi

1. Clone repository ini

```bash
git clone https://github.com/username/md2pdf.git
cd md2pdf
```

2. Install dependensi (macOS contoh):
```
brew install pandoc dialog
sudo tlmgr install xetex fontspec

```
3. Deploy script ke /usr/local/bin agar dapat dipanggil dari mana saja:
```
sudo ./deploy.sh
```

---


## Cara Penggunaan
Jalankan perintah berikut di terminal:
```
md2pdf [file.md] [--theme THEME_NAME] [--latex]
```
Contoh:
```
md2pdf dokumen.md --theme minimalist-template --latex
```

---

## Fitur Interaktif
Saat dijalankan, aplikasi akan menampilkan menu interaktif untuk memilih ukuran kertas dan margin, contoh:

```less
Pilih ukuran kertas:
[•] Smartphone 90×200mm [2/2/0.5/0.5 cm]
[ ] A5         145×210mm [2/2/2.5/2.2 cm]
[ ] B5         176×250mm [2/2/2.5/2.2 cm]
```

---

## Struktur Folder
- md2pdf : Script utama
- deploy.sh : Script deploy
- themes/ : Folder tema dengan template LaTeX dan filter Lua
- build/ : Folder temporary untuk file intermediate
- result/ : Folder hasil output PDF dan TEX akan dibuat di folder yang sama dengan file .md

---

## Kontribusi
Terima kasih jika ingin berkontribusi! Silakan fork dan buat pull request.

## Lisensi
MIT License © 2025 Fakhri Rafiki

















