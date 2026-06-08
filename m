Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4059F33688B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912012; cv=none; b=GkGiTwLtUqFmOUDmguGUXs+MpUro/4f+khx3z7IIKAirwe7u/AFGDiRF6Mn9kOD+cgMWkOAvaCA/FAyf12KVziqd2uYZYTmG5utArlkzg+K53jcx59lqj6M1PHhyhOUrS8DJ3qN4i+RwkW/NVtXMs8xrtmbyooiy5Uyvq0JEG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912012; c=relaxed/simple;
	bh=xgtco8k0eXveQfp4S4s7OWJgrAbr2oWSqe91FitD2i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLHAIoJNmHGxdkdLFwmDsZif6s12+OhjD3M1ztqggHKJHuY1C5/ophSf5pd7/YXyRtbwbyvgllceVU0PmK+Vclwyzvj19jzbK1F0is+y8Pc7Is76TcNzbrcaaMSvlLJ6yEKAPjVLBxTPv+/ussM4BBs5tsTRFdceSwj3bfDKJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIvI1ZZI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIvI1ZZI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so2834686a91.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780912010; x=1781516810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRDBSHYpzFBzXnPKcrs7qf2EMqGEh7EqJYnV9Ezibaw=;
        b=JIvI1ZZIJPMHghRMRhoNlpeqRgh7g6JPnSvKmua7BX/kwVF5wr5+LGOBzVXMB9LIcc
         EykrMZLKqapZjHbh4l1ZNHjky32CvjLR5HhlTxSqZAe2/s0z2mjT/X0xzDpJOkCRfweA
         0ma+qA5fQjIZQEVt5NWVgDvB2d8xlQkYOgLG0wF9uGzlntdPKwjHTCEyO+VuDlJCQV1J
         NGfU9ZOj4rMgf8ruauPmvwrRIP9BuncC1m4M42OJqjbjC3pjUC+HS2tXsdeu9Y/bvnGG
         8UURBhu8nL3QJpZ4OfOno++wN799kYnuq9BhXWBWl4l221ZtWI6WF7oJAfkQ9CBpJAIy
         e9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912010; x=1781516810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRDBSHYpzFBzXnPKcrs7qf2EMqGEh7EqJYnV9Ezibaw=;
        b=jx2hJFUWB5X/JBwzaXTX77fXOMXgSuVQmBhZmNYewa8ClcaCcKtoBbrlFPm4OtHvsv
         VcZ1Q03Zj2+wdmhWtRrMuLlvhYg5GOwIUTBhQ8dOJbPKP4GxaWX73dxKsTp7Gjoh6Kkx
         x9Rpt96EW9SmVG+zh49sMKrKi1fZM6w+jt84TMa6csQKA6/nw8hXF8kR1GkwN2+p/QaV
         EMEiyAmS6Hl++/twqMb14/O5pcw5BxP88JPGCTYoroovIE5BmxPyz0qAzd6Z1sa7MnU2
         fC2DIXdWcwybY19k8WIwaIxBvy2o/os51cqk9XM1C13M1hbkVEQuLjap7atIwRPE+jdt
         8mOg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tlg60+IvYSHIk2mQ1USx/AYk8WEKlsMHRrI3d96Ir0uJ+KdlW/UoiCP5VZFRgi1VN99J4Jq8hR7Tl@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFLOzkl73RV09EEqdOPwnXDoUlmbXF2LwQib2Y4D527t8L7oL
	kvYpj03dOtWLkfPTgpYA0iK26LMvsjxIB+hgwbKTnP/IXlymiYSkoRbR
X-Gm-Gg: Acq92OGQt8UwMXHYcBO1JcBNg3QETloGsR0hzWUGSg2yKvjZlYL2y40jccNHLrZKX59
	Zvb2JGP/w6cOiV1oXg2ebYkr6LSjQ7mFtCZ8LckH+HBoR5Ldkweg+vNgC08teE7KeeiaH6XLeNP
	gfpoNP2uI2wAFsaDHoXN/1SHWqAX50Ovy1yuiIAD7YEBv0wHRVHF52FgABYwBG8wI76fdv6Es95
	lbB4zmk811B3qudPo3i9eGoNIreG3ItxNXLuNL9jqR/my0gW03iK4Jt+HLl32DnLGd6cAHvEm6H
	N5xe4kh/eBV+nLDar+jKrF52vrNR/rrCryqXq73TDgw1nu26EEuMRS6X8UlGpse7Qouf/MvSTuo
	LPFc+/iqzBVtyQPFBjqnzkwgycd/+S4pgBYJIG71w8PWDDzol0Wc1b291Qg34Ea88E02MHbKAmB
	myVuOtVdzPG9SJh87KvN7050QqYhcknjQg983KeOchmdWJYddKw74LWqIDK/F2kc7/N7TzxXH9j
	4RWEmUDACQBXbY=
X-Received: by 2002:a17:90b:5787:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-370f0284a87mr15256643a91.14.1780912010481;
        Mon, 08 Jun 2026 02:46:50 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm17761731b3a.10.2026.06.08.02.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:46:50 -0700 (PDT)
Message-ID: <178c4511-a290-4526-9e80-2fe8291f6ed3@gmail.com>
Date: Mon, 8 Jun 2026 17:46:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/verisilicon: add Nuvoton MA35D1 DCU Lite
 display controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-5-a0987203069@gmail.com>
 <335c237d2636764948e629dbab0b5b747ac48fa5.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <335c237d2636764948e629dbab0b5b747ac48fa5.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/8/2026 2:26 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 10:32 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltraLite display
>> controller whose register layout differs from the DC8200 in several
>> important ways:
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
>> 4. Per-frame commit cycle: DCUltraLite requires the VALID bit in
>>     FB_CONFIG to be set at the start of each atomic commit
>> (crtc_begin)
>>     and cleared after (crtc_flush).
>>
>> 5. Simpler clock topology: only 'core' (bus gate) and 'pix0' (pixel
>>     divider) clocks; no axi or ahb clocks required.  Make axi_clk and
>>     ahb_clk optional (devm_clk_get_optional_enabled) so DCUltraLite
>>     nodes without those clocks are handled gracefully.
>>
>> Add vs_dcu_lite.c implementing the vs_dc_funcs vtable for the above
> Nitpick: could you use vs_dc8000 to make things more aligned? (Although
> I must admit that DCUltraLite is the first revision to be supported in
> this codepath).
Understood. I will rename `vs_dcu_lite.c` to `vs_dc8000.c`, all internal 
functions from `vs_dcu_lite_*` to `vs_dc8000_*`, the exported symbol 
from `vs_dcu_lite_funcs` to `vs_dc8000_funcs`, and update the Makefile 
accordingly.
>> differences.  The probe now selects vs_dcu_lite_funcs when the
>> identified generation is VSDC_GEN_DC8000 (DCUltraLite reads model
>> 0x0,
>> revision 0x5560, customer_id 0x305).
>>
>> Extend Kconfig to allow building on ARCH_MA35 platforms.
> Maybe the Kconfig change could be in the last commit or a dedicated
> commit before current ones? Because it's only meaningful after the HWDB
> item is added.
>
> Thanks,
> Icenowy
Understood. The Kconfig change adding `ARCH_MA35` will be moved to a 
separate commit placed after the HWDB entry is added, or as the final 
commit in the series.
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Kconfig       |  2 +-
>>   drivers/gpu/drm/verisilicon/Makefile      |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c       |  9 ++-
>>   drivers/gpu/drm/verisilicon/vs_dcu_lite.c | 78
>> +++++++++++++++++++++++
>>   4 files changed, 86 insertions(+), 5 deletions(-)
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
>> index 9d4cd16452fa..960af0861dfa 100644
>> --- a/drivers/gpu/drm/verisilicon/Makefile
>> +++ b/drivers/gpu/drm/verisilicon/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   
>> -verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_drm.o vs_hwdb.o \
>> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_dc8200.o
>> vs_dcu_lite.o vs_drm.o vs_hwdb.o \
>>   	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
>>   
>>   obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index c94957024189..81a8d9bf85bd 100644
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
>> +	if (dc->identity.generation == VSDC_GEN_DC8200)
>> +		dc->funcs = &vs_dc8200_funcs;
>> +	else
>> +		dc->funcs = &vs_dcu_lite_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
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
