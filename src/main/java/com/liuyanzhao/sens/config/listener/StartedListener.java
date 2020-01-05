package com.liuyanzhao.sens.config.listener;

import com.liuyanzhao.sens.model.dto.SensConst;
import com.liuyanzhao.sens.service.OptionsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

/**
 * <pre>
 *     应用启动的时候所执行的方法
 * </pre>
 *
 * @author : saysky
 * @date : 2017/12/22
 */
@Slf4j
@Configuration
public class StartedListener implements ApplicationListener<ApplicationStartedEvent> {

    @Autowired
    private OptionsService optionsService;

    @Override
    public void onApplicationEvent(ApplicationStartedEvent event) {
        this.loadOptions();
    }


    /**
     * 加载设置选项
     */
    private void loadOptions() {
        Map<String, String> options = optionsService.findAllOptions();
        if (options != null && !options.isEmpty()) {
            SensConst.OPTIONS = options;
        }
    }
}
