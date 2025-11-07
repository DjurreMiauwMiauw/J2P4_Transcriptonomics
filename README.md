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
- `images/` - gebruikte afbeeldingen in deze github.
- `Data_raw/` - ruwe data van Controle groepen en patiënt groepen.
- `scripts/` - R scripts die gebruikt zijn in dit onderzoek
- `Hs_referentie` - Referentie genoom die gebruikt is dit project.
- `README.md` - Klik hier om de github pagina in volledige vorm te lezen.

# Inleiding

Reumatoïde artritis (RA) is een auto-immuunziekte die gepaard gaat met een chronisch ontstekingsproces dat zowel de gewrichten als organen buiten de gewrichten kan aantasten, zoals het hart, de longen en het zenuwstelsel. Er bestaan verschillende vormen van artritis, die kunnen worden onderverdeeld in niet-ontstekingsgebonden artritis, zoals artrose, en ontstekingsgebonden artritis. Deze ontstekingen kunnen ontstaan door kristalafzetting, bacteriële of virale infecties of door auto-immuunprocessen. Ongeveer 0,3–1% van de wereldbevolking lijdt aan deze ziekte, waarbij vrouwen vaker getroffen worden dan mannen (Radu & Bungau, 2021; Platzer et al., 2019).

De oorzaak van RA is nog niet volledig bekend. Waarschijnlijk is het geen gevolg van één enkele factor, maar van een combinatie van genetische variaties, veranderingen in genexpressie, auto-immuniteit en omgevingsinvloeden. Hierdoor is er nog geen behandeling die de ziekte volledig kan genezen (Platzer et al., 2019).

In dit onderzoek zijn vier monsters van patiënten met een RA-diagnose van meer dan twaalf maanden en vier controles onderzocht. De monsters zijn afkomstig van gewrichtsslijmvlies. Met behulp van RStudio is een transcriptomics-analyse uitgevoerd om te bepalen welke genen meer of minder tot expressie komen. Daarnaast is onderzocht welke biologische pathways hierbij betrokken zijn met behulp van een Gene Ontology-analyse.

Het doel van dit onderzoek is om inzicht te krijgen in de genen en pathways die betrokken zijn bij reumatoïde artritis en zo bij te dragen aan een beter begrip van de moleculaire processen achter deze ziekte.

# methoden
Voor dit onderzoek naar reumatoïde artritis (RA) werd RNA-sequencing data van synoviumbiopten geanalyseerd van vier gezonde controles en vier RA-patiënten met meer dan 12 maanden diagnose De controlegroep was ACPA-negatief en de RA-groep ACPA-positief. De ruwe sequencingbestanden (FASTQ) werden uitgelijnd op het humane referentiegenoom (GRCh38) met behulp van de align-functie uit het Rsubread-pakket, na het aanmaken van een index. Hierna werden de resulterende BAM-bestanden gesorteerd en geïndexeerd met Rsamtools.

De genexpressie werd gekwantificeerd met featureCounts op basis van een GTF-annotatiebestand. De differentiële genexpressieanalyse werd uitgevoerd in DESeq2, waarbij een model werd gebruikt op basis van de behandelconditie (RA vs. controle). Significante genen werden geselecteerd bij een aangepaste p-waarde < 0.05 en een |log2FoldChange| > 1.

Vervolgens werd een Gene Ontology-analyse uitgevoerd met clusterProfiler om betrokken biologische processen te identificeren, apart voor verhoogde en verlaagde genen. Resultaten werden visueel weergegeven via ggplot2 en een EnhancedVolcano-plot. Tot slot werd pathway-analyse verricht met behulp van het pathview-pakket op geselecteerde KEGG-pathways.

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



# Kennis van beheersystemen
Voor dit project is GitHub gebruikt om de bestanden op één plek te bewaren en het project overzichtelijk te houden. Op de GitHub-pagina staan de data, scripts en resultaten zodat alles makkelijk terug te vinden is. Het systeem werkt met iets dat branches heet, wat bedoeld is om verschillende versies van bestanden apart te kunnen houden. Op deze manier kon het werk worden bijgehouden tijdens de analyse, zonder dat bestanden verloren gingen.


# Inrichting van het beheersysteem
De GitHub-repository is ingedeeld in verschillende mappen om structuur aan te brengen in het project. Er zijn aparte mappen gemaakt voor de ruwe data, de scripts en de resultaten van de analyse. In het README-bestand staat beschreven wat er in de repository te vinden is en hoe de bestanden gebruikt kunnen worden. De indeling zorgt ervoor dat het project overzichtelijk blijft, dat duidelijk is waar elk onderdeel zich bevindt en dat het te reproduceren is door derden.


# Communicatie over het beheersysteem
Github is gebruikt in dit onderzoek om alle bestanden centraal op te slaan en de bestanden makkelijk bereikbaar te maken. Ook is het gebruikt om het project duidelijk te documenteren en duidelijk te maken welke stappen ondernomen zijn. De beschrijving van alle stappen die gedaan zijn zorgen ervoor dat andere onderzoekers het onderzoek zouden kunnen begrijpen en te herhalen. In de repository zijn de ruwe data, R-scripts, resultaten en figuren samengebracht op één plek om alles terug te vinden.

