from youtube_search import YoutubeSearch as Yts
import requests
import sys
arg2=1

try:
    arg2=int(sys.argv[2])
except:pass
class YT_Search:
    def __init__(self,max_res):
        self.get_data = Yts(sys.argv[1],max_results=max_res).to_dict()
        self.max_res = max_res
    def getVideoURL_List(self):
        res = {"id_list":[],"URI_list":[]}
        for k in range(self.max_res):
            res["id_list"].append(self.get_data[k]["id"])
            res["URI_list"].append((self.get_data[k]["thumbnails"])[0])
        return res
    #fdat = search(arg2)[0]
    #def get_artUrl():
if __name__ == "__main__":
    M = YT_Search(arg2)
    g = M.getVideoURL_List()
    print(g["URI_list"])
    #download thumbnails cuz yeah chromium doesn't return mpris:artUrl while using playerctl
    #so i have no choice tho
    #for z in range(arg2):
    with open(f'tmp0.png', 'wb') as hlr:
        hlr.write(requests.get(g["URI_list"][0]).content)
        hlr.close()


    







