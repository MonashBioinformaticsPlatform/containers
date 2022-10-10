# Monash Bioinformatics Containers

This is a repository for Dockerfiles and container images (mostly) packaging individual tools.

> Your first port of call should usually by BioContainers (eg via the little 'containers|none' badge on [a Bioconda package](https://bioconda.github.io/recipes/samtools)). But sometimes we need our own custom containers.

## Quickstart

Find the image and version you want under [Packages](https://github.com/orgs/MonashBioinformaticsPlatform/packages?repo_name=containers).

Run: 

```bash
NAME=guppy-gpu:6.3.8

singularity pull docker://ghcr.io/monashbioinformaticsplatform/containers/${NAME}
```
(where `${NAME}` is the name:version of the image you want)

This will generate a `*.sif` file (eg `guppy-gpu_6.3.8.sif`). You can run the tool in the container with something like:
```
singularity exec guppy-gpu_6.3.8.sif gupper_basecaller --help
```

## Adding new Dockerfiles

Create a Dockerfile at `dockerfiles/${tool}/${version}/Dockerfile`.
(where `${tool}` and version might be `guppy-gpu` and `6.3.8`)

Ideally also add a `dockerfiles/${tool}/${version}/README.md`

Test your `docker build` locally.

Edit the `matrix:` section at the top of `.github/workflows/docker-build-push.yml` to add the details for your new tool (follow the established pattern).

Commit and push to the `main` branch and check [Actions](https://github.com/MonashBioinformaticsPlatform/containers/actions) to see if the image build was successful.