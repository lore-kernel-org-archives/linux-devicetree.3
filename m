Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CCC175A9D
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 01:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791250640; cv=none; b=LM+icGxwQ0dJ/wYnKr5HTrpMtv20aJtPbNZebqo2LIKgwF957XdogmY21YtPMH5oy+h1DZAJsI/el6T/ghUa/CerzCXLt3XGN+eMiEUVzJ3zZdOzfgujXh5F9RfGiYiYSQDpFPCOxO4PTmVLg6bueRUkKxhIguxc5HorP89hZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791250640; c=relaxed/simple;
	bh=MwhIUu8284tsPXQflMPNAg1Eksl24JjpDL1h+L6/E6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSPzOWM1nI4yb7Ay8vsx0Xtn19p2mf4rHDc62Bgu/NG9mPbZWV2Kc+0nb2FzghuL2g4zJrJfJe9hlGHfF0NAgxb7edXh5LFSLNr9RAFprVY1ZMPxBlSuEJnRpeUWZrfFquCEDjvKEUKMs/+sIo5tD+IVk7A7gv9kBmzh8tvQcOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pzla47UY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pzla47UY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a7bf792424so1464712a91.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791250638; x=1791855438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=;
        b=Pzla47UYTFp+ISe1/LXeoK4CMO8yMX26zRKkKxaOVsBzJGYEbvk/r5sV9AUtm60Qfc
         qcRfzBiTk4x5XlIV1kqchITQSLvv7F9OTncEzz+SXQ6GJPTbTCfCjNi97R7kob5YPJ6v
         Nb8t+u7e1S4VQDGVyV7ZScMHk6jOQgkfiLXPc4Q0Hsw1RvoKRMGoIkE2P/ivH/tW7Fjh
         n7SJ1tEvW6LtMEBeDEGgt2lP6ejKjq8jCgWF0QTrsuFNgMlTcY8H91EhfqgufoqiOu6h
         88sRidQDMdherE7U2D7GUUPN9xcL2gjf2SJBYbOr6QOilNCzw95RU3sEp384MnXeB/dA
         a9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791250638; x=1791855438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZvrpE+UCMWuW/cWov2L5qNAmDeOn4P8WPzJ2s8dPcc=;
        b=Pn0x42D6qfqfI46tINvPBSCZuWv0MVwj3GjxsHyQqhcoJPmj8tyxMLTkCsE4M86ZY5
         1HTBMiA2md1m9BLom2GeN8jBdTXfTEeac5e4cYL87jcfNmClQBxQYvqAjAvgg+MRPZxr
         P6IRDHisg1O3nDCFHLnpsdTY+peXFtntAP7ZKUzlWJK8OtTG4Qm/KQX8r/BoKW2/YHXK
         0/xGkDpmoGZw+JEwP173c4LzQPKufe0YFPrXBsR+wczqUqT6FsAAhaaD7ZaDyD803cNt
         JE4nwOtF7CVCxd7gGBjT2XLZe5qV7Zd3KjB9KhoIf9WkvwqR4N3+aXJDbmiBw9I6SUx1
         cS5g==
X-Forwarded-Encrypted: i=1; AKwUvByUnW8djS8LYUYIbIv7LzLB9evmiip+06eFNOTwp2pNqSfJHQOjA/25q+X2ymu3g//pQVNHtyX7BIA/@vger.kernel.org
X-Gm-Message-State: AFq9FYLE/1pAwAgEGJnS+4V0h4hkomlHBtW8cGXjUu1qtcWRWkVLU6Ah
	vK6thsqxaQUT1ooK+qWxUbtkxQUIa/L/S0/f4fEQ/h72a2bf3dZkWnaM
X-Gm-Gg: AYBFou2wVAwQoZsNSL5WfpaAp1J0uFSstJaRfu+hzPiOQB6cq4uT1GplNcu10uX+p2M
	OVcW/4Pwht8v7JCO/y/gX/6bpjrZSJTKFezb0a6AWHRQLa93EZQNrstebedsYDHYbmq3lNiZdkS
	zI6KHB8FS6cHhjrTtGmyFeLylkcqAOOriWD8RAsh3z6a4S/ZC+FICIC0Qtp+hTQVsm8h3f8h+X6
	TqVC1vflmvzKx8XZxkvV9/zZlCeoSL3jS9LoXzL7Yu+Um9gLUR3ROoZmpxicvU7XPoyBvjyQyZW
	Ot4aorL/J3VNyPhM1Uul0dd46O0gqL3hwDTumGMamk8v1WBNx+l+ey8UrqX5cvbSUYxBYo6E1D0
	Xd/hXn14PCrohPAYTIZP5r6NV9MgERwWqQuapWtWZepITEhjv9IAy+F4CAGcBxfFPNUrFwVKeqz
	m/K5733Sqe0rJ2a4CI8K1wxk1fJ3eCnfqIldVbR5qJMCV/YKXy8XVk5iTSVBeJt8JLc3l8gwHTL
	P3Z16s3E6Fd0p1ZLid8wtYgWMbk/dU9w9pth9pOmIJ557VjFMihMSM=
X-Received: by 2002:a17:90b:4d0d:b0:3a7:ecab:c4d3 with SMTP id 98e67ed59e1d1-3a7ecabcdc5mr4934553a91.23.1791250638290;
        Mon, 05 Oct 2026 18:37:18 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543ab76bsm2081598a91.13.2026.10.05.18.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 18:37:17 -0700 (PDT)
Message-ID: <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com>
Date: Tue, 6 Oct 2026 09:37:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asN29Gi71MIA-2fq@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Vinod Koul 於 2026/10/5 下午 06:07 寫道:
> On 29-09-26, 10:08, Joey Lu wrote:
>> PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
>> PHY1 control bits shifted 16 positions relative to PHY0.  A separate
>> driver for PHY1 would duplicate this logic, so the existing driver is
>> extended to manage both ports.
>>
>> The original driver polled only DEVCKSTB after releasing PHY0 from
>> reset.  When USB0 operates in host mode (USB ID pin floating or tied
>> high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
>> exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
>> phy_init() call from the EHCI driver.  The init callback is changed to
>> accept either host-mode or device-mode clock stability, whichever
>> asserts first.
>>
>> The power_on and power_off callbacks are replaced by a single init
>> callback that handles PHY reset and clock-stable polling, because
>> there is no PHY-specific clock gate on MA35D1; the PHY analog block
>> derives its reference from the HXT crystal.
>>
>> A read-only USB role switch is registered for PHY0 to expose the USB0
>> role to userspace via the standard role-switch sysfs interface.  The
>> .set callback returns -EOPNOTSUPP because the hardware mux is fully
>> automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
>> is not enabled, the registration returns -ENODEV and the driver skips
>> the role switch gracefully without failing probe.
>>
>> Two new optional device-tree properties are implemented:
>>    - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
>>      codes to the RCALCODE field in USBPMISCR.
>>    - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
>>      the over-current detect input as active-high.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/phy/nuvoton/phy-ma35d1-usb2.c | 286 +++++++++++++++++++-------
>>   1 file changed, 211 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> index 9a459b700ed4..547c7d55d8ff 100644
>> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
>> @@ -1,11 +1,16 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * Copyright (C) 2024 Nuvoton Technology Corp.
>> + * Nuvoton MA35D1 USB 2.0 PHY driver
>> + *
>> + * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
>> + * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
>> + * PHY0 switches automatically via the USB ID pin.
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
> Not correct, this should be updated to 2024-2026, you dont drop the
> copyright notices, you update them!
Agreed, will fix in v7 to preserve the original 2024 date and reflect 
this series' changes.
>>    */
>>   #include <linux/bitfield.h>
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>> -#include <linux/io.h>
> why is this dropped?
This driver never did direct MMIO access (no readl()/writel()/ioremap()/
__iomem), even before this series - all register access goes through
regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
unused include already, and it's dropped here as part of the broader
rewrite touching this include block. Happy to keep it if you'd prefer
not to bundle unrelated include cleanup into this series.

Thanks for the review.

BR,
Joey
