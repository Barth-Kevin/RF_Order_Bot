# Bestellbot für Shopware 6 Schnellbestellformular

Dieses Projekt automatisiert die Befüllung des Schnellbestellformulars im Warenkorb eines Shopware 6 Backends mithilfe von [Robocorp RPA](https://robocorp.com/docs/) und Playwright.

## Funktionsweise

Das Skript liest Bestelldaten (Artikelnummer und Anzahl) aus einer CSV-Datei und trägt diese automatisch in das Schnellbestellformular des Shops ein. Anschließend wird die Bestellung abgeschickt und ein Screenshot erstellt.

## Voraussetzungen

- Python 3.x
- [Robocorp RPA Framework](https://robocorp.com/docs/)
- Playwright-Browser-Unterstützung
- Zugangsdaten/Secrets in `.secret.robot`
- Eine CSV-Datei mit Bestelldaten (siehe unten)

## Verwendete Bibliotheken

- `RPA.Browser.Playwright`
- `RPA.HTTP`
- `RPA.Tables`
- `Collections`

## Aufbau der CSV-Datei

Die CSV-Datei (`/input/quickorder.csv`) muss mindestens folgende Spalten enthalten:

| Artikelnummer | Anzahl |
| ------------- | ------ |
| 123456        | 2      |
| 654321        | 1      |

## Ausführung

1. Stelle sicher, dass die CSV-Datei im Verzeichnis `/input/quickorder.csv` liegt.
2. Passe ggf. die Variablen im Skript an (z.B. URL, Browser-Typ).
3. Starte das Skript mit Robocorp oder dem Robot Framework:

   ```bash
   robocorp run .
   # oder
   robot tasks.robot
   ```
