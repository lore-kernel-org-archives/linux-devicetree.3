Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B49329C54
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263635; cv=none; b=dZ9hhgKwo9YfsE2QfgbNF7PbWhdkqrjMewJ/hkXOR2WkQPpryH9lIARDuU6beaTd/5ajvWtHaFOKjT7qnbKGHh3+dmj3O15cyIxHYV1Dzr1NQ/mxkqpEshe4wkTQ4NN/U13cQmrcbi69jPr/cAIogR1pjE+ckAQ+DePMkt4qtIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263635; c=relaxed/simple;
	bh=hWRBU29dNFkhPABz8wMZX5qI45LPRwRDkloljDEwgiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sc++gXTTanzqN/wrTaukm7VVtlqq+pybVvjwe0PnDkfZYpgJOVxjpkjXXMCx+Gf7y/CLxO26E5ahDPDITYxLOodkjjE4ZZ21qPx40mvMhQoJODodueEhWbWvbhD50qX5koh7M4M04k2Pp+VV8/umD55nUYpPVqY1e2xl5d1k/Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWpDVy6A; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWpDVy6A"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so43761665e9.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263631; x=1779868431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sLZA4hvW9xs9FgysnR1c1k6UhOsTdTrM6VQ3/eZLexk=;
        b=dWpDVy6AmfAhrxStW6mbQVcxb4p0KD5F5GbZqISVTMhfn/jY2+4RnhbVu/GYx4QXjM
         s9ZTbRf+P59cbLyf+dSt7uaQYVumuKdBjzu+bNak6RVXI7yJx0bSQgBA6L6UBHsDifWF
         9hQ4Og+EiDAk2orVNTG42eFyhj+BG3yExPk38IhBu5kb0xml12tekPU6MYAQDDLONKC3
         NCQCWeQlSu6ivJyQG9OQwOzaqAfu+vEuccK2QsF+NnNf1P876oGAETp6/U8V0QqlACtu
         5CbGacZf4EHScp9x+l64FY6rO5k9Y+vxW8VdHJkcUd7LDxDvXx+tXU8JOHdFWmB3eZWa
         DI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263631; x=1779868431;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLZA4hvW9xs9FgysnR1c1k6UhOsTdTrM6VQ3/eZLexk=;
        b=P7D+IhLsXp6UkGwDgOR86mXDNOnSv9UOhenh5w5WiqNtXMe4NZweEjwLlb8oRNnEGo
         088inwbE750S/sILN+o6BI6QDA1ZRN4TLZMs5kFo9oVyKXJMbgWeNXutHdXhl5xTE9Ii
         Xk0xbskcwyJ9rv6xamZPnM/z20BuiKbNnROSITCe9ew/qcTIb4TxcU+C5nxndIVhT8wL
         Yc9jMTZ86I1WhpKkiGgvOlIna5XJNzxuu8OJqdWuvNOouEY4SGhApYWvXRe1RrbpfXLu
         FqGyQpRUDcWcpt98uwb1hMnxZ3TNJwmBSg7NHxmqpM/d6oCCoTKhX1PTLs9llGDIVB/K
         sYfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8H9rygGxoB1Hcx5q+2H657Ax4XCSSwCbNxCJg5e1qOuXjSZhwsUYP2DkSTFm26B9oo0u7OQqfYAU9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34FHRcnp2s6lpGUHybnmQUH0stTTr6i97nifotZfFA6Xb89fd
	XRiPmoWGkFNaQzD+wr1JcWLXxh1vS/H5xmihN5DlRFQ5X42/M5xEgPY2
X-Gm-Gg: Acq92OHTNrIhZboCuI2R9taW1oZRCDoWaM4sCx1nK0ITB9tdpdG9Tm68J2nquAAJuVl
	X2qxE8yPzwV6AYbWDb9oWfPLN+Z7eCB2mANikTiHykiLWYM7/7HOT8gPDBAmShg+MOwr5ToaRJc
	pHjVp4NJgBlvwOtK9ccD1NsXt0aHbZJ8xN57machS5NzJZ/BqD5q8RGnfcmZEQsVRBzTuCGlGqW
	RymvRVlGPaVnrB8LEunI1WP53CP0cJ5FzoEqS0Pkq/H4xTAP50SFXuMfFxotX5DKPJYDL8zrU0F
	VLBqRcvMNzA/WJsip9SVcloXeuKyjkZwP62F+Uf53HcT0ib636heBCWmTfKffN9dzCqzHl6kvFz
	zGZpPxLXGlVIr95PgfrN7PLDNFbeLF2TB7n5s2N64NzEouqxSSrZWPSqKg3WzmPenlTVxlC3FKT
	b4N/o5mUnneJEyM74QMeH6mLKq23hxDU8rQlsWrnfgnyzl4MFVu3C9qhaucUTEqK815FhmmMFzf
	okQ
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr291977335e9.15.1779263630727;
        Wed, 20 May 2026 00:53:50 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-137-241.net-htp.de. [89.182.137.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ffed60c8esm91723435e9.10.2026.05.20.00.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:53:50 -0700 (PDT)
Message-ID: <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
Date: Wed, 20 May 2026 09:53:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Trevor Gamblin <tgamblin@baylibre.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulfh@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.dev>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>, Vincent Legoll <legoll@online.fr>,
 Margherita Milani <margherita.milani@amarulasolutions.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
 <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Trevor,

On 16.05.26 2:35 PM, Trevor Gamblin wrote:
> 
> On 2026-05-15 22:57, Yixun Lan wrote:
>> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>>> This series enables complete SD card support for the Spacemit K1-based
>>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>>> high-performance SD card operation.
>>>
>>> Background
>>>
>>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>>> currently lacks basic SD controller configuration, SDHCI driver
>>> enhancements for voltage switching and tuning, and power management
>>> infrastructure.
>>>
>>> [...]
>> Hi Iker,
>> I've picked patch 1-3, for [4/4] I think it should be merged after
>> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/
> 
> Hi Yixun,
> 
> That makes sense. In response to your earlier feedback I had drafted a more
> complete dts after another schematic comparison, but Iker and I discussed it
> and opted to avoid changing scope too much. Andre's series includes the bits I
> wanted to add and more, so that works out.

I have 4/4 rebased on my series anyway, do you want me to send it?

Thanks,
Andre

> 
> Thanks!
> 
> Trevor
> 
>>
>> Applied, thanks!
>>
>> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>>        https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
>> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>>        https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
>> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>>        https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>>
>> Best regards,

