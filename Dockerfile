# Start from a core stack version
FROM jupyter/scipy-notebook:latest

# Install the Dask dashboard
RUN pip install dask_labextension openpyxl pyarrow; \
  jupyter labextension install -y --clean \
  dask-labextension

# Dask Scheduler & Bokeh ports
EXPOSE 8787
EXPOSE 8786
EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root"]