Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CC401A22
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836114; cv=none; b=IuKd6mhYP02BHnv2qdaft9PjVe1HUJKTSOVkC/Eoi40H8w2essswzrI+Jq3uhmprD8xAo9UO+yKNv25fkmqVvpbkw0aXngQagBhdHcT/5VP5OMbRjotnv2vEpPevA5fF1YNLh2rW98T9W3gCZaLMBkIPn7FB580HncH30pddp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836114; c=relaxed/simple;
	bh=MNJXilQnBvYEG82nQpV/+W1YuceTtoGlk0VMSzRioAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smszYKBJwso8Mnysy+TO7MV3JCxxmh/fBTOhBorFabbL09BnLFGwYGh+Kjy0oZ1w1yWLxn9StJVwi/0bMDrBHIaoxVmCfFTsbDnO9lkkmVhudyWJX6/Mp+fCW+zysdQdxuK/8QDduXT9Xalu5EZN49qrsyN105sjwbBnaG/AhWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItzQvet1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItzQvet1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bccb978bd9so4273725ad.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778836112; x=1779440912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDBlcreApT69nD2JDPHGYA71d8rTboSMPdYxDM3luXk=;
        b=ItzQvet1GVehZ+GBmqLOD50+FZooTlJ68/M0/tyKHc6IeEJyJ5lQglQJiQ+o50VxMo
         yqhgCldzqku1p9Yjjz0qFLLRkvQWdDXNBQEEZXYudWrgg2IwM9NCQBHf6nDI7yX3oaVv
         pMZZNl1590THb56285AJSz7sfXKpeWiBdXkoKF3MaLyhzHxWr0xCbbt+SPcq7riRzjB1
         zU8Z7eackz3CeDaH5wTM2oMRUg/jxHDp3BbM/MHRsVTSyISL6mbCA5kBA6wI3djigBm+
         7mQpV98aKrW5nXlYRhOA122ic+yz0bXUyRK5qdP53X4mS1BaFO3cV/sd7JmqFTKWUNfR
         qzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836112; x=1779440912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDBlcreApT69nD2JDPHGYA71d8rTboSMPdYxDM3luXk=;
        b=c75mK3dNw0kCw2yqkXH4tr4+uq8W5JaO410cVp1hTxLzaolrVU/9kKiS59EcJL01zr
         M0O5dDjr8XOIl4XF1HJMM2fEkpU0sYQmn/EBU5z6p6ngQ2/RpC9qkyF4MpxPZMXjmEU5
         RdmhiZmJslWVT/mplW3mj1kfyCrEzwC2kRzp26QzdxkgSmEd9OU0iuXvyWnE/hijjS8+
         7J7dna0bIBtKw0+mWo8WZfrAf2zTJpMZVu3bpc3jTR+GG7SzD8oWJF3dfWBUJNL/1fGL
         V9R8wgnR2ngkGXeeq0TXk5NepUqQRdv5YDlQLstSsbpqpUCs6MDfu6MMn+dHhU9q8477
         n2vw==
X-Forwarded-Encrypted: i=1; AFNElJ/thQhB0j47CV88H54pb7i4JphUkYtt5TpqE3Ml73TDtM/GMMy3MnDxYZwS8JkMQY3miwfn1e6gjDuG@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPm5sdXhUkpU6F8MDX3gAt8im552w+wZ++FVRb6VwPpbL+KbR
	+OQMIZbP+OOkghynBiDiFdm91Tj0hO7lFF7s8KKususVOOLkHFm98izT
X-Gm-Gg: Acq92OHvETqZoGILXjv3shEeP+bX1rrU21ZvulpF+fxUHiiD6iSDYbT4VZLHg4ie7Pt
	xp/re2uJIiyG+u+OkgMoAE+P5iW8cORwD/Sqr0uPVpANWvPUJJwL6PE8Ppmu1Cb5eHrF018vVyx
	bbRhiNVMFifQxaK1Ry6S29Ip2hBF3yKwOjjvg98D3IeedWEgb+XEezrCJrVK+6Gsqmv/0wqP4Va
	fnYkyidUoapXniNcpyvwPHIXZzQEt5w/mmybVrRQaYOCgpMr8KW1u6aJoBhEkxhmTS2mLJISwH7
	wfWIXqbu2/y53qRI9tpe7tau0amVG7uSv/GX1VlOor3RsI5JhckiQbFpjZ3jpe9pEpPUaAv13Q9
	ccL8OsElmrkWNO+VWMzzvDKjnpSqCTtCTDcNswerlCPCev/5HwkkwE8hl45zGnT21dXQzWe6vf+
	wvHhjwr946vLMh3JCwkbXMWyf85P4q1ueOJNH4slk1VT810lSyfiQX8WsXcg3Wp7yGERW87ijHy
	zEh+8dSeJQNhDY=
X-Received: by 2002:a17:903:46c7:b0:2bc:dca9:f0ed with SMTP id d9443c01a7336-2bd7e9249a5mr28348315ad.15.1778836111714;
        Fri, 15 May 2026 02:08:31 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm55522125ad.65.2026.05.15.02.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:08:31 -0700 (PDT)
Message-ID: <520e1683-6d5c-4e1f-8811-0ef78cf8d605@gmail.com>
Date: Fri, 15 May 2026 17:08:25 +0800
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
 <dfbc4042-64cf-49f2-a5de-12260beffaa0@gmail.com>
 <4bf6efbb222ebc4d770ad613d17c6185e7cb2fda.camel@iscas.ac.cn>
 <1d04dd6d-f245-4b83-96b0-c5491fad8093@gmail.com>
 <76a9e9b676509e85484a1eb31c723b46c7e21a19.camel@iscas.ac.cn>
 <1a42a168-1dbb-467e-9053-b5585a737f71@gmail.com>
 <1c4d8611411e2d14699ac0b9aeb5b2377feedc8a.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <1c4d8611411e2d14699ac0b9aeb5b2377feedc8a.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/15/2026 4:38 PM, Icenowy Zheng wrote:
> 在 2026-05-15五的 14:25 +0800，Joey Lu写道：
>> On 5/12/2026 9:12 PM, Icenowy Zheng wrote:
>>> 在 2026-05-12二的 18:59 +0800，Joey Lu写道：
>>>> On 5/12/2026 6:01 PM, Icenowy Zheng wrote:
>>>>> 在 2026-05-12二的 17:06 +0800，Joey Lu写道：
>>>>>
>>>>> ======= 8< =============
>>>>>>>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> index 7a93049368db..225af322de32 100644
>>>>>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>>>> @@ -164,13 +164,16 @@ static void
>>>>>>>>>> vs_bridge_enable_common(struct
>>>>>>>>>> vs_crtc *crtc,
>>>>>>>>>>       			VSDC_DISP_PANEL_CONFIG_CLK_E
>>>>>>>>>> N);
>>>>>>>>>>       	regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>>>>>>>       			VSDC_DISP_PANEL_CONFIG_RUNNI
>>>>>>>>>> NG);
>>>>>>>>>> -	regmap_clear_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> -			
>>>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>>>> -	regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> -
>>>>>>>>>> 			VSDC_DISP_PANEL_START_RUNNIN
>>>>>>>>>> G(ou
>>>>>>>>>> tput));
>>>>>>>>>>       
>>>>>>>>>> -	regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>>>>>>>> id),
>>>>>>>>>> -
>>>>>>>>>> 			VSDC_DISP_PANEL_CONFIG_EX_CO
>>>>>>>>>> MMIT);
>>>>>>>>>> +	if (dc->info->has_config_ex) {
>>>>>>>>>> +		regmap_clear_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> +				
>>>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>>>> +				VSDC_DISP_PANEL_STAR
>>>>>>>>>> T_RU
>>>>>>>>>> NNIN
>>>>>>>>>> G(ou
>>>>>>>>>> tput
>>>>>>>>>> ));
>>>>>>>>>> +
>>>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>>>>>>>> +				VSDC_DISP_PANEL_CONF
>>>>>>>>>> IG_E
>>>>>>>>>> X_CO
>>>>>>>>>> MMIT
>>>>>>>>>> );
>>>>>>>>> Should the commit operation happen on
>>>>>>>>> DC8000/DCUltraLite
>>>>>>>>> too?
>>>>>>>>> (By
>>>>>>>>> writing to DcregFrameBufferConfig0.VALID).
>>>>>>>>>
>>>>>>>>> Many registers written has "Note: This field is double
>>>>>>>>> buffered" in
>>>>>>>>> the
>>>>>>>>> DCUltraLite documentation.
>>>>>>>>>
>>>>>>>>> I suggest create a static function for commit -- write
>>>>>>>>> to
>>>>>>>>> the
>>>>>>>>> corresponding commit bit on DC8200, and write to
>>>>>>>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>>>>>>>> [a] There is no commit operation for DCUltra Lite.
>>>>>>>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID
>>>>>>>> (BIT(3))
>>>>>>>> is a
>>>>>>>> hardware-managed double-buffer status bit: hardware
>>>>>>>> writes
>>>>>>>> 1=PENDING
>>>>>>>> when a new register set is ready and clears to 0=WORKING
>>>>>>>> after
>>>>>>>> the
>>>>>>>> VBLANK copy. Software must never write it, and there is
>>>>>>>> no
>>>>>>>> polling
>>>>>>>> use
>>>>>>> It seems to be writable and controls whether register
>>>>>>> buffering
>>>>>>> is
>>>>>>> enabled, see [1].
>>>>>>>
>>>>>>> The description of this bit in MA35D1 TRM says "This
>>>>>>> ensures a
>>>>>>> frame
>>>>>>> will always start with a valid working set if this register
>>>>>>> is
>>>>>>> programmed last, which reduces the need for SW to wait for
>>>>>>> the
>>>>>>> start of
>>>>>>> a VBLANK signal in order to ensure all states are loaded
>>>>>>> before
>>>>>>> the
>>>>>>> next VBLANK", which indicates some kind of "committing
>>>>>>> write",
>>>>>>> although
>>>>>>> the code at [1] seems to indicate that double buffering is
>>>>>>> only
>>>>>>> enabled
>>>>>>> when bit is cleared.
>>>>>>>
>>>>>>> Anyway this bit should be programmable, and "Software must
>>>>>>> never
>>>>>>> write
>>>>>>> it" contradicts with the MA35D1 TRM.
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Icenowy
>>>>>>>
>>>>>>> [1]
>>>>>>> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
>>>>>> Thank you for the correction. I'll add
>>>>>> `#define VSDC_FB_CONFIG_VALID BIT(3)` to
>>>>>> vs_primary_plane_regs.h
>>>>>> and
>>>>>> write it in `vs_primary_plane_commit()` for non-config_ex
>>>>>> variants.
>>>>>>>> case in the driver that requires a named constant. For
>>>>>>>> non-
>>>>>>>> config_ex
>>>>>>>> variants, `vs_primary_plane_commit()` performs no commit
>>>>>>>> operation —
>>>>>>>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>>>>>>>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET`
>>>>>>>> (BIT(4))
>>>>>>>> is
>>>>>>>> set/cleared in the bridge enable/disable paths.
>>>>> Well according to the driver code for DC8000 from Eswin, and
>>>>> the
>>>>> bit
>>>>> named "VALID", maybe it should be cleared before programming
>>>>> the
>>>>> registers, and set after programming registers, to make the
>>>>> process
>>>>> of
>>>>> programming registers atomic from the perspective of the
>>>>> display
>>>>> controller.
>>>>>
>>>>> Anyway this should require testing on real hardware to verify.
>>>>>
>>>>> By the way, I see multiple peripheral drivers for MA35D1 get
>>>>> applied in
>>>>> the torvalds tree, but the device tree is still only a
>>>>> skeleton;
>>>>> when
>>>>> will the device tree be updated?
>>>>>
>>>>> Thanks,
>>>>> Icenowy
>>>> Thanks for pointing this out. I’ll perform tests on real hardware
>>>> since
>>>> I haven’t used this bit before.
>>>>
>>>> As for the device tree, we plan to update it comprehensively
>>>> after
>>>> completing several major IPs, with the goal of releasing the
>>>> update
>>>> later this year.
>>> Well I bought a MA35D1 board (MYIR MYB-LMA35 + RGB LCD) earlier
>>> this
>>> year (and this is where I got the MA35D1 identification register
>>> values). Hope I can have a chance to test this driver by myself.
>>>
>>> As MMC, Ethernet and USB support is all applied, maybe it's already
>>> worthy to update the device tree ;-)
>>>
>>> Thanks,
>>> Icenowy
>> Yes you can!
>>
>> I have performed hardware validation on the MA35D1 and found that
>> this
>> bit acts as a manual latch for the shadow registers rather than an
>> auto-clearing trigger, which clarifies the slightly ambiguous
>> description in the TRM.
>>
>> Following your suggestion, I will align the implementation with
>> ESWIN's
>> DC8000 logic: setting the VALID bit at atomic_begin and clearing it
> Ah do you mean clearing it at begin and setting it at flush?
>
> In the Eswin driver (which seems to be based on reference code by
> Verisilicon, I saw similar driver code for DC8200),
> dc_hw_enable_shadow_register() clears VALID bit when enable is true,
> and all register setting sequences calls that function with enable =
> true before setting and enable = false after setting.
>
> In addition, considering this bit is called "VALID" instead of
> "INVALID", I think it represents that the DC will apply the new setting
> when it's set and keep the current setting when it's cleared, so I
> think it should be cleared before modeset sequence and be set after
> modeset sequence.
>
> Thanks,
> Icenowy
Thanks for pointing that out. To clarify, the TRM defines the states for 
this bit as:
1: PENDING (Shadow registers are locked; incoming CPU writes are held in 
the shadow buffer).
0: WORKING (Shadow registers are unfrozen/live; configuration is committed).

Regarding the Eswin reference, `dc_hw_enable_shadow_register(hw, false)` 
actually writes a 1 to isolate the registers during a batch update, and 
then transitions back to true (0) to flush them out.
My hardware test confirms this sequence:

- atomic_begin: We set VALID = 1. This safely freezes the current 
scanout configuration so we can update multiple registers (like frame 
addresses and pitches) without mid-frame tearing.
- atomic_update: We write the new register values safely into the frozen 
shadow space.
- atomic_flush: We clear VALID = 0. This releases the shadow lock, 
triggering the hardware to latch the whole batch atomically.

If we reverse this logic—leaving the bit at 1 after the flush — the 
hardware remains permanently stuck in the PENDING state, waiting to be 
unfrozen, which starves the display engine and results in the blank 
screen behavior I observed.
>> at
>> atomic_flush. My tests confirm this allows the hardware to latch the
>> plane configuration correctly while avoiding the blank screen issues
>> observed with other configurations.
>>
>> I am preparing the v2 patchset with this change, along with the
>> requested commit splits, and will submit it shortly.🙂
>>
>>>>>>> ========= 8< ==========
>>>>>>>
