# Semafor cu Buton pentru Pietoni pe FPGA

## Descriere

Acest proiect implementează un sistem de semafor cu buton pentru pietoni utilizând o placă de demonstrație Lattice. Semaforul controlează atât fluxul de vehicule, cât și traversarea pietonilor, respectând regulile definite pentru comutarea luminilor.

## Funcționare

### Semaforul pentru mașini
  - **Roșu:** 30 secunde
  - **Verde:** minim 60 secunde
  - **Galben:** 5 secunde
  
### Semaforul pentru pietoni
  - **Roșu** când semaforul pentru mașini este verde sau galben.
  - **Verde** când semaforul pentru mașini este roșu.

### Buton pietoni
  - Activ pe nivel logic `1`.
  - Ignorat dacă semaforul pietonilor este deja verde.
  - Apăsarea este memorată și are efect doar dacă semaforul pietonilor este roșu.
  - Când semaforul pentru pietoni este roșu, orice apăsare este reținută pentru următoarea comutare.
  - Semaforul mașinilor trece la galben doar după ce a fost verde cel puțin 60 secunde și a fost apăsat butonul pentru pietoni în această perioadă.

- **Frecvență ceas de intrare:** `1 Hz` (perioadă `1 sec.`).

## Platformă și Software Utilizat

- **Placă de dezvoltare:** `Lattice MachXO3LF`
- **Software de proiectare:** `Lattice Diamond`


## Etape de Implementare

1. **Proiectarea și simularea circuitului**
   - Definirea semnalelor și a logicei de comutare.
   - Implementarea codului în VHDL.
   - Testarea în simulator pentru validarea funcționalității.

2. **Implementare pe FPGA**
   - Crearea fișierului de constrângeri pentru maparea pinilor.
   - Generarea bitstream-ului și programarea plăcii.
   
3. **Testare fizică**
   - Verificarea funcționării corecte a semafoarelor și butonului pentru pietoni.
`

## Extra Fotografii

![pozasimulare](https://github.com/user-attachments/assets/89d5e3c4-8b39-44f3-be12-2f51b8945cf1)


## Licență

Pentru detalii despre licență, consultați fișierul `LICENSE` din acest director.

