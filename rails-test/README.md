# bash history problems

Went down rabbit hole of how best to allow bash history to be persisted in a volume for non-root users. Major issue is that a mounted volume is owned by root, and so mounting `/home/user` or a `/home/user/commandhistory` folder results in root ownership, and the non-root user is unable to persist bash history.

Most promising solution is [here](https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user), with the problem being that it puts the non-root user into a sudo group... and then what is the point of having a "non-root" user.