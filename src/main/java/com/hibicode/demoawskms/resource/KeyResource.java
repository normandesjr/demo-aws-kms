package com.hibicode.demoawskms.resource;

import com.hibicode.demoawskms.credential.securityCredential;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/keys")
public class KeyResource {

    @Autowired
    private securityCredential decrypt;

    @GetMapping
    public String getKey() {
        return "Key: " + decrypt.decrypt();
    }

}
