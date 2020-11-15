import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, Radio, Drawer, InputNumber } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { TableListItem } from './data'
import { pageQuery, remove, exportExcel, getBydictId, insert, update } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'

/**
 * 字典模块数据管理
 */
const DrawerInfo: React.FC<{
    info: {
        drawerInfoKey: string
        visible: boolean
    }
}> = (props) => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const [drawerVisible, setDrawerVisible] = useState<boolean>(true)

    const acForm = useRef<ActionType>()

    const [form] = Form.useForm<FormInstance>()


    const { TextArea } = Input

    const formItemLayout = {
        labelCol: {
            xs: { span: 4 },
            sm: { span: 4 },
        },
        wrapperCol: {
            xs: { span: 18 },
            sm: { span: 18 },
        },
    }

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '字典标签', ellipsis: true, valueType: "text", dataIndex: 'dictLabel',
        },
        {
            title: '字典键值', valueType: "text", dataIndex: 'dictValue'
        },
        {
            title: '字典排序', valueType: "text", dataIndex: 'dictSort'
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
            title: '备注', search: false, valueType: "text", dataIndex: 'remark'
        },
        {
            title: '创建时间', search: false, valueType: "dateTime", dataIndex: 'createTime'
        },
        {
            title: '操作', valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return [
                    <Button type="primary" onClick={() => refPut(row)}>
                        <EditOutlined />
                        修改
                    </Button>,
                    <Popconfirm
                        onConfirm={() => refRemove(row.dictId)}
                        title="确定删除吗"
                    >
                        <Button type="primary" danger>
                            <CloseOutlined />
                             删除
                        </Button>
                    </Popconfirm>
                ]
            }
        },
    ]

    /**
     * 新增字典
     * @param row row
     */
    const refPost = async () => {
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改字典信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getBydictId(row.dictId)
            if (code != 200) {
                return message.error(msg)
            }
            // 赋值表单数据
            form.setFieldsValue(data)

            // 设置Modal状态
            setModal({ title: "修改", visible: true })

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 移除字典
     * @param row dictIds
     */
    const refRemove = async (dictIds: (string | number)[] | string | undefined) => {
        try {
            if (!dictIds) {
                return true
            }

            let params
            if (isArray(dictIds)) {
                params = dictIds.join(",")
            } else {
                params = dictIds
            }

            const { code, msg } = await remove(params)

            if (code !== 200) {
                return message.error(msg)
            }

            message.success(msg)

            acForm.current && acForm.current.reload()

        } catch (e) {
            system.error(e)
        }

    }

    /**
     * 取消Modal的显示
     */
    const handleCancel = () => {
        setModal({ title: "", visible: false })

        form.resetFields()

    }

    /**
     * 保存数据
     */
    const onSave = () => {
        form
            .validateFields()
            .then(
                async (fields) => {
                    try {
                        // 开启加载中
                        setLoadingModal(true)

                        // ID为0则insert，否则将update
                        const { code, msg } = fields.dictId == 0 ? await insert(fields) : await update(fields)
                        if (code != 200) {
                            return message.error(msg)
                        }

                        message.success(msg)

                        if (acForm.current) {
                            acForm.current.reload()
                        }

                        // 关闭模态框
                        handleCancel()
                    } catch (e) {
                        system.error(e)
                    } finally {
                        setLoadingModal(false)
                    }
                }).catch(e => {
                    system.error(e)
                })
    }

    return (
        <Drawer
            // 关闭时销毁子元素
            destroyOnClose={true}
            width="80%"
            placement="right"
            closable={false}
            onClose={() => {
                setDrawerVisible(false)
            }}
            visible={props.info.visible}
        >
            <TWTProTable
                headerTitle='数据管理'
                actionRef={acForm}
                rowKey="dictId"
                columns={columns}
                request={pageQuery}
                rowSelection={{}}
                beforeSearchSubmit={(params) => {
                    // 分隔搜索参数
                    if (params.between) {
                        const { between } = params
                        // 移除参数
                        delete params.between

                        // 适配参数
                        params.beginTime = between[0]
                        params.endTime = between[1]
                    }
                    return params
                }}
                toolBarRender={(action, { selectedRowKeys }) => [
                    <Button type="default" onClick={refPost}>
                        <PlusOutlined />
                        新增
                    </Button>,
                    <Popconfirm
                        disabled={!(selectedRowKeys && selectedRowKeys.length > 0)}
                        onConfirm={() => refRemove(selectedRowKeys)}
                        title="是否删除选中数据"
                    >
                        <Button
                            disabled={!(selectedRowKeys && selectedRowKeys.length > 0)}
                            type="primary" danger
                        >
                            <DeleteOutlined />
                            批量删除
                        </Button>
                    </Popconfirm>,
                    <Popconfirm
                        title="是否导出数据"
                        onConfirm={() => exportExcel({ s: 1 })}
                    >
                        <Button type="default">
                            <FundProjectionScreenOutlined />
                            导出数据
                        </Button>
                    </Popconfirm>
                ]}

            />

            <Modal
                title={`${modal.title}字典`}
                visible={modal.visible}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Menu"
                    form={form}
                >
                    <Form.Item
                        hidden
                        {...formItemLayout}
                        label="字典ID"
                        name="dictId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="字典类型"
                        name="dictName"
                    >
                        <Input placeholder="字典名称" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="数据标签"
                        name="dictType"
                        rules={[{ required: true, message: '数据标签不能为空' }]}
                    >
                        <Input placeholder="数据标签" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="数据键值"
                        name="status"
                        rules={[{ required: true, message: '数据键值不能为空' }]}
                    >
                        <Input placeholder="数据键值" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="显示排序"
                        name="status"
                        initialValue={0}
                        rules={[{ required: true, message: '显示排序不能为空' }]}
                    >
                        <InputNumber />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="状态"
                        name="status"
                        initialValue={1}
                    >
                        <Radio.Group>
                            <Radio value={1}>正常</Radio>
                            <Radio value={0}>停用</Radio>
                        </Radio.Group>
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="备注"
                        name="remark"
                    >
                        <TextArea placeholder="请输入内容" />
                    </Form.Item>

                </Form>

            </Modal>
        </Drawer>
    )

}

export default DrawerInfo