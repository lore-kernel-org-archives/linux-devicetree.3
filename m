Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D023B7741
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576816; cv=none; b=G4XaUtWF0mvapzmw+WUqKbvs1lXReFDB0ntnVGbpBrf4FisciLQxwLudTUXlx1BcybEnOz5DJhGdUWnPkd0y4cqE+axUNKT/MUSEJWtdTB39Z4+UvnCjbrXy2RNCd0uXlI4Wb26Z1Hehf6B9wUQ9BbOZ77EVyMk4fCOdJnnUFEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576816; c=relaxed/simple;
	bh=BEeMHp4ulcgWvyzYfj6bdDGl2bd5EepRcrHzf7pZd6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbjW1P5+dQNIBV3If4kXF8OQ55jE6wkgFZ7PHG8f2NADeapbySpKS+CNfZ74gDb7EGE+LeQljtYpYtd/GnroxY0cZJfUvZSQ4+RC3xytdd+ygqRu8jpAbz/wqTfGVBkiat3E4HzCK69YQtN42NLp1KsupgaXxKUm9M8b7egFMp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4/6j0Zr; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4/6j0Zr"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3664df30f53so2383125a91.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778576810; x=1779181610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1x3QKNa6wEmvoxZX8OKMfbWBrcN6crkcagrWuMBo3Xc=;
        b=e4/6j0ZrBfIK+TkFpj0P8lifuHD4Gn54AjJ/EbupOLvp327EwzeXKtTl5yJtV/QFDI
         gv7KV2Du6exU31EyWgllRdqlhlBMBPCA9MYPtKT0JoiG0nq3s6WwD1igYThYtZ7F19dm
         lcdeXfSD9TnlhYXrZBf+44WYqNY5ACBfLk8rrsnVZnQKHwWefD+5rMJ1Rg0jboNH8ZcO
         2giHz8zTx53TJXMZERzszBO6WbKDNwT/Qfzq16M4jUgdg24fWKTe5So7Osrv7ycDHriF
         e6HG3XHp9D87lswF5G5A4jyp3QjrkaKoUgngeh3dMCAJ5MCotq4eWMkNdWcu0q1PtLcD
         23lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576810; x=1779181610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1x3QKNa6wEmvoxZX8OKMfbWBrcN6crkcagrWuMBo3Xc=;
        b=IrKuM12PchP7s5o+3XJHQDJkzZlWRP8BDh03eP9m9in3G5NAMl7lvKUFnHVd8fHpbq
         8cZtAmX6Vdpi3/mZ93hyiEWnuomUX0mQwmY87ktg+qqf9/7jqOt/L8gCRPjr6l/LlTvn
         qd9GmfLPEs3YkBc69d0I+tm/E2HfL6XlltyKp/3lvcU1jRqP/S3YGfEKDuSg8dAwLLM+
         rMwoT3486A+JfyGJHypvq5qjIOW2+MHDsyZcjSgaoqddhqpFGlkgjCPzDflp+8b/ZSTc
         qqAEixOI5h97oY0hYOcwGHSjPQfoNgiKSXMCrFJD3rJu4eR3btnkouHDcUe+3G4dbAv6
         WK8A==
X-Forwarded-Encrypted: i=1; AFNElJ/J8VrRPRGTgjMGIl9LoR+aqWyhBtnFHT21tNEP6WbYLLTXvlAwH7BW95PdTb5xwkhwyk2ocY1mWa3G@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiB4y4mWUem0V5VlvfR5EX/PNNZwJa8FDWPiNzdfw+dtJMv54
	MExYmU6IqH8uVmvRnBkkxeoE1wpOJySOU5lZFIAxVh2+VnaojidKpVl9
X-Gm-Gg: Acq92OEPm7PbM8ObDEdzKLzXDiVYe15j+74ZiN/fWkePqCaYGgYEs8AkB+t4BAQL3/0
	uRyrBWd07mDnHabqDiJ1/RNtk4fvSn8DG+jLyoB/LDIEtVYDrjNElHSMyrLFh9mlaQXqFh2SdHZ
	Vu9vmc7KoqabnagqRoFx0P2GldYSLt4MwolpP4QxsRBSMJWvDrAsQds1DXl+ml4MJxkymOMF0Kv
	Q7wrCdyJiP7dbBPkB4RczoXYEtD5fig55FsUfAp6sRmTa5qtOEdyjUB0fsFE0g99oIwvjruKpqK
	Yja9VwQtBu6xEyleEzkvkWamWAWSb59KaOc2ZBC8fzpmzqmgFNzEKjbwYampLEYzJTcxE2ERDZO
	BbaMja15PcOyMi+FX3aUSSzsTqEVjcZ8hia3XkoYkLwkLKQs2ANaLYIoGgLLA46Vvy1uZkOi5+I
	5oCAWLmkn36QPT5p/P4cIOA+4lhPqXf8kd+itUgOZjeFKM5JF7WfHFbczszkG83xVQNWPtk6DoB
	PIA
X-Received: by 2002:a17:90b:3806:b0:367:bf59:6f99 with SMTP id 98e67ed59e1d1-368b26f7b09mr2441610a91.26.1778576809623;
        Tue, 12 May 2026 02:06:49 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625cee7sm10341825a91.2.2026.05.12.02.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:06:49 -0700 (PDT)
Message-ID: <dfbc4042-64cf-49f2-a5de-12260beffaa0@gmail.com>
Date: Tue, 12 May 2026 17:06:43 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/verisilicon: add support for Nuvoton MA35D1
 DCUltra Lite display controller
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-3-a0987203069@gmail.com>
 <93e69179dbc495188cfffd8015350b3a55ce7876.camel@iscas.ac.cn>
 <de35406e-874d-4bdd-be7f-3d74dc37b13f@gmail.com>
 <3b94806073de8bd1d79aa7ec956493f67679e46b.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <3b94806073de8bd1d79aa7ec956493f67679e46b.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/12/2026 4:11 PM, Icenowy Zheng wrote:
> 在 2026-05-12二的 15:45 +0800，Joey Lu写道：
>> On 5/11/2026 5:47 PM, Icenowy Zheng wrote:
>>> 在 2026-05-11一的 15:51 +0800，Joey Lu写道：
>>>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltra Lite
>>>> display
>>>> controller, which is a previous generation of the DC8000 series.
>>>> While
>>>> the general register layout is similar to the DC8000, there are
>>>> several
>>>> key differences that require per-variant handling in the driver.
>>>>
>>>> Add a vs_dc_info platform data structure (in vs_hwdb.h) to
>>>> describe
>>>> per-IP-variant capabilities, and use it throughout the driver to
>>>> select
>>>> the correct code paths at runtime.
>>>>
>>>> Key differences between DC8000 and DCUltra Lite handled:
>>> What the driver supports now is DC8200, DC8000 have the following
>>> point
>>> 1~4 the same with DCUltraLite (different to DC8200).
>> Understood. I'll rename all `vs_dc8000_*` identifiers to
>> `vs_dc8200_*` in v2. The commit message will also be corrected to say
>> that points 1~4 are differences from DC8200, not DC8000.
>>>> 1. No chip identity registers (0x0020-0x0030): DCUltra Lite uses
>>>> static
>>>>      platform data instead of reading model/revision/customer_id
>>>> from
>>>> HW.
>>> My test shows that revision and customer_id is correctly present,
>>> only
>>> model is 0 -- I think this can be also considered as a valid model
>>> value because the IP name has also no model number.
>>>
>>> The revision number is 0x5560 and customer id is 0x305 .
>> Thank you for testing. I'll drop the `has_chip_id` flag
>> entirely. In v2, `vs_fill_chip_identity()` will be called for all
>> variants. A new entry will be added to `vs_chip_identities[]` in
>> vs_hwdb.c with model=0x0, revision=0x5560, customer_id=0x305,
>> display_count=1, and `vs_formats_no_yuv444`.
>> e.g. verisilicon-dc 40260000.display: Found DC0 rev 5560 customer 305
>>>> 2. No CONFIG_EX commit mechanism: DC8000 uses registers at 0x1CC0
>>>>      (FB_CONFIG_EX), 0x24D8 (FB_TOP_LEFT), 0x24E0
>>>> (FB_BOTTOM_RIGHT),
>>>>      0x2510 (FB_BLEND_CONFIG), 0x2518 (PANEL_CONFIG_EX). DCUltra
>>>> Lite
>>>>      omits all of these and instead uses enable/reset bits in
>>>> FB_CONFIG
>>>>      (bit 0 = enable, bit 4 = reset) for direct framebuffer
>>>> updates.
>>>>
>>>> 3. No PANEL_START register (0x1CCC): DCUltra Lite panel output
>>>> starts
>>>>      when PANEL_CONFIG.RUNNING is set; no separate multi-display
>>>> sync
>>>>      start register is needed.
>>>>
>>>> 4. Different IRQ registers: DCUltra Lite uses 0x147C (IRQ_STA) /
>>>>      0x1480 (IRQ_EN); DC8000 uses 0x0010 (IRQ_ACK) / 0x0014
>>>> (IRQ_EN).
>>>>
>>>> 5. Different clock/reset topology: DCUltra Lite requires only
>>>> "core"
>>>>      (bus gate) and "pix0" (pixel divider) clocks with no reset
>>>> lines
>>>>      managed by the driver. DC8000 needs core/axi/ahb clocks and
>>>> three
>>>>      resets.
>>> It's possible that your SoC integration combines core clock gate
>>> with
>>> bus clock gate instead of bus clock gate not existing.
>> Agreed. In v2 I'll remove the family-gated clock handling and
>> instead use `devm_clk_get_optional_enabled()` for the axi and ahb
>> clocks, so they are simply skipped if not present in DT. Resets are
>> already optional. This keeps the probe path uniform and handles any
>> SoC-specific clock combinations naturally.
> Maybe this could be splitted as another patch, to make single commits
> smaller.
Got it.
>>>> 6. Single output only: DCUltra Lite has one display output; per-
>>>> output
>>>>      index logic is still in place but display_count is fixed at
>>>> 1.
>>>>
>>>> 7. Reduced register space: max_register is 0x2000 vs DC8000's
>>>> 0x2544.
>>>>
>>>> Add the "nuvoton,ma35d1-dcu" compatible string to the OF match
>>>> table,
>>>> extend Kconfig to allow building on ARCH_MA35 platforms, and
>>>> expose
>>>> vs_formats_no_yuv444 as the default format table for DCUltra Lite
>>>> (YUV444 blending is a DC8000-only feature).
>>>>
>>>> All changes have been tested on Nuvoton MA35D1 hardware and are
>>>> functioning correctly.
>>>>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
>>>>    drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
>>>>    drivers/gpu/drm/verisilicon/vs_dc.c           | 129
>>>> ++++++++++++----
>>>> --
>>>>    drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
>>>>    drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
>>>>    drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
>>>>    drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
>>>>    .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
>>>>    .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
>>>>    10 files changed, 187 insertions(+), 74 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig
>>>> b/drivers/gpu/drm/verisilicon/Kconfig
>>>> index 7cce86ec8603..295d246eb4b4 100644
>>>> --- a/drivers/gpu/drm/verisilicon/Kconfig
>>>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>>>> @@ -2,7 +2,7 @@
>>>>    config DRM_VERISILICON_DC
>>>>    	tristate "DRM Support for Verisilicon DC-series display
>>>> controllers"
>>>>    	depends on DRM && COMMON_CLK
>>>> -	depends on RISCV || COMPILE_TEST
>>>> +	depends on RISCV || ARCH_MA35 || COMPILE_TEST
>>>>    	select DRM_BRIDGE_CONNECTOR
>>>>    	select DRM_CLIENT_SELECTION
>>>>    	select DRM_DISPLAY_HELPER
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> index 7a93049368db..225af322de32 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>> @@ -164,13 +164,16 @@ static void vs_bridge_enable_common(struct
>>>> vs_crtc *crtc,
>>>>    			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>>    	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>    			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			
>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> -			VSDC_DISP_PANEL_START_RUNNING(output));
>>>>    
>>>> -	regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>> id),
>>>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>> +	if (dc->info->has_config_ex) {
>>>> +		regmap_clear_bits(dc->regs,
>>>> VSDC_DISP_PANEL_START,
>>>> +				
>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>> +		regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>> +				VSDC_DISP_PANEL_START_RUNNING(ou
>>>> tput
>>>> ));
>>>> +
>>>> +		regmap_set_bits(dc->regs,
>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>> +				VSDC_DISP_PANEL_CONFIG_EX_COMMIT
>>>> );
>>> Should the commit operation happen on DC8000/DCUltraLite too? (By
>>> writing to DcregFrameBufferConfig0.VALID).
>>>
>>> Many registers written has "Note: This field is double buffered" in
>>> the
>>> DCUltraLite documentation.
>>>
>>> I suggest create a static function for commit -- write to the
>>> corresponding commit bit on DC8200, and write to
>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>> [a] There is no commit operation for DCUltra Lite.
>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID (BIT(3)) is a
>> hardware-managed double-buffer status bit: hardware writes 1=PENDING
>> when a new register set is ready and clears to 0=WORKING after the
>> VBLANK copy. Software must never write it, and there is no polling
>> use
> It seems to be writable and controls whether register buffering is
> enabled, see [1].
>
> The description of this bit in MA35D1 TRM says "This ensures a frame
> will always start with a valid working set if this register is
> programmed last, which reduces the need for SW to wait for the start of
> a VBLANK signal in order to ensure all states are loaded before the
> next VBLANK", which indicates some kind of "committing write", although
> the code at [1] seems to indicate that double buffering is only enabled
> when bit is cleared.
>
> Anyway this bit should be programmable, and "Software must never write
> it" contradicts with the MA35D1 TRM.
>
> Thanks,
> Icenowy
>
> [1]
> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
Thank you for the correction. I'll add
`#define VSDC_FB_CONFIG_VALID BIT(3)` to vs_primary_plane_regs.h and
write it in `vs_primary_plane_commit()` for non-config_ex variants.
>> case in the driver that requires a named constant. For non-config_ex
>> variants, `vs_primary_plane_commit()` performs no commit operation —
>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET` (BIT(4)) is
>> set/cleared in the bridge enable/disable paths.
> ========= 8< ==========
>
