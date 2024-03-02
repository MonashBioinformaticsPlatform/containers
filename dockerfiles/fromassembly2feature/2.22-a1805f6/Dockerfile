FROM mambaorg/micromamba:1.5.6

ENV GIT_REF=a1805f682c9ac28c3ec22dc067d3576e64764fb3

# TODO: Pin versions
RUN micromamba install -y -n base \
    bioconda::prodigal \
    bioconda::samtools \
    bioconda::blast \
    bioconda::plasclass \
    r::r-essentials \
    bioconda::bioconductor-msa \
    bioconda::bioconductor-biostrings \
    conda-forge::r-seqinr \
    conda-forge::r-reshape2 \
    conda-forge::r-rmarkdown \
    conda-forge::pandoc && \
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