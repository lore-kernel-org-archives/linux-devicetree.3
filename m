Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511770;
	b=UP49VR1Hgccf6eMhy6OrZG2JZy2W/jXoFBgFt+gbBBNIPVryIJqo4eJCgRLPVFQC4K7F
	 tFZGvheCeaa/8VuVC0bah8rj+9Mf/ZJnNARjWDUfhRgx4P/FYQpmFIfPEn0xTxhxyF+Xg
	 eO8j9ZLapLfg2zUkOkhFjLpRPwRQSN7c8uM92VtaTvfj9tqOi/uX9I9399hd2jGXXQ/PF
	 Zcr9+7yVqU1tv5gVb7iDeEWMNEbEi2RvfYX78M49YayLCfcfTj3aP8QfUQL2eOj5w2hX8
	 PWySZvQp56YGuUVyQFv2RyRMiNsTaZki0FGL6GQic+XAISWOAQnWsndgbivJL3waF9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fmAmCt8UxjgYWhWHzgyp6r0DP5B2fOuM65Nbsx1mc0o=;
	b=2PuKgdHa+hKBlYV6alXby1jd/ds6f0pkK9WNKib2Op+LoHGRt8lj687cdH9K57rY5da/
	 Bp36BlF/5m2p9Kj3+/3AszaUtUqd9v9HKVCyl5BZEGI0Rkx6q1hDjKDRtaqb+mdXbzt8I
	 wqK1B0nSst1AulzgLey+XmZIDxQYR91sfVkgELTQGko/G5WJVAJYozsC/5ixCmnaLA+eH
	 wlzQaGIwI4txYmByTpFYr3d8nDkqtNR4gYTPXGyf97zF8D6kcLOFeBFrH8ff/XBCOZ8z4
	 KsgZvjrC6pcdmcs4w9P7mLXqTmBpWLKne3DhgLr0WACn1aKFcxfOx2RqgYPRaIIvKrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3Kq1a+7;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6EE606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3Kq1a+7
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b10718b387so97368a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511769; x=1795116569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmAmCt8UxjgYWhWHzgyp6r0DP5B2fOuM65Nbsx1mc0o=;
        b=v3Kq1a+7ql5oXgGT5c5lV++J/+Xy84mJXUGN5XjMD5+8TAjEr1x0CdvJyIsiyjk6vx
         kYpzDJ07P60CYudM1VSkmCQBxlMgsBS1UL000ihMP1rphUVkbdaoPQAnK9z3gXwlxX1I
         KWxO7gpwnuyT8KIj9aeXi+yFZQzXinwp8QAhBe/c19ehH8x2YttA4WJRhWRZd22Yo5YQ
         rIeHTWA6JiKSHqu3uuId+1Z9PImRBknKVRNpfEviK97tHsu78NJFnRo5St0C1q+GMPug
         bKsu9JZz7gcq/7WoYfvBkHKMSaUVl1iMWI3hbvNfPs96KfE1OdJfH+7sWwVSAEC4xDlN
         g44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511769; x=1795116569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmAmCt8UxjgYWhWHzgyp6r0DP5B2fOuM65Nbsx1mc0o=;
        b=QrTs7SLp524y7boWUW5szOu1LWj74BctVE6kRzrc2zpi/kONHPcMI+89p1PRAU9sBH
         bYhtuVyYEj0yK68Kre8EsqGnvqqCS+usYuBMabaftWuYWDOsf5zNVgAo8Wkg4IuQiqpG
         Sii57v+vT21VNRTnZhb2e+FHwCxQ5dBFhcP4lCT3HI9nSYhoEBbCLdR9oBsrnYpAssih
         M7MEolmZMulxQttoHLhSrA5nVSUHiOP+c23CmoYnqdS68RsPexJlLy5jY2qn9BDRGmqR
         48/2Q713ikXoGoKMO9Mg12DWWzyRAvq1rN0Otw/+AOvt1jaXm5kLdm2pc0QJGvrmdSdu
         ArBA==
X-Forwarded-Encrypted: i=1; AL+hErFpnbjBMXgdW2LIEChPvUFRupvmxj9OE9jsB7G7KnIolKSWEECwQd0PtmQVp5KftnBPh+V9g9TqZP8c@vger.kernel.org
X-Gm-Message-State: APuU4Z83ydWgR6Hyjy265IXb2dKpCO5cO1QNEFIJD2vlDZTXxfjZwtOk
	zfVvO8uuYPXPPNF6InYtgJWAac2hDaADuQzBnrgIJpP9D3B13+5+olC3
X-Gm-Gg: AYBFou1Il2abnKwOGtDSurr7Mwyaa4BrbBRaPMaI1PlH0RfImwU/8SPFuY5/7Mbk268
	Cz8A3O4ijBXaweoEdy0FZHOP5nFafsx1miVvkzVo0oRQ6xpQPzF52td+fwi4mMSEegnD56WLaoL
	AJCgiMALl1bFGmqaRjP39ex/4JETKW9vhFAvI2rferpRcOswmVQqOHQ7Hv8zng9ymU5ANGZgPKN
	p0xbTqw8RptHX+Kb9A+m4Qn7DDFtfgR8Xr4SeLy5fTjE1h680TdgclgxHAgbvkbgP1Bsg8LJgwc
	4sjYHQTqvNHVpZVulW8rYqcWdIGiBenrvIuYOw48xzNjGanXVvsNlZkdOC3eNYcOQ3rjIVVQBQQ
	ZFOXJ79QXSLnva7vyUpJTw9ct3cNlqEzoLUDrtZG0QSc+AXmdV1Rn3wQDV3F1Z+nlQ8KraYA/rf
	FxHDub+0zIkVag2/Zdn014YtGoG7Wi4+mCbsO5smP2lGMBB6t9wFtt9sgtkqYB1icmZL6+9c2So
	k9yHLwe3AIdNdc0cj+EKhFTwTWsky2Rr+AEPP5Hc2VtODr7eOWfF9FASyMgZzf/zuZ2pgDPAgcV
	wMVxUOYIgav4I+EuguSfIpnH2Dhae7RHoKCWy3PvtkbU9IKC77flkR8=
X-Received: by 2002:a17:90b:1f8d:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b1b0a20e04mr73493a91.37.1794511769226;
        Thu, 12 Nov 2026 11:29:29 -0800 (PST)
Received: from [198.18.0.1] ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm5972639a91.9.2026.11.12.11.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:29:28 -0800 (PST)
Message-ID: <f0b7f100-f8cd-4e58-8a67-beda34ad4d06@gmail.com>
Date: Fri, 13 Nov 2026 03:29:23 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-3-cyan2254650260@gmail.com>
 <20261112-mottled-formidable-galago-eb933b@quoll>
Content-Language: en-US
From: Pufan Jin <cyan2254650260@gmail.com>
In-Reply-To: <20261112-mottled-formidable-galago-eb933b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/12/26 7:08 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2026 at 11:29:17AM -0500, Pufan Jin wrote:
>> Add devicetree support for the ALINX AX7Z020B development board.
>> The board is built around the ALINX AC7Z020 system on module with a
>> Zynq-7000 (XC7Z020-2CLG400I) SoC, 1 GB DDR3 SDRAM and 32 MB QSPI
>> flash, and provides Gigabit Ethernet (JLSemi JL2121 PHY), USB 2.0
>> host, MicroSD slot, dual CAN buses (SN65HVD232 transceivers on
>> MIO 10-13), I2C RTC/EEPROM/LM75 and the serial console on UART1.
>> DevCFG FPGA manager is also enabled.
>>
>> The two SMA AD inputs and the spare differential pair are wired to
>> XADC aux channels VAUX1, VAUX9 and VAUX12. The XADC hard macro is
>> always accessible from the PS, so expose these channels via the
>> driver's xlnx,channels property.
>>
>> Link: https://www.alinx.com/
> Drop link. We do not advertise websites, unless it brings some value.
>
>> Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
>> ---
>>   arch/arm/boot/dts/xilinx/Makefile             |   1 +
>>   .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++
>>   .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
>>   3 files changed, 213 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
>>   create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
> ...
>
>> diff --git a/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
>> new file mode 100644
>> index 0000000000..472d9fcaaf
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts
>> @@ -0,0 +1,142 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * DTS for ALINX AX7Z020B Development Board
>> + *
>> + * Copyright (C) 2026 Pufan Jin <cyan2254650260@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include "zynq-alinx-ac7z020.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>> +/ {
>> +	model = "ALINX AX7Z020B Development Board";
>> +	compatible = "alinx,ax7z020b", "alinx,ac7z020", "xlnx,zynq-7000";
>> +
>> +	aliases {
>> +		ethernet0 = &gem0;
>> +		serial0 = &uart1;
>> +		serial1 = &uart0;
>> +		mmc0 = &sdhci0;
>> +		spi0 = &qspi;
>> +		i2c0 = &i2c0;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "";
> Drop bootargs, why do you need empty ones anyway?
>
>
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	usb_phy0: phy0 {
> just "phy" or is there phy-1?
>
> Best regards,
> Krzysztof


> Drop link. We do not advertise websites, unless it brings some value.
Agreed. I've removed the link in v3.

> Drop bootargs, why do you need empty ones anyway?

The empty bootargs is not needed. I've removed it.

> just "phy" or is there phy-1?

There is only one USB PHY on this board. I've renamed the node to "phy".

Thanks for the review!

Pufan Jin

