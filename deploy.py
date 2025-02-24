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

def file_replace(file_path, replace_json):
    f = codecs.open(file_path,'r','utf-8')
    content = f.read()
    f.close()
    is_replace = False
    for item in replace_json:
        regex = item["regex"]
        tostr = item["tostr"]
        content, number = re.subn(regex, tostr, content)
        if number > 0 :
            is_replace = True

    if is_replace:
        f = codecs.open(file_path,'w', 'utf-8')
        f.write(content)
        f.close()

if __name__ == '__main__':
    if sys.getdefaultencoding() != 'utf-8':
        reload(sys)
        sys.setdefaultencoding('utf-8')

    command = 'hexo clean'
    if os.system(command) != 0:
        raise Exception("new fails!")

    command = 'hexo deploy'
    if os.system(command) != 0:
        raise Exception("new fails!")


