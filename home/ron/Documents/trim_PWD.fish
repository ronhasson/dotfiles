set -g fish_prompt_pwd_depth 2
set -l user_home ~ #home/username

#replace home in pwd
set -l tempPWD (string replace -ar '^'"$user_home"'' '~' $PWD)

set -l tempArr (string split '/' $tempPWD)


if [ $fish_prompt_pwd_depth -gt (count $tempArr) ]
	set trimmed_pwd (string join '/' $tempArr[1..-1]) #dont trim
else
	set trimmed_pwd (string join '/' $tempArr[(math "-1 * "$fish_prompt_pwd_depth"")..-1]) #trim
end

echo $trimmed_pwd

