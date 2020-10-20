import React, { useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, DatePicker } from 'antd'
import moment from 'moment'
import { TableListItem } from './data'
import { pageQuery, remove } from './service'
import { system } from '@/utils/twelvet'

/**
 * 菜单模块
 */
const Menu: React.FC<{}> = () => {

    const acForm = useRef<ActionType>()

    const { RangePicker } = DatePicker

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '用户名称', ellipsis: true, valueType: "text", dataIndex: 'userName',
        },
        {
            title: 'IP', valueType: "text", dataIndex: 'ipaddr'
        },
        {
            title: '登录地区', valueType: "text", hideInSearch: true, dataIndex: 'orderNum'
        },
        {
            title: '终端', hideInSearch: true, valueType: "text", dataIndex: 'perms'
        },
        {
            title: '操作系统', hideInSearch: true, dataIndex: 'component'
        },
        {
            title: '状态',
            ellipsis: false,
            dataIndex: 'status',
            valueEnum: {
                1: { text: '正常', status: 'success' },
                0: { text: '停用', status: 'error' },
            },
        },
        {
            title: '登录信息', valueType: "text", hideInSearch: true, dataIndex: 'msg'
        },
        {
            title: '搜索日期',
            key: 'between',
            hideInTable: true,
            dataIndex: 'between',
            renderFormItem: () => (
                <RangePicker format="YYYY-MM-DD" disabledDate={(currentDate: moment) => {
                    // 不允许选择大于今天的日期
                    return moment(new Date(), 'YYYY-MM-DD') < currentDate
                }} />
            )
        },
        {
            title: '登录时间', valueType: "date", hideInSearch: true, dataIndex: 'accessTime'
        },
    ]

    /**
     * 移除菜单
     * @param row infoIds
     */
    const refRemove = async (infoIds: (string | number)[] | undefined) => {
        try {
            if (!infoIds) {
                return true
            }
            const { code, msg } = await remove(infoIds.join(","))
            if (code != 200) {
                return message.error(msg)
            }

            message.success(msg)

            acForm.current && acForm.current.reload()

        } catch (e) {
            system.error(e)
        }

    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                rowKey="infoId"
                columns={columns}
                request={pageQuery}
                rowSelection={{}}
                beforeSearchSubmit={(params) => {
                    console.log(params)
                    // 分隔搜索参数
                    if (params.between) {
                        const between = params.between
                        // 移除参数
                        delete params.between

                        // 适配参数
                        params.beginTime = between[0]
                        params.endTime = between[1]
                    }
                    return params
                }}
                toolBarRender={(action, { selectedRowKeys }) => [
                    <Popconfirm
                        disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                        onConfirm={() => refRemove(selectedRowKeys)}
                        title="是否删除选中数据，请再次确认！！！"
                    >
                        <Button
                            disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                            type="primary" danger
                        >
                            <DeleteOutlined />
                            批量删除
                        </Button>
                    </Popconfirm>,
                    <Button type="default">
                        <FundProjectionScreenOutlined />
                        导出数据
                    </Button>
                ]}

            />
        </>
    )

}

export default Menu