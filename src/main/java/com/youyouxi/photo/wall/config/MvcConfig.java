package com.youyouxi.photo.wall.config;

import cn.hutool.core.util.StrUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * mvc 配置
 *
 * @author chenjianbin
 */
@Configuration
public class MvcConfig implements WebMvcConfigurer {

    /**
     * 照片文件夹
     */
    @Value("${photo.wall.path}")
    private String photoWallPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if (StrUtil.isEmpty(photoWallPath)) {
            throw new NullPointerException("没有配置照片墙文件夹");
        }
        registry.addResourceHandler("/photo/**")
                .addResourceLocations("file:" + photoWallPath);
    }
}

