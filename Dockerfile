FROM ubuntu:latest

# Packages & basic container setup
RUN apt-get update && apt-get -y install neovim curl python3-pip locales git
RUN sed -i '/fr_CA.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN pip3 install pynvim msgpack==1.0.2 pylint

# Neovim plugins creation
COPY init.vim /root/.config/nvim/
RUN ["/bin/bash", "-c", "nvim +PlugInstall +qa"]
RUN ["/bin/bash", "-c", "nvim +UpdateRemotePlugins +qa"]

# Launch script
COPY start.sh /root
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
