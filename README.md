# eeb5300finalproject

<h1>Overview and Motivation:</h1>
Treehoppers are insects that have evolved intricate, three-dimensional helmets that are not seen in any other related insects. These helmets are produced from what is normally a flat, single layer of epithelium in the body wall called the pronotum. Fisher et al. (2020) found that these helmets are produced from the expression of wing genes in the pronotum in the fifth instar of the treehopper <i>Entylia carinata</i>, an expression pattern that was not seen in the fifth instar of the related leafhopper <i>Homalodisca vitripennis</i>. 

<img width="894" alt="image" src="https://user-images.githubusercontent.com/44265751/117326216-73089300-ae5f-11eb-941e-df9a2bbe4cad.png">

This implied that at some point during development, treehoppers begin to express genes in the pronotum that are normally not expressed in the pronotum but only in the wing, and this is likely the mechanism that creates these three dimensional helmets from what is usually two dimensional flat body wall tissue. This mechanism is likely related to the intricate folding that occurs in wings, and co-option of this folding mechanism could cause these normally two dimensional regions to become three dimensional. However it is still an open question as to when this co-option occurs in development. Adachi et al. (2020) observed that the oragami-like folding process that creates this helmet seems to occur from the fourth to fifth instar.

<img width="600" alt="image" src="https://user-images.githubusercontent.com/44265751/117328115-540b0080-ae61-11eb-8ceb-87c5658b6c22.png">

This result leads us to believe that wing genes begin to be expressed in the pronotum between the fourth and fifth instar, implying that the fourth instar of treehoppers should have different expression patterns than the fifth instar in these body regions. For our project, we decided to use treehopper RNAseq data from four body regions at the fourth and fifth instars to investigate when wing genes are recruited for pronotum development. 

<h1>Related Work</h1>
The background information comes from work by Fisher <i>et al.</i> 2020. In this <a href="https://www-nature-com.ezproxy.lib.uconn.edu/articles/s41559-019-1054-4">Paper</a>, the authors reveal that leafhoppers (<i>Homalodisca vitripennis</i>) retain the ancestral condition of developing the pronotum from the mesonotum tissue, while treehoppers (<i>Entylia carinata</i>) have co-opted wing patterning genes to develop helmets from the pronotum. Although the data we used comes from this lab, the data was not used in this study and was collected separately. Therefore, the paper serves as background information to guide us. The RNAseq data we use in this project were collected in an effort to parse the expression between fourth and fifth instar of both <i>E. carinata</i> and <i>H. vitripennis</i>, and new data was collected on the fifth instar in an effort to resolve an index swapping issue with the data in Fisher et al. (2020). The sequences are paired end data, and there are three replicate individuals of each species at fourth and fifth instar, with eight body regions sent for TruSeq. This generated 90 libraries of data. We narrowed this down to three replicate individuals of <i>E.carinata</i> at fourth and fifth instar and four body regions for our analysis, or 24 libraries.

<h1>Initial Questions </h1>
After reading the work by Fisher <i>et al.</i> (2020) and Adachi et al. (2020) we wondered at which stage of <i>E. carinata</i> development begins the recruitment of wing patterning genes and in what order. To address this, we formulated two questions: 1) How are the wing patterning genes and the pronotum related? 2) How do the relationships between the pronotum and wing genes change between the 4th and 5th instar?

<h1>Data Information</h1>
The data used in this project was collected by Cera Fisher and shared with us by Elizabeth Jockusch. The data were paired-end and therefore have an associated R1 and R2 for each sample, giving us 48 files to work with based on our previous filtering of the data. The subset of data that we used is located on the server in home/FCAM/ssubramanian/files/ecar and home/FCAM/apastore/files/ecar and was copied to these locations from the ejockusch lab folder. 

<h1>Workflow and Analysis</h1>
We used the <a href="https://github.com/CBC-UCONN/RNAseq_nonmodel">Nonmodel RNAseq Tutorial</a> to analyze our data. The scripts used for each step are located in the folders above, and our workflow described below: 
<img width="894" alt="image" src="https://user-images.githubusercontent.com/44265751/117325399-adbdfb80-ae5e-11eb-9c91-f575293f6f18.png">

<h2><b>#Step 1: File Organization, FastQC and MultiQC </b></h2>
Files belong to Elizabeth Jockusch and Cera Fisher. To begin, we decided to focus on Pronotum, Wing2, Wing3 and Abdomen files for both the fourth and fifth instar of the treehopper. The Wing2 and Wing3 are understood to be involved in Pronotum development, meanwhile the Abdomen would serve as our outgroup for reference. We ran FastQC and MultiQC on all of the files associated with the two instars of the treehopper and all eight body regions to evaluate the quality of all the libraries. Overall, the quality was good. There was high sequence duplication as is to be expected in RNASeq data, but we had good sequence quality and length distributions. 

![image](https://user-images.githubusercontent.com/44265751/116929615-aca58800-ac2c-11eb-90c1-f5a4cb7080da.png)
![image](https://user-images.githubusercontent.com/44265751/116929627-b16a3c00-ac2c-11eb-9e9d-65bf41ffc4a8.png)

Importantly, the quality of one library, N11, was extremely low and had almost no unique reads, and seemed to be made up entirely of adapters. This led us to remove it from further analyses, reducing one replicate of a wing2 region of instar 5. 

<img width="786" alt="image" src="https://user-images.githubusercontent.com/44265751/117332488-e8776200-ae65-11eb-9c69-faa58d8f71e6.png">


<h2><b>#Step 2: Trimming Files with Trimmomatic </b></h2>
From this point onward, we decided to only use the files associated with Wing2, Wing3, Pronotum, and Abdomen instead of using all the files available. We ran Trimmomatic on the FastQC files for the aformentioned body regions. Trimmomatic would serve to remove the TruSeq paired end adapter sequences and dropped reads if they were lower than 45 base pairs. 

Our quality in terms of adapter content was definitely improved.

<img width="379" alt="image" src="https://user-images.githubusercontent.com/44265751/117332829-499f3580-ae66-11eb-938b-c477a963881d.png">

![image](https://user-images.githubusercontent.com/44265751/116928382-fbeab900-ac2a-11eb-8dd7-58ae36c96b23.png)
![image](https://user-images.githubusercontent.com/44265751/116928419-0b6a0200-ac2b-11eb-8d1a-e961253c2946.png)

<b><h2>#Step 3:<i> de novo</i> Assembly with Trinity </b></h2>
We used Trinity to assemble our trimmed libraries. When running, we split our files in half and ran separately. Based on our sequence length distribution, we set our minimum contig length to 90. 

<b><h2>#Step 4: Concatenate Asseblies for Reference Transcriptome </b></h2>

<b><h2>#Step 5: Identify Coding Regions using <i>Transdecoder</i> and <i>hmer</i></b></h2>

<b><h2>#Step 6: Use vsearch to cluster similar transcripts and assemble <i>de novo</i> Reference Transcriptome</b></h2>
After assembling our de novo transcriptome, we used RNAQuast to evaluate the quality of our reference. 
<img width="480" alt="image" src="https://user-images.githubusercontent.com/44265751/117333412-e8c42d00-ae66-11eb-9d98-992e5861bc5a.png">
<img width="470" alt="image" src="https://user-images.githubusercontent.com/44265751/117333540-05f8fb80-ae67-11eb-8fc8-da83fcd91d3f.png">

We found that the reference we assembled was of good quality, with our average length of our transcripts being 858.7 and our N50 being a high value at 969. 

<b><h2>#Step 7: Annotate Reference Transcriptome using <i>EnTAP</i></b></h2>
To annotate our reference transcriptome to eventually do gene ontology, we searched three databases using EnTAP and favoring hits to the genus Entylia. The three databases we searched were UniProt, RefSeq, and NR Protein. 

<b><h2>#Step 8: Index Reference using <i>Kallisto</i>, Generate Counts for each Library </b></h2>
We used kallisto to index the reference transcriptome and then generate counts for each library. To generate counts in readable files for R we then ran two scripts located in the 08_Counts folder. 

<b><h2>#Step 9: Visualization and Analysis of Differential Experession in R</b></h2>
We began our analysis in R by using NOISeq as was described in the RNASeq non-model organism tutorial. We first generated a count distribution plot to see whether the counts of each library were distributed relatively evenly. 

![image](https://user-images.githubusercontent.com/44265751/116934557-1e80d000-ac33-11eb-9855-64ce23920ca4.png)

This revealed that one of our libraries, N10, had lower counts than all our other samples, and as we looked back at our fastqc file associated with this library we saw that it also had a low amount of unique reads that we had not noticed before, and that we will further examine in our future directions. 

We then evaluated whether there was a length bias in our reads, and found that as reads were longer they seemed to be expressed more. 
<img width="418" alt="image" src="https://user-images.githubusercontent.com/44265751/117335251-f24e9480-ae68-11eb-9f54-bce5ddc9936d.png">

Finally, we used NOISeq to create PCA plots that visualize the distribution of our expression data using either instar or body region as the visualizing factor at a time, but we went on to make further visualizations using the R pipeline described in the RNASeq model organism tutorial that gave us more informative PCA plots.

We also were able to see how many genes were upregulated or downregulated in these instars using NOISeq. 
We found that 45 genes were differentially expressed, with 11 upregulated in instar 4 and 34 upregulated in instar 5 which was much lower than we were expecting and may have been thrown off by our inclusion of N10. 

The RNASeq model organism R pipeline utilizes counts that are from the package HTSeq, but we had used kallisto to generate our counts and had to convert the counts into integer format so that it was readable by the R package DESeq. After this conversion, we were able to follow this pipeline to get some more visualizations that would enable us to compare expression between the instars and body region and their interaction. 

The first plot generated was a histogram of the log of the sum counts for each gene across all the samples. This showed us that the counts of this RNASeq data was widely distributed even when log transformed.
<img width="873" alt="Screen Shot 2021-05-06 at 12 57 10 PM" src="https://user-images.githubusercontent.com/44265751/117336791-94bb4780-ae6a-11eb-8a10-64ac659bf7a8.png">

The plots of our shrunken log2 fold changes showed that there were some genes that were upreglated or downregulated, and that there was differential expression at a few of the red points that had significant change. 
<img width="854" alt="Screen Shot 2021-05-06 at 12 59 02 PM" src="https://user-images.githubusercontent.com/44265751/117337004-d9df7980-ae6a-11eb-8f22-f90c3aa8f169.png">
<img width="857" alt="Screen Shot 2021-05-06 at 12 59 26 PM" src="https://user-images.githubusercontent.com/44265751/117337056-e82d9580-ae6a-11eb-82da-dcdfa2c71307.png">
<img width="865" alt="Screen Shot 2021-05-06 at 1 02 29 PM" src="https://user-images.githubusercontent.com/44265751/117337405-53776780-ae6b-11eb-8448-d57074f43714.png">

We then created PCA plots using variance stabilized transformed counts and first did it by just one factor, instar or body region, at a time. This allowed us to see if there are differences between the instars overall and the body regions overall. 
The instar plot showed us that there was quite a bit of overlap between the instars and that instar variation is not one of the main explanations of the variance in the data. 

<img width="677" alt="Screen Shot 2021-05-06 at 1 05 26 PM" src="https://user-images.githubusercontent.com/44265751/117337736-bbc64900-ae6b-11eb-9caa-575da629ea99.png">

The PCA for body regions showed that our outgroup of the abdomen is grouped together separately from those body regions that we expected to show more similar expression. And as the Fisher et al. (2020) paper showed us, there was a lot of overlap between the wing regions and the pronotum.

<img width="682" alt="Screen Shot 2021-05-06 at 1 06 53 PM" src="https://user-images.githubusercontent.com/44265751/117337904-f0d29b80-ae6b-11eb-9eca-0c0d9d60774d.png">

We were then able to create a PCA visualizing both instar and body region together, with the reds and greens indicating instar 4 body regions and the blues and purples instar 5 body regions. The abdomen body regions are grouped together again, and it seems that there is quite a bit of overlap in wing and pronotum expression between the two instars, which was not what we were expecting, and will be further expounded upon in the discussion. 

<img width="731" alt="Screen Shot 2021-05-06 at 1 11 06 PM" src="https://user-images.githubusercontent.com/44265751/117338418-8706c180-ae6c-11eb-8507-b6edefc8f4e7.png">

Finally, we were able to create a heatmap of the top 50 differentially expressed genes between instar and body region, which showed some specific genes that were differentially expressed between instars, but did not clearly show differences between instars and body regions interacting. 

![image](https://user-images.githubusercontent.com/44265751/117338762-f1b7fd00-ae6c-11eb-9c85-4574bd240165.png)


<h1>Discussion</h1>
We observed overlap in expression of the wing2, wing3, and pronotum regions in the fourth and fifth instars, which was expected, but we expected to see some more differentiation between the instars. If looking at the PCA plot that just is colored by the instar factor, there is quite a bit of overlap between the fourth and fifth instars, and it seems that instar differences do not explain most of the variance in our data. When looking at the PCA plot that is just colored by body region, we see that the abdomen, our outgroup, was indeed the most distantly related to all other body regions, and that there is overlap between the wing body regions and the pronotum. When looking at them separately, it seems as though there is little differentiation between wing and pronotum expression between the instars.

![image](https://user-images.githubusercontent.com/44265751/117356513-cf7caa00-ae81-11eb-9db2-fad48e415821.png)

However, when we look at the PCA plot that is colored by both instar and body region above, we see slight evidence of some interaction between the factors. Clearly the abdomen is clustered away from the rest of the body regions in both instars, so we can clearly see that our outgroup was indeed an outgroup. And if you look at the overlap of fourth and fifth wing and pronotum regions, there does seem to be some grouping. The fourth and fifth samples seem to be slightly differentiated, with all of the fourth instar wing and pronotum regions clustered together. Two of the fifth instar replicates are clustered to the bottom right of the fourth instar, but one fifth instar individual is clustered away from the rest. Our low sample size may have allowed specific individuals to have a large effect on the data, and this fifth instar sample could be an outlier. We had initially hypothesized that wing genes would show less overlap with the pronotum genes in the fourth instar and overlap more in the fifth instar, but this is clearly not the case even with the slight grouping that we see. But there might be slightly different expression in these regions in the fourth and fifth instar, and further exploration is necessary to see what exactly these differences are and if they are relevant. 

![image](https://user-images.githubusercontent.com/44265751/117340712-3349a780-ae6f-11eb-88a8-df77c00ad15c.png)

We observed the following patterns from the numbered regions highlighted in our heatmap shown above:
In the first highlighted region there was a consistent increase in expression across all body regions in the fourth instar, but downregulation in the same genes for the fifth instar. We can’t be certain as to what the function of these genes are without delving more into gene ontology, but these genes seem to be associated with a process that slows in the fifth instar.
This gene was expressed widely in both the fourth and fifth instar across all body regions. The expression of this gene does appear to decrease slightly in expression in the fifth instar, but once again across all body regions. 
This gene seems to be clearly upregulated in the abdomen, and is expressed more in the fifth instar. While the abdomen was only our outgroup, this is still an interesting pattern to find (and we do wish we had clearer patterns like this to interpret with our wing and pronotum regions). 
There was high variation in the libraries of this row, however it appears that the abdomen and wing 2 regions experienced upregulation for this gene in both instars, with more upregulation in instar 5. However this is a very irregular pattern and we are not sure if any conclusions should be drawn from this. 

Overall, these patterns do not give us much insight toward differential expression between the body regions that we were interested in, but does seem to have some wider patterns of differential expression between the instars.

<h3><b>Future directions</h3></b>
From this project, we conclude that there is not much differentiation in expression between the wing and pronotum regions between fourth and fifth instars. However, there are many more steps we could take and questions that we have that can be addressed in the future. These results could be improved by removing sample N10, which had a poor unique read count as we saw in our fastqc after using the data for our count distribution plot during R analysis. The inclusion of N10 may have created issues with our expression counts; analysis revealed only 45 upregulated genes, and a library with such low counts could skew our analyses throughout the pipeline. We have already begun the process of removing N10, and hmmer is currently running on a dataset excluding this library, however we will not be able to report the results of an analysis without N10 for the scope of this project. Another area that could have been explored was gene ontology. The focus of this project was to understand the relationship and expression patterns between the two instars’ body regions, so we did not use GOseq as understanding the function of the genes was not in the scope of this project. However, understanding the function of the genes, especially those involved in patterns on our heatmap, may help us understand the full process of helmet development during this period. We confirmed that expression in wing2 and wing3 is similar to the pronotum in both instars, however we were unable to find significant differences in the intensity of expression in the different body regions between the two instars as we expected to find. These results indicate that more samples at different instars are likely necessary to observe exactly when the co-option of wing genes in the pronotum occurs. 


<h1>References</h1>
Adachi, H., Matsuda, K., Nishida, K., Hanson, P., Kondo, S., & Gotoh, H. (2020). Structure and development of the complex helmet of treehoppers (Insecta: Hemiptera: Membracidae). Zoological Letters, 6(1), 3. 

Fisher, C. R., Wegrzyn, J. L., & Jockusch, E. L. (2020). Co-option of wing-patterning genes underlies the evolution of the treehopper helmet. Nature Ecology & Evolution, 4(2), 250–260. 


