Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71174963B1
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785333459; cv=none; b=CWEVnpmXTQ4M0zjH6brk2gwxOTbThAal4cZvU/VqkXeJVtx885BAC6SK5W4rmhRCXnoa7bR21vfqO8MttnaG2Mo3q6JqrFG+b0/M54QhnjAaFFlC2B2lxllPA1z7VrT6zmweuimuQI9kHlXCYR0FenMVT4XTGiXH3sPdW/pn7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785333459; c=relaxed/simple;
	bh=vJdll9tgUFJTkxZ66v8f/MFpSPCfNVfFJzk9JQDOSCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaJ1vcANMeKKjRlXmMokKUgqzi+o9flGDMvcEay6eDzRaG8cPYGYsTbJrDME8neXusX1rhkaNTepfa4SoeX4DXP2IeuBnwkijyNGoIsABZiGiZ7Twf0li4sDxEipenqX6ymFIGYiFDmjEhQes8g+W+2QZoEAIrpoT8m7tbVTfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JyXIGrVm; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JyXIGrVm"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7ee4399c423so843565a34.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785333441; x=1785938241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1faCMgze9p8XUDYZgawC40ARuZzb777TUs53Av6Blw=;
        b=JyXIGrVmE/e1OiMDfg5vh71SIXp2Qw840nw7q0ysxRCvKBjbNmGLPolMqa/9sssFgB
         +NTaymU4izBbTXTY8ZMTf7DG7Pa6G/euK/jkGRMpFFwQzyF113tsV//k3/sDztP1HYqG
         ID1iiPeZf7nh7ICNhPJM+AAEmqMR4YC7jvy4yRnKddC7eU5UPAwD0tEs+To1XoC8Lx1z
         SdG0yO9/ChIr2K2f2w48uQv81y1jywTdFNYQc0LIk4emTVnJ8sIbEUz3rWRJcdG5Nm3G
         XE0MwSgZksrGq7QEZvh51NXgp0OtVjIomA2UGv3WqgOipAYI8MkLk1ZQ2X5pXFFpSH46
         vsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785333441; x=1785938241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1faCMgze9p8XUDYZgawC40ARuZzb777TUs53Av6Blw=;
        b=M9YDoSA5WcguJetafreDhRc5wrmkxcvTKNt6REKJi1mty24xti6tbIpReaZ5cWYYYT
         iOwCGpqtJ/KJ0lFBILtAhXKx+XBxKdY0Ie2flzEEZbV5gLVASSyZjDPO2mrgKFJ9L3ba
         fRKwNBj51DuaUy4FH+5CUZFC+KsihC8GLCIq/D0jTxoe/KcHIEfri7YxPPvoOm5q9nMu
         OJnei3K9fOxM1wbbwkAT0/EGCH9GJe3sjIYCUNCIOmnLCPU3XtmjvkJlyem5QVYJjZX/
         GR4G3FPfIHLm9aCLxLKZJqOwk7AV7ZcSycTzYLkI9/7zCg+0ic8t7nv9KAM2j76ZPQCn
         FNCw==
X-Forwarded-Encrypted: i=1; AHgh+RrVqIjaqJyyLxGMyoblrSyxmEqntvEpX1ccWR33Pw1HmYSwbRAyi8FZjWV8Ags9tIwec8/dJsNrxr0P@vger.kernel.org
X-Gm-Message-State: AOJu0YyapibTeYtIoySA4Mu9r1/nqtBSSIMBnYoBmzCcRFSU4MwqkdTh
	ZRQN6SEynkUDL6SA3F4tkgcvBzE2obp235i1UZNhExoDXVdXckOXPCamShgv3tOJBz0=
X-Gm-Gg: AR+sD11ec6yMsNKhAlnWvLB9RCOhVFtmOSyLB2L2umoa398VZwLrr+3mMsJjWYpA3wh
	Hz/5PhbuHWtMbMTWQQFjOebfGC5zArTzWdKJbLRfpPfAS/dcNmdywfqA9VBl6GCxzbPRj7qz27o
	4n5QAgUWjaZCwsdZb7vDzWEGGJa+x5Ji/lAvqchPq1AAbKR2UiQbK7mxgGCSlu3F21QRRGvaS31
	W8QvPR75pw6OnLrM+N0MI8RduUn5vpdSrHC8X0nQuBQZR1NWEQGjkESV9hJz5CEp9F1hW7kU9EY
	PLuGnTJZqposNggWgBEWSRJQ+HYrJIkclPZHcjxYGCeroKtlUMYBkjy/S/2R0P0TS7alSHlOAYr
	B8+UtNT1Ga3Dp04IxYLzzjA/QGEyqq7MFaD/n1QCZQMzAM2DHhvnCISygTdKvYo1GJqRGx1eysl
	vsg7FmdBidAoQd+hmnBwa3PkMb1FPFBitYReXO8VCpPODQdi4OvSSOThpJie+4xVwRcU3VWkl7D
	246vbOvluF4xmdQv0CrviHeGxh5xntic4BsqZ0=
X-Received: by 2002:a05:6820:168b:b0:6a4:cf9:9a74 with SMTP id 006d021491bc7-6ac969bce4cmr3382658eaf.1.1785333441212;
        Wed, 29 Jul 2026 06:57:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45886924321sm2551708fac.17.2026.07.29.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:57:20 -0700 (PDT)
Message-ID: <02b159ad-42d3-4d1b-a73e-13612d9f2845@baylibre.com>
Date: Wed, 29 Jul 2026 08:57:19 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: ti: k3-am67a-beagley-ai: GPIO
 improvements
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7ee50408-aa33-4d16-b8ff-f5e2dc59104b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/29/26 4:57 AM, Vignesh Raghavendra wrote:
> Hi David,
> 
> On 29/07/26 01:14, David Lechner (TI) wrote:
>> This is picking up a few downstream changes from [1] to make GPIOs
>> easier to use that I missed when using the BeagleY-AI with a mainline
>> kernel.
>>
>> [1]: https://openbeagle.org/beagleboard/linux/-/blob/v6.6.58-ti-arm64-r35/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai-pinmux.dtsi?ref_type=heads
>>
> Above had to be reverted due to reasons mentioned here:
> https://lore.kernel.org/all/20250221091447.595199-2-mwalle@kernel.org/
Thanks. I was starting to suspect something like that.

Is PATCH 2/2 still acceptable?

