#-*- coding: utf-8 -*-
import sys
import base64
from urllib.parse   import quote
import requests, json

def translater(From, to, string) :
	data_signature = 'rlWxMKMcL2IWMPV6Ijg0ZWU4OTYxLWUwNGYtNDBjMS04N2Y4LTFhMzM3YWQ1MDY3NyIsImRpY3QiOnRydWUsImRpY3REaXNwbGF5IjozMCwiaG9ub3JpZmljIjpmYWxzZSwiaW5zdGFudCI6ZmFsc2Us'
	request_message = '"source":"{}","target":"{}","text":"{}"'.format(From, to, string) + '}';

	data_to_base64 = base64.b64encode(request_message.encode('utf-8'))
	urlencoded_data = data_to_base64

	data =  data_signature + urlencoded_data.decode("utf-8")
	data = data.replace("%0A", "")

	if((From == "ko" and to == "ja") or (From=="ja" and to=="ko")) :
		url = 'https://papago.naver.com/apis/nsmt/translate'
	else :
		url = "https://papago.naver.com/apis/n2mt/translate";
	params = {'data': data}
	response = requests.post(url=url, data=params)
	jsonData = json.dumps(response.json(), ensure_ascii=False)

	data = json.loads(jsonData)
	return data["translatedText"]


string =  sys.argv[3]
From  = sys.argv[1]
to = sys.argv[2]


dotSpace = 0        #'. '기준으로 찾은 위치
dotPerN = 0         #'.\n'기준으로 찾은 위치
Qmark = 0           #'? '기준으로 찾은 위치
QmarkPerN = 0       #'?\n'기준으로 찾은 위치
splitedText = []    #5000이하의 단위로 잘라낸 문자열을 저장하는 리스트
start_point = 0     #search를 위해 만든 시작 위치 저장 포인트
end_point = 0       #어디까지 문자열 저장 리스트에 저장할지, 그리고 다음 스타트 위치가 어디일지를 결정


while len(string[start_point:])>5000:   #5000보다 크면 수행
    dotPerN = string[start_point:start_point+5000].rfind('.\n')         #5000단위로 찾음. rfind는 뒤에서부터 찾음
    dotSpace = string[start_point:start_point+5000].rfind('. ')
    QmarkPerN = string[start_point:start_point + 5000].rfind('?\n')
    Qmark = string[start_point:start_point + 5000].rfind('? ')
    end_point = max(Qmark,QmarkPerN,dotSpace,dotPerN)       #찾은 위치들 중 가장 큰 값을 이용. 그러니까 5000에 가장 가까운 것
    if end_point==-1:
        end_point = max(string[start_point:start_point + 5000].rfind('.'), string[start_point:start_point + 5000].rfind('?'), string[start_point:start_point + 5000].rfind('\n'))
        splitedText.append(string[start_point:start_point + end_point+1])
        start_point = start_point + end_point+1
        continue



    splitedText.append(string[start_point:start_point + end_point+2])   #리스트에 해당 위치까지 저장.  search기준 문자도 저장.
    start_point = start_point + end_point+2

splitedText.append(string[start_point:])    #반복문을 나와서 5000자 이하의 나머지 스트링을 append함
k=1
result = ""
for i in splitedText:
    result = result + translater(From, to, i)

print(result)
