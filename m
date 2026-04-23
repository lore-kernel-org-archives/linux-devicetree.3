Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E631DDBF
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776958007; cv=none; b=OEetH6pxX5rjvlDiqeF2phT151+EGYczqGEjo4EqBeHqiepeYhe+ycOm/W0oGsd9rqEQBokY5GQgFoktJz6Mkbow6aDo6PkXjvsv3dLQOYxsx5/y8E0KJqYWUhnuOX64JcMfTb4uKCaQCG//41oChaj16/uyF6tEL5uVTWqDxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776958007; c=relaxed/simple;
	bh=wwYO7DwkkIekSFcmdv7bcJkBJc0FpoK5IjA/HxnTUlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vzkr1Ak8JFBQTrEFzPRShpJKK04JGuCHdLG3/eYAA69b6Rdoys1xVqnAXZHuri0gTwaqOcHYNUa7Qav+6r8VN24vw5mePKBkijOhRCHRKfagcnJXKvAPu3ugmAsWFO8Yzt8TClHlUJqrXAvx8dTn10taPJSjAe8KJ/2zOoj8N10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiVG+zew; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiVG+zew"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b788a98557so23678515ad.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776958006; x=1777562806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sbCxB9IAysHGZN3vkH0WjlUgZYZZsosyMOgEIZiVEG0=;
        b=HiVG+zewQwcI06bi0CWly2GC7rMA/I4oJFaJ1/IaN0vR9Kj5HREc4NolABQACfaXiI
         lMuN3cal2AFB69+tm3MNz8QiHL6LnpxlmfW3ZMn9hwrUHME18EqmzvOCSRkwQtGAzvyg
         6uex4s4ZCirxS4qkVobBeizbkocZnIIR2x4EO3qbRA2Zj67Aw+OoOvUEppeCopvyBZBv
         +sXt9S6VIRV95xmZhKMmLq3mQIyscnb2yoi2BNRwTorNLnICzuRGZNSjqNVOeIwgSIAB
         DBXKFhlrJeudMTsDYdYdI3Cz7xrOADt7b5iiDUqT9RaYny/h7iKfYiRaQ+BVVMM6rn6B
         P5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776958006; x=1777562806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbCxB9IAysHGZN3vkH0WjlUgZYZZsosyMOgEIZiVEG0=;
        b=rbvYPiVAqOeIpApa82RsxzpXGmJQKvx6rjKkGycK+55Zx2IkXha91vT1nShE4zDMf2
         WACJF5sp+qW7xNcXtkcIKjH+hb9eY6sj4B1bBzsZyBafCBR6gYmqOoRfTehJjk4Yur57
         bscEStnASk7Rb2q8mTkgiNhr17xusnJitzLDoi2FWSYXB8QV7wxm8n6t2K3Gt+omFATP
         l5GzMEukHxNJIy3JgGKRZf4iANtLSe+X8VuYTEXafaobzllG6weCmIsIQnjsguY+dm89
         Spzuv/rrxWEDw4RQkfcxUh0As8JrzCv7JDP4bgIGtbndeui0SPBNTE1Y3ibz6GNy/Db9
         nVBg==
X-Forwarded-Encrypted: i=1; AFNElJ9fb36HCc8ztHGa9ynsszvz6Zd7iMWbZd2AG9ana3ls53vBRd/jC5Z5OC8vGKHzz2jHuZYIPP0eSukB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8RZKlWu1VSNfOaCAKVXLomz+euhpRliknfG59VYh4yqRAVxk
	AR33ETHcyVlRXonQv7FHbwxSn0tKR9c4fhQhPLwNrBGsdOBzWKEG31DA
X-Gm-Gg: AeBDievpPWtsUyeEGe6W5vSiNqFS174lA68PO1LY38paVpP7p3l/Pg6ebihmb+ZYcsY
	x4MGk1WpMs1w66Cry1RH5PzpqDgpsk2804o4j8UYJ4/CjiZbScgChCwH8J51F1e8V3kpqCpof9m
	LCV7JxJNTt7r4R3BJVIfjjRfQAY/w2jkz+MRvbhJNUA+ZyUubZSUBcF9KCbnqa1Dw9cFkNTpHgr
	Utzrh48QayTAQff+1+/nWEGp7F7FtZ95aijdwemt1t78qjpNucPtYp6TRk9n89VFbb/qCV8dkzC
	PiAjY2OZ9c1rUoPP+Q4E9svbtB+atVM2TW1BQURqr6beq/dxuq4ysG360JsLZcL3hHHX96yPSnm
	q1W/VIVskdbm613W2BsQy6e0FXn0lr9dIdpHVUjHz+Y81Cu/k/uWn+8UdokSs7HL6SmdXqnzDGs
	axHaQ65zkcXUCfGgbZs8sCUATtSBYBelTyyad7TecDlq8P3yR1HQX852szqA==
X-Received: by 2002:a17:903:4510:b0:2b2:a6a2:c8ca with SMTP id d9443c01a7336-2b5f9ed123cmr211804065ad.13.1776958005517;
        Thu, 23 Apr 2026 08:26:45 -0700 (PDT)
Received: from [192.168.1.7] ([115.99.233.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm239529415ad.6.2026.04.23.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 08:26:45 -0700 (PDT)
Message-ID: <4cbda428-ba64-434a-836d-9356980326ea@gmail.com>
Date: Thu, 23 Apr 2026 20:56:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mmc: st,sdhci: convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260409-st-mmc-v1-1-4c54321c3535@gmail.com>
 <20260416-merciful-bug-of-fantasy-f08d00@quoll>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260416-merciful-bug-of-fantasy-f08d00@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16-04-2026 14:48, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 07:43:16AM +0000, Charan Pedumuru wrote:
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: st,sdhci
>> +      - items:
>> +          - const: st,sdhci-stih407
>> +          - const: st,sdhci
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
> 
> replace maxItems with a list with description

maxItems is required, dt_check fails without it and I can add the description.

> 
>> +
>> +  reg-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      enum:
> 
> List order is not flexible. The only flexibility is presence of top-mmc-delay

Okay.

> 
>> +        - mmc
>> +        - top-mmc-delay
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      enum:
> 
> Same here

Yeah, I will define them as const

> 
>> +        - mmc
>> +        - icn
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    const: mmcirq
>> +
>> +  pinctrl-names:
>> +    const: default
> 
> Drop

Okay.

> 
>> +
>> +  resets:
>> +    maxItems: 1
>> +    description: Phandle to reset line of host controller.
> 
> Drop description

Sure.

> 
>> +
>> +  vqmmc-supply:
>> +    description: Regulator supplying I/O voltage (Vcc/Vdd for SD/eMMC).
>> +
>> +  non-removable:
>> +    type: boolean
>> +    description:
>> +      Indicates a non-removable device (e.g., eMMC). Also used for mmcss config.
>> +
>> +  bus-width:
>> +    description: Number of data lines.
>> +    enum: [1, 4, 8]
>> +
>> +  max-frequency:
>> +    enum: [50000000, 100000000, 200000000]
>> +    default: 50000000
>> +    description:
>> +      Maximum bus frequency. Used to configure CCONFIG3 in mmcss.
>> +
>> +  sd-uhs-sdr50:
>> +    type: boolean
>> +
>> +  sd-uhs-sdr104:
>> +    type: boolean
>> +
>> +  sd-uhs-ddr50:
>> +    type: boolean
> 
> No, drop all above. Look how MMC bindings are written.

Okay.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - pinctrl-names
>> +
> 
> Missing allOf with $ref to mmc-controller

Okay, then in that case I need to change the name of the node.

> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/stih407-clks.h>
>> +    sdhci@9060000 {
> 
> Wrong name. Look at other examples. You might need to fix DTS.

Sure, I will send a cleanup patch replacing the sdhci node name to mmc for these compatibles in a separate patch.

> 
> Best regards,
> Krzysztof
> 

-- 
Best Regards,
Charan.

