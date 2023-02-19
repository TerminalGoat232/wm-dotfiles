import argparse
def spc():
    parser = argparse.ArgumentParser()
    parser.add_argument("spc")
    args = parser.parse_args()
    spced = ''.join([" " * x for x in range(int(args.spc))])
    return spced
if __name__ == "__main__":
    print(spc())
