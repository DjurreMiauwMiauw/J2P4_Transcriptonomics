<p align =”center”>
<img src = “plaatjes/Transcriptonomics_startpagina” alt = "ik kan tenminste de tekst veranderen, maar daar houdt het ook wel op"
width = “600”/>
</p>

# Inhoud


# Inleiding J2P4 Transcriptonomics project, welkom bij Djurre's github pagina.

In dit project is er gekeken naar Reumatoïde Artritis (RA). Dat is een systemische auto-immuunziekte waarvan de oorzaak nog niet bekend is. Wetenschappers denken dat de oorzaak een combinatie lijkt te zijn van genetische aanlag, omgevingsfactoren en een ontspoord immuunsysteem. RA komt voor bij 0.3-1% in de wereldwijde bevolking. Vrouwen zijn 2-3x gevoeliger dan mannen voor het verkrijgen van de ziekte. Er wordt veel onderzoek gedaan naar specifieke genexpressie in patiënten voor de genezing van RA. 

In dit onderzoek zijn 4 samples van personen zonder RA en 4 personen met een RA diagnose van meer dan 12 maanden. Hierbij zijn samples genomen van gewrichtsslijmvlies. Met behulp van R wordt een transcriptonomics analyse uitgevoerd. Hierbij wordt gekeken welke genen meer of minder tot expressie komen. Ook wordt gekeken naar welke pathways betrokken zijn bij de ziekte met behulp van een Gene Ontology analyse.

# methoden
Voor dit onderzoek naar reumatoïde artritis (RA) is een transcriptomics-analyse uitgevoerd op synoviumbiopten van acht personen: vier met RA en vier zonder. De ruwe RNA-sequentiegegevens zijn eerst uitgepakt en uitgelijnd op het humane referentiegenoom (GRCh38) met behulp van de Rsubread-package. De resulterende BAM-bestanden zijn gesorteerd, geïndexeerd en geteld met featureCounts om een genexpressiematrix te verkrijgen.

Met behulp van DESeq2 is differentiële genexpressie-analyse uitgevoerd om genen te identificeren die significant verhoogd of verlaagd tot expressie komen in RA-patiënten ten opzichte van controles. De resultaten zijn visueel gepresenteerd met een vulkaanplot (EnhancedVolcano). Vervolgens zijn de significant veranderde genen gebruikt voor functionele verrijkingsanalyses met clusterProfiler, waarbij Gene Ontology (GO)-termen zijn geïdentificeerd voor biologische processen betrokken bij RA. Ook is pathview gebruikt om genexpressie te visualiseren in een specifieke KEGG-pathway.

Deze methode biedt inzicht in genen en pathways die mogelijk een rol spelen in het ziekteproces van RA. De analyse helpt bij het beter begrijpen van de moleculaire mechanismen achter RA en kan leiden tot nieuwe inzichten voor therapie of diagnose.

# resultaten
wat de fuck
# conclusie
wat de fuck
