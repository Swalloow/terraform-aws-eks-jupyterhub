FROM jupyter/minimal-notebook:1386e2046833

# -----------------------------------------------------------------------------
# --- Constants
# -----------------------------------------------------------------------------

USER $NB_USER

WORKDIR /home/$NB_USER

# install lab extensions
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

RUN conda install ipywidgets
RUN jupyter labextension install @jupyterlab/plotly-extension

# https://github.com/jupyterlab/jupyterlab-latex
RUN pip install jupyterlab_latex
RUN jupyter labextension install @jupyterlab/latex

RUN jupyter labextension list
RUN jupyter kernelspec list

# install kor font
USER root

# https://interp.blog/docker에서-apt-get-update가-실패할-때/
RUN sed -i 's/archive.ubuntu.com/kr.archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt-get install -y fonts-nanum-coding fonts-nanum-extra fonts-unfonts-core fonts-unfonts-extra fonts-baekmuk

# install graphviz executables
# https://stackoverflow.com/questions/27666846/pydot-invocationexception-graphvizs-executables-not-found
RUN apt-get -y install graphviz
RUN apt-get -y install htop

# set timezone: KST
RUN echo "LANG=ko_KR.UTF-8" > /etc/default/locale
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

USER $NB_USER

RUN fc-cache -fv
