# Start from a core stack version
FROM jupyter/scipy-notebook:latest

# Install the Dask dashboard
RUN conda update jupyterlab dask
RUN pip install openpyxl pyarrow s3fs python-snappy dask-labextension;
RUN jupyter lab build

# Jupyter Lab interface
EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]