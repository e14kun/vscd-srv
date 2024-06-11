FROM ubuntu:22.04

RUN apt update && apt install -y curl vim neovim tree
#RUN apt update
#RUN apt install -y code-server
#RUN apt install -y curl vim neovim tree

# install VS Code (code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# install VS Code extensions
RUN code-server --install-extension redhat.vscode-yaml --install-extension ms-python.python --install-extension Vue.volar


# code-server setting
RUN sed -i 's/127.0.0.1:8080/0.0.0.0:7000/g' /root/.config/code-server/config.yaml
RUN sed -i '/password/d' /root/.config/code-server/config.yaml
RUN echo 'password: password' >> /root/.config/code-server/config.yaml

CMD code-server
# RUN code-server 
#RUN systemctl enable --now code-server

# systemctl start code-server


# cf code)
# podman stop jy_job_code-server && \
# podman rmi jy_job_code-server:latest --force && \
# podman build -t jy_job_code-server /home/ulexv20/jy_job/code-server_dk
# podman run -dt -p7000:7000 -v /home/ulexv20/jy_job:/jy_job --env-file /home/ulexv20/jy_job/db.env --name jy_job_code-server jy_job_code-server
# echo code-server:7000 && ssh -L 7000:192.168.0.107:7000 law-ai@203.245.3.119 -p22001


# cf links)
# how to code-server extension install
# https://passwd.tistory.com/entry/code-server-%ED%99%95%EC%9E%A5-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8extension-%EC%88%98%EB%8F%99-%EC%84%A4%EC%B9%98

# theme about cf link
# https://life-with-coding.tistory.com/454#:~:text=1.%20%ED%85%8C%EB%A7%88%20%EB%B3%80%EA%B2%BD%ED%95%98%EA%B8%B0%201.%20Visual%20Studio%20Code%EC%9D%98%20%EC%83%81%EB%8B%A8,%3A%20Generate%20Color%20Theme%20From%20Current%20Settings%EB%A5%BC%20%EC%84%A0%ED%83%9D%ED%95%A9%EB%8B%88%EB%8B%A4.
