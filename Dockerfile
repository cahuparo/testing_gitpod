# Use an official Miniconda image as a parent image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /workspace

# Update Conda and install Nextflow and nf-core via Bioconda
RUN conda update -n base -c defaults conda && \
    conda config --add channels bioconda && \
    conda create --name nf-core python=3.12 nf-core nextflow && \
    echo "source activate nf-core" > ~/.bashrc

# Expose the port Nextflow might use for web reports
EXPOSE 8080
