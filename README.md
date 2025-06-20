<p align =”center”>
<img src = “plaatjes/Transcriptonomics_startpagina.jpg” alt = "Transcriptomics_startpagina"
width = “600”/>
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
Om de verschillen in genexpressie tussen RA-patiënten en gezonde controles in kaart te brengen, werd een differentiële expressieanalyse uitgevoerd. In de volcano plot [(Figuur 1)](plaatjes/VolcanoplotWC) zijn genen met een significant verhoogde of verlaagde expressie weergegeven op basis van log2 fold change en adjusted p-waarde.

Vervolgens werd een GO-verrijkingsanalyse uitgevoerd. In [Figuur 2](plaatjes/Top25hoog) zijn de 25 meest verrijkte biologische processen weergegeven die geassocieerd zijn met verhoogde genexpressie. Enkele voorbeelden hiervan zijn leukocyte chemotaxis, T cell activation en immune receptor signaling. [Figuur 3](plaatjes/Top25_laag) toont de top 25 GO-termen voor genen met verlaagde expressie, waaronder termen gerelateerd aan celontwikkeling en differentiatie, zoals pattern specification process en axonogenesis.

Tot slot werd een KEGG-pathwayanalyse uitgevoerd [(Figuur 4)](hsa05323.pathview). Hierin zijn verschillende betrokken genen binnen het hsa05323 – Rheumatoid arthritis pathway aangeduid met kleur op basis van hun expressieniveau. Zowel genen met verhoogde als verlaagde expressie zijn zichtbaar binnen het pathway.
# conclusie
In dit project werd RNA-seq data van synoviumbiopten van RA-patiënten en gezonde controles geanalyseerd om inzicht te krijgen in genexpressieveranderingen bij reumatoïde artritis. De differentiële expressieanalyse toonde aan dat meerdere genen significant verhoogd of verlaagd tot expressie kwamen in het RA-synovium.

De GO-analyse liet zien dat verhoogd tot expressie gebrachte genen voornamelijk betrokken zijn bij immuunactivatie en migratieprocessen van leukocyten en lymfocyten. Verlaagde genen waren daarentegen gerelateerd aan ontwikkelings- en differentiatieprocessen.

De KEGG-pathwayanalyse bevestigde de betrokkenheid van het bekende hsa05323 – Rheumatoid arthritis pathway, waarin diverse ontstekingsgerelateerde genen verhoogd tot expressie kwamen.

Deze resultaten leveren een overzicht van relevante biologische processen en signaalroutes die actief zijn bij RA, en ondersteunen het gebruik van transcriptomics om ziekte-gerelateerde mechanismen in kaart te brengen.
