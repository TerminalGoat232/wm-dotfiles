from youtube_search import YoutubeSearch as Yts 
import sys
arg2=5
def search(max_res):
    final = []
    for k in range(max_res):
        final.append("https://youtube.com"+Yts(sys.argv[1],max_results=max_res).to_dict()[k]['url_suffix'])
    return final 
try:
    arg2=int(sys.argv[2])
except:pass
print(search(arg2)[0])


