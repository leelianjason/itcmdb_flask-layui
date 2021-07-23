class APIResponse(object):
    def __init__(self):
        self.code = 0  # 0为正常，1为执行错误
        self.msg = ''
        self.count = ''
        self.data = []


def CheckParams(params):
    if not params:
        params = None
        return params
    else:
        return params
