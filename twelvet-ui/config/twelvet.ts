import { Settings as ProSettings } from '@ant-design/pro-layout';

type TwelveT = ProSettings & {
  pwa: boolean;
};

const proSettings: TwelveT = {
  navTheme: 'dark',
  // 拂晓蓝
  primaryColor: '#1890ff',
  layout: 'side',
  contentWidth: 'Fluid',
  fixedHeader: false,
  fixSiderbar: true,
  colorWeak: false,
  menu: {
    locale: true,
  },
  title: 'TwelveT',
  pwa: false,
  iconfontUrl: '//at.alicdn.com/t/font_2059726_06tmsv6poz9l.js',
};

export type { TwelveT };

export default proSettings;
