Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048D4534A9
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519573; cv=none; b=G9sqj9VhggC9DkjXZMIc1bFs70V+Y4A2KUtWf+jqe55y5xGekNPhGeVJfqyxvWZG8ikXF3Al8ZZb0ez56ZRsXbPIw6jzR4/HO6j3Hgv3t1f1vjhzgJx9hOSv+LXE6IGUguSpM5Hheplbyf7hNorcJz0NO7BEef8A5KDJiIilX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519573; c=relaxed/simple;
	bh=xBnjbcfEInuD7wKHlSXA5W30KWw7QfpToPZZ3oihvOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBzazp9N/FIL+VXdfrOO8nT+6E3zpp0NWk1uoSvctv4TIf5bu+BfJP+kdJoLdEj+7VXAKFyZf3xjhhPIrW22/MHRMHgfGfT6Kg5ZS+kN8wXnld8/GWLGjzrsWmR+Hvs6opAwsfoL67/wuBsVxdOjY+2L5pbay5clcxPUX79Q8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpFkRk7F; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpFkRk7F"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c6b6c54b3so842651fa.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785519569; x=1786124369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vN26vxm6o8zanEQNz46PhpMvu2bmYdDVwJynhP9O2Ag=;
        b=JpFkRk7FsV9Wvui6IFJqREAw1pqV/kXqEAosytqe2gRJ4Gj6qtzDfCHNlJb4xMkGwR
         2+fMpPEJrnclbKwyNMe99YXAYHk+266+pEHp1JbfUYzkZwDO0lOOxVPc5b2jquFGOtE2
         FYSY1xijEQpdsRVNUg/fldlAQWbj8bjmKHGwEyTJylcd9G21f653AyhI/BQRqEJdMo81
         tUgN6/blKoIBr7FmrHgt87IiJVkV2/AmvMuKV1opc+071HCBUtASXwaVzRSFXkQTX9Oa
         mKwr3JWGSIGcRgUV7ZRBPdFsiaLq8K39s1XuDmj2GYqlEd+5oCDOiCaLWOSxKtnnl+XM
         I30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519569; x=1786124369;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vN26vxm6o8zanEQNz46PhpMvu2bmYdDVwJynhP9O2Ag=;
        b=lNZ4J2OGuPefsy8sx5VW0uhpT+/gpGoMesosAXBSQQLexmvRAUDa3CobpKjlLQfzGU
         KlEbnncqA3NzYBNoLx/6mv4mW+NQh2a1uwklwkI4f2l0mqISteZVZ8pY0Q+DvkwZzw0l
         mRahnS54N63ijvhD6INRxPrJWDhobVUrT7Uy57pqiMJ+pvV0OOsD7KbTE4hMdoxhbewv
         n/3rNHApl/U2RrjkHov1GlIei/W85qgWDlEuNnXdijGS8wr32C5l6E4rvhpQeT9+gkaN
         +JK0WdJDZGaVjnaXcO8zE0lNB4YuCImS73r112Tmc4k5GtvAoyzlcp3FpWEfc+mBHCHk
         2WUw==
X-Forwarded-Encrypted: i=1; AHgh+RqwP2HU7Eu9gwXQ2P7+Yti57c04BT5CJmR2a5qHCaI//ylIHMxLqBWJXpIU1rd9q87seItsNcja9FEl@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcOXJv/4/lo0sqxe/YcvJVdcleZC9fqrUx6mhq67iVVnauMqN
	06kH6wNvkwBVYb9KwUGo1KB4vNMgf4/TWuFH/jbeTguiAaK1msQyPufanJYhonj5d9s=
X-Gm-Gg: AR+sD11a4v/EaN453Ri3PMxeKbOFcalk/k4m11eedp3HF/l0k2xTLYoX1YKT5mc+gSG
	9JZ1BsXmTRtFsfe5aJWCmnREWtdc92EIlq3x1L9WUfzIAmC+JVw3UMPfWAlmvv/gW1oUFoB7u0D
	P4Vntujy/pcD+D+d9I/wwEsHRcQWXv52DvcwayQ67Jl3CYmAQTlH0TOpuAuSkzM4LdbjJpXajQM
	o+a/H58vhld3jiZSORRCIWkTJCfsuS4Mr9xWDCkWDe04ETtsgGXuPLGqTmMSOTaZFGUmeEPy2Jr
	rqOaRf7JxSjJk0yGicWrR4FFjQR9X2Irs1o0X0R2itnQZW9G7/EglO0tzpBBHWYmYQQTw8VSejz
	jI/9dw1zk7KMe8QRDnd7vIMKGXeFjzGS2LvvmxW1pcSpksuMX7l7z/R7M5qMbC4V+phcrFF91Cn
	ocqmQI/o/4bWx8I0cSV8ZT097fwpy+OHYDxtPxf6BN0rN2eg7r3+AoZCHAU4Q3N/OQwohRE2al5
	tyZ8CJJHq6U7s/wOcuhy2ELW29dfwy4zLDvDe6y5nu5uVl9OA8TCw==
X-Received: by 2002:a05:6512:39cf:b0:5b1:4fde:61a with SMTP id 2adb3069b0e04-5b2e4f50524mr160505e87.2.1785519568497;
        Fri, 31 Jul 2026 10:39:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cf68esm466117e87.34.2026.07.31.10.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:39:26 -0700 (PDT)
Message-ID: <2fcdea3f-8588-40b6-9686-52756dd19d26@linaro.org>
Date: Fri, 31 Jul 2026 20:39:25 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com>
 <20260724-sk5jn5-v2-2-871d3b9a2e47@oss.qualcomm.com>
 <2b5753f2-d5f4-4957-b865-f06b842af3de@linaro.org>
 <d5f579a7-b04b-4feb-8d6f-ae6e76e51f60@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d5f579a7-b04b-4feb-8d6f-ae6e76e51f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wenmeng,

On 7/31/26 11:24, Wenmeng Liu wrote:
> 
> Hi Vladimir,
> On 7/25/2026 3:22 PM, Vladimir Zapolskiy wrote:
>> Hi Wenmeng.
>>
>> On 7/24/26 12:50, Wenmeng Liu wrote:
>>> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP GBRG 10-bit
>>
>> I believe "GBRG" detalization here will be incorrect, if you consider image
>> flips or odd crops.
>>
>>> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
>>> exposes the standard controls (exposure, gain, vblank/hblank, test
>>> pattern).
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    MAINTAINERS                |    1 +
>>>    drivers/media/i2c/Kconfig  |   11 +
>>>    drivers/media/i2c/Makefile |    1 +
>>>    drivers/media/i2c/s5kjn5.c | 2835 ++++++++++++++++++++++++++++++++++
>>> ++++++++++
>>>    4 files changed, 2848 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index
>>> 244c7ed5872aa0972a7b055d7e0b19d530820a08..6f6edae5de13efc0cda6c91ab8c9a40bfe2cbff9 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -24195,6 +24195,7 @@ M:    Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>    L:    linux-media@vger.kernel.org
>>>    S:    Supported
>>>    F:    Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
>>> +F:    drivers/media/i2c/s5kjn5.c
>>>    SAMSUNG S5P Security SubSystem (SSS) DRIVER
>>>    M:    Krzysztof Kozlowski <krzk@kernel.org>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index
>>> 7ffccba897ae5637bd0cb913e1e04f9c7d0c89f5..06b5dbc32cab328df8d10da04d91a708bff6fdda 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -824,6 +824,17 @@ config VIDEO_S5KJN1
>>>          To compile this driver as a module, choose M here: the
>>>          module will be called s5kjn1.
>>> +config VIDEO_S5KJN5
>>> +    tristate "Samsung S5KJN5 sensor support"
>>> +    depends on GPIOLIB
>>> +    select V4L2_CCI_I2C
>>> +    help
>>> +      This is a V4L2 sensor driver for Samsung S5KJN5 50MP GBRG
>>
>> Same comment as above, I believe "GBRG" should be either removed or
>> generalized to "Bayer" or "raw".
>>
>>> +      10-bit RAW MIPI CSI-2 camera sensor.
>>> +
>>> +      To compile this driver as a module, choose M here: the
>>> +      module will be called s5kjn5.
>>> +
>>>    config VIDEO_T4KA3
>>>        tristate "Toshiba T4KA3 sensor support"
>>>        depends on ACPI || COMPILE_TEST
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index
>>> d04bd5724552e88fc2ad39f9bbaf9b4ce1763939..45019ce20a6c34c8139b8247b6904c3abb1a8fe7 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -133,6 +133,7 @@ obj-$(CONFIG_VIDEO_S5K3M5) += s5k3m5.o
>>>    obj-$(CONFIG_VIDEO_S5K5BAF) += s5k5baf.o
>>>    obj-$(CONFIG_VIDEO_S5K6A3) += s5k6a3.o
>>>    obj-$(CONFIG_VIDEO_S5KJN1) += s5kjn1.o
>>> +obj-$(CONFIG_VIDEO_S5KJN5) += s5kjn5.o
>>>    obj-$(CONFIG_VIDEO_SAA6588) += saa6588.o
>>>    obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
>>>    obj-$(CONFIG_VIDEO_SAA7110) += saa7110.o
>>> diff --git a/drivers/media/i2c/s5kjn5.c b/drivers/media/i2c/s5kjn5.c
>>> new file mode 100644
>>> index
>>> 0000000000000000000000000000000000000000..865db808aabcf7d910acbdab8126b9fa308ef875
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/s5kjn5.c
>>> @@ -0,0 +1,2835 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Samsung S5KJN5 50 MP GBRG 10-bit RAW MIPI CSI-2 sensor driver
>>
>> Same comment as above.
>>
>>> + *
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>
>> Let me ask, which interface or declaration from media/v4l2-ctrls.h
>> is used in the driver? I have a feeling that it's unused.
>>
> 
> It is required. The driver call many interfaces form it, like
> v4l2_ctrl_new_int_menu/__v4l2_ctrl_handler_setup...

my bad, I stopped at media/v4l2-device.h above, and my question is about
this media/v4l2-device.h header actually, can you please double check,
if the driver uses anything from that header or not?

I wrongly copied a definitely used media/v4l2-ctrls.h to my question,
it was not my intention, sorry.

> And thanks a lot for the review. ACK for the rest, and I'll address them
> in the next revision.
> 

Thank you! I will try my best to review the driver without a great delay.

-- 
Best wishes,
Vladimir
