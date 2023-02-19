#include <bits/stdc++.h>
using namespace std;
using namespace std::chrono;

uint64_t timeSinceEpochMillisec() {
    return duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
}

int main(int argc, char* argv[]) {
    if(argc == 1) {
        cout << "no program\n";
        return -1;
    }
    // run
    uint64_t ms1 = timeSinceEpochMillisec();
    int returned_val = system(argv[1]);
    uint64_t ms2 = timeSinceEpochMillisec();
    cout << "(executed in " << double(ms2 - ms1)/1000 << "s)" << endl;
    cout << "program exited with code " << returned_val << endl;
    return 0;
}
