Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1703F5BD8
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692261; cv=none; b=WkV27wNFdzyWLe05BJqtelO+T3R0TVO+kk9Sl4jPu1rwCG//3ikm+vTsFYuqbAquXIih9qzdJEXm8WJpnhCFr8ybxGANMwRCZ8cOCG9pTgyH1JudasLxm8SY+r8963OKjh0WsZgC5xUQoeGAgiVRjhoswAGMhaYUv4G29bd3WQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692261; c=relaxed/simple;
	bh=VFLn1X/FbV6WyAJSv1mK1wQhaEOpXkrcXFv80dKxP10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdKuE6bwbmuFDIDIB7XnaM/2s+6fkSPBjajK9sZwSO5ggsQxp3IISwXRHtvMXDgZPxvHQS3+1mu2iwjgAd6mcT7BJUBGsTXAtwqO6/hnf/3kcXQQPB5jiSVPIc8CMhWOmsW3o/nQ4f3JcBG68h5veYvAHssgbhpgxRGFk3lbU6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMlS76J1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMlS76J1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2d792c8so36035185ad.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692260; x=1782297060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afZH9eP+KoE3Ta3oJntXN/TPimtdYin4QgRicypPySg=;
        b=dMlS76J1soPUHTZfZQpMu19qpieaKR1nTUQtRH2TxYH//x/uHQhnbhtsKuC3BLzEVN
         6Nblp5pF1jpRf3OX3of6PaFCvufZDa5clGaVrnhtpiHfYyJNF0/GEgmVNJC5f0uu+u2T
         ZtUzK4NI2AYAdA/hvVMrQc3T6G0lde2+nfiZ6WQiXlvwn85EaMrXWzaV6bW/D6NUkOEF
         HLKR3MplsP6/5QDkQykgQz+CDGYk4v9XU+mbnEqo1YhLrKGOVjmnJyQ7TkihL1+1epU3
         mAYKNLgJHcXidjzzx9gw7aW6AXauGeQhpqv8SZtk/hZDEnAgiYD5Fjo/ygzMZalW/pj0
         oKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692260; x=1782297060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afZH9eP+KoE3Ta3oJntXN/TPimtdYin4QgRicypPySg=;
        b=GTIfLby579Uaq0GNuw/MF0YoxIGN5+65IIqeGN0P30EA5iUafIue24eC5ck/Zc9wlH
         lQl3tXzf5j0Vu70Ef/YP8fec+Iwb+PU7g3tGkanDqx3uz5phaHSES0cd7lKR95YhMPO1
         c2FlbHMZ4NuDukEKUYIeRsx6viao1iVybeNPnkrQT9CaUgVnZpdtHXMBFeQ9TuLhxxDv
         Bjh20rp5AROrQEOs68WCeYt8XtNAjHnLV09vsfALwZH4Su2yqgjvqjzxBMLKGNh861/3
         51/iWIeO9wL5vn8QuyPIFUj337ZrI2onVRdWTe2Tyicjnvw3wDUEVioFGWTIqBy2DkOa
         8FqA==
X-Forwarded-Encrypted: i=1; AFNElJ9lw04ah75bTVXy2MWakC5rkFQxl9X+xRVaTGywuphY9Ue8CFNsQO3WGupyfNKMcTitG1rQ66QP/3Bj@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzi0s/qKzfZS3s7O2/NAqD40hCrGoXgzDRQieaDFuCoWJXLMC
	hbHX6BgogUZVAvXGOnvyLhxby1Qv4K++w5GrfrOfkJK7IvZ9S2Ps33o2
X-Gm-Gg: AfdE7ckKQ/xDkxdS7sTci3q0rwZbA5dV1AjDnDQQEyddNlqvErs/fsOOuXTHgoTDx+c
	3WhJZYAEQdGZDArGpknFTB89byYtzHuP3ZFuq66DZzWn4q+eoxAXCV1jYXOez2cB1uXDlQaviVa
	aRnaEu0waAfbbP1+C0747KxXTMEqXxmEA/LEFJJQBGypdmEAbMYH7CTH5z2rDDb4/a4r28bvNpg
	y8AD2GqMaQxtG3+sHvSiC0bzS6/YqKG/MygDJbZhYcRwwi2cclht+oa1qQtLteIUGENUFNBHZl/
	8x+VK5bTWzIDBBEpptSkQLrkqzouPOHhitFwUvMAePXxUH/fgS2iZrY0BDMeYD39QpDsZoVEFb4
	FKJlfUKn9rk//K7UJiOviOIGbvaSs+AYABKsQuqGOOAJg6OxcRc7US8Wv8DzpX3hlF6WZWlzxq3
	zdMfJUujsOyvu3+NjGD5MAGTRXNj0186tdz5p8CMAXznao1tgBOQBb1DMg8N+GGpg5NA==
X-Received: by 2002:a17:902:ce91:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c6bc23de79mr28853095ad.25.1781692259833;
        Wed, 17 Jun 2026 03:30:59 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a47f8sm150830775ad.47.2026.06.17.03.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:30:59 -0700 (PDT)
Message-ID: <4414042f-56e2-495a-81c3-0040c8e1b01f@gmail.com>
Date: Wed, 17 Jun 2026 18:30:56 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615065003.76661-1-a0987203069@gmail.com>
 <20260615065003.76661-4-a0987203069@gmail.com>
 <38d07e3b3c841d380c987800d8ef85065be94e79.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <38d07e3b3c841d380c987800d8ef85065be94e79.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/15/2026 4:37 PM, Icenowy Zheng wrote:
> 在 2026-06-15一的 14:50 +0800，Joey Lu写道：
>
>> +
>>   	drm_crtc_vblank_on(crtc);
>>   }
>>   
>> @@ -119,7 +148,8 @@ static bool vs_crtc_mode_fixup(struct drm_crtc
>> *crtc,
>>   }
>>   
>>   static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
>> -	.atomic_flush	= drm_crtc_vblank_atomic_flush,
>> +	.atomic_begin	= vs_crtc_atomic_begin,
>> +	.atomic_flush	= vs_crtc_atomic_flush,
>>   	.atomic_enable	= vs_crtc_atomic_enable,
>>   	.atomic_disable	= vs_crtc_atomic_disable,
>>   	.mode_set_nofb	= vs_crtc_mode_set_nofb,
>> @@ -132,7 +162,7 @@ static int vs_crtc_enable_vblank(struct drm_crtc
>> *crtc)
>>   	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_set_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>> +	dc->funcs->enable_vblank(dc, vcrtc->id);
>>   
>>   	return 0;
>>   }
>> @@ -142,7 +172,7 @@ static void vs_crtc_disable_vblank(struct
>> drm_crtc *crtc)
>>   	struct vs_crtc *vcrtc = drm_crtc_to_vs_crtc(crtc);
>>   	struct vs_dc *dc = vcrtc->dc;
>>   
>> -	regmap_clear_bits(dc->regs, VSDC_TOP_IRQ_EN,
>> VSDC_TOP_IRQ_VSYNC(vcrtc->id));
>> +	dc->funcs->disable_vblank(dc, vcrtc->id);
>>   }
>>   
>>   static const struct drm_crtc_funcs vs_crtc_funcs = {
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index dad9967bc10b..9729b693d360 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -8,9 +8,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_graph.h>
>>   
>> -#include "vs_crtc.h"
>>   #include "vs_dc.h"
>> -#include "vs_dc_top_regs.h"
>>   #include "vs_drm.h"
>>   #include "vs_hwdb.h"
>>   
>> @@ -33,7 +31,7 @@ static irqreturn_t vs_dc_irq_handler(int irq, void
>> *private)
>>   	struct vs_dc *dc = private;
>>   	u32 irqs;
>>   
>> -	regmap_read(dc->regs, VSDC_TOP_IRQ_ACK, &irqs);
>> +	irqs = dc->funcs->irq_ack(dc);
> The definition of bits in 0x0010 seems to be different to ones in
> 0x147C, although the first 2 bits are the same. (e.g. `BIT(2)` is
> "cursor interrupt" in DC8000 0x147C but "secure reset done" in DC8200
> 0x0010).
>
> Should some kind of translation be done in `irq_ack` ? (and add a
> unified interrupt definition that aims to be the translation target).
>
> Thanks,
> Icenowy
I will add a set of unified IRQ bit definitions (e.g. 
`VSDC_IRQ_VSYNC(n)`) in a shared header. Each `irq_ack` implementation 
will translate its hardware-specific register bits into those unified 
bits before returning, so `vs_drm_handle_irq` can use the unified 
definitions without knowing which register layout was used. Currently 
the VSYNC bits (BIT(0)/BIT(1)) coincide between DC8200 0x0010 and DC8000 
0x147C, so the translation is trivial; this change will prevent future 
confusion from diverging bit meanings (such as BIT(2)).
>>   
>>   	vs_drm_handle_irq(dc, irqs);
>>   
>> @@ -136,6 +134,8 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   	dev_info(dev, "Found DC%x rev %x customer %x\n", dc-
>>> identity.model,
>>   		 dc->identity.revision, dc->identity.customer_id);
>>   
>> +	dc->funcs = &vs_dc8200_funcs;
>> +
>>   	if (port_count > dc->identity.display_count) {
>>   		dev_err(dev, "too many downstream ports than HW
>> capability\n");
>>   		ret = -EINVAL;
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.h
>> b/drivers/gpu/drm/verisilicon/vs_dc.h
>> index ed1016f18758..544e1a37065b 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.h
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/reset.h>
>>   
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_plane.h>
>>   
>>   #include "vs_hwdb.h"
>>   
>> @@ -22,6 +23,34 @@
>>   
>>   struct vs_drm_dev;
>>   struct vs_crtc;
>> +struct vs_dc;
>> +
>> +struct vs_dc_funcs {
>> +	/* Bridge: atomic_enable, atomic_disable */
>> +	void (*panel_enable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*panel_disable_ex)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* CRTC: atomic_begin, atomic_flush */
>> +	void (*crtc_begin)(struct vs_dc *dc, unsigned int output);
>> +	void (*crtc_flush)(struct vs_dc *dc, unsigned int output);
>> +
>> +	/* CRTC: atomic_enable, atomic_disable */
>> +	void (*crtc_enable)(struct vs_dc *dc, unsigned int output);
>> +	void (*crtc_disable)(struct vs_dc *dc, unsigned int output);
>> +
>> +	/* CRTC: enable_vblank, disable_vblank */
>> +	void (*enable_vblank)(struct vs_dc *dc, unsigned int
>> output);
>> +	void (*disable_vblank)(struct vs_dc *dc, unsigned int
>> output);
>> +
>> +	/* Primary plane: atomic_enable, atomic_disable,
>> atomic_update */
>> +	void (*primary_plane_enable_ex)(struct vs_dc *dc, unsigned
>> int output);
>> +	void (*primary_plane_disable_ex)(struct vs_dc *dc, unsigned
>> int output);
>> +	void (*primary_plane_update_ex)(struct vs_dc *dc, unsigned
>> int output,
>> +					struct drm_plane_state
>> *state);
>> +
>> +	/* IRQ acknowledge */
>> +	u32 (*irq_ack)(struct vs_dc *dc);
>> +};
>>   
>>   struct vs_dc {
>>   	struct regmap *regs;
>> @@ -33,6 +62,9 @@ struct vs_dc {
>>   
>>   	struct vs_drm_dev *drm_dev;
>>   	struct vs_chip_identity identity;
>> +	const struct vs_dc_funcs *funcs;
>>   };
>>   
>> +extern const struct vs_dc_funcs vs_dc8200_funcs;
>> +
>>   #endif /* _VS_DC_H_ */
>>
>>
