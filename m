Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D76433FE33
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219035; cv=none; b=U8k1BWb869/ZQMzhY2rBYH2vHO5Q8iTfw9IoT08l+dpe9/lE7yBXrfafgpvXKfb7Vdye5dQWDe4fdEGIL113SkoyqVSGjzRNOlARTkJTKXarhlIpga3qqEEP0NQ0X88G+U7ow+2MFsU8h1IZZ5jReVCWK1wiU/0N5twadyBb6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219035; c=relaxed/simple;
	bh=EaSyvjvgS188EtX7hWuGpx7JU9522ewQuDCxU65EkxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjVIws2d8j9pDwe3WjqLjLxvWk1FgywBpVAeCahL9+VlniUaPWl4B5dTJXMPRilb2/HDiNc6Sm7T8GQ66wqY++KTwDoK7zeoz0JXXrVK/U12R18QgTm1V5hEXcTF/lO8gq5ecQlw7DHSaJLBlvMqYTB+VL+tGXWhzxmvDAqu4ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG/gx+Mo; arc=none smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG/gx+Mo"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1179071a12.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 20:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790219033; x=1790823833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSJK5l1XEbWtgCR1VGoo0OE9b5AL7+ONChxVba323TI=;
        b=TG/gx+MobDDw6jqqr4MJKOxtykO8z0BzPWVVoNVpIdq/WXJmI+aqL4NgGs6lTQ9rUb
         iHO+OR/bw8XEMo/mlilaUTMhkzccL67ubLpPG01Cg1L2DvIgcat0HBLMjUXfwdMZVvGA
         EeVl4SmQOiwcaDL4ZWZbOVWngtthGaWsP2EqvVQ6kqc2TSAPSjfnNEGyqbEYU8HvHakg
         XDiWfgQ360As9ScoZNVr7Wj5Oz3gPwDgW/QsfbhzMdwcWOQVizgQEJAmdicbh84CwCUg
         jYs1FAKXvHAmsl42xiY81odnWSoTbPee0HL9ttVJK6/DMe5l2ORVeJaT224Nifm5BaLz
         3lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219033; x=1790823833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSJK5l1XEbWtgCR1VGoo0OE9b5AL7+ONChxVba323TI=;
        b=iQW5mTJhpNPEaug+mB6B2WTPy68VEIkR1gtW/YbvVXck+tUwqSP+saODJHptenlVyk
         8db6Km2KpX81MvBkHL3tL2HqAbiXiZie9BC9ohKEBJSP7mepifhserUn8SlfHb9rmW1V
         1OQKRj6xBvUtgwTpbQX/BTw9tjBf9+fbmZAaqRE3MCmAsxBj9M2TpOjaPtHwKIcDr0JK
         9welqcAWdTZcQxOERptoQjdN4tjBxqu4PCmTlCHmZbUJDJ8jar+tWe9jM3eQMf7s94wF
         DxMFqbGmNVteK64Uu8DBhc2y5Go+nwlWm9WlmpbYQxv+0Yrkr+1K64RZ5yDM/2w8eAGC
         fshA==
X-Forwarded-Encrypted: i=1; AKwUvBxx+jOzM3Wt32whwiiejUG6zoFInliENhNRHNjx6FPeXaNssMRJc5FVTi/NW6TCdNsRdNkquLoFoWcB@vger.kernel.org
X-Gm-Message-State: AFuF++kQdLFkjvqw2RubYGg0Z6x7UtF7LDojINiKKMokPozGtgk6KBvQ
	EfK066hk4sUQ91hsj0Z4XdWtcSgAPxEQ+7zqj86DbGOSj4+hm/xulOTj
X-Gm-Gg: AYBFou2fyi+WqZoE/iwdd8Iojq+UYTDflRsJMoN3FH6nG9JGu0yIwUZy4HOrn1wTYh0
	oRpgWY3lRs2KytIS3HKC6ztoZBVICvGv0KHx967nyJXC8U2+HRbv23v6koToZ631ICgqxpCconi
	RbabKoxkAxd5RoSKhZZ9ebyR14Tg5ZEx6Xyk5TOTx63jfVw9DciNzdRPb17VV8VG1E8XDes3p3N
	EeMJXqjlrzhYOJ0KpMaEX2pwwLdUDxIHcG1E/J69f8x6FBqj4W/3Zt+Yvnio7xDjHBI8tsNU2uK
	C/azkmU5DzcOdsI8F9H3Gi/+rB1qH8Hkfo78IzUSyYW80UOvQTqhzmnvyKnuQBrOlH2caBNM6jU
	ZgIUcsCZA+KX9+FobNiaGt/vhLxBrLAAus9ncmZrOYPzVrnFZlBcCkG6hhhUWraa2XUxBw60axV
	02th74DRw3MT5ZVfVsj5ZJEpdRK0QZddRZFwY6BIuYCQgYBDBAQk63MGav7ClFrFgPJrSjG4crJ
	6JAD7OEiQQjoDxMztwWeF+vqEYQNwxzIBOxZeOOlqVOek7WWw==
X-Received: by 2002:a17:90b:51c1:b0:39e:6c68:c77b with SMTP id 98e67ed59e1d1-3a098e078b8mr910792a91.49.1790219033463;
        Wed, 23 Sep 2026 20:03:53 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09738f98asm2082693a91.15.2026.09.23.20.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 20:03:53 -0700 (PDT)
Message-ID: <d53cc934-965a-4ae8-a6cf-298c5a587e5d@gmail.com>
Date: Thu, 24 Sep 2026 11:03:51 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: nuvoton,ma35d1-spi: Add Nuvoton
 MA35D1 SPI controller
To: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260923041926.425551-1-cwweng.linux@gmail.com>
 <20260923041926.425551-2-cwweng.linux@gmail.com>
 <005e8cd7-811f-4304-bac3-e0c531958922@kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <005e8cd7-811f-4304-bac3-e0c531958922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2026/9/23 下午 08:35 寫道:
> On 23/09/2026 06:19, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a Devicetree binding for the SPI controller found in the
>> Nuvoton MA35D1 SoC.
> 
> I could swear I saw it last days... I did check and indeed. There is
> qspi which is almost the same binding. Why this cannot be in the same
> file? What are the differences justifying duplicating files?
> 
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for pointing this out.

The MA35D1 SPI and QSPI controllers are separate hardware IPs. QSPI
additionally supports dual/quad/DTR transfers and a target-mode timeout
function, while the SPI controller does not.

However, these differences do not require different Devicetree
properties. The register resource, clock, reset, interrupt and native
chip-select descriptions are otherwise the same, so I agree that they
should share one binding.

There is currently one driver-related difference: the existing QSPI
driver does not yet support GPIO chip selects, while the new SPI driver
does. I will therefore keep the QSPI cs-gpios restriction in the shared
schema for now using a compatible-specific conditional.

We also plan to add GPIO chip-select support to the QSPI driver in a
follow-up patch. Once that support is added, the QSPI-specific
cs-gpios restriction can be removed and both compatibles can use the
same schema constraints.

I will merge the SPI and QSPI bindings in v2.

Thanks,
Chi-Wen

