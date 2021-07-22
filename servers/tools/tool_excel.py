import xlrd
from servers.tools import tool_db
from datetime import datetime
from xlrd import xldate_as_tuple


# xlsx文件打开需要,pip install xlrd==1.2.0
def insertFromExcel(upload_path):
    book = xlrd.open_workbook(upload_path)
    sheet = book.sheet_by_index(0)
    # 获取表格标题
    row_0 = sheet.row(0)
    rowsnumber = sheet.nrows  # 行数
    colsnumber = sheet.ncols  # 列数
    # 遍历所有行
    for i in range(1, rowsnumber):
        info = {}
        # 遍历所有列,并加上表头
        for j in range(0, colsnumber):
            # 获取表标题
            title_tmp = str(row_0[j])
            title = title_tmp.split("'")[1]
            # 判断返回类型  0 --empty,1 --string, 2 --number(都是浮点), 3 --date, 4 --boolean, 5 --error
            ctype = sheet.cell(i, j).ctype
            cell = sheet.cell_value(i, j)
            # 修改excel导入的整数变为了浮点
            if ctype == 2:
                cell = int(cell)
                cell = str(cell)
            elif ctype == 3:
                date = datetime(*xldate_as_tuple(cell, 0))
                cell = date.strftime('%Y/%m/%d %H:%M:%S')
            info[title] = cell
        # 写入数据
        result = tool_db.addDataByID(info)
    return result
