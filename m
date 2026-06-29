Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC40F3FC5B1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729654; cv=none; b=jl952BYkdal0kHeFdmgE1YbZvTG/eCeX4Qbx6p533YYSQ7VCE+MoWfTJ4WDEwQuRpuESTn0RP7q20v32cBb8oO2aHe7K+gCsF4e9r2xY1t0UC+NdOg3W7pDIVbPX4JNt/qlXrY7uFUR9CW5va59re5mFlGOnGU/8EEnnLjb86dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729654; c=relaxed/simple;
	bh=3Wh7nsekpafScjHFLfNOnyVP/d69BiHZls1kuOwqrrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efWsEqKqq4qzF2Z9o8c9NjErLmRb/ADLqho7wxre8/582gQavUFt/U4Kj1PlvRCYR1BGVUlelD5vRwKupZc6id4Btg9KdzlPdWeUW3178+Z2rdO6O2lno0zotAFDgrm2bfiFVgoWVRd/P7E0IDrmsS3JXQxHK8HrxCpPBUPosek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbu4zQrV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbu4zQrV"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-845c65e0a10so1509318b3a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782729652; x=1783334452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omopOdpKTyCcb7PSO2EkN5aJ0TMqkgpva2n1TsO3dC8=;
        b=Nbu4zQrVwSmHuu1g1fKTXIOINb0myyMItLZTBASBWJlTAKjmAb3YtlrcrXMAfpXib0
         oQ0rhuQpl+j7f2gpGZ1tkul/+lfUyPa/mLQhADiR/eJr8aEU75qhLQrjLpNOe9NEfCyO
         +inYLn+3FAOBg3lazdpTr1LZGvA4KvpcQ59Mih3MhytsTfzFuj4OqH4PdotgPVfw+X6r
         AQcuA44RhAJqz8zBX8rbQRm3Y0iUK2q0S4JUQ1LZZRQzSPnM4eiATKiKWY9Cy3s8uIVb
         8jWICROoQ4pQk0gR3J/l73y0OM6KpMVin0aRxXfcmf0CMNQNN3jAxOKj7evbq/9VGT7I
         kUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729652; x=1783334452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omopOdpKTyCcb7PSO2EkN5aJ0TMqkgpva2n1TsO3dC8=;
        b=bIs2obVztZMePGBslYtO42KR54aN45J2cXWS/gjsryH7CkCvsQGST5acq3NplzqoN0
         sL0wVjVcn6k8gIJx5aZYDdOY0WZPQ+t6LgMM2xd3KkjE1bghksC5ldiVQrH/ktt8n1gN
         FtNxmNrptXS6bkiA4bvbTJlNBDNNoPdmZUIWHjRO8oKqFli3c/Ve8QrPWfLDnpa8s/9y
         58OyiJwXedHt+PT1Q0jehJw4ff5WDYiJFH1sXYDnbZbgiHLDUSsLsDyrYlOps8Z47rM/
         0i/NIYXD9nf0C0NHDMCtn4kOXIcP4Sbpz1f8Vx6RjRYetaa4HFfZHR8yDHQSk8KSz849
         qJ+Q==
X-Forwarded-Encrypted: i=1; AHgh+RolpvJDaiQLoCRULPVwHBeRR949M3i2YcjoIvkoC0usaA1lz37fBXnIriedKzXdMC3N3lZdJKXAGTvA@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHIx1aAt4R3pX2pcrSvI4DXJ2lNIGlxi3oLk8+JmqJIYAAPnp
	XtgRgnQTs9UrW4BBBE+g16DJZBemIrLkOR4gPjtcFZZcy6POQd4Ds0ta
X-Gm-Gg: AfdE7ckAWz00G6IpCufl8dTBeSq/lWsPAESvNC1kjhr293xOjS0r8A/egFH5S//sLOQ
	Df9YpCbIBuZcDNpHX0fc22iEObgFmdytjeRMqflOsJb7+Yy6P2616mr4jZFUp36EV45Y5h3n9t8
	PbAUpkkivKXBVoArwVl+tQr4gc0c1ocZSKk4s3nzpSgRjweIs4cpWXdUIMfJd7Qli1smuG8twLF
	3/R0sne8oTFroa+mFBj5j+MK6v+QUQ9cEN75ux7e1+AZrl1gUJdPtAf46n1DBIp6Kz2SQ3pZYDX
	do8n5gFui6uUyPRY6sbFaXVobGHeFI5HXQf80dRvUk9zCd5bDEPZqpY1t/ck91EboGgvGzoLt1A
	LYxOOTgSbZQztTlbx/TEwaDxqvPx0QF8QZKda4I/05enYnpLDMniwB7XBNMFmdit/Qjdcki/lKK
	Ugo0kvvAtufSSMa2cwAZUbST7oWBN8fC4Yu7UjhEKR1oQ955pzfV7oGk0vmw5T2VRYwg==
X-Received: by 2002:a05:6a00:a253:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-8462f3d7595mr4441676b3a.58.1782729652146;
        Mon, 29 Jun 2026 03:40:52 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845cdc2ff53sm5565548b3a.7.2026.06.29.03.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:40:51 -0700 (PDT)
Message-ID: <24de6a00-ba4e-455b-baa7-479d1cc2edf3@gmail.com>
Date: Mon, 29 Jun 2026 18:40:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend
 for dual-port OTG support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625023958.569299-1-a0987203069@gmail.com>
 <20260625023958.569299-3-a0987203069@gmail.com>
 <20260625-sexy-black-tarantula-4031a6@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260625-sexy-black-tarantula-4031a6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/25/2026 3:58 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 25, 2026 at 10:39:56AM +0800, Joey Lu wrote:
>>   properties:
>>     compatible:
>>       enum:
>>         - nuvoton,ma35d1-usb2-phy
>>   
>> +  reg:
>> +    maxItems: 1
>> +
>>     "#phy-cells":
>> -    const: 0
>> +    const: 1
>> +    description:
>> +      The single cell selects the PHY port. 0 selects the OTG port (USB0,
>> +      shared with DWC2 gadget controller) and 1 selects the host-only port
>> +      (USB1).
>>   
>> -  clocks:
>> -    maxItems: 1
> This is odd, considering that parent does not have clocks. So explain me
> this:
> 1. USB PHY needed clocks.
> 2. You extend USB PHY to cover second part.
> 3. That extension for second part means that clocks are not needed.
> Really, how? How is it possible in hardware?
The hardware has two independent clock domains:

   - The PHY analog block takes the 24 MHz HXT as its reference, wired
     directly to the PHY's internal PLL, which derives the required 
operating
     frequencies internally. This reference path is entirely outside the SoC
     software clock tree; no software-gatable clock gate needs to be enabled
     for the PHY to power up and lock its PLL. The only software control the
     PHY driver exercises is toggling each PHY's Power-On Reset (POR) bit,
     which resides in the SYS register block. The driver accesses this via
     the parent regmap

   - `HUSBH0_GATE` / `HUSBH1_GATE` / `USBD_GATE` are AHB/APB bus interface
     clocks for the host and gadget (EHCI, OHCI, DWC2). They gate
     the register-access path between the CPU and each controller, not 
the PHY
     analog circuitry itself.

The original single-port driver enabled `HUSBH0_GATE` as if it belonged 
to the
PHY, but that gate is actually owned by EHCI0/OHCI0 and is already 
managed by
those controller drivers through their own `clocks` DTS bindings. The PHY
driver was redundantly enabling the same gate.

When extending the driver to cover PHY1, the same pattern held: EHCI1/OHCI1
manage `HUSBH1_GATE` themselves. There is no clock that belongs 
exclusively to
the PHY, so `clocks` will be dropped from the PHY binding entirely.
>> +  nuvoton,rcalcode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 2
> You should require two values. I understand that any PHY is optional,
> thus you skip the entry, so how would you provide value for PHY1 only?
`nuvoton,rcalcode` will be changed to require exactly two values
(`minItems: 2, maxItems: 2`), one for PHY0 and one for PHY1 respectively.
The property will remain optional overall; when absent, each port 
retains its
power-on default value loaded at hardware initialisation. When present, both
entries must be supplied.
>> +    items:
>> +      minimum: 0
>> +      maximum: 15
>> +    description:
>> +      Resistor calibration trim codes for PHY0 and PHY1 respectively.
>> +      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
>> +      adjusts the PHY's internal termination resistance. Both entries are
>> +      optional; when absent the hardware reset default is used.
>>   
>> -  nuvoton,sys:
>> -    $ref: /schemas/types.yaml#/definitions/phandle
>> +  nuvoton,oc-active-high:
>> +    type: boolean
>>       description:
>> -      phandle to syscon for checking the PHY clock status.
>> +      When present, the over-current detect input from the VBUS power switch
>> +      is treated as active-high. The default (property absent) is active-low.
>> +      This setting is shared by both USB host ports.
>>   
>>   required:
>>     - compatible
>> +  - reg
> That's ABI break which was not explained in the commit msg - neither
> specifying impact nor actually providing reasons why you break ABI.
>
> And honestly, you have no resources here except the address, so now it
> is clear that this should be folded into parent. See DTS101 talk slides.
The commit message will be updated to explicitly acknowledge the ABI break:
existing DTS files that contain a standalone `usb-phy` node without a `reg`
property will fail dt-schema validation after this change. The impact is
limited to the MA35D1 SoC; no upstream DTS for this SoC existed before this
patch series, so no in-tree board files are broken. The break is intentional
and justified: the PHY register block is physically contained within the 
syscon
MMIO range, and modelling it as a child of the syscon with a standard `reg`
property correctly reflects the hardware topology and follows the convention
established by similar sub-blocks in other SoCs.
>>     - "#phy-cells"
>> -  - clocks
>> -  - nuvoton,sys
>>   
>>   additionalProperties: false
>>   
>>   examples:
>>     - |
>> -    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    system-management@40460000 {
>> +        compatible = "nuvoton,ma35d1-reset", "syscon", "simple-mfd";
>> +        reg = <0x40460000 0x200>;
>> +        #reset-cells = <1>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
> Drop. Keep only child node and make parent binding example complete.
The example in `nuvoton,ma35d1-usb2-phy.yaml` will be changed to show only
the `usb-phy@60` child node, without wrapping it in the parent node.
The full parent + child example will be moved to 
`nuvoton,ma35d1-reset.yaml`.

Thanks for review.
>>   
>> -    usb_phy: usb-phy {
>> -        compatible = "nuvoton,ma35d1-usb2-phy";
>> -        clocks = <&clk USBD_GATE>;
>> -        nuvoton,sys = <&sys>;
>> -        #phy-cells = <0>;
>> +        usb-phy@60 {
>> +            compatible = "nuvoton,ma35d1-usb2-phy";
>> +            reg = <0x60 0x14>;
>> +            #phy-cells = <1>;
>> +        };
>>       };
>> -- 
>> 2.43.0
>>
