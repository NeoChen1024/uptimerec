#!/usr/bin/env sh
# VCS Auto Update script -- update all repositorys under a directory
# Usage : vcs-update.sh [dir]

RETURN=0

if [ -n "${1}" ]; then
	cd "${1}"
fi

for dir in */ ;do
	(
	cd "${dir}"
	printf '\033[1;34m>>\033[32m%s\033[1;34m<<\033[0m\n' "${dir%/}"
	if [ -d .git/ ];then
		git pull
	elif [ -d .svn/ ];then
		svn up
	elif [ -d CVS/ ];then
		cvs up -Pd
	fi
	[ "${?}" != 0 ]&& : $((RETURN++))

	printf '\033[36m========\033[0m\n'
	)
done

[ "${RETURN}" != 0 ] && echo "Something failed..." || echo "Done!"

exit "${RETURN}"
