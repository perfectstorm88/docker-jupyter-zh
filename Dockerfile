FROM centos7-python:3.8.10
ENV NLS_LANGE="SIMPLIFIED CHINESE_CHINA.ZHS16GBK"
# 安装中文字体(中易黑体)，支持matplotlib中文梯子
RUN yum -y install fontconfig && yum clean all
COPY SimHei.ttf /usr/share/fonts/
# 常用的库，如pandas、matplotlib、excel、yaml等
RUN pip install matplotlib jupyter openpyxl pandas PyYAML

COPY requirements.txt .
RUN pip install --trusted-host mirrors.aliyun.com  -i http://mirrors.aliyun.com/pypi/simple/  -r requirements.txt

WORKDIR /work
CMD ["python","-m","jupyter","notebook","--port=8888","--allow-root","--ip=0.0.0.0","--no-browser","--NotebookApp.token='your password'"]

