library(clusterProfiler)
library(AnnotationDbi)
library(org.Hs.eg.db)
library(tidyverse)
library(goseq)
library(DESeq2)
library(KEGGREST)
library('Rsubread')
library(Rsamtools)
library(EnhancedVolcano)
library(pathview)



setwd("C:/Users/djurr/OneDrive - NHL Stenden/Hoorcolleges - Werkcolleges/Jaar 2/P4/Werkcollege 1/Transcriptonomics_ECHTSPUL/echtspul_RA_rauw_unzip/Data_RA_raw/")
getwd()
# Vervang de bestandsnaam hieronder met je eigen zip-bestand

unzip("Data_RA_raw (1).zip", exdir = "echtspul_RA_rauw_unzip")

#Hiermee worden de bestanden uitgepakt in een submap 'ethanol_data'

buildindex(basename = 'Djurres_genoom', reference = 'Homo_sapiens.GRCh38.dna.toplevel.fa.gz', memory = 10000, indexSplit = TRUE)

# Ethanol monsters
align.djur1 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785819_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785819_2_subset40k.fastq", output_file = "control1.BAM")
align.djur2 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785820_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785820_2_subset40k.fastq", output_file = "control2.BAM")
align.djur3 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785828_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785828_2_subset40k.fastq", output_file = "control3.BAM")
align.djur4 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785831_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785831_2_subset40k.fastq", output_file = "control4.BAM")
align.djur5 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785979_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785979_2_subset40k.fastq", output_file = "sample1.BAM")
align.djur6 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785980_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785980_2_subset40k.fastq", output_file = "sample2.BAM")
align.djur7 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785986_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785986_2_subset40k.fastq", output_file = "sample3.BAM")
align.djur8 <- align(index = "Djurres_genoom", readfile1 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785988_1_subset40k.fastq", readfile2 = "echtspul_RA_rauw_unzip/Data_RA_raw/SRR4785988_2_subset40k.fastq", output_file = "sample4.BAM")

# Laad Rsamtools voor sorteren en indexeren


# Bestandsnamen van de monsters
samples <- c('control1', 'control2', 'control3', 'control4', 'sample1', 'sample2', 'sample3', 'sample4')

# Voor elk monster: sorteer en indexeer de BAM-file
# Sorteer BAM-bestanden
lapply(samples, function(s) {sortBam(file = paste0(s, '.BAM'), destination = paste0(s, '.sorted'))
})

lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))
})

allsamples <- c("control1.BAM", "control2.BAM", "control3.BAM", "control4.BAM", "sample1.BAM", "sample2.BAM", "sample3.BAM", "sample4.BAM")

count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "Homo_sapiens.GRCh38.114.gtf.gz",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)

head(count_matrix$annotation)
head(count_matrix$counts)

# Bekijk eerst de structuur van het object
str(count_matrix)

# Haal alleen de matrix met tellingen eruit
counts <- count_matrix$counts

colnames(counts) <- c("control1", "control2", "control3", "control4", "sample1", "sample2", "sample3", "sample4")

head(counts)

write.csv(counts, "bewerkt_countmatrix.csv")
head(counts)

counts <- read.table("count_matrix.txt", row.names = 1)
treatment <- c("control", "control", "control", "control", "sample", "sample", "sample", "sample")
treatment_table <- data.frame(treatment)
rownames(treatment_table) <- c('SRR4785819', 'SRR4785820', 'SRR4785828', 'SRR4785831', 'SRR4785979', 'SRR4785980', 'SRR4785986', 'SRR4785988')

dds <- DESeqDataSetFromMatrix(countData = round(counts), 
                              colData = treatment_table,
                              design = ~ treatment)

# Voer analyse uit# Voer analyse uitcounts
dds <- DESeq(dds)
resultaten <- results(dds)



# Resultatread.table()# Resultaten opslaan in een bestand
#Bij het opslaan van je tabel kan je opnieuw je pad instellen met `setwd()` of het gehele pad waar je de tabel wilt opslaan opgeven in de code.

write.table(resultaten, file = 'Resultaten_echt3.csv', row.names = TRUE, col.names = TRUE)

sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]

head(laagste_p_waarde)

if (!requireNamespace("EnhancedVolcano", quietly = TRUE)) {
  BiocManager::install("EnhancedVolcano")
}


EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')

# Alternatieve plot zonder p-waarde cutoff (alle genen zichtbaar)
EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj'
                pCutoff = 0)

EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')

dev.copy(png, 'VolcanoplotWC.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

resultaten[1] <- NULL
resultaten[2:5] <- NULL

pathview(
  gene.data = resultaten,
  pathway.id = "hsa05323",  # KEGG ID voor Biofilm formation – E. coli
  species = "hsa",          # 'eco' = E. coli in KEGG
  gene.idtype = "SYMBOL",     # Geef aan dat het KEGG-ID's zijn
  limit = list(gene = 1)    # Kleurbereik voor log2FC van -5 tot +5
)

keggLink("hsa", "path:hsa05323")
keggLink("eco", "path:eco00010")




head(resultaten)

all <- rownames(resultaten)
all

sigs <- read.csv("Resultaten_echt3.csv", sep = " ", header = TRUE, row.names = 1)

# 🔁 Genen filteren
genes_high <- rownames(sigs[sigs$log2FoldChange > 0.5, ])
genes_low <- rownames(sigs[sigs$log2FoldChange < -0.5, ])

# 🧬 GO-analyse voor verhoogde genen
GOresults_high <- enrichGO(
  gene = genes_high,
  OrgDb = org.Hs.eg.db,
  keyType = "SYMBOL",
  ont = "BP"
)

# 🧬 GO-analyse voor verlaagde genen
GOresults_low <- enrichGO(
  gene = genes_low,
  OrgDb = org.Hs.eg.db,
  keyType = "SYMBOL",
  ont = "BP"
)

# Zet de resultaten om naar data frames
GO_df_high <- as.data.frame(GOresults_high)
GO_df_low <- as.data.frame(GOresults_low)

# Sla de resultaten op als CSV-bestanden
write.csv2(GO_df_high, file = "GO_enrichment_results_high.csv", row.names = FALSE)
write.csv2(GO_df_low, file = "GO_enrichment_results_low.csv", row.names = FALSE)

# 🔝 Top 10 GO-termen per groep
top10_high <- GO_df_high %>%
  arrange(p.adjust) %>%
  slice_head(n = 5)

top10_low <- GO_df_low %>%
  arrange(p.adjust) %>%
  slice_head(n = 5)

# 📊 Visualisatie
ggplot(top10_high, aes(x = reorder(Description, p.adjust), y = -log10(p.adjust))) +
  geom_col(fill = "deepskyblue") +
  labs(title = "Top 10 GO-termen (verhoogde expressie)", x = "GO-term", y = "-log10(p.adjust)")

ggplot(top10_low, aes(x = reorder(Description, p.adjust), y = -log10(p.adjust))) +
  geom_col(fill = "brown1") +
  labs(title = "Top 10 GO-termen (verlaagde expressie)", x = "GO-term", y = "-log10(p.adjust)")

