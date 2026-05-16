Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66883305683
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934908; cv=none; b=KtE/NcBtG9Fkeu5DRpctI3PKRH97Wa8/JiQzXqPcsJl0i17YpVmSNcZ3ERiHEYDU/OUv5+ghAgCNB3D81B/Nb48+VHtiyDRyVSO78TH5tEKCysoU7HXSCSSv6XImAMXL/iXsaATggtsym54tZaaAm0snz9MqQ+GjM+2OnWrrLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934908; c=relaxed/simple;
	bh=/0+rB3LCDje5H1GWAPmFkRfOosbuwDC1QTWFKmh24Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9mgPWgyfVHxB+h7ovjCOWBgS/A+f2XciUk7iiXpCP0OEldszSDtVQR641wagMrJg0PkWLtd9h3VRKfTecSUoBwJA0s8f6KPQRNtpIEIRappfE1WVobXtH8QQXUh+rAIFlt0JWul6xzEjwqk+mDXGYxnwl0bmruSdpjrdlTL9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=tRzxLUfl; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="tRzxLUfl"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-910f734b477so119198785a.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778934904; x=1779539704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlYX20Tz7KrUA9/+ib940qbKVKDUFNbiWx/P6UgmXqc=;
        b=tRzxLUfl7WKi7iPmFaARqPkpgb9BshebIlYejfpOws/ALL5c6MblM/r7I2D/E3kIYR
         mJyDXi6DlOORYPHugG2qBKloV48ks5PwzBSu5yPBrVokNy2UpRZzkUzn/KHbB7ShHa3K
         tsAm81MH5oENssNUCdT5zUKwEXDa/eNLAP7gQB0oInMMRdcyZFJVqnGEs3X5jIlrn9UQ
         dA//omAOVlR4cESoLwRsmedQLUgeEl3dOhwJx120JstiN5eizs0xIX0TPiCMqmGXnucx
         mSYaxPayEVmKvNt3hHDeaRSGHqpxxoYyEmvMeUyaBTNv0psZ2uX/lP+dG/SJmkU8ANJ2
         Dlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934904; x=1779539704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlYX20Tz7KrUA9/+ib940qbKVKDUFNbiWx/P6UgmXqc=;
        b=NVZZbVWaa5/+BC2Ov5Iuvou4WjJVHi8hYS6HVizeFvFHeuHHmp4szrsnKwquY8TuiH
         xbRxWasJ3zufHs5/oyIKIqz1qjk+RNO3z7cJWWAfySPrydUIxEWYoSKhpxFfjUcKMzCu
         vUT4zhzmucEUjeNCw2OualaeYOaabUdGX3qPQgpXa1NPvG8z4uBKQ7Lju61RaRi41fyx
         1KjH4qU3JGsZQEnvP4k0dwJSARrV5Wsd8zd3kr9yE7sOBh+PKMbS+VpBpdSDl0W9gjD3
         MHzFPdBxs+NqsU/05HUD0p4tlHV37A9NEXfMyiz4d8JgbaFshg09KQozVBpOb2dpa0WH
         WaUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8c36umA07jA8ReSgNi5h/ZoKq5nmF2RnuOqUQlEtAwIRr//0E/oKbPmIv/OKd/pTobIHfz+tHqNteS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7WoUzDAVOTJam5jO0poFDm3NBsVtC7xKmwcnWId6nELSpwrBa
	L8ljkHZVIOL6RbGa7N3K5v5sxO/GxYsMMdBv5OjpzaouPlINscTkVOYs7YcbdttxWNk=
X-Gm-Gg: Acq92OF8vt6h2EbEwV+XO+ggzDL2ydJ0OqRqb+J7/2ngkcHVmf9tVgkeCWiLesziJfC
	OOzNUreD46sP8N3jHXyFN7+LvbX/s6lVex7Bs/CJVElBFHHhr+Ajnk6EF7hZOCFbCVHL7Ld5uRF
	R5UgqHO3OdFyU+4JTuL9fSpjvWYLXARDOjCYLrWAkv9VhD4iRM+w3dGt4MyDVjccxcQVw4f3H7K
	ZzI6Cp3I1Hc4LyTJTl08sR+P8a/Vf3CuaW/91kT4fSGM3U+9VL5hDCWIQBqr7ouiju0MJ1tEOE0
	nJr5+4wCiHX+2leHUBQPND343OZzxUmNU/y00ZFxa5GOPG2oJMMijVqdDcpmIlGwjTHVvToWj1S
	/I0shYW0847hYaH528b14Si6KjvU7Rtty6/QuDRTEQso/Z6aAU4BYaFZzG6GdNzHF14xqw69oHx
	kx24S8Qizy4jYeVzHOB7JRF6UEfCfDaa0l6CroCdaKh5lRBTutJ442Xij6jrvg7GdXniMF5ncCQ
	NtQOWn9ABNbSDk=
X-Received: by 2002:a05:620a:7087:b0:8ed:d906:a8ff with SMTP id af79cd13be357-911ce04464cmr1176183685a.14.1778934904152;
        Sat, 16 May 2026 05:35:04 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:9cf2:2d6b:fbf2:991c? ([2001:1970:3847:e000:9cf2:2d6b:fbf2:991c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bcf3776dsm895724585a.39.2026.05.16.05.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 05:35:03 -0700 (PDT)
Message-ID: <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
Date: Sat, 16 May 2026 08:35:01 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
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
 Aurelien Jarno <aurelien@aurel32.net>, Andre Heider <a.heider@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <177889984452.2298656.1074391459031404894.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-05-15 22:57, Yixun Lan wrote:
> On Fri, 15 May 2026 12:48:58 +0200, Iker Pedrosa wrote:
>> This series enables complete SD card support for the Spacemit K1-based
>> OrangePi RV2 board, including UHS (Ultra High Speed) modes for
>> high-performance SD card operation.
>>
>> Background
>>
>> The Spacemit K1 SoC includes an SDHCI controller capable of supporting
>> SD cards up to UHS-I speeds (SDR104 at 208MHz). However, mainline
>> currently lacks basic SD controller configuration, SDHCI driver
>> enhancements for voltage switching and tuning, and power management
>> infrastructure.
>>
>> [...]
> Hi Iker,
> I've picked patch 1-3, for [4/4] I think it should be merged after
> https://lore.kernel.org/all/20260513071958.29574-1-a.heider@gmail.com/

Hi Yixun,

That makes sense. In response to your earlier feedback I had drafted a more
complete dts after another schematic comparison, but Iker and I discussed it
and opted to avoid changing scope too much. Andre's series includes the 
bits I
wanted to add and more, so that works out.

Thanks!

Trevor

>
> Applied, thanks!
>
> [1/4] riscv: dts: spacemit: k1: add SD card controller and pinctrl support
>        https://github.com/spacemit-com/linux/commit/2d77e577109967ef65f269c1fc1d6a659d4260fb
> [2/4] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
>        https://github.com/spacemit-com/linux/commit/2585c60ce2f977b13f14a67d1e3ed9c73fd7f381
> [3/4] riscv: dts: spacemit: k1-bananapi-f3: add SD card support with UHS modes
>        https://github.com/spacemit-com/linux/commit/c76e2f058cbcab84e4a703f26857a58bdf6a0042
>
> Best regards,
