FROM ubuntu:latest

RUN apt-get update && apt-get -y install neovim curl python3-pip locales git

RUN sed -i '/fr_CA.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY init.vim /root/.config/nvim/

RUN pip3 install pynvim msgpack==1.0.2 pylint

RUN ["/bin/bash", "-c", "nvim +PlugInstall +qa"]

RUN ["/bin/bash", "-c", "nvim +UpdateRemotePlugins +qa"]

COPY start.sh /root
RUN chmod +x /root/start.sh

ENTRYPOINT ["/root/start.sh"]
