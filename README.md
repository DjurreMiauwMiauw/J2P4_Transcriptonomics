<h1 align="center">Analyse van genexpressie en betrokken pathways in synoviumweefsel van RA-patiënten</h1>

<p align="center">
  <strong>Auteur:</strong> Djurre Scharringa<br>
  <strong>Datum:</strong> 08 November 2025<br>
</p>

<hr>


<p align="center">
  <img src="images/Transcriptonomics_startpagina.jpg" alt="Transcriptomics_startpagina" width="600"/>
</p>

# Inhoud
- `plaatjes/` - gebruikte afbeeldingen in deze github.
- `Data_raw/` - ruwe data van Controle groepen en patiënt groepen.
- `scripts/` - R scripts die gebruikt zijn in dit onderzoek
- `Hs_referentie` - Referentie genoom die gebruikt is dit project.
- `README.md` - Klik hier om de github pagina in volledige vorm te lezen.

# Inleiding

In dit project is er gekeken naar Reumatoïde Artritis (RA). Dat is een systemische auto-immuunziekte waarvan de oorzaak nog niet bekend is. Wetenschappers denken dat de oorzaak een combinatie lijkt te zijn van genetische aanlag, omgevingsfactoren en een ontspoord immuunsysteem. RA komt voor bij 0.3-1% in de wereldwijde bevolking. Vrouwen zijn 2-3x gevoeliger dan mannen voor het verkrijgen van de ziekte. Er wordt veel onderzoek gedaan naar specifieke genexpressie in patiënten voor de genezing van RA. 

In dit onderzoek zijn 4 samples van personen zonder RA en 4 personen met een RA diagnose van meer dan 12 maanden. Hierbij zijn samples genomen van gewrichtsslijmvlies. Met behulp van R wordt een transcriptonomics analyse uitgevoerd. Hierbij wordt gekeken welke genen meer of minder tot expressie komen. Ook wordt gekeken naar welke pathways betrokken zijn bij de ziekte met behulp van een Gene Ontology analyse.

# methoden
Voor dit onderzoek naar reumatoïde artritis (RA) werd RNA-sequencing data van synoviumbiopten geanalyseerd van vier gezonde controles en vier RA-patiënten met meer dan 12 maanden diagnose De controlegroep was ACPA-negatief en de RA-groep ACPA-positief. De ruwe sequencingbestanden (FASTQ) werden uitgelijnd op het humane referentiegenoom (GRCh38) met behulp van de align-functie uit het Rsubread-pakket, na het aanmaken van een index. Hierna werden de resulterende BAM-bestanden gesorteerd en geïndexeerd met Rsamtools.

De genexpressie werd gekwantificeerd met featureCounts op basis van een GTF-annotatiebestand. De differentiële genexpressieanalyse werd uitgevoerd in DESeq2, waarbij een model werd gebruikt op basis van de behandelconditie (RA vs. controle). Significante genen werden geselecteerd bij een aangepaste p-waarde < 0.05 en een |log2FoldChange| > 1.

Vervolgens werd een Gene Ontology-analyse uitgevoerd met clusterProfiler om betrokken biologische processen te identificeren, apart voor verhoogde en verlaagde genen. Resultaten werden visueel weergegeven via ggplot2 en een EnhancedVolcano-plot. Tot slot werd pathway-analyse verricht met behulp van het pathview-pakket op geselecteerde KEGG-pathways.

# resultaten
# resultaten
Om de verschillen in genexpressie tussen RA-patiënten en gezonde controles in kaart te brengen, werd een differentiële expressieanalyse uitgevoerd. In de volcano plot [(Figuur 1)](images/VolcanoplotWC) In dit figuur valt te zien dat er meer rode significante stippen verder naar rechts uitwijken dan verder links. 

<p align="center">
  <a href="./images/VolcanoplotWC.png" target="_blank">
    <img src="./images/VolcanoplotWC.png" width="450" alt="Volcano plot">
  </a>
</p>

Vervolgens werd een GO-verrijkingsanalyse uitgevoerd. In [Figuur 2](images/Top25hoog) zijn de 25 meest verrijkte biologische processen die vaker voorkomen in patiënten van RA. Deze verhoogde expressies hebben allemaal dichtbij een -log10(p.adjust) van 10 of erboven. 

<p align="center">
  <a href="./images/top25hoog.png" target="_blank">
    <img src="./images/top25hoog.png" width="450" alt="Top 25 verhoogde GO-termen">
  </a>
</p>

[Figuur 3](images/Top25_laag) toont de top 25 GO-termen voor genen met verlaagde expressie. Hierbij zitten de meeste van de verlaagde expressies rond een -log10(p.adjust) van 3 of erboven.

<p align="center">
  <a href="./images/top25_laag.png" target="_blank">
    <img src="./images/top25_laag.png" width="450" alt="Top 25 verlaagde GO-termen">
  </a>
</p>

Tot slot werd een KEGG-pathwayanalyse uitgevoerd [(Figuur 4)](images/hsa05323.pathview). Hierin zijn verschillende betrokken genen binnen het hsa05323 – Rheumatoid arthritis pathway aangeduid met kleur op basis van hun expressieniveau. Zowel genen met verhoogde als verlaagde expressie zijn zichtbaar binnen het pathway.

<p align="center">
  <a href="./images/hsa05323.pathview.png" target="_blank">
    <img src="./images/hsa05323.pathview.png" width="550" alt="Pathview KEGG hsa05323">
  </a>
</p>


# Gebruik van GitHub voor data- en scriptbeheer

## 🧭 Context van het beheersysteem
GitHub is in dit project gebruikt als versiebeheersysteem om de volledige workflow van de transcriptomics-analyse inzichtelijk te maken. De repository bevat alle relevante bestanden — van ruwe data en scripts tot resultaten en figuren — waardoor elke stap in het onderzoeksproces traceerbaar blijft. Door het gebruik van branches en commits konden wijzigingen in R-scripts gecontroleerd worden doorgevoerd zonder verlies van eerdere versies.


## 🧩 Inrichting van het beheersysteem
De GitHub-repository is gestructureerd volgens richtlijnen voor reproduceerbaar onderzoek. De mapstructuur is overzichtelijk ingericht met afzonderlijke mappen voor ruwe data (`Data_raw`), scripts (`scripts`), referentiegegevens (`Hs_referentie`), en resultaten (`images`).  
Daarnaast bevat het README-bestand een duidelijke beschrijving van de workflow, gebruikte softwarepakketten (zoals *DESeq2*, *clusterProfiler* en *pathview*), en verwijzingen naar de bijbehorende analyses. Dit zorgt ervoor dat de volledige data-analyse eenvoudig te reproduceren is door derden.


## 💬 Communicatie over het beheersysteem
Via GitHub is niet alleen de onderzoeksstructuur gedocumenteerd, maar wordt ook transparant gecommuniceerd over de uitgevoerde analyses. Door middel van commits, beschrijvende commit-berichten en het README-bestand wordt helder weergegeven welke stappen zijn uitgevoerd en waarom.  
Hierdoor kunnen medestudenten of onderzoekers de analyse volgen, controleren en hergebruiken — wat bijdraagt aan de openheid en betrouwbaarheid van het bio-informaticaonderzoek.

