package com.twelvet.vosual.monitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 监控中心启动器
 */
@EnableAdminServer
@SpringCloudApplication
public class TWTMonitorApplication {
    public static void main(String[] args) {
        SpringApplication.run(TWTMonitorApplication.class, args);
    }
}