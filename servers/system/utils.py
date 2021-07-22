class Response(object):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.data = dict()
