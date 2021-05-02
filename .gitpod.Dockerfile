From gitpod/workspace-full

RUN sudo apt-get install fish -y && \
    sudo apt-get update && \
    sudo apt install python3 && \
    sudo apt install python2

#RUN [ -f requirements.txt ] && pip3 install -r requirements.txt && pip2 install -r requirements.txt 

RUN sudo chsh -s /usr/bin/fish

USER Giri

#SHELL ["fish", "--command"]

ENV SHELL /usr/bin/fish

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

ENTRYPOINT [ "fish" ]
