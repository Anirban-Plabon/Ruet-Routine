import json


x=b'{"xxxx":"ppp"}'
x=x.decode('utf-8')
print(type(x))
print(x)
k=json.loads(x)
print(k['xxxx'])