Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6618BBA3D
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782704935; cv=none; b=ANRZJDCnc5OlOuSWCH/fwv0mqxopHwkuAkoDHeOtCdq32RGHVqXqs2vMS/5nazdDEBCtEIpIzJG96b6hg59ERXUxC4jbMmf8/CJBzMyylQ653ONshT3plK+Y6g9IjNWNKr7Q7KRoVBb6rzaMPtyzYNKcDkPExvNbubEFLSJC4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782704935; c=relaxed/simple;
	bh=zPspuBjg3KJXURc+0x1BbdbhRTQR036NZIrYAprXl3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQ5cuVH9AWPYWiEjXkOJH45FANrv7b22rJCvQVnXlsh1d9kmpA/+Rvp2llui6lhL/mhgR3sBS0hjDkCO9U+m/1DuUnVXNRs4M339O11vCNGYouXL57e8nWH7i0vocRqsa9XKf+rXY09apEZ5YASfjxmhNqiNOqszT3Vcj8767K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuhIyoFN; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuhIyoFN"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845ea8924a2so326123b3a.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782704934; x=1783309734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYaJLO7rVJIlOh5//OZ2QMbg6ndszMv9dZxRzh/XAcg=;
        b=YuhIyoFNHXSK9nN/FAh86XmrvqULqAlvOBIGY8KJFSQ7mkw0gHiMJnFLoho8/CJ6RF
         9whKkv2SJbMCQOxEVCrvNrGqgUDFj4foE62tZl/6SR8hhLE/z0Z1tOzNqF1yXXJlDdHR
         dJc5LaD5kLYJS5TWpmXGNzD15sJ7QU0AdI0m2JTXHYcJfRMrFlQDGtu9jT4syLH6WP0A
         Wmvn81U0NVffseBHzwx7o/oQyo9YaG4wgieD6Ww2EB0oyaIqWi9I+UJk3CqC9l9p1c5S
         5BZT3TrDVvOZwDT3IH09TJEfxuZWjfinZk0nXMHbkR8r7ANJhmoQWzbdnEfxBjitMAhW
         Xdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782704934; x=1783309734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYaJLO7rVJIlOh5//OZ2QMbg6ndszMv9dZxRzh/XAcg=;
        b=iH0aqdUJJYFH04IZaATN4G8KXzJOMtNAyg3Vniobw1+AqIjW7LFTerFyh/E/HqC8Pm
         ssrGJotEkHXsXoAmelveG8KrjWiQlIHv4XL46GufBnbYQYvWWo+Z+c1YxsCWL8gBEXT6
         Wu+g0khIa5MbxU318tpGB9NEXKzNXKSXTEJ07uMP88X7Bu7jSNwcis795SrhlM7LX4mb
         ddIHDd/K6hQysEQHaBn/7SkONrC9j2huIQrOvuGGPinb8/jITQeZ8aOimBE9rBoprC3z
         4DuAoC7uiszC8AGo1VZ9Ua0c7adj7IVZejYAi8UQ+yps5I44GZ0XcWolWhUHJhAD8tAn
         o+YA==
X-Forwarded-Encrypted: i=1; AHgh+RpjXZMcdJeQaIO+g9b9/l6+8Oud8sp94uxFOv94L908C1adt9OtIIKrFnaSbS4WxnoLBp+pc8qKmR4c@vger.kernel.org
X-Gm-Message-State: AOJu0YwWePW4Imr3iKt8ucGOBjLUmdasHzAQE86smhXWhr6UGYb+cnon
	wQRYM4qHcUBocm7ASX78q1bt+V+1vu3UsHAfvfsrIutEuuWu5zQYkCHu0mBIOw==
X-Gm-Gg: AfdE7cnE4fF9hFJxzlZZwCNIAY5gkU2qrj8saDxpClkVbdVAAInAr/V8AzuRx3ivlnI
	Y56+ZPv6idlX0HvHpbfqPyLoeNevf8GzVPhzubeW9K7cHbQUQ9rJ60McOv34BZJLC5KcAczXaf4
	GMMXXAn9K/AMmsFxxJgSUJ49uilWW+E3XtkxBjQoztitsgnxpWnX723eknThtqIp+g5OuQ0l/Yo
	UNjD/tcqL+ZxVpmquZLmo/WjVsh8lHu36AEvvYLW0M3/z4cTo/14EwldIjgA1a12t76+betBcjW
	2stifB9CYE5p6S6yIQUrYV1mWIW0OkpA8c3YP9WaBUbYawh5hGBZiqnPf5/C6qb75Xy3snlgaSD
	cnDJFkUfqhMkoYlqzZOa0Q1vYmbMpwANNN8yjgEsqGs6Q2mjHYzjc+sTYulYgT+5oJXSMf3//1P
	qopXHx/30eclVL6DuzTiG0hrDZGmTLzHAEO4rIQemzwlapz8hHvXrPRkjt0vbM50BjYAUaa7s9G
	mS3
X-Received: by 2002:a05:6a00:238b:b0:845:e19a:1188 with SMTP id d2e1a72fcca58-845e19a1487mr4616768b3a.52.1782704933611;
        Sun, 28 Jun 2026 20:48:53 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fedaefsm11603061b3a.23.2026.06.28.20.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 20:48:53 -0700 (PDT)
Message-ID: <e44b9d64-95dd-4b1e-bcd3-05bd5a9963eb@gmail.com>
Date: Mon, 29 Jun 2026 11:48:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/verisilicon: make axi and ahb clocks optional
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260625094449.708386-1-a0987203069@gmail.com>
 <20260625094449.708386-5-a0987203069@gmail.com>
 <cf9af38dfe52548649b9010f298341d4064aaa21.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <cf9af38dfe52548649b9010f298341d4064aaa21.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/26/2026 4:03 PM, Icenowy Zheng wrote:
> 在 2026-06-25四的 17:44 +0800，Joey Lu写道：
>> The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller
>> whose
>> AXI and AHB bus clocks share a single gate enable bit with the
>> display
>> core clock, so the clock driver does not expose them separately. This
>> patch makes the axi and ahb clocks optional in the probe.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ```
> Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ```
>
> Thanks,
> Icenowy
Thank you for the review. I will revert this patch entirely. As discussed
in the binding review, axi and ahb clocks will now always be supplied in
the devicetree using the same phandle as the core clock gate, so making
them optional in the driver is no longer needed.
>> ---
>>   drivers/gpu/drm/verisilicon/vs_dc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c
>> b/drivers/gpu/drm/verisilicon/vs_dc.c
>> index 9729b693d360..fd1f5fe67a68 100644
>> --- a/drivers/gpu/drm/verisilicon/vs_dc.c
>> +++ b/drivers/gpu/drm/verisilicon/vs_dc.c
>> @@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device
>> *pdev)
>>   		return PTR_ERR(dc->core_clk);
>>   	}
>>   
>> -	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
>> +	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
>>   	if (IS_ERR(dc->axi_clk)) {
>>   		dev_err(dev, "can't get axi clock\n");
>>   		return PTR_ERR(dc->axi_clk);
>>   	}
>>   
>> -	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
>> +	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
>>   	if (IS_ERR(dc->ahb_clk)) {
>>   		dev_err(dev, "can't get ahb clock\n");
>>   		return PTR_ERR(dc->ahb_clk);
