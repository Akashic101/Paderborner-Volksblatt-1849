![cover of Paderborner Volksblatt](https://github.com/Akashic101/Paderborner-Volksblatt-1849/blob/master/assets/Paderborner_Volksblatt_cover.png)

---
![GitHub last commit](https://img.shields.io/github/last-commit/Akashic101/Paderborner-Volksblatt-1849?style=for-the-badge) ![GitHub repo size](https://img.shields.io/github/repo-size/Akashic101/Paderborner-Volksblatt-1849?style=for-the-badge) ![GitHub issues](https://img.shields.io/github/issues/Akashic101/Paderborner-Volksblatt-1849?color=dfdf00&style=for-the-badge)

This repository is a work-in-progress project which includes a scan of every page of the "Paderborner Volksblatt" newspaper from 1849. The pages are from a [facsimile](https://www.wikiwand.com/en/Facsimile) printed in 1979 by the Junfermannsche publisher in Paderborn. You can also find a text-file of every page where the text was extracted using [Tesseract OCR](https://github.com/tesseract-ocr/tesseract). The model used was provided by the [Mannheim University Library](https://github.com/UB-Mannheim/Reichsanzeiger) who used OCR to scan in newspaper-editions of the [Reichsanzeiger](https://digi.bib.uni-mannheim.de/periodika/reichsanzeiger/), a trained model based on theirs to fix small issues in recognizing certain characters is currently in the works.

Special thanks to the municipal library of Aachen which provided the book-scanner to start this project and Stefan Weil of the Mannheim University Library who helped me finding the right Tesseract-model to use. This project could not have been done without those named.

## Progress

Scanned: 365/365 ✔️  
Cropped: 90/365  
Sorted: 62/365  
OCR: 31/365  
Reviewed: 17/365  

## Notes

Currently missing page: First page of 11.1.1849

## Navigate this repository 

### Scans

If you are looking for raw scans in PDF-format navigate to the [input-folder](https://github.com/Akashic101/Paderborner-Volksblatt-1849/tree/master/input/). There you will find a folder for each month which in turn includes a folder with the raw unedited files and a folder with cropped scans.

```
├──
├── input                    
│   ├── month
│   |    ├── edited
│   |         └── page_*.pdf        # Cropped PDF's with border around the pages removed
│   |    └── raw
│   |         └── page_*.pdf        # Raw unedited scans with border
└──
```

### OCR

If you are looking for the OCR-results head to the [OCR-folder](https://github.com/Akashic101/Paderborner-Volksblatt-1849/tree/master/OCR/) where you will find a folder for every month done so far. In each you will find a folder containing every PDF converted to a PNG and the associated text-file. This text has not yet been reviewed and contains errors. Reviewed files can be found in the [done-folder](https://github.com/Akashic101/Paderborner-Volksblatt-1849/tree/master/January/done) sorted by dates.

```
├──
├── OCR                    
│   ├── month
│   |    ├── done
│   |    |     └── page_*.pdf
│   |    |            └── date
│   |    |                  ├── page_*.png        # Converted edited PDF's used for OCR-recognition
│   |    |                  └── page_*.txt        # Reviewed text-files
│   |    └── png_and_text
│   |         ├── page_*.png                      # Converted edited PDF's used for OCR-recognition
│   |         └── page_*.txt                      # Unedited text-files with mistakes
└──
```

### Scripts

I use multiple small scripts and commands to aid the process. These can be found in the [scripts-folder](https://github.com/Akashic101/Paderborner-Volksblatt-1849/tree/master/scripts). Following is an explanation what each file does:

`command.sh`

The main command to convert images to text. Change `path\to\images\*.png` to the path corresponding to location of your images. This script will generate the output in a txt-file with the same name as the PNG in the same location as the image. The ´-l frak_de` flag describes the language Tesseract uses to identify characters. This model is not included in Tesseract by default and was instead provided by the Mannheim University Library and can be found [here](https://ub-backup.bib.uni-mannheim.de/~stweil/tesstrain/frak2021/tessdata_best/) (frak2021_1.069 was used for the Paderborner newspaper).

`fix_s.ps1`

This script is used to fix a very common issue of the above model where it writes `ſ` instead of `s`. While this is factual correct since this letter is the predecessor of the German ß (more about this letter can be read [here](https://www.wikiwand.com/en/Long%20s), it makes the text-files harder to read which is why I chose to replace them. This script goes through each text-file and replaces the character. To run it place it in the folder with the text-files you want to modify and run it.
