#!/usr/bin/env bash
session_engines=(
"django.contrib.sessions.backends.db"
"django.contrib.sessions.backends.file"
"django.contrib.sessions.backends.cache"
"django.contrib.sessions.backends.cached_db"
"django.contrib.sessions.backends.signed_cookies"
)

for session in "${session_engines[@]}"
do
    export SESSION_ENGINE=$session
    tox -- --driver=Chrome
    tox -- --driver=Firefox
    tox -- --driver=PhantomJS --liveserver=127.0.0.1:8000-8100
done
