Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C30432E95
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784745; cv=none; b=eeKy+VeKWrhANDrX70OQ+GZ8JANAZKe/zThHIUmesPeeG1W8tX0xjImfF4BWma7724cQcU87J72ycBD4K0PkSfy6jcWDp1AsHdRXfo/+Ok5s2WgdMYgXVGPyW/ShbwgGrkVb7ND6v59TzG1bY4wI97RNtKk7+W460IvsFoPe0pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784745; c=relaxed/simple;
	bh=XKGpIuuo6O7kytNhl1VQHpUrM4ZOOWo1SPMYBBVs6II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lg6VmMgRtENDY2+u4CoIxnSkqsgOr+JmllvWvo+gBhLEZbczQc3amRUdddZWz6eruDePkH015TcaiXONG3p2uQII3OTn0rc6eOMP66McgazP2rJkLGKimErj4gbJdWBTsoplNZLS7sHzxA2vbNvRiSRpUSeJmrAax3xyLVBsoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=k617tlsJ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="k617tlsJ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb34c17b96so2580665a34.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785784741; x=1786389541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWhNVuNUeWmdXxG9AxDJ/JJjMmObR+VfZMlaxit4KDY=;
        b=k617tlsJSnXA+ObJtUmS4S3TPzDdSCOKnh5P+acMy2VpV93oxwg3ywmUWCevWQbrIz
         DuIfYAUTaLXXP2zXjo+SECM7Cry2ctsMgvSt93TtMxcwlgN8NmjPpoMv3AXnPtgITr7u
         jsM1n9hybsNdSs5XAEasSO8jZw4X57OdS0DhsZhk+CXhWzLv6kMEk+j8w6twhQpTDbmD
         94bSOpROqxFNmxVeHKaptDq4pfeMs8ZnON9P28piUvvO5rgV4eyw4Z2eXaH7yY66MALK
         MMeSgYxL2NhQed2WFAZJebvxzU08uy1prJ9rzFRczrIgxjXthFfoo4dStcQUUSgv7MT9
         0yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784741; x=1786389541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWhNVuNUeWmdXxG9AxDJ/JJjMmObR+VfZMlaxit4KDY=;
        b=qXiL+TbUj6KmQifL2RoJ0RSxdR6S5PqfRHem9MPX5Qx2hF5MEDWfUV6XmVAf05FDVN
         vRscY+OzJ0XFJXyLHMAP5VBtcK93Nn+L6IsLk7Kd+7hWcsDNcEORBWEohyGC3CI31NEF
         gJx1q9sQRhMOayHH+69enRTGsWJ0PC6XpMFZHuLLhupYwwtt62TN5DYq9ZAA971B/WeB
         CPU6ycm7PNH9fVZjh9Mh5IKj8rLCW68uCqqwjeGcwtLK5hu0ClMDrtNhMRcAiGCagoVi
         sYp57WPWZQbppOkRsOntXAGl/d0/2hbP6zTLM/9UWgelvmfk554a+yy20y/0GU+SxfqJ
         uMPQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc129X16fhim4VeqXnuqGZqaIDlb3a5xH12HR3C/I3my0X/zy7kUdPvwqCC237zvYlplzMPYlXvLkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7F1a7hRCutToXTgI2lLRrtT8NcEIJjy+pqdbihe1lxdTgLdCi
	c8m9ct1Am3BZ4EtVxDZX1iPKQn91QSyzC52bOCSO3Akz6tPnzH6qXxxNglR6A5T/mP0=
X-Gm-Gg: AR+sD10RkW5wAUr3JA25f8DMsUeyIB/If/04syOaOLfoT2jc0ULSo442O+CTISu8THQ
	OJA9hsDXL5iIcMDai6f1/bsu0bZUW1aT6UsPt38kp+dXSLD/KbS/wP9QDbIOnnqFPmB98r1ozYH
	aBJ4J2dCuc52uKfMpzCCckS+brn+eBVglgDchUcwXp+XmiERjCVuKfOPg0EYv3HFzc9gYuUdktk
	gHLyst4LYqh8zc4vpx5lLZqdHew0Qk/5KyqRHcsgBB1d7u1iZcDT0KwYcS+ZtNohTjHtAjfnO0t
	L1r25g43uKyLJ8CmprRWOwD277m5mKMXXLJ37TaJ57PhyF/AU1v7vVOM1U2Bin0Fvg6KwTdlQye
	KYagyCeyJH2v88cF48lfl1UfNYkZNTZ1dzwAzy4uF6Wg1MOEz7bBDCZ3lZOgbr8FdzIjne9MEg6
	kcnMQIgdUWdabtnkdtZ+5Iz1uh9vN+Er1pRkVRMTCn9hhTj4qpaLCRRlTGe0Bn43YK5C0x5W0rZ
	+0kQzWDb/CkVm9Km1Yke/WiJ6mquNz30g==
X-Received: by 2002:a05:6830:6413:b0:7e9:d082:3b87 with SMTP id 46e09a7af769-7f196b61346mr16269729a34.1.1785784741332;
        Mon, 03 Aug 2026 12:19:01 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b8f7:1f5e:7c:a7d1? ([2600:8803:e7e4:500:b8f7:1f5e:7c:a7d1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f11e522sm8029109a34.25.2026.08.03.12.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 12:19:00 -0700 (PDT)
Message-ID: <43059ed9-2ff8-4bf3-846a-53a4c7cd72bd@baylibre.com>
Date: Mon, 3 Aug 2026 14:18:59 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
 <20260731-gp2ap070s-v3-2-d1f5cecf9fe7@disroot.org>
 <380b864f-6266-40fb-87a4-027afb422885@baylibre.com>
 <DKFHI80E1741.3L5TMU6D3P9OC@disroot.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <DKFHI80E1741.3L5TMU6D3P9OC@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 12:28 PM, Kaustabh Chakraborty wrote:
> On 2026-08-01 11:41 -05:00, David Lechner wrote:
>> On 7/30/26 3:07 PM, Kaustabh Chakraborty wrote:
>>> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
>>> Corporation. This sensor is used in mobile devices, including, but not
>>> limited to - the Samsung Galaxy J6.
>>>
>>> The driver has been adopted from Samsung's downstream kernel
>>> implementation [1]. Due to the lack of public documentation about the
>>> schematics of this device. The downstream driver acts as the secondary
>>> source of information. Driver clarity has also been improved with the
>>> help of the GP2AP* drivers in iio/light.
>>>
>>> Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/blob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
> 
> [...]
> 
>>> +static void gp2ap070s_reset_action(void *private)
>>> +{
>>> +	struct gp2ap070s_drvdata *drvdata = private;
>>
>> Usually, we don't bother with a cast/local variable in these.
>> The void* can be passed directly as an arg.
> 
> Yeah, but CFI will not be happy about that.

How so? We do this all the time and no one has reported any
issues with it.
