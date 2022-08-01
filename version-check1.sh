#!/bin/bash
# Simple script to list version numbers of critical development tools
export LC_ALL=C
bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH

apt-get install binutils
echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
apt-get install bison
bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  apt-get install yacc
fi

apt-get install coreutilis
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
apt-get install diffutils
diff --version | head -n1
apt-get install find
find --version | head -n1
apt-get install gawk
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else
  apt-get install awk
fi

apt-get install gcc
gcc --version | head -n1
apt-get install g++
g++ --version | head -n1
apt-get install grep
grep --version | head -n1
apt-get install gzip
gzip --version | head -n1
cat /proc/version
apt-get install m4
m4 --version | head -n1
apt-get install make
make --version | head -n1
apt-get install patch
patch --version | head -n1
apt-get install perl
echo Perl `perl -V:version`
apt-get install python3
python3 --version
apt-get install sed
sed --version | head -n1
apt-get install tar
tar --version | head -n1
apt-get install makeinfo
makeinfo --version | head -n1  # texinfo version
apt-get install xz
xz --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy
