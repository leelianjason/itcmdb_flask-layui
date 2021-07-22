from flask import redirect, session
from servers.tools import system_db


def authentication(func):
    def wrapper(*args, **kwargs):
        loginName = session.get("loginName")
        passWord = session.get("passWord")
        user = system_db.selectUserByloginName(loginName=loginName)
        if user is None:
            return redirect("/system/login")
        else:
            if loginName == user.login_name and passWord == user.password:
                return func(*args, **kwargs)
            else:
                return redirect("/system/login")

    return wrapper
