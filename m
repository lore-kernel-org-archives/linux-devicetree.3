Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C12D3A7C
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782705250; cv=none; b=EQ14CS+vnU9XmueN89q+nZijhUWo5t9a0Ik1lDy/YuNyE0uSphKSWF2sGH90gU9XRC6ANoSqXWfD8Pt87OGnMiY4AM47syeDqNI7ko762sgdR5dMDyrayyiEpwBtezcVmOm6yfzPlYIAnQy5P2BRyDb3snklfsF1Il1YbWpby9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782705250; c=relaxed/simple;
	bh=5umHZV3H/ot1rNNXhRIqLlTbIixDu6He53sSu2yb9LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDeO2jvaTEU7eiBZBpe5GWjU4UGfNo6XfVm0XC2qGIH2of8vF2btLaHjd8XShovB6SAURQNZXKhtgzkDNNJTBWEGfx9k/9n7yQi22ZTldv2B/TqCiHwii6RzBFV30MfI2/Zp4eDM/zVRWg4PtuIVR+WvazmoUo+AZg/Nw4bgd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRhUYCbJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRhUYCbJ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c99672293cso12229525ad.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782705248; x=1783310048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFFcFveTYAjTv+ZdiJ5NifJ7wIuGpllPfX6b0xg96Fk=;
        b=HRhUYCbJxlktNk0URRPUqLiVZZ2sGfmMQTj5K8UxphFoxnlFTftlpjrS9fcHXfF84n
         WA9N0l1sb2+OT1KxNAGGaUCJNnOSwscLvpSrx5nyt8NV7kU1TmQsVDpHVqfJyurkSW1B
         kfXSWqP2BgOuuJxld5g7xkDi9u31fAAVmgA6pqr0uUAaHflntLHk2ZxJ0dqSk/Zw2OGB
         yIl5XHlqaQ+3tetUPYxGH8xLcBdTgHJbSQbXVTJeaTV7X+Tl6KZaOA/VCyWm8JwQHLlM
         fFC+EVmAfY4FVqR1UuRpV8cD7okAm7BagUo3hi63MCNcfzm7off/UTl+iIVzU9cnd7af
         Y/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782705248; x=1783310048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFFcFveTYAjTv+ZdiJ5NifJ7wIuGpllPfX6b0xg96Fk=;
        b=GVEDU2Dp1uydP7JB11y8lkkrss8urjxYQvBTya6M4U1nED9KkJTrm3eONyYLrIb0FT
         Fx83Fv7XcZ8gNJh9pddRn7Lr1f2/xLw/oFW8XaHue/N7GUA2hh56T48IxBZoMbEYGsxG
         GcG5RDgPPJVqS3eyxtvvcGdUnsLRM7cAHOABS2KgJEib/DibJL8j/6ksXgUGhceHXf9X
         e+4xocBlO8xR6JIXPGLBqN+4l8p7LmqgdHkkD73et1VcFeZ4yXeUlLwijWA1z9db/TGX
         qsERAA8ftpYzbawOoEZydkSOQnq+AnYXAn4Dby9WpSM0XjUoBGPNjtCmoyrydHWX+1aE
         LT2w==
X-Forwarded-Encrypted: i=1; AHgh+RocfF/T8vQe08kov7DUk6tUCygPj8T8ecam23aAtnhZGfgYCtatF5jmi3aSIVHQx87KofBpcmbNBqSr@vger.kernel.org
X-Gm-Message-State: AOJu0YyBuDKDWafgMbd2BUKvIiELU04sJhs103gbqt1AXFiBeD3VyO2p
	UAVB48xvO117+kwOR+WxtpI5H16k2cxJzpPEnphq2MPjRZM3BavUHE+t
X-Gm-Gg: AfdE7cnU7Ylj7uvwVUoVLbDFWfmowNpmMoelEqAVBhwWz2J0Bx/0WmNgdzMKTMNNMnE
	7hDyrJCTDSqIkPzkKVYzeeaSDwUmYP7paX4mkyFymSLnimynBMNmlZ7TKz9nkTcsSijYp4SRID+
	eCjQ58Esoc/5B5oXLIY0qpieaX48s0cWuUz7DXzPCaE9sLTY6QGdqv10TTWg/Mrj8quX2f18cC8
	Q7w1JV2CvnzT7LVDiQbJtKiHvdh1/ol2pbQTt5365NlVajiBOI+N3QesZBspPB4SdLWaokBw3bj
	2kA6XPsyFoCjiQgbKO+NSr3wDMPAfAAv2XSRMbhXSKA6FyHSHGr/t4F1lNHl4/hOx+UhopVfatn
	qF6Y3QE0dbAMg8dKHFnIy5EragpfQUsYmZii3RiOOy66ZDphnikhRECztkQ/Rk34yEI+Kd1RCJH
	wsGMB9Qf8daN2MBd2gwkNMYVSywdGu12nr6jWAqc7jTSgTR2Nc7e9iwgnRZydam4BAa1du+GUi9
	p7Q
X-Received: by 2002:a17:903:244f:b0:2ca:b8d:e65f with SMTP id d9443c01a7336-2ca0b8de994mr9096045ad.1.1782705248120;
        Sun, 28 Jun 2026 20:54:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b1b02f8esm36341435ad.71.2026.06.28.20.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 20:54:07 -0700 (PDT)
Message-ID: <abe52380-dbb9-49e1-b93b-ab4aca9105b6@gmail.com>
Date: Mon, 29 Jun 2026 11:54:03 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/verisilicon: add DC8000 (DCUltraLite) display
 controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-6-a0987203069@gmail.com>
 <39e7d0426d1690ccfc8dbcfc77e7440bc5c9a725.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <39e7d0426d1690ccfc8dbcfc77e7440bc5c9a725.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/2026 4:03 PM, Icenowy Zheng wrote:
> 在 2026-06-25四的 17:44 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
>> controller (DC8000 generation) whose register layout differs from
>> the DC8200 in several important ways:
>>
>> 1. No CONFIG_EX commit path: framebuffer updates use the enable (bit
>> 0)
>>     and reset (bit 4) bits in FB_CONFIG instead of the DC8200 staging
>>     registers (FB_CONFIG_EX, FB_TOP_LEFT, FB_BOTTOM_RIGHT,
>>     FB_BLEND_CONFIG, PANEL_CONFIG_EX).
>>
>> 2. No PANEL_START register: panel output starts when
>>     PANEL_CONFIG.RUNNING is set; there is no multi-display sync start
>>     register.
>>
>> 3. Different IRQ registers: DCUltraLite uses DISP_IRQ_STA (0x147C) /
>>     DISP_IRQ_EN (0x1480) versus DC8200's TOP_IRQ_ACK (0x0010) /
>>     TOP_IRQ_EN (0x0014).
>>
>> 4. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
>>     divider) clocks; no axi or ahb clocks required.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile    |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c     |  5 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
>>   drivers/gpu/drm/verisilicon/vs_dc8000.c | 86
>> +++++++++++++++++++++++++
>>   4 files changed, 92 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/verisilicon/vs_dc8000.c
>>
>> diff --git a/drivers/gpu/drm/verisilicon/Makefile
>> b/drivers/gpu/drm/verisilicon/Makefile
>> index 9d4cd16452fa..d2fd8e4dff24 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o \
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_dc8000.o vs_drm.o vs_hwdb.o \
>>   	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index fd1f5fe67a68..9499fffbca58 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -134,7 +134,10 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>> identity.model,
>>   		 dc->identity.revision, dc->identity.customer_id);
>>   
>> -	dc->funcs = &vs_dc8200_funcs;
>> +	if (dc->identity.generation == VSDC_GEN_DC8200)
>> +		dc->funcs = &vs_dc8200_funcs;
>> +	else
>> +		dc->funcs = &vs_dc8000_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index 825f5dd6bf17..ac96ad701199 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -66,5 +66,6 @@ struct vs_dc {
>>   };
>>   
>>   extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +extern const struct vs_dc_funcs vs_dc8000_funcs;
>>   
>>   #endif /* _VS_DC_H_ */
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc8000.c
>> b/drivers/gpu/drm/verisilicon/vs_dc8000.c
>> new file mode 100644
>> index 000000000000..fbe0fa516cac
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 Joey Lu <yclu4@nuvoton.com>
>> + */
>> +
>> +#include <linux/regmap.h>
>> +
>> +#include "vs_crtc_regs.h"
>> +#include "vs_dc.h"
>> +#include "vs_drm.h"
>> +#include "vs_primary_plane_regs.h"
>> +
>> +static void vs_dc8000_panel_enable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dc8000_panel_disable_ex(struct vs_dc *dc, unsigned
>> int output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_RESET);
>> +}
>> +
>> +static void vs_dc8000_crtc_begin(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dc8000_crtc_flush(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_VALID);
>> +}
>> +
>> +static void vs_dc8000_crtc_enable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dc8000_crtc_disable_ex(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			  VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dc8000_enable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static void vs_dc8000_disable_vblank(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_clear_bits(dc->regs, VSDC_DISP_IRQ_EN,
>> +			  VSDC_DISP_IRQ_VSYNC(output));
>> +}
>> +
>> +static u32 vs_dc8000_irq_ack(struct vs_dc *dc)
>> +{
>> +	u32 hw_irqs, unified = 0;
>> +	unsigned int i;
>> +
>> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &hw_irqs);
>> +
>> +	for (i = 0; i < VSDC_MAX_OUTPUTS; i++) {
>> +		if (hw_irqs & VSDC_DISP_IRQ_VSYNC(i))
>> +			unified |= VSDC_IRQ_VSYNC(i);
>> +	}
> Maybe a warning for unknown IRQ bits should be added here.
>
> Thanks,
> Icenowy
I will add the same `drm_WARN_ONCE` pattern in `vs_dc8000_irq_ack` for
unknown `VSDC_DISP_IRQ_STA` bits.
>> +
>> +	return unified;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dc8000_funcs = {
>> +	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
>> +	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
>> +	.crtc_begin		= vs_dc8000_crtc_begin,
>> +	.crtc_flush		= vs_dc8000_crtc_flush,
>> +	.crtc_enable_ex		= vs_dc8000_crtc_enable_ex,
>> +	.crtc_disable_ex	= vs_dc8000_crtc_disable_ex,
>> +	.enable_vblank		= vs_dc8000_enable_vblank,
>> +	.disable_vblank		= vs_dc8000_disable_vblank,
>> +	.irq_ack		= vs_dc8000_irq_ack,
>> +};
