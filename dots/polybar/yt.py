import urllib3
import libxml2
import sys

def printStdErr(*objs):
    print(*objs, file=sys.stderr)


# parse input parameters
if len(sys.argv) < 2 or len(sys.argv) > 3:
    printStdErr("Usage: " + sys.argv[0] + " YoutubeURL [MPDOutputFilename]")
    printStdErr("\tExample: " + sys.argv[0] + " https://www.youtube.com/watch?v=GTGUa4J8XKw aspen.mpd")
    exit(1)

mpdoutfile = "video.mpd"


if len(sys.argv) == 2:
    yUrl = sys.argv[1]
elif len(sys.argv) == 3:
    yUrl = sys.argv[1]
    mpdoutfile = sys.argv[2]


printStdErr("Downloading HTML of " + yUrl)

f=urllib2.urlopen(yUrl)
html=f.read()

mpdurl = html[html.find("dashmpd"):]
mpdurl = mpdurl[mpdurl.find("\":")+3:]
mpdurl = mpdurl[0:mpdurl.find("\"")]
mpdurl = mpdurl.replace("\\/", "/")

printStdErr("Extracted MPDURL from HTML: ")
printStdErr(mpdurl)

downloadfile = urllib2.urlopen(mpdurl)
mpdstring = downloadfile.read()

# store to file
localmpdfile = open(mpdoutfile, "w")
localmpdfile.write(mpdstring)
localmpdfile.close()


# print adaptation set and representations


print("AdaptationSet,RepresentationID,Bitrate,Codec,ExtraInformation")


# parse MPD using libxml2
doc = libxml2.parseFile(mpdoutfile)

# assuming there is one period, containing multiple adaptation sets
periods = doc.get_children().get_children()
adaptationSet = periods.get_children()

# iterate over adaptation sets
while adaptationSet != None:
    adaptationSetType = None
    # get adaptation set type (based on mimetype)
    for prop in adaptationSet.properties:
        if prop.name == 'mimeType':
            adaptationSetType = prop.content

    # go over all childnodes, containing representation settings
    childNode = adaptationSet.get_children()
    while childNode != None:
        if childNode.get_name() == "Representation":
            # if this is a representation xml tag, check out all the type values
            for prop in childNode.properties:
                if prop.name == "id":
                    repId = prop.content
                elif prop.name == "bandwidth":
                    repBitrate = prop.content
                elif prop.name == "height":
                    repHeight = prop.content
                elif prop.name == "width":
                    repWidth = prop.content
                elif prop.name == "frameRate":
                    repFPS = prop.content
                elif prop.name == "codecs":
                    repCodec = prop.content
            # print representation information
            if "video" in adaptationSetType:
                print(adaptationSetType + "," + repId + "," + repBitrate + "," + repCodec + "," + repWidth + "/" +
                      repHeight + "/" + repFPS)
            elif "audio" in adaptationSetType:
                print(adaptationSetType + "," + repId + "," + repBitrate + "," + repCodec)
        # get next childnode (get next representation)
        childNode = childNode.get_next()

    # get next adaptation set
    adaptationSet = adaptationSet.get_next()