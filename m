Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171BA318BA8
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464551; cv=none; b=F1NEeP48G3Zb04MAXJqAoa60KiSpN/N/e/8shkbYkImKOFXpH60vMJzCSh+/QRu973u54wTQ/+xMVjRDX+C4XGYvQk+we/SYNSEVP4nSU8it3kFQ83Rpf1nX0eqSsdgklLazPGYLZk/kK4jEEYimMQxDyBPF9lLHLN7A4XfBgws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464551; c=relaxed/simple;
	bh=igxfLzjNRzlg/VIKwNlvJVJy0GbqwQZ5ZRoK9S4PnPo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=H3dw6c/ew5AmTbjtIXL1DbqO3TNxRoIzS1DnAZxJgSIpm5UtH+xpGbrj2a5qFoFlkR4toerxvgFGujhzFv34QBPS9JWU0V3AiGeIFA8EIVr9fnTE6xcXyCak1H0uoUnpahKdJIw4Vp8GMk5Im0rwdxbVH/2+1fKn9pDMhUIdiJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iv6fJOdA; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iv6fJOdA"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c648bc907ebso2639687a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775464548; x=1776069348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MB0F9SKYr6+JVse3TW9scM+eJP0jATRzNvx3luR3WWo=;
        b=Iv6fJOdAX4yk4DKa0HYr99WL2eCpEfKX6Vcvu1BXHsg2Wc45mcoIhokGNPytZQjA40
         9nOFZ5JK9cQr8hfJyd1r73tBb4p629UK680J1IfHCW1qvEn1LH+ofyFRxvfWefegbgaT
         Oebz4Nzh48TOQYAOAO0i1MoeGHQc1PcD8zI8NiqyGmel2CDMdjWJNj3RNjyZcLDjbn/V
         4Ye0CV2nULsf0N2bGY9Zaj4LuFeMIpO9905X58BWFPHV45HOt8mE1VMBf5BP9hsZv3u8
         oJAOSZXOkxrbvSEqHz0hRVYSyM5vMvOlBbJZ5TJz/VMbnl1HxcseYq/yqLg+hsrP4j0z
         xXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775464548; x=1776069348;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MB0F9SKYr6+JVse3TW9scM+eJP0jATRzNvx3luR3WWo=;
        b=fALYStZ9sSRFM/sGKck4FaIDvT/n5BhmlloQC26BgIVW2b1qhmjubkneTwzvmIcRyi
         7hZymObwSSA0o/OBjmspDZzt53/0ao/B6NfMDv5STfpDFX3nJm88xY43dZsJbBAjp/3X
         SVBpwq1Q1E680GouobXWvwX70DD83OqNz5QtIyrhViWNAeAmpjcR/swblrVX/wkorpxD
         RA8LBo7yJu6DQlSgWqdS7A8BU2baQ04uvmhM1g9H6Aq4C6+fd/CdBse2J8qY90HR+OrW
         hSN7ZsqVtMKGA7ik6U18pfY9UfgUqM79Pzg6fNy3q3M6fpKQ3Bcbv6ysR1ApitQNs2I7
         AISQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVTsL6yaHdsYG38GFoOCQA9BIJWMdy8aXo3Vc+Y86O/oune1G2BwZFch6mJi2h0vMxy1OHkeUB7INY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuzj5pZpWyGLKO4MYufKxD1jYfyQCjsKCiBh7J1sY16synn8Yw
	tlh08IAre5qDHcEMSXM8A97JV/0P2Icb+A2rnmnmEY7cMafQ2C5yjCQk
X-Gm-Gg: AeBDiesTtAuXSGw0sQnExfMfmvjhfsXhDK0Sy5nbe5tQvJ+pqvbjuzTFl0DJS5a8zEN
	bRNUIU8gavMmqKdMdKKhmCcS/QIiUJ9Xx8Qj297dzcexXvS4DzHoVXLXQKon2bTwcpwDcYaMcfB
	5k4lAf0gQONQQAFWhiqogryqiWIN2JY5fTwcON9SLw6cxWGcdK02ENKHIh3H/iIYJt3VeVo3uxC
	mp4StPxsTjleupXlEtL0Z5gLIMoBQ6lPPO3TMV26F649qyNbR0xRFMWsb8NodXRluwNt38Eb8u3
	/Xxh3jLcW0r+taEFXsZSG/XxKA5oaBd8Oa5iIpJRVIO3ZChSuI2GyVEZqicxxSWQqHgNSLa3xDD
	QAj/RbCCDfp4bhq6Hn0J5k0zqPMzkDRSKEi1tRx8jvU6vMMt2m/RKPFtict00MsfWk9+o/eJWxI
	PbZeetp+vDfU0mNpuhs0DWXkit0fZkxmCQdD2XAz/1iwPr+IM=
X-Received: by 2002:a05:6a20:7354:b0:39b:e321:784f with SMTP id adf61e73a8af0-39f2f05041dmr12441393637.40.1775464548351;
        Mon, 06 Apr 2026 01:35:48 -0700 (PDT)
Received: from [172.16.20.13] ([136.226.252.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm13741897b3a.29.2026.04.06.01.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:35:47 -0700 (PDT)
Message-ID: <35eed359-8088-4ec0-9e16-e5cb31e0952e@gmail.com>
Date: Mon, 6 Apr 2026 14:05:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: tessolveupstream@gmail.com
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

