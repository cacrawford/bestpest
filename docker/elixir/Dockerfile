FROM elixir:latest

RUN mix local.hex --force && \
    mix local.rebar --force

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*
