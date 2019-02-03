var system = require('system');

var argsdata = system.args[1];
var ko_ja = system.args[2];
var server;

if(ko_ja == "0")
	server="https://papago.naver.com/apis/n2mt/translate";
else
	server="https://papago.naver.com/apis/nsmt/translate";

var page = require('webpage').create(),
    data = 'data='+argsdata;

console.log(data)

page.open(server, 'post', data,  function (status) {
    if (status !== 'success') {
        console.log(page.content);
    } else {
        console.log(page.content);
    }
    phantom.exit();
});
