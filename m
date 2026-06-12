Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC01A4F3C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224387; cv=none; b=FLCVk7vrThGXxMkRtFS3WOtyV9UKWCPxl0+oEccQEXQN/5S/PErCwEI5hLQv+vj0AbVIJdSvcMAHrcM/Sd50Zq32bnZfEGR7UoQ0Rv/7zEo5EUxuJbl2Zxhx7PpSQoSyF+Ga98ety8dlq1Arx7YGxmqRN9tY7efv7ZKvfAgD8Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224387; c=relaxed/simple;
	bh=4ZGkqYncW6FCKmTFfthiEaEQ0KaMfkbOjRiXFrR5ruI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHVk+CmQ60ovKdGIrObu8vjYS3MJ7hHeljsIDHz7rF1aFsTTK3u/Ch3G8zO+og7UK0N5PqzyKrTY24AWgSBlNCbhSo6/L2kETdrqCskNiRQA6dQ56XmKLUnUTooqG4JrZJv0xuudFz7QL8bAHEzeoMXVByyalWIvoOdspDntFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cc2/iuHI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cc2/iuHI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b944f6edso4130495ad.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781224386; x=1781829186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDFF/uetcCRW1wRDCYb9fakGqH6rrdtEO+ThtsQms1Y=;
        b=cc2/iuHIB4MaEIU+bcd1PEaW4isaJfQZATbw7YGI0hmK6EKyLTI7f2OOXTFk4fDLMq
         1lXgeADAz898tU+iyVslF0tibY+SwnsZ6eqZzfCUwYFDpYdAyro49N35u9ZR1a+sDNb2
         Q0nzPqe+yeY8pe2d+bwl05o7yybVYX4hfrMgTwBmpy6L8vrHn7Eer9rLkzCpe6Z7hEoS
         O8mb0b+O0e2nSCnZ7+5uSm6Tw736oBQzDGpQee75E5pY/vqx3jfFcQA6PvlJsXBrVT4d
         mIbxXGGk4+ddtzoBCPXfVbO45hlu6X1wCIqYbBrx/qDx1O2TbLdNJDQR1n5gjoK5SPij
         7lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224386; x=1781829186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDFF/uetcCRW1wRDCYb9fakGqH6rrdtEO+ThtsQms1Y=;
        b=rdSJMmORTeQcsGz+sPYpOFaIwNBIagjRZYhIVsBN67YTswv4MZqpeLwTllh1H46/sh
         0J73K5opT2Qi21Djsygg9pO8Ezzh6aCciw7h+/s/BQ3ByX/tHyfqJxisoelDbmcQ3hBE
         8aT6fAdI06jUGfDxSkkBbwZqqmjjviEwESVpTMmiTBr4z0r5BDzdEVyp8dyIMA4uVEF4
         LoEbkulitQIumu/p12lG6vfL4wR3xQg7Bvq1kmUBd1q3XCmatp3WRkaDqXDnMcbTu/ME
         ffOTN9v5cmZ9Vj9OwGvwciRM4Sxwgux2QRLEGclGqwfSfCSStNk4UFp7kLEHBJDcBW0t
         uPPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KAadP/DhUo0Ec3iAcmCSGOuzSjMXq6Ev8ohrsF3EY5yVwcL90572ciZXCe4gNgwCqKpaK37YK6T0D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9f7dNci5ixHkgxDWhDeopHnQL7bzFzf4K3OCAQGbwGzs/LWNZ
	trS7UXdZkEnWAbzbTIvyX4ZUoJcTy+AHgijdV6ZCulLVKYTIDaVj758X
X-Gm-Gg: Acq92OFMYgyFCzBTo7+KBn0iRW3+RjZQvVjfZFg/uY4Ol9/61llsGFzXAx3klxHxkWa
	8vyk/lK1vcatAP9ZhCPMbQNZyebOHGeqj28uMtJWIEuGIS9H1ipw4PWGvgSQUNuhUMUxT4HO+kI
	GOEUPPfd36Lhww6UPTU8jdj7Zm4DAAwh/c98+MFJEImkhD12z4TseeBmhSFdRLof0s/Ov6Fb6EH
	rOVP0F0vWfsDFjcZZYf+qFIxsLPytTcBSmPyEJQm1fKdbkIBgzen8zhq9FlHC54q6int8sSL/8/
	huGJ4XPVDYKBsnJhITIWZBucklHv13tT7NY9en4Go9j+z2j8hGgXiXDfRk72f4ZNrXbbvQK6NgK
	tbLzodj6F0Mpq29P+QIclVZa1GV6JYbguS4YIUXDmK296jxHXEKPLHt60wcN/N6CKa3eR0Z/JAi
	K7dybhXTSbxjPcY/ErW6RetKLYrxgcpHdgq5hN9LzWRFsjcQhBQhy8Jf86/DiWc32Oo+MudNzuW
	cU=
X-Received: by 2002:a17:902:d58a:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c411f73c91mr7474725ad.28.1781224385550;
        Thu, 11 Jun 2026 17:33:05 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6511sm1291275ad.24.2026.06.11.17.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 17:33:05 -0700 (PDT)
Message-ID: <0031379c-0cc3-40c8-8145-5b1991b42f05@gmail.com>
Date: Fri, 12 Jun 2026 08:33:01 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton
 MA35D1 QSPI
To: Conor Dooley <conor@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260611091246.2070485-1-cwweng.linux@gmail.com>
 <20260611091246.2070485-2-cwweng.linux@gmail.com>
 <20260611-decoy-glamorous-81903a5fd1f9@spud>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260611-decoy-glamorous-81903a5fd1f9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Conor,

Thanks for the review.

I will add a default value for num-cs in v4:

   num-cs:
     maximum: 2
     default: 2

The controller has two native chip selects and the driver currently uses
that hardware default.

Best regards,
Chi-Wen

Conor Dooley 於 2026/6/12 上午 01:34 寫道:
> On Thu, Jun 11, 2026 at 05:12:45PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
>>
>> The controller supports SPI memory devices such as SPI NOR and SPI NAND
>> flashes. It has one register range, one clock input and one reset line,
>> and supports up to two chip selects.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> new file mode 100644
>> index 000000000000..d3b36e612eb0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Quad SPI Controller
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-qspi
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  num-cs:
>> +    maximum: 2
> Missing a default of 2, unless you make the property required.
> FWIW, your driver doesn't appear to read this value.
>
> pw-bot: changes-requested
>
> Cheers,
> Conor.
>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        spi@40680000 {
>> +            compatible = "nuvoton,ma35d1-qspi";
>> +            reg = <0 0x40680000 0 0x100>;
>> +            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk QSPI0_GATE>;
>> +            resets = <&sys MA35D1_RESET_QSPI0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +    };
>> +
>> -- 
>> 2.25.1
>>
