Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037636F90E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826357; cv=none; b=dUEFnaeEu4Ga9FXSqw+DLupMigGrUdCJV9eluLnOz6qq0N+FTL0QeWiTyJlnJE/MZrncOcVYcQ5CGOB1ZkRNUIBVy6M7qOIvuBI47GC2YBcizqczfRA8eZ1VJidZAVI3JUK1EqeIvJwnuRrWDP7P8f97yH/n27gh1KvP2BfbXpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826357; c=relaxed/simple;
	bh=h545ON6L3KV75fWVbtwI+PsMEJB5oC9uZj9fG6ieiX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyRY1sIR9wqDKBYdMmxQZvO9/bBn7pvNLYCsM96zUyMMjZybjjje8LE0nPMxClL4rbxknr7OKOEl02WS96LnYe8rNTtiOax/BifJCVyScrWrb2257H8Nf0GqENtk72YBmfWQ17jt6Um8cHdcUi1V/FCkbs4FKxVhjWTSCeHsrtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4n8XePR; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4n8XePR"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3721117a12.1
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778826355; x=1779431155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4wG8bH1gfDBcb14JbvmcrOJGC7+5HB1bq/2ymPAYSI=;
        b=V4n8XePRYYiQgCryrrVetcJyPjrO5OfDn8dzhXvgumIRn+0343GFdaXfQILRs6KTQP
         JYybxdDmlQRqCpKv0B+jhEUelbDOOAOIXOkvMPmSZp7Y3DcdVNPQjt1vFo4o9DDYERxV
         h6Orbw9HwVFls2gU+xbfcoo8csqol6bn98zH38i/yun4pjfUcUrmJdEbYNmS8ipcy55R
         6NjTXJGLLz/Ar67YXhEaEoT5vVVV3m9WX1VkIL8M4zEVnF/8HUQOvZ31tnE00+gPcXPn
         36+AUkekroww8Ogn3sL2EKgNDCw1RHeExcBiYj6FNbCoS2tDi0/m4OQnnIjDLpI/k7FN
         jNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778826355; x=1779431155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4wG8bH1gfDBcb14JbvmcrOJGC7+5HB1bq/2ymPAYSI=;
        b=VISxkteTl0QhWZcqDESR8H6AIS3TzhD6/lsMY02FssbI6zj/E/sijDewDK+RFqG9Jk
         msZAKivX0ZPpxAoeNaE2p1xIuh0giLNgAqS63d7zGtvPY/PHe1bxBPlwg6apJS3OnQb8
         Kv93dWspFGwmruyEniJSEtwS3UG0rTX2hjQ39ds04lWSKU0yDbe9ihuuJDpXsKvTAn6g
         zEr9frEiXexJdocSgFNIGSV2X/ib3TGK9LsrtSsQVxVwRfqFiBJjml6fw7jFXPg9Thch
         TvQbVMEkJTqFqGxGmjUj7Yahd7TcFdOOuoqGCjDRkWiaf1b5qtUXvhMbOuTh9XaVjZSo
         rr9w==
X-Forwarded-Encrypted: i=1; AFNElJ+5KRIlHT80RiFQS3w/LZniVxCgDF4Ci9yds45jsKLtUltvYlgTbDkzootMtgDWVOlGMOfoz91JsYoW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1jsG4wijW2FlJ7vlzItmiCsujT+NP+Ai4R+VedV7e7OY99PUR
	pC5XNwvL8fe7/k+YtDOBBHPFPK+C0nVXpY26nSsOYuaXcOtiW2Yoqcl1OBsnAg==
X-Gm-Gg: Acq92OFR2AFMLkXPPXRjTcceH8gsPOW98uy2dJ5rffWqPjfBH/C81iXQvdEwCYd2v45
	L/xSCmdlH8saaIzpW4RXtQErliPUvzCBEzgRBX79QzwLbR4kANdt10dWqKhfUpkbae9y99P/xdF
	zhTiQnDj6IEsIVcI7Bj1vogMWHra6xYZuprgM9ZQTs/awxy0AwwweLxeahJKDeRYwoiDRauDJMZ
	DWwriyQhHZwulqZcvUJw8Ll+jVE/WF+FHPW+YUwzQZD6OlFEt8mJx8ISQuMmMPhGDY+fxlJ22xA
	Ye2YGx+NEjLtQD1yr+mYAApVUaLcRnsjNIE659iuLKqzI9ch4WvyN1caVBqsCmM7+SFPR+GgADY
	yWlaSdW/FAReuTKCKDcWxodTo5YxndM0D9p/wZJxSmYbgzzyU1X8LOoElkQI7uK6zocp5ePuLQX
	dL4mbPWVUjfkwDeqSiH2G5gGWyyFlPuRUlorJzg3noqFvnndWTHTsuIbRNQq/pNNoISrHsXqnUA
	8Y/
X-Received: by 2002:a05:6a20:560c:b0:3a8:2af3:ce8b with SMTP id adf61e73a8af0-3b22e72fb16mr2125835637.14.1778826355136;
        Thu, 14 May 2026 23:25:55 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm4688486a12.20.2026.05.14.23.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 23:25:54 -0700 (PDT)
Message-ID: <1a42a168-1dbb-467e-9053-b5585a737f71@gmail.com>
Date: Fri, 15 May 2026 14:25:48 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <76a9e9b676509e85484a1eb31c723b46c7e21a19.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/12/2026 9:12 PM, Icenowy Zheng wrote:
> 在 2026-05-12二的 18:59 +0800，Joey Lu写道：
>> On 5/12/2026 6:01 PM, Icenowy Zheng wrote:
>>> 在 2026-05-12二的 17:06 +0800，Joey Lu写道：
>>>
>>> ======= 8< =============
>>>>>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> index 7a93049368db..225af322de32 100644
>>>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>>>> @@ -164,13 +164,16 @@ static void
>>>>>>>> vs_bridge_enable_common(struct
>>>>>>>> vs_crtc *crtc,
>>>>>>>>      			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>>>>>>      	regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>>>>>      			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>>>>>> -	regmap_clear_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>> -			
>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>>>>>> -
>>>>>>>> 			VSDC_DISP_PANEL_START_RUNNING(ou
>>>>>>>> tput));
>>>>>>>>      
>>>>>>>> -	regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>>>>>> id),
>>>>>>>> -
>>>>>>>> 			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>>>>>> +	if (dc->info->has_config_ex) {
>>>>>>>> +		regmap_clear_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>> +				
>>>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_START,
>>>>>>>> +				VSDC_DISP_PANEL_START_RU
>>>>>>>> NNIN
>>>>>>>> G(ou
>>>>>>>> tput
>>>>>>>> ));
>>>>>>>> +
>>>>>>>> +		regmap_set_bits(dc->regs,
>>>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>>>>>> +				VSDC_DISP_PANEL_CONFIG_E
>>>>>>>> X_CO
>>>>>>>> MMIT
>>>>>>>> );
>>>>>>> Should the commit operation happen on DC8000/DCUltraLite
>>>>>>> too?
>>>>>>> (By
>>>>>>> writing to DcregFrameBufferConfig0.VALID).
>>>>>>>
>>>>>>> Many registers written has "Note: This field is double
>>>>>>> buffered" in
>>>>>>> the
>>>>>>> DCUltraLite documentation.
>>>>>>>
>>>>>>> I suggest create a static function for commit -- write to
>>>>>>> the
>>>>>>> corresponding commit bit on DC8200, and write to
>>>>>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>>>>>> [a] There is no commit operation for DCUltra Lite.
>>>>>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID (BIT(3))
>>>>>> is a
>>>>>> hardware-managed double-buffer status bit: hardware writes
>>>>>> 1=PENDING
>>>>>> when a new register set is ready and clears to 0=WORKING
>>>>>> after
>>>>>> the
>>>>>> VBLANK copy. Software must never write it, and there is no
>>>>>> polling
>>>>>> use
>>>>> It seems to be writable and controls whether register buffering
>>>>> is
>>>>> enabled, see [1].
>>>>>
>>>>> The description of this bit in MA35D1 TRM says "This ensures a
>>>>> frame
>>>>> will always start with a valid working set if this register is
>>>>> programmed last, which reduces the need for SW to wait for the
>>>>> start of
>>>>> a VBLANK signal in order to ensure all states are loaded before
>>>>> the
>>>>> next VBLANK", which indicates some kind of "committing write",
>>>>> although
>>>>> the code at [1] seems to indicate that double buffering is only
>>>>> enabled
>>>>> when bit is cleared.
>>>>>
>>>>> Anyway this bit should be programmable, and "Software must
>>>>> never
>>>>> write
>>>>> it" contradicts with the MA35D1 TRM.
>>>>>
>>>>> Thanks,
>>>>> Icenowy
>>>>>
>>>>> [1]
>>>>> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
>>>> Thank you for the correction. I'll add
>>>> `#define VSDC_FB_CONFIG_VALID BIT(3)` to vs_primary_plane_regs.h
>>>> and
>>>> write it in `vs_primary_plane_commit()` for non-config_ex
>>>> variants.
>>>>>> case in the driver that requires a named constant. For non-
>>>>>> config_ex
>>>>>> variants, `vs_primary_plane_commit()` performs no commit
>>>>>> operation —
>>>>>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>>>>>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET` (BIT(4))
>>>>>> is
>>>>>> set/cleared in the bridge enable/disable paths.
>>> Well according to the driver code for DC8000 from Eswin, and the
>>> bit
>>> named "VALID", maybe it should be cleared before programming the
>>> registers, and set after programming registers, to make the process
>>> of
>>> programming registers atomic from the perspective of the display
>>> controller.
>>>
>>> Anyway this should require testing on real hardware to verify.
>>>
>>> By the way, I see multiple peripheral drivers for MA35D1 get
>>> applied in
>>> the torvalds tree, but the device tree is still only a skeleton;
>>> when
>>> will the device tree be updated?
>>>
>>> Thanks,
>>> Icenowy
>> Thanks for pointing this out. I’ll perform tests on real hardware
>> since
>> I haven’t used this bit before.
>>
>> As for the device tree, we plan to update it comprehensively after
>> completing several major IPs, with the goal of releasing the update
>> later this year.
> Well I bought a MA35D1 board (MYIR MYB-LMA35 + RGB LCD) earlier this
> year (and this is where I got the MA35D1 identification register
> values). Hope I can have a chance to test this driver by myself.
>
> As MMC, Ethernet and USB support is all applied, maybe it's already
> worthy to update the device tree ;-)
>
> Thanks,
> Icenowy

Yes you can!

I have performed hardware validation on the MA35D1 and found that this 
bit acts as a manual latch for the shadow registers rather than an 
auto-clearing trigger, which clarifies the slightly ambiguous 
description in the TRM.

Following your suggestion, I will align the implementation with ESWIN's 
DC8000 logic: setting the VALID bit at atomic_begin and clearing it at 
atomic_flush. My tests confirm this allows the hardware to latch the 
plane configuration correctly while avoiding the blank screen issues 
observed with other configurations.

I am preparing the v2 patchset with this change, along with the 
requested commit splits, and will submit it shortly.🙂

>>>>> ========= 8< ==========
>>>>>
