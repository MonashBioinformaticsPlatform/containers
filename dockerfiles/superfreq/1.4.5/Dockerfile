FROM ghcr.io/rocker-org/r-ver:4.3.1

RUN --mount=type=cache,target=/var/cache/apt \
     apt-get update && \
     apt-get install --yes \
            build-essential git pkg-config wget git curl htop \
            libhdf5-dev libssl-dev libpng-dev libboost-all-dev \
            zlib1g-dev libbz2-dev xz-utils liblzma5 liblzma-dev libclang-dev libhts-dev libhts3 \
            libxml2-dev openjdk-8-jdk python3-dev python3-pip libfftw3-dev libgsl-dev \
            llvm \
            libglpk40 libglpk-dev libigraph-dev libigraph2 libfontconfig1-dev libcairo2-dev \
            libudunits2-dev libgdal-dev libgeos-dev libproj-dev libsqlite0-dev libproj-dev && \
            samtools varscan && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN R --no-echo --no-restore --no-save -e "install.packages(c('devtools', 'renv'))" && \
    R --no-echo --no-restore --no-save -e "install.packages(c('BiocManager'))" && \
    R --no-echo --no-restore --no-save -e "BiocManager::install(c(\
        'GenomeInfoDb', 'GenomicFeatures', 'VariantAnnotation', \
        'Rsamtools', 'rtracklayer', 'BSgenome', 'GenomicFeatures', 'Rhtslib' \
    ))" && \
    R --no-echo --no-restore --no-save -e "BiocManager::install(c('BSgenome.Hsapiens.UCSC.hg19', \
                                                                  'BSgenome.Hsapiens.UCSC.hg38', \
                                                                  'BSgenome.Mmusculus.UCSC.mm10'))" && \
    R --no-echo --no-restore --no-save -e "devtools::install_github('ChristofferFlensburg/superFreq', ref = '9958474')" && \
    rm -rf /tmp/Rtmp*
