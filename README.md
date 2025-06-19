<p align =”center”>
<img src = “plaatjes/Transcriptonomics_startpagina” alt = "ik kan tenminste de tekst veranderen, maar daar houdt het ook wel op"
width = “600”/>
</p>

# Inhoud


# Inleiding J2P4 Transcriptonomics project, welkom bij Djurre's github pagina.

In dit project is er gekeken naar Reumatoïde Artritis (RA). Dat is een systemische auto-immuunziekte waarvan de oorzaak nog niet bekend is. Wetenschappers denken dat de oorzaak een combinatie lijkt te zijn van genetische aanlag, omgevingsfactoren en een ontspoord immuunsysteem. RA komt voor bij 0.3-1% in de wereldwijde bevolking. Vrouwen zijn 2-3x gevoeliger dan mannen voor het verkrijgen van de ziekte. Er wordt veel onderzoek gedaan naar specifieke genexpressie in patiënten voor de genezing van RA. 

In dit onderzoek zijn 4 samples van personen zonder RA en 4 personen met een RA diagnose van meer dan 12 maanden. Hierbij zijn samples genomen van gewrichtsslijmvlies. Met behulp van R wordt een transcriptonomics analyse uitgevoerd. Hierbij wordt gekeken welke genen meer of minder tot expressie komen. Ook wordt gekeken naar welke pathways betrokken zijn bij de ziekte met behulp van een Gene Ontology analyse.

# methoden
Voor dit onderzoek naar reumatoïde artritis (RA) werd RNA-sequencing data van synoviumbiopten geanalyseerd van vier gezonde controles en vier RA-patiënten (ACPA-positief, diagnose >12 maanden), gebaseerd op Platzer et al. (2019). De ruwe sequencingbestanden (FASTQ) werden uitgelijnd op het humane referentiegenoom (GRCh38) met behulp van de align-functie uit het Rsubread-pakket, na het aanmaken van een index. Hierna werden de resulterende BAM-bestanden gesorteerd en geïndexeerd met Rsamtools.

De genexpressie werd gekwantificeerd met featureCounts op basis van een GTF-annotatiebestand. De differentiële genexpressieanalyse werd uitgevoerd in DESeq2, waarbij een model werd gebruikt op basis van de behandelconditie (RA vs. controle). Significante genen werden geselecteerd bij een aangepaste p-waarde < 0.05 en een |log2FoldChange| > 1.

Vervolgens werd een Gene Ontology-analyse uitgevoerd met clusterProfiler om betrokken biologische processen te identificeren, apart voor verhoogde en verlaagde genen. Resultaten werden visueel weergegeven via ggplot2 en een EnhancedVolcano-plot. Tot slot werd pathway-analyse verricht met behulp van het pathview-pakket op geselecteerde KEGG-pathways.

# resultaten
wat de fuck
# conclusie
wat de fuck
