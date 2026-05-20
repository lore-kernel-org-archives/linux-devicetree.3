Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E4330652
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 03:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246604; cv=none; b=ZxMFufjr3+i0VqBFYHbwFORqyfcBBv7YIfBp8ciYMpgf2kyYlyfWR9+4Xbu8dc78XakBYisf0xG++8aVNA3lBk3yCcAxBHdEQfFMR/jYDXDFtjZrzPr9TRTXDfBM9e0XL87BJyjR5EuG8Rc9gYd4FY9jpJ9tj2Y6MWBsgnC1XdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246604; c=relaxed/simple;
	bh=RAIKr5dAc5cSz5OtYS/boEiYq0kemDWO5e9ehaEz8Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dB/m9WKWHPJJ03IlNbo/N/eJMCtSlIakI7LfyaE4pnI1WQjo2vREGmQmY+100ngmNBD09cllJiaNzkMNBM3/R5n8XgteFGz4G8+z/fH0uY5IqSJk+4eLrZJSStOksDiP8BqZtGiSR7vi44U1R7FmkoKzZv66xCUVInEti8aw/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S14JLk19; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S14JLk19"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8025f1c227so3583477a12.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 20:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246602; x=1779851402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tlGxYsdCeIeMZ+N+hOExxK1vNZUEfTSzZ60NUH8zxXI=;
        b=S14JLk19pv3S4BZ8CvG5przNlPiIjiTJetYJeXDe2XPDCQNdegVyZKFvD3hc1nVwI8
         4SsnQPBmFxU7Q0aT+EXsRZnK32pCKpHRQyIfqED/Z5+SDHv4t6qakBAz9R+a/6nNXR6H
         ynPA+MyJTY790u0J0vbHs7dOXl4YjR6iP6kIow2+5poCpngPq8NBbGyE7Bs0LlZbXP5+
         kqfkg3mUh9w/gh2DOd4Nq2kXlh2Q6yEzxbQ1R9ypkMDtKQLy7C7/25V4fqL3YcFBSQyZ
         cqE1mkxXUoidg8i/TkmzeqVmNoL0JOc2mI7s2SWnKs/gty5jPPAvwYwqf28DpB7Nnc2C
         jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246602; x=1779851402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlGxYsdCeIeMZ+N+hOExxK1vNZUEfTSzZ60NUH8zxXI=;
        b=REUgDJWJwpMf/VAibLoAId4trhpyD0nQiFzma3eMRdDs9ii/Em8wT62Ke0F/bwtyoa
         gKPpa3B8mHgP0XExoo6Q7NdaqNMiqjxbOX0RZwdEagq4Y3aMWX0TW8kVRDQ31dR34v41
         737cFTzE9wLccxIvJ0zqEWdRZKDLydMhZ+N5zm1w4qh5DgZU/WSIKyw1iKadqZpeeS6O
         uCF9lvpF1Rda5hMj8zrBSeI3pRR0ajBPcXBRMLcSRdQSLM/FABhihMlzOVLaMpvgnWsy
         +0CVztOqus4QQBt0ED/uFBIPyqilHE0djmKfZ159+OiYe0TO04+0Ogue4pHlC+MRAeIt
         AVtA==
X-Forwarded-Encrypted: i=1; AFNElJ8aa2UnGW6x/StJwj/gxE0Tut0ZTXiJulOyvqeaIOeM7Fk9fPbnaT19/auNhjZO6+nzB5IPhZqVl0Xu@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhKwkFogSJYVk48Ttf3EtvKtB+glnOgeyjYvRree5RcXbPi0k
	LtlJf3SZHors41rDGme7Eixfc/WEANXbT+kdSte0X6zkBryYbhT7AdeITd2vLQ==
X-Gm-Gg: Acq92OFrBTvGDhTfNlPewRCyxO3KjjoEDePoEoEYEHM2yVWUMs93RowlKWgHudqYoRF
	Uogz3QArLMeM/e9pZb34x/C0vgIASPbEzgpr9RCe+uoPwXaYxygWL7d/sduKoyGl/ZgAQ6yXUeo
	2rRg8HscOO9MhzLodEYPSx4GR19gsePpdZLBh4cAbOUC0tBs3EcmhRyORJnOKJ17b66NsY7t8tw
	/aXUypQVyNyFZDh63Yql5hbVCYDmLPPsPSiQx08LVGZpcDxbBf0JzHlInkpRfRQ9rmNgzxGRsUx
	Nw41R+6avzA6ZF34wzCEDBJihOfP0fYf7KAg7HHntiyHw61xzm2avc2lFk5OQSj8mJrGeboGIlR
	Uiq8QO7EFXsPLA7q7mCuoIsznOyU6sipwIEKlQRIIr2io9kWsLvdF8TCsx0O32JPFIsJke1y+cF
	KhJNLr8EBck1aYdj4G6HgkdsGL19ISjVOO1EiWTMapPKUdArUSb2qRwY079qs91XRrxjwvM+e0N
	dyi
X-Received: by 2002:a05:6a00:198f:b0:82c:20ba:1570 with SMTP id d2e1a72fcca58-83f33d9828dmr22226850b3a.29.1779246601737;
        Tue, 19 May 2026 20:10:01 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977c494sm18877770b3a.21.2026.05.19.20.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 20:10:01 -0700 (PDT)
Message-ID: <fb2ddf2c-36af-4118-95f1-081542e5a804@gmail.com>
Date: Wed, 20 May 2026 11:09:57 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/verisilicon: add Nuvoton MA35D1 DCU Lite
 display controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260519055114.1886525-1-a0987203069@gmail.com>
 <20260519055114.1886525-5-a0987203069@gmail.com>
 <4d3c239ff1c560791668e571c5e6ab58c08ea002.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4d3c239ff1c560791668e571c5e6ab58c08ea002.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/19/2026 3:44 PM, Icenowy Zheng wrote:
> 在 2026-05-19二的 13:51 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCU Lite display
>> controller.  While its register layout is broadly similar to the
>> DC8200,
>> several differences require dedicated hardware ops:
>>
>> 1. No CONFIG_EX commit path: framebuffer updates use enable (bit 0)
>> and
>>     reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging
>> registers
>>     (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT, FB_BLEND_CONFIG,
>>     PANEL_CONFIG_EX).
>>
>> 2. No PANEL_START register: panel output starts when
>>     PANEL_CONFIG.RUNNING is set; no multi-display sync start register
>>     is used.
>>
>> 3. Different IRQ registers: DCU Lite uses DISP_IRQ_STA (0x147C) /
>>     DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
>>     TOP_IRQ_EN (0x0014).
>>
>> 4. Per-frame commit cycle: DCU Lite requires the VALID bit in
>> FB_CONFIG
>>     to be set at the start of each atomic commit (crtc_begin) and
>> cleared
>>     after (crtc_flush).
>>
>> 5. Simpler clock topology: only "core" (bus gate) and "pix0" (pixel
>>     divider) clocks; no axi or ahb clocks.  Make axi_clk and ahb_clk
>>     optional (devm_clk_get_optional_enabled) so DCU Lite nodes without
>>     those clocks are handled gracefully.
>>
>> Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
>> differences.  After chip identity detection, vs_dc_probe() now
>> selects
>> vs_dcu_lite_funcs when the identified model is VSDC_MODEL_DCU_LITE
>> (model register reads 0, revision 0x5560, customer_id 0x305).
>>
>> Extend Kconfig to allow building on ARCH_MA35 platforms.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
>>   drivers/gpu/drm/verisilicon/Makefile      |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
>>   drivers/gpu/drm/verisilicon/vs_dc.h       |  1 +
>>   drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78
>> +++++++++++++++++++++++
>>   5 files changed, 87 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
>> b/drivers/gpu/drm/verisilicon/Kconfig
>> index 7cce86ec8603..295d246eb4b4 100644
>> --- a/drivers/gpu/drm/verisilicon/Kconfig
>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>> @@ -2,7 +2,7 @@
>>   config DRM_VERISILICON_DC
>>   	tristate "DRM Support for Verisilicon DC-series display
>> controllers"
>>   	depends on DRM && COMMON_CLK
>> -	depends on RISCV || COMPILE_TEST
>> +	depends on RISCV || ARCH_MA35 || COMPILE_TEST
>>   	select DRM_BRIDGE_CONNECTOR
>>   	select DRM_CLIENT_SELECTION
>>   	select DRM_DISPLAY_HELPER
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>> b/drivers/gpu/drm/verisilicon/Makefile
>> index f4fbd9f7d6a2..bf88f627e65c 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,5 +1,5 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_dcu_lite.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index c94957024189..77bc63c629f7 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   		return PTR_ERR(dc->core_clk);
>>   	}
>>   
>> -	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
>> +	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
>>   	if (IS_ERR(dc->axi_clk)) {
>>   		dev_err(dev, "can't get axi clock\n");
>>   		return PTR_ERR(dc->axi_clk);
>>   	}
>>   
>> -	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
>> +	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
>>   	if (IS_ERR(dc->ahb_clk)) {
>>   		dev_err(dev, "can't get ahb clock\n");
>>   		return PTR_ERR(dc->ahb_clk);
>> @@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>> identity.model,
>>   		 dc->identity.revision, dc->identity.customer_id);
>>   
>> -	dc->funcs = &vs_dc8200_funcs;
>> +	if (dc->identity.model == VSDC_MODEL_DC8200)
> Don't do that. The model value is only for matching hardware values,
> not for detecting what's present. Don't forget that DC8000 has a model
> value of 0x8000, but behaves similarly with DCUltraLite with a model
> value of 0x0.
>
> I suggest adding another field for assigning helper functions.
>
> My suggestion is here:
>
> ```
> enum vs_dc_generation {
> 	VSDC_GEN_DC8000,
> 	VSDC_GEN_DC8200
> };
> ```
>
> Thanks,
> Icenowy
Understood. I will add `enum vs_dc_generation` to vs_hwdb.h and a 
`generation` field to `vs_chip_identity`. Each entry in 
`vs_chip_identities[]` will set `.generation` accordingly (DC8200 
entries → `VSDC_GEN_DC8200`; DCUltraLite → `VSDC_GEN_DC8000`). The probe 
will then branch on `dc->identity.generation == VSDC_GEN_DC8200` instead 
of the model register value.
>> +		dc->funcs = &vs_dc8200_funcs;
>> +	else
>> +		dc->funcs = &vs_dcu_lite_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index 45172c1a525c..d77d4a1babdf 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -66,5 +66,6 @@ struct vs_dc {
>>   };
>>   
>>   extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +extern const struct vs_dc_funcs vs_dcu_lite_funcs;
>>   
>>   #endif /* _VS_DC_H_ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>> b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>> new file mode 100644
>> index 000000000000..11ef57d5ebaa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dcu_lite.c
>> @@ -0,0 +1,78 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
>> + */
>> +
>> +#include <linux/regmap.h>
>> +
>> +#include "vs_crtc_regs.h"
>> +#include "vs_dc.h"
>> +#include "vs_primary_plane_regs.h"
>> +
>> +static void vs_dcu_lite_bridge_enable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dcu_lite_bridge_disable(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_begin(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_flush(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_enable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dcu_lite_crtc_disable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dcu_lite_enable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dcu_lite_disable_vblank(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			  VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static u32 vs_dcu_lite_irq_handler(struct vs_dc *dc)
>> +{
>> +	u32 irqs;
>> +
>> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
>> +	return irqs;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dcu_lite_funcs = {
>> +	.bridge_enable		= vs_dcu_lite_bridge_enable,
>> +	.bridge_disable		=
>> vs_dcu_lite_bridge_disable,
>> +	.crtc_begin		= vs_dcu_lite_crtc_begin,
>> +	.crtc_flush		= vs_dcu_lite_crtc_flush,
>> +	.crtc_enable		= vs_dcu_lite_crtc_enable,
>> +	.crtc_disable		= vs_dcu_lite_crtc_disable,
>> +	.enable_vblank		= vs_dcu_lite_enable_vblank,
>> +	.disable_vblank		=
>> vs_dcu_lite_disable_vblank,
>> +	.irq_handler		= vs_dcu_lite_irq_handler,
>> +};
