Jasně, tady je aktualizovaný popis pro soubor README s ohledem na nové názvy souborů a nastavení ntfy na konci volání CURL:

---

# Linux Server Monitoring Scripts

Tento repozitář obsahuje scripty určené k monitoringu různých aspektů Linux serverů a posílání notifikací na službu [ntfy](https://ntfy.sh/). Každý script lze snadno upravit podle konkrétních potřeb, například nastavit odkazy na ntfy a upravit hranice pro spouštění notifikací.

## Obsah

1. **Certifikáty**
   - `LECheck.sh`: Script pro monitoring expirace Let's Encrypt certifikátů. Upozorní vás, když se blíží doba expirace certifikátu.
   
2. **Paměť**
   - `ram.sh`: Script pro monitoring využití RAM. Pošle notifikaci, pokud využití paměti překročí nastavenou hranici.
   
3. **Disk**
   - `disk.sh`: Script pro monitoring využití disku. Upozorní vás, když využití disku překročí definovanou hranici.
   
4. **CPU**
   - `cpu.sh`: Script pro monitoring využití CPU. Pošle upozornění, pokud využití procesoru přesáhne nastavenou hranici.
   
5. **Aplikace**
   - `app.sh`: Script pro monitoring běhu specifických aplikací. Informuje vás, když se daná aplikace zastaví nebo není spuštěna.

## Nastavení

Před použitím těchto scriptů je třeba provést několik úprav:

1. **Nastavení odkazu na ntfy**

   Ve všech scriptech je potřeba nastavit URL pro posílání notifikací na ntfy. Toto URL se nastavuje na konci volání CURL v každém scriptu.

   ```bash
   curl -d "Notification message" https://ntfy.sh/your_topic
   ```

2. **Úprava hraničních hodnot**

   V některých scriptech je možné (a doporučené) upravit hraniční hodnoty, při kterých se mají notifikace posílat. Tyto hodnoty jsou nastaveny pomocí proměnných, například:

   ```bash
   RAM_THRESHOLD=80   # Procento využití RAM
   DISK_THRESHOLD=90  # Procento využití disku
   CPU_THRESHOLD=75   # Procento využití CPU
   CERT_EXPIRY_DAYS=30 # Počet dnů do expirace certifikátu
   ```

## Použití

1. **Nastavení scriptů jako spustitelných**

   Ujistěte se, že scripty mají nastavený příznak spustitelnosti:

   ```bash
   chmod +x LECheck.sh
   chmod +x ram.sh
   chmod +x disk.sh
   chmod +x cpu.sh
   chmod +x app.sh
   ```

2. **Spuštění scriptů**

   Scripty lze spouštět manuálně nebo pomocí cron úloh pro automatický monitoring v pravidelných intervalech.

   ```bash
   ./LECheck.sh
   ./ram.sh
   ./disk.sh
   ./cpu.sh
   ./app.sh
   ```

3. **Nastavení cron úloh**

   Pro automatizaci spuštění můžete přidat scripty do crontabu:

   ```bash
   crontab -e
   ```

   A přidat následující řádky dle potřeby:

   ```bash
   # Kontrola expirace certifikátů každý den v 2:00
   0 2 * * * /path/to/LECheck.sh

   # Kontrola využití RAM každou hodinu
   0 * * * * /path/to/ram.sh

   # Kontrola využití disku každou hodinu
   0 * * * * /path/to/disk.sh

   # Kontrola využití CPU každých 15 minut
   */15 * * * * /path/to/cpu.sh

   # Kontrola běhu aplikací každých 5 minut
   */5 * * * * /path/to/app.sh
   ```

## Příspěvky

Pokud máte nějaké nápady na vylepšení nebo jste našli chybu, neváhejte přispět prostřednictvím pull requestů nebo otevřením issue v tomto repozitáři.

## Licence

Tento projekt je licencován pod MIT licencí. Podrobnosti naleznete v souboru LICENSE.

---

Tento popis by měl poskytnout uživatelům veškeré potřebné informace pro použití vašich monitoring scriptů.
