Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DA93F5BF9
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692555; cv=none; b=Rfk/DY9gUBV47Tml7NzRBaxnqvtt+7QqZx9xFImITjNL5I+Fj2x/PGJcs6Kze+jimv6fRQIKPO+b0wakkxJSlaa/8OIWH7a48OCPOdx8W+dw4EplE6qVqd2Xc+19bE43UkY8evcU9S6EDlx2zqeQsElqbGROl9V8RYnUKtiQMmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692555; c=relaxed/simple;
	bh=Yulb2NOXOrnIYLJlijSCFTM1O7qS4FbvauLZ/ruXzZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlFKwfFCVqz24WtzBcKVtOs2Xqr9GJzcbRhTbtvhXduf1yUsVhySNvcaBn+g1ojVoiXDzf58RFSP0IWHidNkcooYel7j8zu14Yo8iBaEMeGRyZo4bo6hqi9PUFvJecFGK+kzzIJDTU5Wucya+kbEhQKNMZLaT6Lp+wnUbH14wrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skDnyWty; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skDnyWty"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so5411226a91.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Ftmopsn3f2abpL48mO0RyoBfFBPSuZonc7xIqzYUpY=;
        b=skDnyWtyP0gePvxEtLkfGmqYcR7lXFFrK2m6/DiTRsZDaXYCdo9yCBGnj4Chiwy3oG
         HG67LNXr/6tt+Uc6Te3tnFjAM9rtMB+7ufu+yHR8uehaJFM5Z32X/HK0AYWHavtf3fEV
         9Sez0JKmzKJIGG6wBUEDQvq3Imlm6iT4rvBUe6rddXHcWwlNPCsV7ilVa6OPrxuCivoz
         t+8kyh9yWkjWqcDPQwFhfppMS9vssXlxjbV0OGoc1fYyaSBLS2q/abDgo/IQlDzgvf41
         yA71N+enmuCHFNmKvVROlVqh2yFMPvLJ4bXV73aseB3DEE1nGWNg2wh0aLxCFTYserZn
         A/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Ftmopsn3f2abpL48mO0RyoBfFBPSuZonc7xIqzYUpY=;
        b=N3MIK7Q+tWv1AGKD7/Jb7pV5IiVITwnEpZwtaK6qlGE6mvUdqWlTdcAeX8TeSE9IA9
         pbB136MMClCkWKz9ZD9UVpuOwwlR45+wwJk9KIF3i69LWamgqdPUJYiOH9fbXJWl+BFg
         tBYox1rT1jFH2YPQKslbxNX6+HJn7r5GhkjkxbogCTLfWDLCQhQfYU9SDX4FwbLeTNbe
         Xz406Eo+/9b86+z/ACHDv64VjObya5jPXL9+EPoOEdxdUJyAQlfleM/38A4aEBppJWVY
         6qJeh+GTcwyP1bmkIrkuAzKGXHqFJjtjV4ZqWlmamUKtKKEHizOMe/IhVjgS09X3N9T9
         qM4w==
X-Forwarded-Encrypted: i=1; AFNElJ+nlVpqKhUgtNYZpsOMqLA0Av0n1h6mTiX+6FIUfpnptLeN+Jrg05RYLIwdVcektdLzESNrj4IpZs6d@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9TX9bmarMVTm4C2bLBV1DPVQiwo3V+RRNT+Gi6QGKs67QWevL
	6WRK0Wi3y/497tFN6XmFUIA84r7aRY9J7fZ49g182ptWU6vcmzujMSlx
X-Gm-Gg: AfdE7cnHb8m10zrzx9SiDa/aWxqgk99EaYa1PiCXw/tMBrv2K1rxjg9ljIX0zopke4N
	RrS0RxFnj3KVE7CFlMQxNcnfKzSp6nKZ2b+rLCH3Wl3LrzWRMLPAu9HA07xnYr1O3kfUMufVG9f
	mtk0G+YjaiOLw+4tIoi4F3CbRfWOAOsN6HLRyEgLmrwG9cPEpdJS/kwY2YUcm0dAOKmE6NZaFJf
	9bZJPBnH0NRIAh5FNiqhcITeEoHCUFNRsBqJsVP0lT5iwx6JU4HVL3mp6ydsj96xh+Z9wK3QvRr
	fOnBFH1qs+eJz460Sm6GRQoCXbOL/nifdn3D+regOuc5CSg2d61+Kd57/utqfAV8jKLx/EVQlW2
	+n5xBE/1Mz252DcbPBdbC4EPTwFBUi8Gdp1YhXOgcWwEBFVBBlaiiXUVJrjWq9VK6i+mKldHLDZ
	R066pN7vsS6GtoIREiol0BeSGmUPixDJDgmZ5vVvLL6jgSqn5kc/glFiuN+NnNEgs7jg==
X-Received: by 2002:a17:90b:2e0b:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-37c9330947cmr3320760a91.4.1781692546953;
        Wed, 17 Jun 2026 03:35:46 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228ebadsm5485446a91.10.2026.06.17.03.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:35:46 -0700 (PDT)
Message-ID: <df7363be-0e3f-4459-be4a-43ffb0a5366c@gmail.com>
Date: Wed, 17 Jun 2026 18:35:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] drm/verisilicon: add DC8000 (DCUltraLite) display
 controller support
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-5-a0987203069@gmail.com>
 <d5df0e9df3a9a68aae982f2fce830a4b10468476.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <d5df0e9df3a9a68aae982f2fce830a4b10468476.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/15/2026 4:51 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
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
>>     ahb_clk optional (devm_clk_get_optional_enabled) so DC8000 nodes
>>     without those clocks are handled gracefully.
>>
>> Add vs_dc8000.c implementing the vs_dc_funcs vtable for the above
>> differences.  The probe now selects vs_dc8000_funcs when the
>> identified
>> generation is VSDC_GEN_DC8000 (DCUltraLite reads model 0x0,
>> revision 0x5560, customer_id 0x305).
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Makefile    |  2 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c     |  9 ++-
>>   drivers/gpu/drm/verisilicon/vs_dc.h     |  1 +
>>   drivers/gpu/drm/verisilicon/vs_dc8000.c | 78
>> +++++++++++++++++++++++++
>>   4 files changed, 86 insertions(+), 4 deletions(-)
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
>> index 9729b693d360..9499fffbca58 100644
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
> Please make the clock change a separated patch for atomicity.
>
> BTW the MA35D1 manual's clock tree shows that DCUltra appears on AXI2
> ACLK, AHB_HCLK2, behind a mux of SYS-PLL/EPLL-DIV2 (which seems to be
> the core clock), and behind a divider (which seems to be the pixel
> clock).
>
> However it's weird that only one DCUltra Clock Enable Bit exists
> despite both bus clocks have "ICG" (I think it means "Integrated Clock
> Gating"). In addition the linux clk-ma35d1 driver assigns "dcu_gate" as
> a downstream of "dcu_mux", although the Figure 6.5-2 in the TRM shows
> no ICG after the "Display core CLK" mux.
>
> Is the two bus clocks controlled by a single gate bit, and is the bit
> also gating DC core clock?
>
> Thanks,
> Icenowy
I will split the axi/ahb optional-clock change into its own patch in v5 
for atomicity.
Regarding the MA35D1 clock tree: from the TRM, the single "dcu_gate" bit 
gates both bus clocks (AXI ACLK and AHB HCLK) together with the display 
core clock through the same ICG cell. The clk-ma35d1 driver exposes only 
"dcu_gate" (downstream of "dcu_mux") and does not provide separate 
axi/ahb clock entries. Therefore the MA35D1 DT binding will use only two 
clocks ("core" and "pix0"); making axi and ahb optional in the driver is 
the correct approach, and this will be stated clearly in the split-out 
patch.
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
>> +		dc->funcs = &vs_dc8000_funcs;
>>   
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index 544e1a37065b..5218e8cf63e2 100644
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
>> index 000000000000..be0c0d7baf52
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc8000.c
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
>> +static void vs_dc8000_crtc_enable(struct vs_dc *dc, unsigned int
>> output)
>> +{
>> +	regmap_set_bits(dc->regs, VSDC_FB_CONFIG(output),
>> +			VSDC_FB_CONFIG_ENABLE);
>> +}
>> +
>> +static void vs_dc8000_crtc_disable(struct vs_dc *dc, unsigned int
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
>> +	u32 irqs;
>> +
>> +	regmap_read(dc->regs, VSDC_DISP_IRQ_STA, &irqs);
>> +	return irqs;
>> +}
>> +
>> +const struct vs_dc_funcs vs_dc8000_funcs = {
>> +	.panel_enable_ex	= vs_dc8000_panel_enable_ex,
>> +	.panel_disable_ex	= vs_dc8000_panel_disable_ex,
>> +	.crtc_begin		= vs_dc8000_crtc_begin,
>> +	.crtc_flush		= vs_dc8000_crtc_flush,
>> +	.crtc_enable		= vs_dc8000_crtc_enable,
>> +	.crtc_disable		= vs_dc8000_crtc_disable,
>> +	.enable_vblank		= vs_dc8000_enable_vblank,
>> +	.disable_vblank		= vs_dc8000_disable_vblank,
>> +	.irq_ack		= vs_dc8000_irq_ack,
>> +};
