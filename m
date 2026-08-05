Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D58E3EA953
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919371; cv=none; b=Q687DHO1m0tdzv/gNMFHPAPAvDmf9Ys+XQGcgVQK3hX2IY/l58upVC6+cDTHzEtsVrqOSjsOD4Po6exe1qcG8hgWNVmb5rsBiByL2qkKZH+gaNSw7PHLYT/AQxLFmkkxPripRXfE6jZNKGUC5nMZkGTKQLUaco5IHVuKOO5+b1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919371; c=relaxed/simple;
	bh=UAi8yJlVwr0Gl5xJX6+Vekt7n/xH/KJOHUYIj5IEFkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFONdrHrxPVH9px3FVdVWzn0uToP8CwvhudJCEj5Lq/NQu4Z1NWbaleLOa7BMLgeTXnZ13mUp9pcrKJvA1jA5YMxlvjsbOe81BLTsPCFTKpwnGQ+u/D8CLAac/9UYwC9611451kzAt12CyO6UP5CZojEdmXHcqDIGtVRmH0owmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=B1eFLvQn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="B1eFLvQn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso3240025e9.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785919364; x=1786524164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQIOeZPTsJ+5KJmdvOKBti/mfnMsa2qcUPhVItieKt0=;
        b=B1eFLvQnM0dyAQU83LswM0mdfpdn+K+rPeD2SKZqTtM/nYtWA3N0hUvITJLzQf/GSN
         ffdX3DOWbbI/mHA3TpDw8d0M2Dn6gGHq+0UCI1e9k+uPSIKB3q6++t+aTQlV+xZTMyQl
         ZByedjylkgV8feF8K2asBGwo4lk2mspXOzTyKRwj4g65TOhXNCTidjVSXNTV9H1P7vSE
         9BjAHJKqf6fCk9tsoU2zHamKtVhuXkE1BF4lAPtGGoFmBy8olh8tFJ36cqczBV50HQbs
         Ox1KFOl1pVspxHmjpudapAnDDEHHcCWasXpn3G5zDIXn0UjnoMELhSngjgIw+v8iYGVg
         JTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919364; x=1786524164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQIOeZPTsJ+5KJmdvOKBti/mfnMsa2qcUPhVItieKt0=;
        b=b3iW9Ac1Q7Uexr5+oO4B4cBHAUof9YI/nKk4iua/5dEyq+X5TvdwKy+Ja4Mw2oxa1p
         4BWUMPgZ+Vj7i5U6exD/66Kqi6GuZvADDhwHPKnV6IN7TsyrRVxoY/f+/B6DLlcTN9Iv
         JeePfoiksmMbBKCEucWuEXC5B6cDcMLrObLWukbjrLGW7HZi2QsCG/1tQpUi3WDy5jmZ
         ouiiQEPlaYrpGru1sflvND4QFBtAPsxZZ4X3xD2of7/nI7wfqpQx9vhMGoL9XsGHU+zH
         VtzgvYFfKi9olZpOiVMSYFRiETLiTGDxHIchufto0v68812JnsiDWujv73vsLw9Gy6lF
         Gzyw==
X-Forwarded-Encrypted: i=1; AHgh+RoRST+75L9rFybcdXMxd889EVic9JOjzD1ASHKu2FKs6JUVtaAk75+EPPIek6oCJYzEM3mvSHZr0Myu@vger.kernel.org
X-Gm-Message-State: AOJu0YzdNXJrifKlf3YwXvFctdGVD1S3qtaIRgGx09Uq725fKgeK8imO
	dK+T+Sy967BHJq8FEBF5dRLtqtuh1W55iy2BmrgGg+vWJZzjutOujbI2PN49I7sIVYeoEUf3iXh
	QNkNFl6c8UQ==
X-Gm-Gg: AR+sD13raE/9F8A+E56Y5ydcj6kGMOZ005cOGfBbc97qAdkNQWNzaAZ5/eSve2tOwGa
	AgpHGBFyDu4Z1n5vQVAjX0Dta/ix3IpdXiYFZO6HO3+AQezDkwBS8MVTQGtkiQMRfg80zwahdc6
	Tftzo7e+qeHTXpRogEM23rwsBnwqXlRe+Us8vWGyvSSgRg3L3ncHGjXmYNYLeBLfmPOzgOgJb2l
	DMOOLDhs6syClyHOrQFCfnCYWO0V4JXvj04sDe/3uvEORjPcJELPJLNwRQf6dZS2N05VwwX5Tky
	9MpVmcTp0X1XNzrfgVOLX8VPVllwNLstYAebPdczBYouFTgDfLG3T9kYaiMUKMP2Cg8Z2ncqadA
	ikivRlFogGU+M1DcZUo9YcdO8M0lIGCjpR442kXtLQR2+Pll0rmEsD5PRCYd+3jd1PCMBGALwEb
	c6QDh6vgxOAeqAsJ5mdFGsLGyFRrx0F/DayV+tSOMaqm84o/Xd4LJLx8yJDoRoPNCP2hvny3Ip/
	9C05i17KEM=
X-Received: by 2002:a05:600c:4454:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-4994e7c0377mr56478105e9.9.1785919363850;
        Wed, 05 Aug 2026 01:42:43 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994dfe64e0sm70877995e9.6.2026.08.05.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 01:42:43 -0700 (PDT)
Message-ID: <5f10e213-2ab3-4309-a01e-5d0f098a5b35@sigma-star.at>
Date: Wed, 5 Aug 2026 10:42:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: phy: ti,phy-usb3: document aspcie
 reference clock setting
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, johan@kernel.org,
 rogerq@ti.com, Julian.FRIEDRICH@frequentis.com, upstream+omap@sigma-star.at
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
 <20260804111849.92046-3-david.oberhollenzer@sigma-star.at>
 <20260805-uptight-onyx-unicorn-cfd0ce@quoll>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260805-uptight-onyx-unicorn-cfd0ce@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/5/26 9:39 AM, Krzysztof Kozlowski wrote:
> 
> Not a valid naming, missing vendor prefix and syscon looks like
> Linuxism, since you called it "system control module".
> 

I agree that this is a very vendor specific kluge and I suspected
it might need a vendor prefix. However, I ultimately tried to stick
to existing conventions.

There are 3 more syscon properties defined for this device:
  - syscon-phy-power
  - syscon-pllreset
  - syscon-pcs

None of them have a vendor prefix, all of them use the
description "system control module".

I take it, the existing properties already break best practices
that were established later? Or is there another reason they
lack a vendor prefix?

>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    maxItems: 1
>> +    items:
>> +      items:
> 
> Missing -
> 
Likewise, I simply copied from the syscon blocks and made some
minor changes. Hence also the identical description. So this is
broken for the existing properties as well?

Thanks,

David

