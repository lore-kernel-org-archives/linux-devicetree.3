Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D441305667
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996513; cv=none; b=ETi5gMxaPUighjC2BveruA1Kix3AH2BBf7XeCouTY8S1LshuwnkOGPah7NJNQZjJIaQft3ovX0uZSPphkEDj6fSNh7+yuwY0A/PlC/0TvGMjXRTl1e894H916v9Un1+Ve9dGBNupn4gx67+Jzvf85Xeo+pXcWT85VBrYG7rBsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996513; c=relaxed/simple;
	bh=m4XCWnn5tsuC+sYHI9m26Es3DnnwsD12gNQVZwjZIp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWojiVPahr6YKDInXMbpkvMMiNB3gq7eVb7+T5Ljbm1xd+YWdjuGwQHFYxrQ47cTTmy6KhNbHKpaWU7WlTtj2Zb5BBYGNAyhSlXaHVrnmEqmxmybboX4y4y8bzOTzlzaDeYIoC246jj7bPKrnFmbrKHba45USl5UKCs4sCKoM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dylWxxfz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dylWxxfz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so3768905a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780996511; x=1781601311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0o0LqIeARHGVNWJRSz7OmbFxoiBCC04C/bpvJasunoc=;
        b=dylWxxfz4xm+X0XnjEhRaf9zr1Of0kni5waoKiVR4mEc5NXQrGnvryHJCbJWYk+m8U
         Xe4EB8B2RF7Q5Qamhvchwn6RafdGZvaTIAPqUE/CRwhZNS3/HPXBqMKg9IxWc317uXFz
         fMwDPGPwc0XbHmdk8XId++JU846i7x6JFqCCqSLWEkSFQTtyb4oM6x55yM7uUauIXbUI
         fj4TIoLd1pRxdoJJF7Y6DlRfJJ6Zdq7pJ0cFXeeHbTy/4797Ua5DxpGe9P1TVLReQnSQ
         Xm0R4TNwMSlXPvLaSg4R/8dMk3kCn1yNtwb4tmWAOm+cehNwhSbfuPU2gN/tsr0PnHIM
         k+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996511; x=1781601311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0o0LqIeARHGVNWJRSz7OmbFxoiBCC04C/bpvJasunoc=;
        b=XDqW0NVnoWl7q8umySCbiBjrKhxRNI1CJSRhUBoCXpoYmAlL0Eve2yNcilfsvyYLJQ
         DjtCeOa4/5S5zjy4zQ5tGTf3f+9vJ0tMSHNJ2ZhjJd4E9L+Xqduh5fZp3bsKzc4T5B58
         eaGFjCd6UMMkG3hqMUVGSHoWv3Iiz59waG4UDDoapVsoS9nGbrGlQJuPcJmJswHNUlcu
         sDD6irekvgQd7mk3tkZ9t0BxYCRErV8O5/yO/6lBDC1PKyL3Yji1ntUD9+wfEtE8sJkn
         FfwQDHFkMQRDnTUck/bIK+olvjIuwVzymrxAE81kTmq8xcQEI2ZUgbO08x5IUoRAT/tA
         9ulA==
X-Forwarded-Encrypted: i=1; AFNElJ8b8prXfVxIupc7ZRrPbIa26IiFsCG6fQNs4y29jpAKOaXBF+y548K2/bWyv3zq08gkV2aJivl5eCY/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Db0kOKe7rhdnVJFzrSg+S99W4g4ka75jIx5qgQRaVN1u2UYf
	REdw/aK5TyL+bxpiJDuvDAg47N2Y4Mj87ROtKbWIPUXhrdQ3gewyrhfI
X-Gm-Gg: Acq92OEwmcTWWrT0LixJZYb4dojgCMKmPEK6RC5tt9r3R0Y8IRGSDnkXrlyWpW7vvmG
	DuDIUseLaXgRKqYvGsKALIz2VJD6nEHEYmxTTOjnlCjq/GAXMS4mQGrq1eqslZEdeLYXziAbEW7
	scXs4O9dfX1CQs3rIGi2iyWpW1NJ14O64/N3IK1/k8GttiUD2y5A/gFK8+wyBW0K8G9+4k/PhhD
	jX35EzCFrFZMMvZbq+7nm0h+Npm83M+43+QpVTMAxRYf9XPMXYtOx7ua6BuNzC4D2CiLi1uvSf9
	2CgUfd+j77ak8FZ7l5aZ/WxW3T+J7jK74XFR2tosXXFyqMJFZiG0G0RkmvV+C9dvtm5EQsl1G/k
	ZAraZ9dtr/+2tGBuxP+s0+l01Js+wN9EXXYyP625c5sI72VmHWmbC2IZcueNGgLdumd8SuSsCgG
	tRHodIVcOJYdImIrrjn5N7Hxfy2r7D90sczn5a+G9/+/K9aDyV6O8wuVONU5RR8CAcbUCDXGTiw
	5OBEGCLc/DfefQ=
X-Received: by 2002:a17:90b:6c3:b0:36d:6308:12fa with SMTP id 98e67ed59e1d1-370f0386f18mr21294469a91.18.1780996511281;
        Tue, 09 Jun 2026 02:15:11 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c76f55asm18560817a91.7.2026.06.09.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:15:09 -0700 (PDT)
Message-ID: <c480d9a9-9489-4801-ad7d-33ec4ffc3242@gmail.com>
Date: Tue, 9 Jun 2026 17:15:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: nuvoton: Add MA35D1 USB2 OTG PHY
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-2-a0987203069@gmail.com>
 <20260608-demonic-horned-honeybee-4f6bb7@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260608-demonic-horned-honeybee-4f6bb7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/2026 6:45 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 06:12:19PM +0800, Joey Lu wrote:
>
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Understood. The trailing "binding" will be dropped from the patch 
subject line in the next submission.
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-usb2-phy-otg
>> +
> Where is reg? MMIO is expressed with reg, not via custom phandle.
Understood. The PHY node will be restructured as a child of the syscon 
node, with a `reg = <0x60 0x14>` property covering the writable PHY 
control registers (USBPMISCR, MISCFCR0) within the parent's address 
space. The `nuvoton,sys` custom phandle will be removed; the driver will 
obtain the parent's regmap via 
`syscon_node_to_regmap(dev->parent->of_node)`, which looks up the global 
syscon list by `of_node`. PHY instance selection will be expressed via 
`#phy-cells = <1>`, with 0 for the OTG port (USB0) and 1 for the 
host-only port (USB1).
>
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  nuvoton,sys:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle to the system management syscon.
>> +          - description: PHY instance index.
>> +            enum:
>> +              - 0   # USB0, OTG port (shared with DWC2 gadget controller)
>> +              - 1   # USB1, host-only port
>> +    description:
>> +      A phandle to the syscon node covering the SYS register block, with
>> +      one argument selecting the PHY instance. Index 0 selects the OTG
>> +      port PHY (USB0) and index 1 selects the host-only PHY (USB1).
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  nuvoton,rcalcode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 15
>> +    description:
>> +      Resistor calibration trim code written to the RCALCODE field in
>> +      USBPMISCR. The 4-bit value adjusts the PHY's internal termination
>> +      resistance. When absent the hardware reset default is used.
>> +
>> +  nuvoton,oc-active-high:
>> +    type: boolean
>> +    description:
>> +      When present, the over-current detect input from the VBUS power
>> +      switch is treated as active-high. The default (property absent) is
>> +      active-low. This setting is shared by both USB host ports.
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - nuvoton,sys
>> +  - "#phy-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +
>> +    usb_hphy0: usb-host-phy {
> usb-phy
>
> And drop unused label.

Understood. The node name will be changed to `usb-phy` and the unused 
label `usb_hphy0:` will be removed.

Thanks for the review!

>> +        compatible = "nuvoton,ma35d1-usb2-phy-otg";
>> +        clocks = <&clk HUSBH0_GATE>;
>> +        nuvoton,sys = <&sys 0>;
>> +        #phy-cells = <0>;
>> +    };
>> -- 
>> 2.43.0
>>
