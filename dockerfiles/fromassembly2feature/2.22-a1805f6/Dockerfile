FROM mambaorg/micromamba:1.5.6

ENV GIT_REF=a1805f682c9ac28c3ec22dc067d3576e64764fb3

RUN micromamba install -y -n base \
    bioconda::prodigal=2.6.3 \
    bioconda::samtools=1.12 \
    bioconda::blast=2.15.0 \
    bioconda::plasclass=0.1.1 \
    r::r-essentials=3.6.0 \
    bioconda::bioconductor-msa=1.18.0 \
    bioconda::bioconductor-biostrings=2.54.0 \
    conda-forge::r-seqinr=4.2_5 \
    conda-forge::r-reshape2=1.4.4 \
    conda-forge::r-rmarkdown=2.8 \
    conda-forge::pandoc=2.19.2 && \
    micromamba clean --all --yes

USER root

RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/LPerlaza/fromAssembly2Feature.git /opt/fromAssembly2Feature && \
    cd /opt/fromAssembly2Feature && \
    git checkout ${GIT_REF} && \
    chmod +x /opt/fromAssembly2Feature/fromAssembly2gene.pl && \
    ln -s /opt/fromAssembly2Feature/fromAssembly2gene.pl /usr/bin/fromAssembly2gene.pl

USER $MAMBA_USER

CMD ["fromAssembly2gene.pl"]
