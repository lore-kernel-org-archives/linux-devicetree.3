Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8ADDCD
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774418928; cv=none; b=GC7TTZaXw6nTPXGbCscI5hMy5En2lwoqkeqJd5mdjbH9mXta2B+hXQSwQhlNPV7kEkjFrPA6Li6YedmzulD0BYn0fHXMkwiuYpFSQVWshE3rlR/H/15eifa7YILMYpKxHs127k6vw6jhIHpY3XC427AISuyGtvzS+NI/7spPUPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774418928; c=relaxed/simple;
	bh=1+D+BLaB5M4uWTmzm5krxPv4Gd9zSFI+qIO6M7pjiA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGmBHICE8ZRuSgMk1EQj66D5jT5qrIXzcbOm+5oG9K8mFwyQ3XwUlld4XugXlTc/B9m3R3CwqUTnkgU2qDI8Kq65vMp4NCPBdrH1WQARat8T+B2QTf++ggX2CDG6mS63cDO6bIu9v6LiGzzBzGtmIb4EAFRvA+Dpp6KJLZjN5Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPNEfyLq; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPNEfyLq"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so1705924b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774418927; x=1775023727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zoa2MoiF0mKzbu/HxLLzZaaZ2klLwju72NrX2oHwXew=;
        b=pPNEfyLqoDw6GQi0+zgOV0RpCbq6PSES7acMWOjH0W6dEDizD9qrP6TgYnUVWkRztm
         somJxu/eGRZ8g++7zTaRIj06I+7LWrGe2X9VAH2SoAfW/iFYy5HF1acyh/jRn8DAB8kZ
         wZWyXQwzMpA8dB5FOnM02hXVQcvRC6IGZRqGt9VU2pVRpWcQbHwjZgjxMGOP1GxEErHx
         8ZWxSXC/cuqcNObl9F+yZlbDf6GNcknW3EYGAsd/rp/KM0gwIVQ2SKYb0MXQPWHvEJUg
         GmGDUOiahcZqfb7qPUV4RizsD26FNIcBSieNbdPSWLflrE+4EMZbj2LcFLZJ25OMWgtH
         nc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774418927; x=1775023727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zoa2MoiF0mKzbu/HxLLzZaaZ2klLwju72NrX2oHwXew=;
        b=JIRxsXMOL+nlLp2HNlhM3n7DzFauJszrGkFMZoEAgMcUjfl1+esYkImnys4MeagGSO
         d1ZL2qawWrMQKf4cGLGtUrq4aueyipTaLnLLBSbl/6cEEzAQGCVLefzZFbxiI7HqUc1j
         SX2j8ZHNlAWPl29dqlqr6eH3eZYO2ydiu+sxlAFs1Uu4UCs0gnSUh7DlP1vxnj8846Xn
         8mYL4HNm1i8l49Dk7UXvTQk04XaY6VAdymLBnTU+8DTHNXKIU84Th/8vLLPmWM/oaHQu
         XG94isggiD8arSCm6TMQv9nTBmMdhYlz4VQ8BrF1Z3x5naEL4wiipUdSK1HnnB3x5mKU
         nW6w==
X-Forwarded-Encrypted: i=1; AJvYcCWzM6M3lT19VhMpCDqJGxiJJ0RHqDt/P1Ad9OHhGqGcSHaJZD86kdYSWQYQ5yPnnDx+flna3K0PCO3k@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOs3qf1SeVdGZAow8RU7olSWT5LEgOWYbT/N6gFn2Gm5QjfU/
	xjGULlLA2iAMnOvfrzajlZbky4z7h7B52aaLs410+dPw+ppoLMC4bJxE
X-Gm-Gg: ATEYQzwzJUygHw8ynsnUZEMxf7QamHgUWpB4XrpFEYDSFNBVbnNgi573R6TgIDP5gD5
	YciQ/YIlZaUzmP3+2CuTKjQ0U3HyV2kkqsZv8xY02vqnjwpBfNjZIrnWWpPPFRz/H+NXtMqvGGR
	x1S0ZtcX/MiLyGgIqvFnWq24fcNnevSoFOMf33ACAuhHWEoySBMhXbFt9067wT+rHmcUNFAYvLx
	Y1J0HVW2v0uARB7VbNIkgB3iA/WJ90tvRvugC4fDQ1vUzmfTg3UOxR3JRiAEvffYAQRtCw1AZKX
	/5DAI+SKmDl3wl1qvcJmuFXgUHm7eJSoIFbvzRXNb+0u6GdSFX1VBNX65kZj2eS5lD0GUmRn9HR
	/XlmcVJfvIG6sVYxXlD+39Iq5JP+Sz9Xj9EWEdDVR9Uf3/PlhPH3+n1j7wBeogE4aSS3h0CbxdB
	Ue8VhJJUyn/ykex3QN6Bm6CNiLdVn6CNoAtqLJSf/guzekax6akxEIR3ZRoQ==
X-Received: by 2002:a05:6a00:2da7:b0:82a:7758:1416 with SMTP id d2e1a72fcca58-82c6de6df6amr2498384b3a.12.1774418926718;
        Tue, 24 Mar 2026 23:08:46 -0700 (PDT)
Received: from [172.16.20.13] ([136.226.252.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c76e5a6fcsm503033b3a.59.2026.03.24.23.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:08:46 -0700 (PDT)
Message-ID: <d93f15af-219c-4118-bc33-e2ddd2188922@gmail.com>
Date: Wed, 25 Mar 2026 11:39:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm: bridge: ti-sn65dsi83: Improve dual-link LVDS
 support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Marek Vasut <marex@nabladev.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 valentin@compulab.co.il, philippe.schenker@toradex.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260312043743.261475-1-tessolveupstream@gmail.com>
 <DH6T0NTZHP93.2DWN4BWDPP331@bootlin.com>
 <1ecbcd57-83d9-410c-8e1a-d6a171321ccd@gmail.com>
 <3019871.ElGaqSPkdT@steina-w>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <3019871.ElGaqSPkdT@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24-03-2026 16:40, Alexander Stein wrote:
> Am Dienstag, 24. März 2026, 12:00:43 CET schrieb tessolveupstream@gmail.com:
>> [snip]
>>> Thanks for the detailed explanation.
>> Regarding the panel timings, they are not explicitly defined in the DTS. 
>> The panel is currently using the timings provided by the panel driver 
>> (panel-simple.c), specifically:
>>
>> static const struct display_timing auo_g133han01_timings = {
>>         .pixelclock = { 134000000, 141200000, 149000000 },
>>         .hactive = { 1920, 1920, 1920 },
>>         .hfront_porch = { 39, 58, 77 },
>>         .hback_porch = { 59, 88, 117 },
>>         .hsync_len = { 28, 42, 56 },
>>         .vactive = { 1080, 1080, 1080 },
>>         .vfront_porch = { 3, 8, 11 },
>>         .vback_porch = { 5, 14, 19 },
>>         .vsync_len = { 4, 14, 19 },
>> };
>>
>> The panel I am using is based on AUO G133HAN01, and the datasheet can 
>> be found here:
>> https://datasheet4u.com/pdf/1257948/G133HAN01.0.pdf > About CHA_DSI_CLK_RANGE: what is your DSI clock?
>>>
>>
>> In the current working configuration, the measured clock frequencies 
>> are:
>> DSI_CLK: ~422MHz
>> LVDS_CLK(both A & B Channels): ~70MHz
>>> Finally I don't think the swing values are problematic, so I'd leave them
>>> as the last thing to check.
> 
> I managed to get this display running with this DSI->LVDS bridge on
> TQMa8MxML/TQMa8MxNL (imx8mm or imx8mn) platform.
> See [1] for the DT. What platform/ DSI host are you using?
>

Thanks for sharing your setup.

I am currently working on the Qualcomm QCS615 platform. The setup 
is as follows:

- SoC: QCS615
- Bridge: TI SN65DSI84 (DSI to dual-link LVDS)
- Panel: AUO G133HAN01

I am currently using the following DT overlay:
(talos-evk-lvds-auo,g133han01.dtso)
https://lore.kernel.org/all/20260302121159.1938694-1-tessolveupstream@gmail.com/T/#m00e90e7ff95915bbdb21dbd786c232526e3360a2

Could you please confirm whether the display was brought up on your platform 
using only the DT changes you shared, without requiring any driver 
modifications?
 
> Best regards,
> Alexander
> 
> [1] https://lore.kernel.org/all/20260316135820.760073-2-alexander.stein@ew.tq-group.com/

