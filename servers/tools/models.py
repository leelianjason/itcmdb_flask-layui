# coding: utf-8
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.dialects.mysql import INTEGER, DATETIME
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()
metadata = Base.metadata


class Server(Base):
    __tablename__ = 'itdata'
    id = Column(INTEGER(10), primary_key=True)
    num = Column(String(255))
    project = Column(String(255))
    user = Column(String(255))
    status = Column(String(255))
    type = Column(String(255))
    isdel = Column(INTEGER(1))
    buytime = Column(String(255))
    droptime = Column(String(255))
    cpu = Column(String(255))
    mb = Column(String(255))
    gpu = Column(String(255))
    mem = Column(String(255))
    maindisk = Column(String(255))
    slavedisk = Column(String(255))
    maindisplay = Column(String(255))
    slavedisplay = Column(String(255))
    comments = Column(String(255))


class User(Base):
    __tablename__ = 'user'
    pk_id = Column(INTEGER(11), primary_key=True, autoincrement=True, nullable=False)
    login_name = Column(String(255))
    password = Column(String(255))
    nick_name = Column(String(255))
    role_id = Column(INTEGER(11), ForeignKey("role.pk_id"))
    extra_resource = Column(String(255), default="")
    forbidden_resource = Column(String(255), default="")
    delete_flag = Column(INTEGER, default=0)
    create_time = Column(DATETIME)
    update_time = Column(DATETIME)
    # 添加反向引用
    roleName = relationship("Role")


class Role(Base):
    __tablename__ = "role"
    pk_id = Column(INTEGER, primary_key=True, autoincrement=True, nullable=False)
    role_name = Column(String(255))
    role_des = Column(String(255))
    delete_flag = Column(INTEGER, default=0)
    create_time = Column(DATETIME)
    update_time = Column(DATETIME)


class Resource(Base):
    __tablename__ = "resource"
    pk_id = Column(INTEGER, primary_key=True, autoincrement=True, nullable=False)
    name = Column(String(255))
    url = Column(String(255))
    parent = Column(String(255))
    delete_flag = Column(INTEGER, default=0)
    create_time = Column(DATETIME)
    update_time = Column(DATETIME)


class RoleResource(Base):
    __tablename__ = "role_resource"
    pk_id = Column(INTEGER, primary_key=True, autoincrement=True, nullable=False)
    role_id = Column(INTEGER)
    resource_id = Column(INTEGER)
    create_time = Column(DATETIME)
    update_time = Column(DATETIME)
