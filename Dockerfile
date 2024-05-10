# Use an official Miniconda image as a parent image
FROM continuumio/miniconda3

# Install mamba from the conda-forge channel for faster and more reliable package installation
RUN conda install mamba -n base -c conda-forge -y

# Set the working directory in the container
WORKDIR /workspace

# Add necessary channels and set priority
RUN mamba config --add channels bioconda && \
    mamba config --add channels conda-forge && \
    mamba config --set channel_priority strict

# Create a new environment with nf-core and Nextflow
RUN mamba create --name nf-core python=3.12 nf-core nextflow -y && \
    echo "conda activate nf-core" >> /etc/bash.bashrc

# Expose the port Nextflow might use for web reports
EXPOSE 8080
