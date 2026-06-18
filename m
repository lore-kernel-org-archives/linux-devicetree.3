Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2B3F210C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787850; cv=none; b=KxNzRAPTtqhBMQHrUOZ3D8WMFBf/PJis1GPUgj8iQYYUTPxZvPjhSG6y++FUuOm0tnm0YBNT4HhqF4tyRxTuz5jggAeAp9oVROTAoap99kdUXX+uSanaPWOSMVA/V3I/hd+JEuUilXB4Iw7TT6aiIOm15SG5JJerx7GTstHMTyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787850; c=relaxed/simple;
	bh=J6Sw/dQgNmxN0/EMz0SfG6mVKF1zfca1vJnX/kjOmJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH6ZFXBmitMT2sW9DPvnYR0crgifSqbtxgmON/RbSVtCc64wZW44WVMzZmWsf4xz6/kEeayrON/HTvSTrk4pSUkN/G6ijibH1dr+2AKJ1eECkXWU8tNL6w9SNHnSRTwBE8sZoVErVpeCy4dD07Ge7wwK2PxFfu1U2RvNnstADIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1LSmo5q; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1LSmo5q"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ad544cde93so10866e87.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781787847; x=1782392647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv/G4FgIe0eCoDORK2JWlpclpJ0tr//RTe0aIs6WhTI=;
        b=U1LSmo5q9y2pX8H9YbHU69C0KVtJo0Xn3yXX8pwvMEJFhbiJuISPCZGj64DwTDOc7o
         BU+sYlM8wVjzz97SyrtPK3+0nnSW274A68Ztlp6wwy9aP6ZLJOrbZ8gct2u5PYk0w4KL
         V5DQX9//RNhF+o8EXidAV5JyrPMztOECbUcjI5xsRZIF+Qy/hs9WmW0oD9TpQBzqNVwn
         U98aImfzisE9lPtZsPUfDJcpISCHv8flPdNWT1hk67rigfT+D4OIwiLrRwzs8+Q8Ijhv
         7fzcaBxJzPBkvqqngeptSdBmtlQ4QntBvGAlxfN6/99BORUvxfbfdsiPCdQsPehVk+mQ
         FOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787847; x=1782392647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kv/G4FgIe0eCoDORK2JWlpclpJ0tr//RTe0aIs6WhTI=;
        b=eDlbe/huaj3MZ+TJEF7M1afrGb+cUTS5SpUsIhGacMvs8ZkH0rVlktF3ttbygBsovP
         jFYNS7BNvNwtruaUOCpfOMZdM/BCbmc+TNYJlqKEIlXQO0jyKRNJ2vGKwOAW2oiSdDtY
         PXjpjYLjhEqx+Og5urVAdP5m/tVAyiegN9qqo8pr+8agjgPA9lviFgCUaSPYijB5HvCb
         Z9YyEleJPMETh9V+Jy5ZMAanSuBdkK/5lh4ai39A3j4dVWBKItyOMcR4d2hLlIArozGJ
         DA7rv/4Rr069v9KbhTQT8IxEKf0LfbTbXpB31bm/fBgsZGGuaCOfs15jkD3U1n4KTDyV
         nuAA==
X-Forwarded-Encrypted: i=1; AFNElJ9tqQWp+VtWwZRKOO0N7YlVTpgjGW3ojC767/dISsl1/o1HNcOWhLdMezMcixEGcFYa2LM+qzNovsYn@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfhcn33WUYiz0MJsvizGBqMViMobrE2iwzIS1S5Un4RqLrg0F
	/jMCd35RwTnGNEpoXhIkaJifdX1MniACHXhiM9hVnKIaIT71OeKoX1N1RMIwXHg2ZDE=
X-Gm-Gg: AfdE7ckEkuJ3/TPDAot3BzHPZfgCEO9ZO7bzgYzeS2ecM/DHCNEW5Xi+HIdUabYD2vu
	eLTVeBO0BZVrbJlHvsWGsOT98POu4u3TPttE7IwyyOBa4LCHb70cFmC2jxr4wh/UP+L2q8+konC
	9AjbB25CdnNtTSV+Fxff6HTyDbybKykhZuHGR/8stTQQtTXSDfdf9tTei+CzNGqRwcRdYMcyWkP
	/T2gh2LUBbhuwsrY0j0x3gX/hh9RhzOsavDSJG6dk4/supt831JN7NXPKu7fX0PUt9ZC0ec1myZ
	zrF5idI1N9DA2d+ShKm1y2k7jrXY7qFFng9hRAfMXdrraZSrN+aU9ZjgvMZ9P1MdRB/rBh6zB3E
	Jhcs+glbQUH6GEkRBM5sRWkE81SdvHCmB5V6td9j/Rn0r1CovfcsbgT1e/BydPXPtgAwXtwKfjJ
	6ajsjFC4wqerQPauaoZt1Uq0wbw/bzP9QygaC/jUPcCKag/Sf+HDvQWh6Kb3MrjEtVE0o=
X-Received: by 2002:ac2:4bc5:0:b0:5ad:2ac0:9fb0 with SMTP id 2adb3069b0e04-5ad4dabf7d5mr716947e87.4.1781787847062;
        Thu, 18 Jun 2026 06:04:07 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad4cf526ecsm893796e87.12.2026.06.18.06.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:04:06 -0700 (PDT)
Message-ID: <594dbb69-0d5e-4bc1-9328-f0949e994a8d@linaro.org>
Date: Thu, 18 Jun 2026 16:04:05 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: og0va1b: Add OmniVision OG0VA1B camera
 sensor
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
 <20260618-og0va1b-v1-2-dda71bb83009@oss.qualcomm.com>
 <1a57863c-831a-411c-a0ae-da3d4f1fd6a0@linaro.org>
 <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <226a55a6-babd-47ce-b261-35b982d5c7db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/26 15:36, Wenmeng Liu wrote:
> 
> 
> On 6/18/2026 6:50 PM, Vladimir Zapolskiy wrote:
>> Hello Wenmeng.
>>
>> On 6/18/26 13:37, Wenmeng Liu wrote:
>>> Add V4L2 sub device driver for OmniVision OG0VA1B image sensor.
>>> OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
>>> raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
>>> the 640x480 (VGA) resolution.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    MAINTAINERS                 |   1 +
>>>    drivers/media/i2c/Kconfig   |  10 +
>>>    drivers/media/i2c/Makefile  |   1 +
>>>    drivers/media/i2c/og0va1b.c | 867 ++++++++++++++++++++++++++++++++++
>>> ++++++++++
>>>    4 files changed, 879 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index
>>> 5aa846c8479b20651291d5bd2e316308310f826c..85a06eb9eacc410a565b80d56979eaa565515d0e 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19891,6 +19891,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>    L:    linux-media@vger.kernel.org
>>>    S:    Maintained
>>>    F:    Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
>>> +F:    drivers/media/i2c/og0va1b.c
>>>    OMNIVISION OG0VE1B SENSOR DRIVER
>>>    M:    Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index
>>> 5d173e0ecf424f2f204f8d426be818e44357f8e4..56680772f5f47b4629c4e17f5a5feba08b1d94fc 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -363,6 +363,16 @@ config VIDEO_OG01A1B
>>>          To compile this driver as a module, choose M here: the
>>>          module will be called og01a1b.
>>> +config VIDEO_OG0VA1B
>>> +    tristate "OmniVision OG0VA1B sensor support"
>>> +    select V4L2_CCI_I2C
>>> +    help
>>> +      This is a Video4Linux2 sensor driver for the OmniVision
>>> +      OG0VA1B camera.
>>> +
>>> +      To compile this driver as a module, choose M here: the
>>> +      module will be called og0va1b.
>>> +
>>>    config VIDEO_OG0VE1B
>>>        tristate "OmniVision OG0VE1B sensor support"
>>>        select V4L2_CCI_I2C
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index
>>> e45359efe0e41e13e3c0869e5ead7d6cf4aca3a7..c60851c7fe07e3bdc511c5f482525ba7a044f48e 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
>>>    obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>>>    obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>>>    obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>>> +obj-$(CONFIG_VIDEO_OG0VA1B) += og0va1b.o
>>>    obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
>>>    obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>>>    obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>> diff --git a/drivers/media/i2c/og0va1b.c b/drivers/media/i2c/og0va1b.c
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..f0505b7ba7f329ad57ffafa8f90a24204f002d3c
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/og0va1b.c
>>> @@ -0,0 +1,867 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * OmniVision OG0VA1B Camera Sensor Driver
>>> + *
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regulator/consumer.h>
>>> +
>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +#define OG0VA1B_REG_CHIP_ID        CCI_REG16(0x300a)
>>> +#define OG0VA1B_CHIP_ID            0xC756
>>
>> This is the same chip id as of the OG0VE1B sensor device.
>>
>> What's the difference between these two sensors, and do you find it
>> possible
>> to add support of OG0VA1B sensor/modes into OG0VE1B sensor driver? Or is
>> it just the same device?
>>
>> Hardware specifics described in dt changes also does not show a difference
>> in comparison to ovti,og0ve1b.yaml.
>>
> 
> Hi Vladimir,
> 
> Both OG0VE1B and OG0VA1B belong to the same OmniVision VGA monochrome
> sensor family. They share the same resolution, power rails, reset GPIO
> behavior and power management framework.
> 
> But they are different:
> OG0VE1B:  8-bit RAW, lower FPS

The current OG0VE1B driver supports 640x480@120 FPS, 8-bit mode, however
the sensor itself has 10-bit image output format mode support also.

> OG0VA1B: 10-bit RAW, higher FPS
> and some registers are not same.

The very first one, which I'd like to see in the driver, is the difference
in the CHIP_IP register value.

> 
> The DT bindings can be reused, but would it be more appropriate for the
> driver to remain independent?
> 

It depends on the actual difference between two devices, if it is lightly
maintainable, then it makes no sense to add another driver IMHO, but this
should be established.

If the difference is about different mode programming, I'd say it can be
kept under one device driver.

FWIW on OmniVision website there are "OG0VE" and "OG0VA" product briefs,
the devices are very similar, but not identical. Obviously there are
Linux device drivers, in particular image sensor drivers, which support
multiple different devices, so having a single device driver is at least
a viable option to consider.

It'd be great to get comments from other developers on the subject.

-- 
Best wishes,
Vladimir
