package com.liuyanzhao.sens;

import com.liuyanzhao.sens.utils.Md5Util;

/**
 * @author 言曌
 * @date 2020-01-05 21:32
 */

public class Main {

    public static void main(String[] args) {
        String userPass = Md5Util.toMd5("123456", "sens", 10);
        System.out.println(userPass);

    }
}
