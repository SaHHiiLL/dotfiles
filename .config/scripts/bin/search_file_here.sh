#!/usr/bin/env bash

export LS=$(fzf < <(fd --max-depth 1))
