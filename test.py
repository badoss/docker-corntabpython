import os
import requests


url = 'https://notify-api.line.me/api/notify'
token = '' #token line
headers = {'content-type':'application/x-www-form-urlencoded','Authorization':'Bearer '+token}


def main():
    msg = 'hello form docker '
    requests.post(url, headers=headers, data = {'message':msg})
    print('send massegg success')


if __name__ == "__main__":
    print('start python')
    main()
