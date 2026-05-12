Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04C388E40
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577029; cv=none; b=ByjMJJ22VqhwMrBP3Dtw7DmYzKpjdmQjkUV1F10NBFOJ9CjHQQidHZiAAo40v4sY6f/0cNepwLpksxFodG5/UPLwF2fcoEpeJR7HuaQTXaNLr3dfweAaT+hDn/CMW/HOEZX8utzuV0ncNuWhxotTsX0EEvAN4t3A069RI/W0F9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577029; c=relaxed/simple;
	bh=Grg20u364HDLtV8oYPQ/WPGaG2f/jnq2CL/1dztZOiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCjdrt+/Bkwe/1RUN/1r1/e5iFllMktnMxSHDTN3CfGK1U5Fyit1yXO4utOh9QDmYv+e6owR7ptlHmgrN1kpRod/G6nkxI1uVSc6NeC/5J6s0ibM+aTGkJHjb1b89+zJLe4G0EXnY8aM31CB7Urg3HL0y59e74XgC8tOULg0Il8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEm0kTcj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEm0kTcj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-83659d38e38so2342230b3a.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577027; x=1779181827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z33mAnUolaaopuhgkgsSsR1XqxZfuAXYGKr6UlpMNF4=;
        b=PEm0kTcjG1MeFEgRFD6sF/DiLHwKbzA9RgY3mtqi3cCyCc0ZZX0mlzgwVqUqyGQefc
         Sz5ZTL0UUHO5QpftD85PKqYaV2cMzFIatyUygq8KYTupgtT5JuRc9N4bE+36ROcQFtqr
         X2X4tbsvFtOlkxnldib62Ac4A3jW0ZxBMKkD3XFWI9kYGr+D3XzjyUhq6MtmEmM5Po5M
         1cDWa45IAvdm0VndnjLEJ+O8Vrgi4tlNX6uMh887vs3RNjtD6lzxSuDRgJImkRf6b7Cc
         Y8otm89UV/5UMkA8pqmjWhPsWQ+oszvlApuL/Z02afW7k/ntCjTbjZj/N9fVQK17MT2C
         2++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577027; x=1779181827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z33mAnUolaaopuhgkgsSsR1XqxZfuAXYGKr6UlpMNF4=;
        b=F+FjMc/pqpoh8ew2I+GrV4QMOEFDnO+uWBd0P2nP5a7RlBX3yukyWHLOWD4JA4N+S/
         M/g+7Ugw6HuhB/QfLpoUHqpsLfusCXLELeW9CvQSZGTMxBcB64IdIh73bLLAaxOPPPM5
         +gTffUxHA4ft2DDpM2+1XT5ZlteyOwd0IoqucknBjcIbo8PZMkbKCb7Bdkg/rlv8+VOk
         6Uk71GHU1JzcdO50DeMCmUBwcIFbaCd1SlFFQq1NMzLkP9EAxb8nc4SR3JRlPYCptJik
         KRVfWfMwSZKa2Su+n46Yw2KB943OTmtdnrX9AmQkX+yRE7vXCnZd3Yn2YR3HBfAAiUII
         EnIg==
X-Forwarded-Encrypted: i=1; AFNElJ8qH5EnfR7/BMvo73Kz17L6VacjnKXA+W/laiPssIAyT6/HR7/jfElKkD2XQDKfapVrOoPAhFdVhWkI@vger.kernel.org
X-Gm-Message-State: AOJu0YynyC6s2h1WPAzp+uvFC989cc0/r+LhbX+Hp3gPTBaYG2TQFShV
	o4AMOLTw9Cr3186nhpC/onCyDhrqHjnZBuZ7XmCa6Hq8I1zn/z46cA8t
X-Gm-Gg: Acq92OGOD6Yb7ovjILplSdpWL+oSwBp6RZCLn2rpuUWbPUxOz3HguX51yb3l+XOHcSc
	jjfJSgQIGOi/Mg+L9MP1wavIfHBlLPlD5yOyQn4sukguImJdR+18ZUtAA78a0T4F4shLLgHybo3
	NBKlNMpZS4l3Z6+9LK+ofdlBnX5nAwwIU0Zj3UI+Kejm3lWkUtSwvPJtAY0bTgVRxc5pif0sSsv
	B2DPvcnM4jWUjj4ysO5OCQFlB9XosGQbfuc6sVbpgCPp45aS5V9W9SWXpF0R/ytR3E1qENWvrBv
	O2NJ46KtHYahKHdrnOOq4zQbek/mtMzO1U5EVh9ltPlJVHfJ8lxVTs5YtBWvQ+WKz19EIxdOYFH
	TM//NjQDRrrX0D2mdzSZBZVLAF9sBu+hfSBk24B97YybeguR/jv/l5O9oB8qGRn+lJ+I8D+0Z3l
	0S6HvgMeRgBJEMY+5ndZyU+z4VWk1qf963Bblg5IDw4D48zyC7GFI5mlHsvv7noJdofm1+8OyOQ
	stztjo8UPmV4U4=
X-Received: by 2002:a05:6a00:9a8:b0:835:5557:31fa with SMTP id d2e1a72fcca58-83eebe7fd90mr2418145b3a.46.1778577027383;
        Tue, 12 May 2026 02:10:27 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm28990915b3a.16.2026.05.12.02.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:10:26 -0700 (PDT)
Message-ID: <07ca65f6-33da-40b1-afcd-0b0ceabd49f9@gmail.com>
Date: Tue, 12 May 2026 17:10:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/verisilicon: add support for Nuvoton MA35D1
 DCUltra Lite display controller
To: Thomas Zimmermann <tzimmermann@suse.de>, zhengxingda@iscas.ac.cn,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260511075142.54752-1-a0987203069@gmail.com>
 <20260511075142.54752-3-a0987203069@gmail.com>
 <5157ab4d-3195-49f3-a3e9-aef6d58e869e@suse.de>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <5157ab4d-3195-49f3-a3e9-aef6d58e869e@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/12/2026 4:24 PM, Thomas Zimmermann wrote:
> Hi,
>
> instead of this if-else branchery, I strongly recommend to add a new 
> file with a new mode-setting pipeline for the new chipset. You can 
> share existing helpers where possible, and implement variants where 
> chips differ.  It's a bit more code, but will be a lot easier to 
> maintain in the future.
>
> See ast and mgag200 for example. Both drivers support various 
> revisions of their chipset, where each rev has its oddities.
>
> Best regards
> Thomas

Thank you for the detailed suggestion.

I see your point and will refactor by adding a new file with a 
mode-setting pipeline for the chipset, reusing helpers where possible 
and handling variants as needed.

>
> Am 11.05.26 um 09:51 schrieb Joey Lu:
>> The Nuvoton MA35D1 SoC integrates a Verisilicon DCUltra Lite display
>> controller, which is a previous generation of the DC8000 series. While
>> the general register layout is similar to the DC8000, there are several
>> key differences that require per-variant handling in the driver.
>>
>> Add a vs_dc_info platform data structure (in vs_hwdb.h) to describe
>> per-IP-variant capabilities, and use it throughout the driver to select
>> the correct code paths at runtime.
>>
>> Key differences between DC8000 and DCUltra Lite handled:
>>
>> 1. No chip identity registers (0x0020-0x0030): DCUltra Lite uses static
>>     platform data instead of reading model/revision/customer_id from HW.
>>
>> 2. No CONFIG_EX commit mechanism: DC8000 uses registers at 0x1CC0
>>     (FB_CONFIG_EX), 0x24D8 (FB_TOP_LEFT), 0x24E0 (FB_BOTTOM_RIGHT),
>>     0x2510 (FB_BLEND_CONFIG), 0x2518 (PANEL_CONFIG_EX). DCUltra Lite
>>     omits all of these and instead uses enable/reset bits in FB_CONFIG
>>     (bit 0 = enable, bit 4 = reset) for direct framebuffer updates.
>>
>> 3. No PANEL_START register (0x1CCC): DCUltra Lite panel output starts
>>     when PANEL_CONFIG.RUNNING is set; no separate multi-display sync
>>     start register is needed.
>>
>> 4. Different IRQ registers: DCUltra Lite uses 0x147C (IRQ_STA) /
>>     0x1480 (IRQ_EN); DC8000 uses 0x0010 (IRQ_ACK) / 0x0014 (IRQ_EN).
>>
>> 5. Different clock/reset topology: DCUltra Lite requires only "core"
>>     (bus gate) and "pix0" (pixel divider) clocks with no reset lines
>>     managed by the driver. DC8000 needs core/axi/ahb clocks and three
>>     resets.
>>
>> 6. Single output only: DCUltra Lite has one display output; per-output
>>     index logic is still in place but display_count is fixed at 1.
>>
>> 7. Reduced register space: max_register is 0x2000 vs DC8000's 0x2544.
>>
>> Add the "nuvoton,ma35d1-dcu" compatible string to the OF match table,
>> extend Kconfig to allow building on ARCH_MA35 platforms, and expose
>> vs_formats_no_yuv444 as the default format table for DCUltra Lite
>> (YUV444 blending is a DC8000-only feature).
>>
>> All changes have been tested on Nuvoton MA35D1 hardware and are
>> functioning correctly.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/gpu/drm/verisilicon/Kconfig           |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_bridge.c       |  28 ++--
>>   drivers/gpu/drm/verisilicon/vs_crtc.c         |  13 +-
>>   drivers/gpu/drm/verisilicon/vs_dc.c           | 129 ++++++++++++------
>>   drivers/gpu/drm/verisilicon/vs_dc.h           |   1 +
>>   drivers/gpu/drm/verisilicon/vs_drm.c          |  16 ++-
>>   drivers/gpu/drm/verisilicon/vs_hwdb.c         |   2 +-
>>   drivers/gpu/drm/verisilicon/vs_hwdb.h         |  25 ++++
>>   .../gpu/drm/verisilicon/vs_primary_plane.c    |  43 +++---
>>   .../drm/verisilicon/vs_primary_plane_regs.h   |   2 +
>>   10 files changed, 187 insertions(+), 74 deletions(-)
>>
>>
>
