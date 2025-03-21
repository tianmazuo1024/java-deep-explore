如果在dockerfile里或者在容器里执行yum时报如下错误：

One of the configured repositories failed (Unknown),
and yum doesn't have enough cached data to continue. At this point the only
safe thing yum can do is fail. There are a few ways to work "fix" this:

1. Contact the upstream for the repository and get them to fix the problem.

2. Reconfigure the baseurl/etc. for the repository, to point to a working
upstream. This is most often useful if you are using a newer
distribution release than is supported by the repository (and the
packages for the previous distribution release still work).

3. Run the command with the repository temporarily disabled
yum --disablerepo=<repoid> ...

4. Disable the repository permanently, so yum won't use it by default. Yum
will then just ignore the repository until you permanently enable it
again or use --enablerepo for temporary usage:

yum-config-manager --disable <repoid>
or
subscription-manager repos --disable=<repoid>

5. Configure the failing repository to be skipped, if it is unavailable.
Note that yum will try to contact the repo. when it runs most commands,
so will have to try and fail each time (and thus. yum will be be much
slower). If it is a very temporary problem though, this is often a nice
compromise:

yum-config-manager --save --setopt=<repoid>.skip_if_unavailable=true

Cannot find a valid baseurl for repo: base/7/x86_64
Could not retrieve mirrorlist http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os&infra=container error was
14: curl#6 - "Could not resolve host: mirrorlist.centos.org; Unknown error"
The command '/bin/sh -c yum install java-1.8.0-openjdk -y' returned a non-zero code: 1

那么，只需要在/etc/resolv.conf文件里加上DNS服务就行了。
vi /etc/resolv.conf

加上下面的几行：
nameserver 8.8.8.8
nameserver 8.8.4.4
search localdomain

然后再次尝试运行`docker-compose up -d`即可
