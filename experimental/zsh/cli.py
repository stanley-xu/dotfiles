#!/usr/bin/env python3

import argparse
from requests import get
from subprocess import run
from pathlib import Path
from shutil import copytree, copy

HOME = str(Path.home())
STARTER_ZSHRC="zshrc"
STARTER_ZSH_HOME="zsh"
ZSH_HOME=f"{HOME}/.{STARTER_ZSH_HOME}"
ZSHRC=f"{HOME}/.{STARTER_ZSHRC}" 

resources = {
  'completion.zsh': 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh',
  'history.zsh': 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/history.zsh'
}

repos = {
  'zsh-autosuggestions': 'https://github.com/zsh-users/zsh-autosuggestions.git',
  'powerlevel10k': 'https://github.com/romkatv/powerlevel10k.git'
}

class Parser():
  welcome = 'Help yourself! 🍻'
  command = 'up'

  def __init__(self):
    self.parser = argparse.ArgumentParser(description=Parser.command)
    self.configure()

  def configure(self):
    self.parser.add_argument('command', nargs='+', help=Parser.command)
    self.parser.add_argument('-r', '--reset')
  
class Dispatcher():
  def __init__(self):
    self.map = {
      'up': self.up,
      'down': self.down
    }

  def start(self):
    cmd = yield
    while True:
      if cmd in self.map:
        cmd = yield self.map[cmd]
      else:
        raise RuntimeError(f'unknown command: {cmd}')

  def up(self):
    if not Path(ZSH_HOME).exists():
      self.seed_configs()

    self.update_all()

  def seed_configs(self):
    copytree(Path(STARTER_ZSH_HOME), Path(ZSH_HOME))
    copy(Path(STARTER_ZSHRC), Path(ZSHRC))

  def update_all(self):
    for fname, url in resources.items():
      self.download(url, fname)

    for reponame, url in repos.items():
      self.update_repo(url, reponame)

  def download(self, url, fname):
    dst = f'{ZSH_HOME}/{fname}'
    r = get(url)
    with open(dst, 'w+') as f:
      f.write(r.text)

  def update_repo(self, url, reponame):
    dst = f'{ZSH_HOME}/{reponame}'

    if Path(dst).exists():
      args = 'git -C'.split()
      args.append(dst)
      args.append('pull')
    else:
      args = 'git clone --depth=1'.split()
      args.append(url)
      args.append(dst)

    run(args)

  def down(self):
    print('@down')

if __name__ == "__main__":
  parser = Parser().parser
  dispatcher = Dispatcher().start()
  next(dispatcher)

  args = parser.parse_args()
  if args.command:
    cmd = args.command[0]
    dispatcher.send(cmd)()
  
  dispatcher.close()
