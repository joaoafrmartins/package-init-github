{ parse } = require 'ini'

{ resolve } = require 'path'

{ readFileSync, existsSync } = require 'fs'

username = repo = undefined

config = resolve process.cwd(), ".git", "config"

if existsSync config

  config = parse readFileSync config, "utf-8"

  url = config['remote "origin"'].url.split "/"

  repo = url.pop().replace /\.git$/, ''

  username = url.pop().replace /^.*:(\/\/)?/, ''

username ?= "username"

repo ?= "repo"

module.exports =

  namespace: "github"

  prompts:

    username:

      type: "input"

      default: username

    repo:

      type: "input"

      default: repo
