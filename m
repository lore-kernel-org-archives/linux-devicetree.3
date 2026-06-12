Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A472236F0
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243602; cv=none; b=jsqvbrZZT3+o1mJYBb9c2bP7IoeZNm6QOtTXuIypWsQEAuzYXbFHnVxvU+MI58P6iK8nr/TuW6HbVL1UI4VjvidFYUcw3eleDPgjCfxp8gYwxWoEoZxzaqP8UrsanOTVwQ5BL+FenbznAdajw7Mfy+qSV9gbBY5bKsr3OnlWzKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243602; c=relaxed/simple;
	bh=8fuPxEshqy9pzH10g76mgXq9fxOuzRzGLosN2v81KUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1HUeWJUWcAkPYYd8NK+hJf/0MfUMYV/lm/YuCvhjUdV50a6pjsnsLO5JG17YFKld6L1mYMuR/h1ou+j/snMIDG+3qNR7sA0ONKQ2UhwWhpTZAUqPWNKSnl4godzzC8jgj0z+JcKLT8z4+PIx4wUzVj/ogH9sep54dQub8HuEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIXNSni3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIXNSni3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c858cc9870aso765736a12.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 22:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781243600; x=1781848400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/je3/phVFkxTSj46mlyxqk6IelVNMtxa/1bdYhVDBUI=;
        b=jIXNSni3qWBoKSRPQjva4QcHJ0jhgz/niIDVsAdjo3Jn7Bij3CC4fdDpYPpWSwvCcg
         gZ1JNK2IQCsBDyVzB3KCK68acX23tMGCctGJ4wOYp75fniImRLOHkoSW5scNiZWqVupp
         zQOEoNn2XIQmamwFu8X/n2BR3vgyAI0bA2c2RSr6PN3HOzyugbFAMEG1YFpcsAuL/quY
         sJKBey/xNDUgQNe4W9Bk6ifokhCyKHrPLsNdv4TfrBIFTU5PifXYPfqIrur2FH63ubr5
         afg+/GP3JhHkWMwmCTUT1RxEG5tV89JtwrnMQvXtGi2i6OEjvDgRf94nFhTndViGzJBk
         SZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243600; x=1781848400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/je3/phVFkxTSj46mlyxqk6IelVNMtxa/1bdYhVDBUI=;
        b=Y5XrFTZikNC5foohBV0Xdzu5dVfpnPUSYVZdyA8Jy6lcIUOg88aVHcxiz3aLLDlpI3
         A1AR7hfMhfbAN1v35FZgufNYY6Buewzjs8/wv72/Va8AaoMCdipo4G/zx0QzVwiFY30O
         mSH4n5E1O+/173htlH+YcvENOH12tEteID64QOUtH6uO2xnmMXGwHPSdawHjHTskruEs
         VFMSTp/Qv+u9SNAvPOigF3B4i8PMqeei7Qegicz+Mz3L6Pj89xnQi40E/yzkHT7HcMWp
         OHCPfWV1A/C3eiU8T+d38Grq5QCvOsViqSwFZdZdN0gAXJ9oi1cBHguzHpNLI9kwhz03
         qQDw==
X-Forwarded-Encrypted: i=1; AFNElJ/5TrSX3SQ9BmkA0w7X6IMK3PFg539IVkNJbwNvXiEV1ed12urOCmP+7Xfh9b+zBVWiyQ6fYShXr8Mo@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpQ6ulGq+oGOpLXCvfReIqLRsoe3nuYeSSmnEf7a4WqRMBoiV
	eGdaODG0vNmFkQTqR7R3pD+yQ2mCwgpPqI30wJhOgRuEpPxY97Y7Ldze
X-Gm-Gg: Acq92OG9iV/1mXQ/hOaXbpfyg56qh11HWnHFTeb+gWc/ZmXkbpWtvdH8X3dIMnqxOzD
	int99D5+ohJMxoQ1rERcuyjIACHN3PCBNu4ScvBvicv/fXaplORT1B5Rd+aZJQggfXnjwFWq4cn
	i86y49mdzxO5lDzgwMEvF99gL7w2WPuDE6+Ky0opvxSFFJWrsJjRwIOcQ/AtS/OBqsjXRTdfP6w
	vlLfYqnKPQ19KT+Cx2CBbgyUI64VyP6k4EsZcpo+tXu6H4kyCV0AGYTigCt4CIoxHkq8kJkfIVU
	BDalfweM8RmB1M4w2EUUMtlnX00fWK30W5WKXCPL/B7bEGvl+5advaT2gJkaFgssOzZ8ZJtjaba
	ZlDBGecVQ7LJspYHjO78qKD8EKPLwZrMQow7aBdX/jzlKMClkqixyUHzRQ+irTdN73YAvhPlkw6
	utd2kUO++p7VRR5PakhZUWHjUWprOKjtu63o6jbMDPzPjQGn2Zk3mecg/wkN6+NjazzB09MZvcY
	UE8
X-Received: by 2002:a17:902:e94c:b0:2bf:21e6:bae1 with SMTP id d9443c01a7336-2c3fca68d95mr18444785ad.18.1781243600085;
        Thu, 11 Jun 2026 22:53:20 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f24sm7915955ad.3.2026.06.11.22.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 22:53:19 -0700 (PDT)
Message-ID: <3730c4a3-ae0b-47dc-af4d-ac1ed800e952@gmail.com>
Date: Fri, 12 Jun 2026 13:53:14 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-3-a0987203069@gmail.com> <aiqWSGCuhAK7hoY9@vaman>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aiqWSGCuhAK7hoY9@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/11/2026 7:04 PM, Vinod Koul wrote:
> On 04-06-26, 18:12, Joey Lu wrote:
>> Add a PHY driver for the USB 2.0 PHYs in the Nuvoton MA35D1 SoC,
>> intended for use with the EHCI and OHCI host controllers.
>>
>> The MA35D1 SoC has two USB ports:
>>
>>    - USB0: an OTG port shared between a DWC2 gadget controller and
>>      EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
>>      the physical USB0 signals to the appropriate controller based on the
>>      USB ID pin state.  The DWC2 IP is device-only in hardware,
>>      so host-mode operation on USB0 is handled entirely by EHCI0/OHCI0.
>>
>>    - USB1: a dedicated host-only port served by EHCI1/OHCI1.
>>
>> The driver implements:
>>    - Power-On Reset sequence with a guard that skips re-initialization if
>>      the PHY is already operational.  This protects PHY0 when the DWC2
>>      gadget driver has already run its own init before EHCI0 probes.
>>    - Optional resistor calibration trim via nuvoton,rcalcode.
>>    - Optional over-current detect polarity via nuvoton,oc-active-high.
>>    - For PHY0 only: a USB role switch that exposes the hardware ID pin
>>      state (PWRONOTP[16]).
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/phy/nuvoton/Kconfig          |  15 ++
>>   drivers/phy/nuvoton/Makefile         |   1 +
>>   drivers/phy/nuvoton/phy-ma35d1-otg.c | 264 +++++++++++++++++++++++++++
>>   3 files changed, 280 insertions(+)
>>   create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c
>>
>> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
>> index d02cae2db315..5fdd13f841e7 100644
>> --- a/drivers/phy/nuvoton/Kconfig
>> +++ b/drivers/phy/nuvoton/Kconfig
>> @@ -10,3 +10,18 @@ config PHY_MA35_USB
>>   	help
>>   	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>>   	  series SoCs.
>> +
>> +config PHY_MA35_USB_OTG
>> +	tristate "Nuvoton MA35 USB2.0 OTG PHY driver"
>> +	depends on ARCH_MA35 || COMPILE_TEST
>> +	depends on OF
>> +	select GENERIC_PHY
>> +	select MFD_SYSCON
>> +	select USB_ROLE_SWITCH
>> +	help
>> +	  Enable this to support the USB2.0 OTG PHY on the Nuvoton MA35
>> +	  series SoCs.  This driver handles PHY initialization for the
>> +	  EHCI/OHCI host controllers, including per-PHY power-on reset,
>> +	  resistor calibration trim, and over-current polarity
>> +	  configuration.  For the OTG port (PHY0), it also monitors the
>> +	  USB ID pin and registers a USB role switch.
>> diff --git a/drivers/phy/nuvoton/Makefile b/drivers/phy/nuvoton/Makefile
>> index 2937e3921898..3ecd76f35d7c 100644
>> --- a/drivers/phy/nuvoton/Makefile
>> +++ b/drivers/phy/nuvoton/Makefile
>> @@ -1,3 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   
>>   obj-$(CONFIG_PHY_MA35_USB)		+= phy-ma35d1-usb2.o
>> +obj-$(CONFIG_PHY_MA35_USB_OTG)		+= phy-ma35d1-otg.o
> Have you considered reusing usb2 driver with a different power_on
> function? Or handle the differences internally in the driver. There are
> few similarities in two and some things are different
Thank you for the excellent suggestion regarding reusing the existing 
USB2 driver.

After further evaluation and local testing, I verified that it is 
entirely feasible to reuse the driver. Consequently, I will drop the 
separate phy-ma35d1-otg.c patch series and submit a new patch set that 
extends the existing phy-ma35d1-usb2.c mainline driver.

In the upcoming patch series, I will expand the driver's capability from 
a single-port PHY0 peripheral driver to a dual-port manager supporting 
both PHY0 and PHY1, while integrating OTG features.

BR,
Joey

>
