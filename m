Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F33E928D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350027; cv=none; b=cCDJcSVMIhEzgMePY3C+joo1opt7v6q/2ylvxN84FBUczYpbks/mo/aERMTBeKo5n90mnr9Ls3lc3TIdUn3a5siWpgfrQbOwAIGUDeFFcDFp46MpvZnSMeazkQwe0NLB/Zk3m2a26MHWTFdcHNQItGlli8WDATRUzOhNIGUalio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350027; c=relaxed/simple;
	bh=cIzV8A6gjnfBxi7M/jkO/ioGwvuFgJlAElj7dwnbGAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxJaDxOZXNvZRRe8mhkniolH12F+J4k/9fkSL7MZUw5yHfCF9uXwQR9Bs71xai+9rPjWQtIuNgag/Y3Esk/hwMsmSYNyPgKhQONQ6QDfp95JSqCv9AQOXAPSgvV/rkM4P1UBpgpYVCGo6riek8y+R6TG0hiC0K07BnQMkzKqpzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evfMiBj6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evfMiBj6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829a27414a3so2334480b3a.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774350026; x=1774954826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vg+tszAFkDYIKeCq8j/spGiQp8FN+9eBFj0O9Fz1BUg=;
        b=evfMiBj66QGvoFL1YW/+gtZecFQCjFVXPLpxT9vzWoAKcwXKmiIbAjiK49Xnaa3yrt
         3XFGn3UShpRqMtYw2QEbhvbNfgWMyWXv6chz152DnMmVmcgXV9v+ch12guRiUb0rcDVb
         gCX7vfOSegCuquPxF4PAYB8u9hjZOHHsMm3AALAXklmMS4dZs0NTXbKiqkiSio5Lyxng
         wMY3HE3pTNs+mFtPYF+HW+2qlXmlNWkxRFKsT+CgyXmM/pwnNv4RL+i7ev1H8BhVq6wM
         LjlcxSQnhNfXGWfkr+EzpyCS9rG2QNR2dtH1Zv8BT9XLk/9xQM2WGS6GgZIn85gXjX2K
         B3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350026; x=1774954826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vg+tszAFkDYIKeCq8j/spGiQp8FN+9eBFj0O9Fz1BUg=;
        b=OE1xf/g7aw7lSfskRIT/pLEhRMVzuQjHs5CDEM3/wKAjFq5m/fLeJfNIk1eiwC1IyB
         MCinCm96Ay6Jh8+vo/66dMBnWziq6OusV3QDfwhH99aHgYqRKmGb+hOgKCt2td2pHcJ/
         R0tEm6WWmMsco380J/DW2IbwiYlZabauSg67ScCS/kVuiVu2AXAkP7bJtPHl/vmksVG0
         HslKT2bbdBcxkjr15Fuv7e/q6CPYtsv6TmcSxlVbS00NpyDFP+ziaaF1n1AEIF/S9mZr
         NAV/6hGENB9R7cR6/GHh+8yqYN+Vpgxj9L8GFIdg19VL6XLpVrU6Q6QuqM/bSt9+Okzo
         sbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYib5dRVCqaco2SIpIhNIdaQPUGxKGnJCIxkWlA7Zr7Cx+KAgAk9174uTpiZBlz00lavU4/QB8bacE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1KT8q4WlTvMwj8EpHURAOXhOyj4G7zyxm5qd0sGqF40E/SAD4
	MPWh3e2TeZecCf+YgC5L6znQIh4qH62yBEQVD6Yv/n06sfGBofJ+RrV8
X-Gm-Gg: ATEYQzzW9Lq5uRkuk5X2Ka6jU7LRgvHJEOZ9W4+yF2Ba14+zmgK9pqe2VNwowXxvGcm
	vatpmF6++U3SfLVFg+7OA0PZYVEI5c5bDD8qoUKxzYXrE3WFPJYYY8Ho4qkFbMzBMvKspFOR67H
	M+f2ENS9vdMAzCQ6eFdwTd6W4SdHDsGH5/F6jlEXH3BV+hmgivcMKBQ9fHeGOI//pqIuYIIZQqz
	YVCD0hLTpjft1D/dPPh7+9dtOLapttK/IFHZoT6zlhnZI6+MhZjHiJWwVIMkooMDQqWHsNBJ2pK
	CM8QG68EDmcwaZ2n6wN/u5yYa8wfu9dahUvoS77pAPqKCHeM76wmKzuU1b+Rex7J0OVJXzLXCQ2
	eR4gbmdsJlnIzUMoVuF4Z+WHd+/P2aW1Xy2QZUPcJEovBqsyMRV+zrT4HZHytKH0JvK57K4LDCI
	hIDv0XpAxOAe6AKJtkFXaHlsx21y6fdRlffamu03gNzmBk44c=
X-Received: by 2002:a05:6a00:1a89:b0:81f:b97:14a with SMTP id d2e1a72fcca58-82a8c3b8f88mr13871688b3a.61.1774350025354;
        Tue, 24 Mar 2026 04:00:25 -0700 (PDT)
Received: from [172.16.20.13] ([136.226.252.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc1e59sm12800759b3a.13.2026.03.24.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:00:24 -0700 (PDT)
Message-ID: <1ecbcd57-83d9-410c-8e1a-d6a171321ccd@gmail.com>
Date: Tue, 24 Mar 2026 16:30:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm: bridge: ti-sn65dsi83: Improve dual-link LVDS
 support
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Vasut <marex@nabladev.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 valentin@compulab.co.il, philippe.schenker@toradex.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260312043743.261475-1-tessolveupstream@gmail.com>
 <9f694b2d-44bc-46ad-8aa3-b464c2f0da13@nabladev.com>
 <176ed865-11a6-42de-89e0-06951b59a430@gmail.com>
 <DH0X7QW3AH3C.PRNRA8CRSSKA@bootlin.com>
 <49b79a0d-844b-4fee-bccb-706187ed76d1@gmail.com>
 <DH5S3DYT0PJQ.11ABZFGEU6ZPC@bootlin.com>
 <a937f714-d013-4ac2-a52b-2893fc16f225@gmail.com>
 <DH6T0NTZHP93.2DWN4BWDPP331@bootlin.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <DH6T0NTZHP93.2DWN4BWDPP331@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19-03-2026 19:17, Luca Ceresoli wrote:
> On Thu Mar 19, 2026 at 10:55 AM CET, tessolveupstream wrote:
>>
>>
>> On 18-03-2026 14:21, Luca Ceresoli wrote:
>>> Hello Sudarshan,
>>>
>>> On Wed Mar 18, 2026 at 6:45 AM CET, tessolveupstream wrote:
>>>>>>> You might want to look at recently posted:
>>>>>>>
>>>>>>> [PATCH 2/3] drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output
>>>>>>
>>>>>> Thanks for pointing this out.
>>>>>> I tried applying the patch “[PATCH 2/3] drm/bridge: ti-sn65dsi83: halve horizontal syncs for dual LVDS output” on top of the current tree and
>>>>>> removed the changes that I had previously added in the driver.
>>>>>> However, with this patch applied, I am currently seeing only the backlight turning on and no image on the LVDS panel.
>>>>>> For reference, the LVDS panel used on our platform is G133HAN01.1 and the
>>>>>> DSI-to-dual-link LVDS bridge is SN65DSI84ZXHR.
>>>>>
>>>>> Thanks for having tried.
>>>>>
>>>>> Can you please test with both the fixes in the series applied + the test
>>>>> pattern feature and report the results you get with and without test
>>>>> pattern enabled?
>>>>>
>>>>> The patches to apply are:
>>>>>
>>>>>  - https://lore.kernel.org/all/20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-1-2e15f5a9a6a0@bootlin.com/
>>>>>  - https://lore.kernel.org/all/20260226-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v1-2-2e15f5a9a6a0@bootlin.com/
>>>>>  - https://lore.kernel.org/lkml/20260309-ti-sn65dsi83-dual-lvds-fixes-and-test-pattern-v2-1-e6aaa7e1d181@bootlin.com/
>>>>>
>>>>
>>>> Thanks for the suggestions.
>>>>
>>>> I tested the three patches together as mentioned, but the LVDS panel
>>>> still only shows the backlight and no image. I also tried removing the
>>>> test-pattern patch and retesting with only the remaining two fixes, but
>>>> the result remained the same — only the backlight turns on and no image
>>>> is displayed.
>>>
>>> Sure, the test pattern patch does not change anything, unless you enable
>>> the test pattern.
>>>
>>>>> The first thing I suggest doing on your side is testing with the 3 patches
>>>>> mentioned above.
>>>>>
>>>>> If you display works, good! Let us know (you can also add your Tested-by /
>>>>> Reviewed-by tags to the test_pattern patch too if applicable).
>>>>>
>>>>> If it doesn't work, compare the individual register values to find the
>>>>> differences, try to figure out why the working setting works and how to
>>>>> apply that change to the driver in away that keeps other boards
>>>>> working. You're welcome to come back here to discuss it in case you can't
>>>>> find out on your own.
>>>>>
>>>>
>>>> I tested the three patches as suggested, but the panel still shows only the
>>>> backlight with no visible image. I’m unsure how to translate the working
>>>> register values into a generic fix based on display timings. Any guidance
>>>> on the right direction would be helpful.
>>>
>>> What you should do is:
>>>
>>>  1. with your patches, and while the display is enabled (and working) do
>>>
>>>      cat /sys/kernel/debug/regmap/4-002c/registers >regs.working
>>>
>>>  2. remove your patches, add the 3 I mentioned, and while the display is
>>>     enabled (but only backlight is working) do
>>>
>>>      cat /sys/kernel/debug/regmap/4-002c/registers >regs.broken
>>>
>>> Then compare regs.working and regs.broken. Which registers differ? Can you
>>> give a reason for the differences?
>>>
>>> You can come back with these values here so we may discuss them.
>>>
>>
>> I followed your suggestion and captured the register dumps in both cases.
> 
> Thanks for getting the values.
> 
>> In the working case, several of the timing registers remain at 0,
>> while in the broken case they are programmed with non-zero values.
> 
> Yes, but read the documentation carefully and you will discover this is
> OK. Also you shuld analyze all the differences, some are very interesting.
> 
> The differences are:
> 
>   reg working broken  what changes
>   12:   53      55    CHA_DSI_CLK_RANGE
>   18:   6f      0f    HS_NEG_POLARITY, VS_NEG_POLARITY
>   19:   00      05    CHB_LVDS_VOD_SWING, CHA_LVDS_VOD_SWING
>   24:   00      38    CHA_VERTICAL_DISPLAY_SIZE_LOW (*)
>   25:   00      04    CHA_VERTICAL_DISPLAY_SIZE_HIGH (*)
>   2c:   10      15    CHA_HSYNC_PULSE_WIDTH_LOW
>   34:   28      2c    CHA_HORIZONTAL_BACK_PORCH
>   36:   00      0e    CHA_VERTICAL_BACK_PORCH (*)
>   38:   00      1d    CHA_HORIZONTAL_FRONT_PORCH (*)
>   3a:   00      08    CHA_VERTICAL_FRONT_PORCH (*)
> 
> Values with (*) are those you mentioned above (zero in the working case,
> nonzero in the "broken" case). The docs for these registers says: "TEST
> PATTERN GENERATION PURPOSE ONLY". Those values are irrelevant when not
> using the test pattern.
> 
> Your timings are all different. That means probably you have them
> incorrectly described in device tree or the panel driver, so the
> ti-sn65dsi83 driver computes them using a correct formula but based on
> incorrect inputs, thus producing incorrect output values into the
> registers. What are the timings in your dts or the panel drivers? If you
> don't understand the question: what is your panel description in device
> tree?
>

Thanks for the detailed explanation.
Regarding the panel timings, they are not explicitly defined in the DTS. 
The panel is currently using the timings provided by the panel driver 
(panel-simple.c), specifically:

static const struct display_timing auo_g133han01_timings = {
        .pixelclock = { 134000000, 141200000, 149000000 },
        .hactive = { 1920, 1920, 1920 },
        .hfront_porch = { 39, 58, 77 },
        .hback_porch = { 59, 88, 117 },
        .hsync_len = { 28, 42, 56 },
        .vactive = { 1080, 1080, 1080 },
        .vfront_porch = { 3, 8, 11 },
        .vback_porch = { 5, 14, 19 },
        .vsync_len = { 4, 14, 19 },
};

The panel I am using is based on AUO G133HAN01, and the datasheet can 
be found here:
https://datasheet4u.com/pdf/1257948/G133HAN01.0.pdf > About CHA_DSI_CLK_RANGE: what is your DSI clock?
> 

In the current working configuration, the measured clock frequencies 
are:
DSI_CLK: ~422MHz
LVDS_CLK(both A & B Channels): ~70MHz
> Finally I don't think the swing values are problematic, so I'd leave them
> as the last thing to check.
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

