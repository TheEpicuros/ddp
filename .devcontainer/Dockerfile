FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        jq \
        yamllint \
        curl \
        git && \
    rm -rf /var/lib/apt/lists/*

# Install actionlint
RUN curl -sSL https://github.com/rhysd/actionlint/releases/latest/download/actionlint_$(uname -s)_$(uname -m).tar.gz \
  | tar -xz -C /usr/local/bin

# Install GitHub CLI
RUN type -p curl >/dev/null || apt-get install -y curl && \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
      gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list && \
    apt-get update && apt-get install -y gh && \
    rm -rf /var/lib/apt/lists/*

USER vscode
