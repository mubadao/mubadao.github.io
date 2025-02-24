#!/usr/bin/python
#coding:utf-8

import sys
import os, os.path
import shutil
import plistlib
import json
import datetime
import re
import codecs
import time

if __name__ == '__main__':
    if sys.getdefaultencoding() != 'utf-8':
        reload(sys)
        sys.setdefaultencoding('utf-8')

    command = 'hexo clean'
    if os.system(command) != 0:
        raise Exception("new fails!")

    command = 'hexo g'
    if os.system(command) != 0:
        raise Exception("new fails!")

    command = 'hexo server'
    if os.system(command) != 0:
        raise Exception("new fails!")


