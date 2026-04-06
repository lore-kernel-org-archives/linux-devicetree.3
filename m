Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247826290
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464345; cv=none; b=aashM3afE5JzHyJ4PfKapd1Ke2HMosZs8zKnHXP0M7vlLRcxCNr49NEtXGHypX1yh4THfe3nX6emKj+6sFEOsGxTd+fOarw5pMZEScmAwaAZ13SxAqGHVc/gQJEx/FCJSlvg+fmVFjJGiM0VqY+judTsqepft+P4tytrG5Yuej8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464345; c=relaxed/simple;
	bh=igxfLzjNRzlg/VIKwNlvJVJy0GbqwQZ5ZRoK9S4PnPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSn7/H9z6Js4KxRhHJotkKV+ZJV/SQYMpSkRxwHFi3kLgem0P3JDljdXPnmTFftlIOqaD69/IbOrAG1V1NAGpS9EvVh5mrrAaMl3iu6nPgMApo0p6tutYO0aJp/AXIXZbDTuGIzacaDUghhPkm64ih+edMXzBARG4iy6qMaS6U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmUz+v2c; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmUz+v2c"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a893d289bso1543322b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464343; x=1776069143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MB0F9SKYr6+JVse3TW9scM+eJP0jATRzNvx3luR3WWo=;
        b=GmUz+v2c0R3jjxouaf+THoETYPhFXd0OdDV2qVtrNBptcqrXP6P2vgAtjsnKqARH3m
         GA1jedlwacWICEQSv61fJdaEswRiMkLPFGGj9ZakUIMOZP8hMwPSfuar3/4zEcDZysYn
         09fMK53cEW8l05JntsGt7E8ca0NxN09CHi+iYyIkKVERGemCF0vAW956HuhPMYYXfvpH
         GxKr5AEMtgnGN8CBAC9/zoqM0Cxuc94GKIE/rtmdXj0tlQsWLt3lEuc3R7GeS+LeqV79
         rPLlSbNV5/g5nUJsDs2YQIzejzSMyLuii+p0/VqQB9wQDJufD4S9KAjy95oOZ9R6GrFC
         W9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464343; x=1776069143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MB0F9SKYr6+JVse3TW9scM+eJP0jATRzNvx3luR3WWo=;
        b=Vz8RVkX3tAJRzFRzA771xFKBuoC0pUtJR7pAc2Gxe7m5dRIGju7o+Ej1eXxS8FzFR0
         UWk1luv9luf0fjUCnl3cSx0HC2aPc5ab2QQvPKaXn9q4S8OGyLkHeAp1lTnviGKQSmCw
         l4qFMnKmBGA2XsSG6qhmG5JYnKvXFeMAkCs/9NtSSqvF3URWy0FOQnwztqIDv13U2erY
         0AA2hOU0VyF3t7CcxFLGjxnamMB4CctZzxl/r3YEqc3aLdQBz6UgRRCu+z/xMpxfhjPP
         /ouBEcY4+87b7SszGsJVLUb43Ne+8hAc3FhJRSBlZFWsSTBbMUFO+/dRDTSKQr4YJw/u
         fa8A==
X-Forwarded-Encrypted: i=1; AJvYcCX+PZwz9kWBgFs9907Vkpkdv6o0HfZlzjTPpaQiZVQItmaCrROK1g/Bxbk7cS5vrqxOffXPpZjVC8mb@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZ+zK0H5dym6E+l+dzYplL5RudaM8EG4P7m0mn1SmGK4JYVys
	EkkB5OPXGnrcjwRKTzUBitw1v2Z4tDyAHA4FzoDie2bEM9NKkUBO/iBu
X-Gm-Gg: AeBDievLLYtH1o0St9e8ppZZkOBQojJnMy72svBoZaRIwP/QNuP3mhCqcMeDVAnp71P
	WwahUUNOjDZdX9iCTXq2Ygy0cy+xt2v8fYDRxEX/vYqywyF5UMDYAbMf9STYTq5WRaNrJxkW5xY
	ZmgAG78y2WaI6hw5tTwPdCxNAXH4RSEoSHX2MNFLDjrpnWk/b4ytEzSfN5PrUNaEbC1zBRMYEfh
	vz65B5kQG6DUQ4acrXuX0JxqqQH9Fm2ENa2pOb6tuxMkSI2BnmHaYL5kZhEmBd52gF1rCO/Ylh3
	l0aKb9Dg6U0osI7ZxyBwjtSITOmjCNIsdMJBFghyOmGNklSfT4E3dlE6JjZG8mw/X9pKKmz1o9F
	HPSwl2fn7gbJRa3YfnvSN5RICkqah2OuSlkiEKizf4ouXeajqxmPg5sHxVNAVnEMkUQRG+/2ZE+
	Mcbo+Hc8LXKlqNoXLDzBxR711VODOOgjo+D60+/q23EDh9jAw=
X-Received: by 2002:a05:6a00:1745:b0:82c:21df:807a with SMTP id d2e1a72fcca58-82d0db6ac7bmr11028578b3a.26.1775464343129;
        Mon, 06 Apr 2026 01:32:23 -0700 (PDT)
Received: from [172.16.20.13] ([136.226.252.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm12306813b3a.23.2026.04.06.01.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:32:22 -0700 (PDT)
Message-ID: <68015824-8b8a-4349-a681-163a8ca3b5bc@gmail.com>
Date: Mon, 6 Apr 2026 14:02:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: bridge: ti-sn65dsi83: Add support for
 dual-link LVDS video mode
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, marex@denx.de,
 valentin@compulab.co.il, philippe.schenker@toradex.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260312043743.261475-1-tessolveupstream@gmail.com>
 <20260312043743.261475-3-tessolveupstream@gmail.com>
 <DH0X6JQP0ZIW.3F4LJLIEMWH8M@bootlin.com>
 <9a9e13a5-411a-40bc-b52f-4345e7f6b92e@gmail.com>
 <DH5S3RB2XZ31.3C994FZK5U4OV@bootlin.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <DH5S3RB2XZ31.3C994FZK5U4OV@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18-03-2026 14:22, Luca Ceresoli wrote:
> Hello Sudarshan,
> 
> On Wed Mar 18, 2026 at 6:53 AM CET, tessolveupstream wrote:
>>>> +	if (ctx->dual_link_video_mode) {
>>>> +		regmap_write(ctx->regmap, REG_RC_LVDS_PLL, 0x05);
>>>> +		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>>>> +		regmap_write(ctx->regmap, REG_DSI_CLK, 0x53);
>>>> +		regmap_write(ctx->regmap, REG_LVDS_FMT, 0x6f);
>>>> +		regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x00);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_VERTICAL_DISPLAY_SIZE_LOW, 0x00);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_VERTICAL_DISPLAY_SIZE_HIGH, 0x00);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_HSYNC_PULSE_WIDTH_LOW, 0x10);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_HORIZONTAL_BACK_PORCH, 0x28);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_VERTICAL_BACK_PORCH, 0x00);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_HORIZONTAL_FRONT_PORCH, 0x00);
>>>> +		regmap_write(ctx->regmap,
>>>> +			     REG_VID_CHA_VERTICAL_FRONT_PORCH, 0x00);
>>>> +	}
>>>
>>> I guess these hard-coded values are sepcific to your panel. They must
>>> instead be computed based on the timings in order to work for every panel.
>>>
>>
>> The hard-coded values were initially derived from the TI DSI Tuner output
>> during our bring-up testing. TI had also mentioned that when PATGEN is
>> enabled with dual-LVDS output on the SN65DSI84, the horizontal timings
>> must be divided by 2. They also noted that the current driver does not
>> appear to divide the horizontal timings when PATGEN is enabled in
>> dual-LVDS mode.
>>
>> Based on that suggestion, we had tried adjusting the horizontal timing
>> registers accordingly to match the tuner output.
>> Could you please advise how these register values are expected to be
>> derived from the mode timings so that they work correctly for different
>> panels?
> 
> Well, the principle is quite simple:
> 
>  1. the panel docs tell you which timings the panel needs, e.g. HBP must be
>     10 clock cycles
> 
>  2. your panel description in dts or implementation in a panel driver will
>     then be written accordingly
> 
>  3. the ti-sn65dsi83 driver will receive a struct drm_display_mode* with
>     these values
> 
>  4. based on those values it sets the registers so the SN65DSI84 uses the
>     timings required by the panel (with a bit of math if needed):
> 
> 	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,
> 		     mode->htotal - mode->hsync_end);
> 
> Same for all other timings.
> 
> Ti is more complicated if more cases need to be handled, such as dual-LVDS,
> and the chip documentation is vague about what must be done in those cases.
> 
> I suggested next steps to move forward in reply to the cover letter.
>

Thank you so much for your suggestion.
 
>>>> @@ -965,9 +1001,15 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>>>>
>>>>  	dsi->lanes = dsi_lanes;
>>>>  	dsi->format = MIPI_DSI_FMT_RGB888;
>>>> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>>>> -			  MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
>>>> -			  MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
>>>> +	if (ctx->dual_link_video_mode)
>>>> +		dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
>>>> +	else
>>>> +		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
>>>> +				  MIPI_DSI_MODE_VIDEO_BURST |
>>>> +				  MIPI_DSI_MODE_VIDEO_NO_HFP |
>>>> +				  MIPI_DSI_MODE_VIDEO_NO_HBP |
>>>> +				  MIPI_DSI_MODE_VIDEO_NO_HSA |
>>>> +				  MIPI_DSI_MODE_NO_EOT_PACKET;
>>>
>>> There is no explanation about this, can you elaborate on why?
>>>
>>> I'm working on bringing up a dual-LVDS panel on a board with the SN65DSI84,
>>> and the removing MIPI_DSI_MODE_VIDEO_BURST seems to help, but I still have
>>> no idea why. Should you have any info, maybe from TI, it would be very
>>> interesting.
>>>
>>
>> During our earlier bring-up, TI mentioned that one possible reason for the DSI
>> REFCLK not behaving as expected could be that the DSI output is configured in
>> burst mode instead of non-burst mode. In burst mode the DSI clock may not be
>> continuous, whereas non-burst mode provides a more predictable DSI clock.
> 
> Uhm, this is a bit vague. They basically said "burst can be more
> problematic than continuous", which is obvious, and "try disabling burst
> and see whether it helps" with no explanation on why one works and not the
> other. Shoudl you have more info from them you'd be welcome to share it. In
> particular, is disabling burst mode specifically related to dual-LVDS, or
> just a way to (try to) get rid of some problems without a clear
> understanding?
> 
> On my side I also have a dual-LVDS panel connected to a SN65DSI84, which
> works only by disabling burst mode. I haven't tried upstreaming it because
> I don't have an explanation of why it fixes the panel and so I have no idea
> how to teach the driver when it should disable burst mode.
> 
> Additionally inyour patch you remove many other flags. Any explanation from
> those?
>

Thanks for your inputs.
 
I wanted to share a quick observation from our side. With your suggested 3
patches (links below), the panel started working after simplifying the 
dsi-> mode_flags:
 
https://lore.kernel.org/all/20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-1-2e15f5a9a6a0@bootlin.com/
 
https://lore.kernel.org/all/20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-2-2e15f5a9a6a0@bootlin.com/
 
https://lore.kernel.org/lkml/20260309-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v2-1-e6aaa7e1d181@bootlin.com/
 
Earlier configuration:
 
MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
MIPI_DSI_MODE_VIDEO_NO_HSA | MIPI_DSI_MODE_NO_EOT_PACKET;
 
Working configuration:
 
MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_NO_HSA |
MIPI_DSI_MODE_NO_EOT_PACKET;
 
From our testing, removing MIPI_DSI_MODE_VIDEO_BURST along with the NO_HFP/NO_HBP 
flags results in stable LVDS output in dual-link mode.
 
Could you please suggest how you would prefer to handle this change for 
upstreaming?
 
> Best regards,
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

