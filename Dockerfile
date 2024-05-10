# Use an official Miniconda image as a parent image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /usr/workdir

# Install Nextflow and nf-core
RUN conda update -n base -c defaults conda && \
    conda config --add channels bioconda && \
    conda create --name nf-core python=3.12 nf-core nextflow && \
    echo "source activate nf-core" > ~/.bashrc
