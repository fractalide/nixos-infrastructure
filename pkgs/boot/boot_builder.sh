source $stdenv/setup || exit 1

boot_bin=$out/bin/boot

mkdir -pv $(dirname $boot_bin)
cp -v $src $boot_bin
chmod -v 755 $boot_bin

patchShebangs $boot_bin

wrapProgram $boot_bin \
	--set JAVA_HOME "${jre}" \
	--prefix PATH ":" "${jre}/bin"

