# Use an official Miniconda image as a parent image
FROM continuumio/miniconda3

# Install mamba from the conda-forge channel
RUN conda install mamba -n base -c conda-forge -y

# Set the working directory in the container
WORKDIR /workspace

# Create a new environment with only Python using Mamba
RUN mamba create --name nf-core python=3.12 -y && \
    echo "conda activate nf-core" >> /etc/bash.bashrc

# Activate the environment and install Nextflow and nf-core
RUN /bin/bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    conda activate nf-core && \
    mamba install nf-core nextflow -y"

# Expose the port Nextflow might use for web reports
EXPOSE 8080
