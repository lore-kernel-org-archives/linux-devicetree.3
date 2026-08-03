Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2523019D8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722778; cv=none; b=jQrEcsj2M1JbkfIhQYNC1vEfJrGppye1fb60fySr6LtGUbeKNePQP3iysfH2jD1ZWRkbRdoEbeJpQcRL2twufdGLyyk/at7gw+stbogmb/vVi1omZycYGbjPJ7FLwgNWgQEWiUHSk9ws/an1U+UcggfD2gUPRvdFF7u8TaaLBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722778; c=relaxed/simple;
	bh=8Yv3hh31LT/ea1kydVeshMQp3oy3EXGN203QyIn9mjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AldzU899DEz5dFtJiXz0Pq0dAuvlWLWO9hcirRDJHz5oEKh0KmwsAvC9khLsKJ6YAKpMrWpbPpzMg8toyYzDuwjLNZnKox7WwAHdrqooyK93z2N11wE466O3ZIAfZr0SCRudXSIiyO42e/2XRURsBJp6LR7wotlReLvVy6P4O4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyXck0ss; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyXck0ss"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so2871579a91.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 19:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785722776; x=1786327576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zBpvBewXJUAUQskEE9gVJKiIy2xHWWYPydLmxFZvPhA=;
        b=NyXck0ssIL66oPpr9E8Rlx3eXsxC9fmA2ucAeYuiWdIabOAyLeDIeuzJaZCSrNvTnP
         LMniQfCype3d8sy009P8Zibi7wOkyT2rh8GwDVeGzGAoELjOMV//7rsu3KnDNAMHXoRO
         Ffzk1+cFVSflgElDkMva3gpbI42fxgKOm175kZ/UritzlAHYSVqX8x17O4JSp+2nqCoL
         ci3xBOfeBZZP0h3CQ2NKVMRAbG1+FUO+HfiXITsYoL6mSYBSUQ721PvYt1JSU5vokHiS
         vCRK0RNKSUCeA4O2k9TRqbmvG1G/zi4AEx4UrxZ8sdUDwhSjjauTDzx1RjVtQ13OvLRT
         H+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722776; x=1786327576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBpvBewXJUAUQskEE9gVJKiIy2xHWWYPydLmxFZvPhA=;
        b=E5p/C/riu2b/n4B9k50aNmVTDd46gzs75xgw97ndnBWPPD87OJcJJ72OlSg+CPY6wy
         nxldeLYdbmH/B53l1PjzKS+NMyTvpfOfMQqOdALMR3Dryw8wolaE9fxkud83FGD/0IUi
         Ob4Dn47TEIHFakhwr28DGgPC2TwQiq/tWce+GQcKOzKN39hiXsAMNaYJcm9d9hZI7P7T
         1AozrINbmdoPH+fyn3qFVIGM5i5fe6folphmTFWc+pQceO+STzN3koiVbZGZTEmixQjj
         060pzAAC0OURkL4VQCZ32p+bpqI1LHclnic/sMSNCR02p7U9L8YAOcrDgBW3fW8wNagr
         ytfg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1TToVmrGhvURbMPXF8snSMdPb0Vy7k2lYMxNWfZ/zd2tT3vYgm2SrC5HpuXk05kf870UMhxZs2mBf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNNDpIdAwcOTayz6x/oNEUZ1aJE3ipEO/ju2Y61ev2l9rAnbj
	jEH0QSJ1JCapobCFZv37NZ6ASHK/VsWtaSxS7XiXqoF1hTvzW+24MDha
X-Gm-Gg: AR+sD12pTTdTcEZgzQ4zjhcnPV9AWvQPtLJpRQLzwDnYuXSEFcfKbLrfNfFMXmmknja
	58mItTRUzxxSaBdViNjFz4HO5dyJZEVHB6KjS2tD8YCELzZJ968QdnUKT1U2QdIg4ncBOW65wvU
	Os8fJfkmSaa+CPQn5Dbl/sPywGr5H+VCJOc9OABavadfxqMcplgrQrse1UUgfEqOQQug0VCoIxD
	/uo7YTUspAZzk9z0KvCbtW7waMT70RvAfGkchm0mElsMV2SG/YVOfz8WiHuYvcDyw1QZlg3yyxk
	sIZimsYXillKkhPecGIHEiuYT4t1iN3RFilj/43cFe+Jxh2LZzx58AHczD4HFog9pWVXP1pWVYq
	zN14CJDP46+Drn/3bFV3vA5ey+EAATMrv1+UZLpJhax0JQUEBdb0+m6DYHuW/9zWUC+Liy5QRin
	L7NUU5jL8Ps3iuvBXcToVHLHczasgsJPfkGVNPrTLYvFnNEamnVHISTJkmyu+Eyt3Hz39UokTOz
	779iDTbxF4tF1ppa26k0gEDRm9RQbbwe0UL9V/R
X-Received: by 2002:a17:90a:c104:b0:38f:c8f6:4ab4 with SMTP id 98e67ed59e1d1-38fc8f64da1mr3417332a91.41.1785722776096;
        Sun, 02 Aug 2026 19:06:16 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2e0f409sm3199716a91.4.2026.08.02.19.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 19:06:15 -0700 (PDT)
Message-ID: <222f1bd8-e680-4a45-a7b3-d6e8b653c2a8@gmail.com>
Date: Mon, 3 Aug 2026 10:06:12 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton
 MA35D1 QSPI
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cwweng@nuvoton.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260731023818.1626075-1-cwweng.linux@gmail.com>
 <20260731023818.1626075-2-cwweng.linux@gmail.com>
 <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Mark Brown 於 2026/8/1 上午 04:28 寫道:
> On Fri, Jul 31, 2026 at 10:38:17AM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Quad SPI controller found in
>> Nuvoton MA35D1 SoCs.
> This leaves the generic binding's support for GPIO chip selects enabled
> but the driver doesn't set use_gpio_descriptors so they don't actually
> work.  Either the binding or the driver needs an update.  Otherwise
> things seem mostly OK so I'll apply, please send an incremental patch
> for this.

Hi Mark,

Thanks for pointing this out and for applying the series.

The current driver only supports the controller's native chip selects, 
so I will send an incremental binding patch to disallow the cs-gpios 
property.

Best regards,
Chi-Wen

