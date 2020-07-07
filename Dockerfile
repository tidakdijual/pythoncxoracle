FROM ubuntu

RUN apt-get update && apt-get install -y python3 libaio1 bc flex python3-pip 
COPY oracle-instantclient19.6-basic_19.6.0.0.0-2_amd64.deb /etc/oracle-instantclient19.6-basic_19.6.0.0.0-2_amd64.deb
COPY oracle-instantclient19.6-devel_19.6.0.0.0-2_amd64.deb /etc/oracle-instantclient19.6-devel_19.6.0.0.0-2_amd64.deb

RUN dpkg -i /etc/oracle-instantclient19.6-basic_19.6.0.0.0-2_amd64.deb
RUN dpkg -i /etc/oracle-instantclient19.6-devel_19.6.0.0.0-2_amd64.deb
RUN echo 'export ORACLE_VERSION="19.6"' >> $HOME/.bashrc
RUN echo 'export ORACLE_HOME="/usr/lib/oracle/$ORACLE_VERSION/client64/"' >> $HOME/.bashrc
RUN echo 'export PATH=$PATH:"$ORACLE_HOME/bin"' >> $HOME/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$ORACLE_HOME/lib"' >> $HOME/.bashrc
RUN pip3 install cx_Oracle
RUN rm /etc/oracle-instantclient19.6-basic_19.6.0.0.0-2_amd64.deb
RUN rm /etc/oracle-instantclient19.6-devel_19.6.0.0.0-2_amd64.deb


EXPOSE 80