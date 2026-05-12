Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD93839B1
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583570; cv=none; b=FuADwn4Bf5kIbz2wSQkdWDL7TeyN319kuEJHLv2tn9oq1x+5hGNpIAMEKumGUSBzO6hGC1Qe9BAIcMFA9CchTK3vOBXxCx26trIdNzqQ5adIY8UacyqYPCX1flqeSOiD2S0zO1y6/QRPKGdqVI6SDXdQWWT9K2riCdSxSauH/sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583570; c=relaxed/simple;
	bh=ZB2DEenZ1V39Q+b2N7YHtAMHyUeMGeFI2eS7MCxKdaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orCG7dBvwxlU9nWSda3hjcPvRtmMAeZ+4rs2wboUKZzoiNjzbvsUHo2GpUoJIq7jTfcye/1dsIZ1JbM2gCKQ1+UssJ9kbtQRp6Cp8rkK5nuzs4+E0+rCeFeVCPtN5RLUUQHvhktYev0or8CwqlFUApsm34Hghp+bxqQo41/SO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPke9mmR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPke9mmR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so2845479a91.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778583568; x=1779188368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFfxIbyksNeEtf5P/BOwbmqUFbMT5NN+UNPslcsX6G8=;
        b=CPke9mmRwssW3SMtqcfzmgbykJyb0ueAKRjoM1usqKY2EX4LPyatjVtfaldBiC7J0O
         529C4bImBHt1jW3wisCkRDF214mEWfq5A+Yw65eW82Qp3Kd603kdIQi7MNdg9v2CWQAQ
         jFiwHdbyG96oKaNtJ89Mbp+Ug84SOWAsAM3KvM6KFqQVFHsn5Xm2lOkzv1nAAQyGpf4O
         +pfYqDGAhS+Btyx7gLJ4aFBGQEM/bSMQJWAF7IUoUZ8ndAS7qp5bzn1w/3VNRz/VEnSE
         rzWv74MgG5aJ1CDGKKMw7eyyJUeS0h8KrKG0AjowaBhukPWF9j/BPYImGMX8jew1OoDN
         Cjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583568; x=1779188368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFfxIbyksNeEtf5P/BOwbmqUFbMT5NN+UNPslcsX6G8=;
        b=k9fYcu9Ix3mikcWn8U3ZPMjuJpp93lN2ANIEg0rE1nAKHI36SuoLfCP7mZtJbnlJEe
         cIGfDb6uDnYvuaAli5Frrrb9zhGpH3Sz8GG3FhYHDKSwO+uY9jEkp70NsilOQpEuw+oq
         m5MkXyEjGfJkrVjyChi56R3HhxDOQFSILNQAxnLkr2c++9QZLRx0TpntZU5h8ykxyuPH
         63h8GuI1isYCIsWbJGcvNcIHpr5KKlL9nsYX/Zx8tp8tcLDetEh5IOpDp4c5I1ecI1Dk
         C8LDJptZTL4tIiO7oeSHpOyXvLdiPazdNPJ7y3EDJ2N8/5XvUumNW/PbemmZc6P0aWaP
         Z1ww==
X-Forwarded-Encrypted: i=1; AFNElJ9gnWLZh1nwnQl2rRU0Y3wRemUYy1L5ntXJ28xcU4OkQhDWHuKJVM1eCR86aqwMWsek+7zgocCJMZPM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+USVcAwfl5m4/HuktS7oMJHC3to1HcNDaBXvU/ngcsSg2RKE
	yoffGYajBPNE+C4Kdv9THPKPN/4Pl5WFTUp0jYZ4f32t1alJRnkwFRdH
X-Gm-Gg: Acq92OEU6oMPZro6BLNG6WZQ+I2ln1dZGNBxYD5z7elN+ThnxVZ8yEejAkB2cdPpjqU
	QZYp91vaLemelzw83RDTyJELBBC7JpG5LV4rOMxI9J4csEw0yE5SSdEg1t3Sasgq1vDnGHfpQ5x
	eAPVy2IDTZxLheQUI9bJXTS80sAi1dQ463f687INmr3wP+ko6u6qLsjPGjEhHV6L9+Y4/rwgbQL
	j/WSkDzzeUNOnaixtXq/PTibom6FziGVpOOuTiO+5oaEp7PpQ0s5gjl2X0LKV4+9od5xee8DfBs
	iooVjEIW4O4XfLbi+9TmRANRm6Ddzb5o/dZQG53wVX1HxLboBr7No6bY4A3nVPT+wBYYvLtyHye
	UkHvFyivIjj1SCk9chBpjxMPHxqQzaQi9FGLVuvA7Xkb6pTwBseGPhDjaWE17H08Z3L3GMpfjO9
	vKWFIufPq0xkJI2jmsDevvjg5U9pYoLjOyEq3gU6tve6gtqvBnX0LmfeXtsvmvKTqx/2aKj9VvD
	FXG
X-Received: by 2002:a17:90b:3883:b0:368:6998:b49e with SMTP id 98e67ed59e1d1-3686998bc7emr7312294a91.9.1778583567896;
        Tue, 12 May 2026 03:59:27 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d65ed459sm14241837a91.14.2026.05.12.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:59:27 -0700 (PDT)
Message-ID: <1d04dd6d-f245-4b83-96b0-c5491fad8093@gmail.com>
Date: Tue, 12 May 2026 18:59:21 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4bf6efbb222ebc4d770ad613d17c6185e7cb2fda.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/12/2026 6:01 PM, Icenowy Zheng wrote:
> 在 2026-05-12二的 17:06 +0800，Joey Lu写道：
>
> ======= 8< =============
>>>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> index 7a93049368db..225af322de32 100644
>>>>>> --- a/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
>>>>>> @@ -164,13 +164,16 @@ static void
>>>>>> vs_bridge_enable_common(struct
>>>>>> vs_crtc *crtc,
>>>>>>     			VSDC_DISP_PANEL_CONFIG_CLK_EN);
>>>>>>     	regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_CONFIG(output),
>>>>>>     			VSDC_DISP_PANEL_CONFIG_RUNNING);
>>>>>> -	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>>>> -			
>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>> -	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
>>>>>> -
>>>>>> 			VSDC_DISP_PANEL_START_RUNNING(output));
>>>>>>     
>>>>>> -	regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc-
>>>>>>> id),
>>>>>> -			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
>>>>>> +	if (dc->info->has_config_ex) {
>>>>>> +		regmap_clear_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_START,
>>>>>> +				
>>>>>> VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
>>>>>> +		regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_START,
>>>>>> +				VSDC_DISP_PANEL_START_RUNNIN
>>>>>> G(ou
>>>>>> tput
>>>>>> ));
>>>>>> +
>>>>>> +		regmap_set_bits(dc->regs,
>>>>>> VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
>>>>>> +				VSDC_DISP_PANEL_CONFIG_EX_CO
>>>>>> MMIT
>>>>>> );
>>>>> Should the commit operation happen on DC8000/DCUltraLite too?
>>>>> (By
>>>>> writing to DcregFrameBufferConfig0.VALID).
>>>>>
>>>>> Many registers written has "Note: This field is double
>>>>> buffered" in
>>>>> the
>>>>> DCUltraLite documentation.
>>>>>
>>>>> I suggest create a static function for commit -- write to the
>>>>> corresponding commit bit on DC8200, and write to
>>>>> DcregFrameBufferConfig0.VALID on DC8000/DCUltraLite.
>>>> [a] There is no commit operation for DCUltra Lite.
>>>> I'll not add a `VSDC_FB_CONFIG_VALID` macro. VALID (BIT(3)) is a
>>>> hardware-managed double-buffer status bit: hardware writes
>>>> 1=PENDING
>>>> when a new register set is ready and clears to 0=WORKING after
>>>> the
>>>> VBLANK copy. Software must never write it, and there is no
>>>> polling
>>>> use
>>> It seems to be writable and controls whether register buffering is
>>> enabled, see [1].
>>>
>>> The description of this bit in MA35D1 TRM says "This ensures a
>>> frame
>>> will always start with a valid working set if this register is
>>> programmed last, which reduces the need for SW to wait for the
>>> start of
>>> a VBLANK signal in order to ensure all states are loaded before the
>>> next VBLANK", which indicates some kind of "committing write",
>>> although
>>> the code at [1] seems to indicate that double buffering is only
>>> enabled
>>> when bit is cleared.
>>>
>>> Anyway this bit should be programmable, and "Software must never
>>> write
>>> it" contradicts with the MA35D1 TRM.
>>>
>>> Thanks,
>>> Icenowy
>>>
>>> [1]
>>> https://github.com/rockos-riscv/rockos-kernel/blob/rockos-v6.6.y/drivers/gpu/drm/eswin/es_dc_hw.c#L993
>> Thank you for the correction. I'll add
>> `#define VSDC_FB_CONFIG_VALID BIT(3)` to vs_primary_plane_regs.h and
>> write it in `vs_primary_plane_commit()` for non-config_ex variants.
>>>> case in the driver that requires a named constant. For non-
>>>> config_ex
>>>> variants, `vs_primary_plane_commit()` performs no commit
>>>> operation —
>>>> `VSDC_FB_CONFIG_ENABLE` (OUTPUT, BIT(0)) is set in
>>>> `vs_crtc_atomic_enable()` and `VSDC_FB_CONFIG_RESET` (BIT(4)) is
>>>> set/cleared in the bridge enable/disable paths.
> Well according to the driver code for DC8000 from Eswin, and the bit
> named "VALID", maybe it should be cleared before programming the
> registers, and set after programming registers, to make the process of
> programming registers atomic from the perspective of the display
> controller.
>
> Anyway this should require testing on real hardware to verify.
>
> By the way, I see multiple peripheral drivers for MA35D1 get applied in
> the torvalds tree, but the device tree is still only a skeleton; when
> will the device tree be updated?
>
> Thanks,
> Icenowy

Thanks for pointing this out. I’ll perform tests on real hardware since 
I haven’t used this bit before.

As for the device tree, we plan to update it comprehensively after 
completing several major IPs, with the goal of releasing the update 
later this year.

>>> ========= 8< ==========
>>>
