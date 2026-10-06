Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748B38550E
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283390; cv=none; b=UKtQBjFz/l5OK+a/M1uK/Ys6kGoovy6JX+GLGXbwXfz6pTUzPiXQeK29J6/pbzIk0eS86lL7Uy9fN3xuGJxTITZhw0EiL3S3LziXCOxJO1H/6If3+VzGE863tmb9h36EQvI1i1Mrs5LtS/azoIz7kVBIk2U9nn0DU6HM/tHtkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283390; c=relaxed/simple;
	bh=Y4YXkuvkrc1XHWLGfGnZVC4JlpoFO4yvIMBJD/MVErY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFzCeMP26QFrUtIXe0ZdpTIuoX6B4d1xqZBlQ6x9BYSVngeXxqFbigb0yo8L8jA5wUDbcyUE2JkCSmfpFg4w8B7ZvO5yz0oGQca5mBwfkvZgW66Q1a47Y7NC7ge3WPbDkxH/vjESut9umMDF4mJPKu5lg3irQECD6tbMEsR61n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioc8eQSe; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioc8eQSe"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so999635a91.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283389; x=1791888189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=;
        b=ioc8eQSes1AR8V86aI71e73rJbRneVPIfBQdSBgV5w4VG9l0i9DgDn+iEWC6NMzcXR
         Nnl4bYj64aB4lQZhKJTNyWJgBaIjCRgNAF7Lc7IGVn5Rzp2LC0lOS4WMhoCyd/0ct3VQ
         JRJkE3ga4b+tixfKcEyipvKkAf8gQBAgEYt1hgHkjpEcj+HrQDsf/Ok8tChHnLPvvmbR
         3qw6wT6o0Mvo8Eq08Rj9MCjqRszrjv59PLcJk6ubw4AWuidIaZ0iZfySSXK8VBt7W+hd
         Y55IYE/1jTN4XlaR2oTGjrmLfdhBSONg78NxNEJMLMLfTJqepQDTyU2BYyZqzJbpcvPc
         1AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283389; x=1791888189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WgOz8LzlE3w3VKFtUPRYULU7lY8WNBCIqyynChuXNxU=;
        b=2Jceuzf6IHimoW5Od+6SBLJr5qVpGZsdrzDJRxUFS8TsWHr1tbB0OCVEp68zBZsUlj
         10ydxKQfVuBaxyEHlT51KwIL+0ATw1BD19PIbftSDFpE3PSBMuKRWipweSAfhNWO9EqP
         jV/MxPsIKblwKtmfynJlYGxF/KbTeR848oaqQHWUq4mXGafwuRPQvVAwS7JLRat/neoN
         VJK9AOKM/Ej/jbFg47dzZe4yvOBLBLlNuO7ui7wPFrhGm8EBIW2abNkLh1mMk7hxCkCH
         5fQt0luVTKDn6h20zvT2X5RRgHTffqULT0ASXHJzzkfW6//PVcVxWJOnm0KWrpM4oC9F
         GqzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMobnOATSU9riFqpfyP9txw/VluubOE8tzBmtOeEzCXpALohjX3DPkyapYSBqXZgpRf8VilGCwGV64@vger.kernel.org
X-Gm-Message-State: AFq9FYJkODN2ubOdkn7WmEAxIE2DDzkMUQtDqZYtD20kEQ5eEAhWdT5m
	gcd6KpmkzzeF/WxMtQRUftOeXP8rBrTqnREic+JspS66XItAQBCT+q2I
X-Gm-Gg: AYBFou0XfeLvZcX2MaizVtlE6p+p8i8eHJZ9uqJMBintqTw/SF1e6Ohm0YIpggp8wOY
	91oGnz52nS9WzzIcg9lcXsuKn5uIByDwiTiMsYwAGwcooHUqPewropsZM0DGQjelpeugqns7Ua3
	Md0vNROMlDJby5lSH9NkVU4TK1/B5iY5nbuqiALwCLzbChJ+cxJMVXiJRXI0Y/T/Oi5V1ERhF/G
	yx9KOPAFGArmsbk4Ro+xJ9/6yRqqroAAdA2SCmxIbVKRHrJR35IH22xtmwUZ/oUxwb96W5XdGl/
	Wv/ZdrsTaYQCqeqgCUCeXQKzW1vkuMvyLdX4QkBXurlkKolisG+kzfZsH8F/if9/CU1m2UwKSb5
	TWmHcbnd/RJxybb4yVEAilNRuk53IXCGWdy0clMqk4Cpvl7MMEU7Q6ChfLYVc9q7uGOe03IliyJ
	ajiLtYQCAVr0aW3UYdT7ZiK5xWRx9AZ+2mjtth7p8eRcZutUqS4TLFOG2IFMmBebEy2AbMHH9ab
	sKjUOD1J+ZTg4omR1v3+wu0L8LjKKR0LCiYknvGnweY7n+NNoSmi88Si9jrv/A42A==
X-Received: by 2002:a17:90b:280d:b0:3a0:345a:3646 with SMTP id 98e67ed59e1d1-3a8736b5a2fmr730235a91.45.1791283388692;
        Tue, 06 Oct 2026 03:43:08 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4184018a91.13.2026.10.06.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 03:43:08 -0700 (PDT)
Message-ID: <e646b60a-cbc3-44b9-8014-c9aa76ccc3bd@gmail.com>
Date: Tue, 6 Oct 2026 18:43:04 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port
 with OTG support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com> <asN29Gi71MIA-2fq@parshuram>
 <ab91b558-e7e6-4758-b4e3-66e5db75b790@gmail.com> <asSzYUA5W51Ngn4X@parshuram>
 <413f21b6-90ca-4102-9466-3cf7b9feddc3@gmail.com> <asTP4lI3psLy5GCg@parshuram>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <asTP4lI3psLy5GCg@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Vinod Koul 於 2026/10/6 下午 06:39 寫道:
> On 06-10-26, 18:22, Joey Lu wrote:
>> Vinod Koul 於 2026/10/6 下午 04:37 寫道:
>>> On 06-10-26, 09:37, Joey Lu wrote:
>>>> Vinod Koul 於 2026/10/5 下午 06:07 寫道:
>>>>>>      */
>>>>>>     #include <linux/bitfield.h>
>>>>>>     #include <linux/clk.h>
>>>>>>     #include <linux/delay.h>
>>>>>> -#include <linux/io.h>
>>>>> why is this dropped?
>>>> This driver never did direct MMIO access (no readl()/writel()/ioremap()/
>>>> __iomem), even before this series - all register access goes through
>>>> regmap via syscon_regmap_lookup_by_phandle(). So linux/io.h was an
>>>> unused include already, and it's dropped here as part of the broader
>>>> rewrite touching this include block. Happy to keep it if you'd prefer
>>>> not to bundle unrelated include cleanup into this series.
>>> Then it should be a different patch explaining this
>> Understood. I'll drop this change from the series. I'll leave the include
>> unchanged.
> Nope, pls add it, but a separate patch. This in unrelated to this one,
> and should be added but as a different patch.
Got it. I'll add it as a separate patch. Thanks.
