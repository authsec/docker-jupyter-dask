# Start from a core stack version
FROM jupyter/scipy-notebook:latest

# Install the Dask dashboard
RUN conda update jupyterlab dask
RUN pip install openpyxl pyarrow "s3fs==0.4.2" python-snappy fastparquet dask-labextension blosc==1.9.2 lz4==3.1.1 msgpack==1.0.0 dask==2021.1.1;
RUN jupyter lab build

# Jupyter Lab interface
EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]