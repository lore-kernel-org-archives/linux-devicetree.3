Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A544266B1
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745558; cv=none; b=HAxzQsYOx0n5QpwF49f50OLvCIAAa++FRsWd9FS7A1m/jUJ9bg6JgZIevtyNevmVYEsbLHVshSbZepr3WNZPu3R3CZCRRpc67CgDNsP5xeb6Joexz2EebrENFhk+dRZTMfr0DDoaqU2cY0grcWJegDn2LIUSYj5uANUqNWXo6ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745558; c=relaxed/simple;
	bh=NIbfOpAFlLlvaPWeifBrHOW03ZGaSqQUgrtJhDxVpjk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i0m1wkhnouc16qzCJ7BY1TUi8SjzDlBRWP7MTwwHyaTktk+FQkIt2fxxhCjs/Zq+QHfwaiZKxnN6UeupsREtaw42CX/6QASml3FPHapNdBrALs3A3dt2GtmvynzrDpvAQNItcJt5O4qg4GbK/0WpK9hEm+zoR7cfQJrjrWT8Viw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Dpx/49Aj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Dpx/49Aj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4939a809b24so18233325e9.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782745554; x=1783350354; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAzrVW08LVfxI+Bn9EkRfmN0dtsivlXeptpZjuWvIi0=;
        b=Dpx/49Ajd3JBnbFiLpFOGWu9duzBHMLdV2dNBhIGAeSw/4/FGVScIn4Knc8jX6+grw
         q+cxjUiNxzstXLfCo5VnGFKnG++2mOrr5BcfwUNaVBmkHOMlq+Hw0464ilsQBh8TG7cy
         o+forZnHG4aNB2Zl/SaHpfijavNdPgvonTKXAyTFPENL+quGQPxx8EbJa/tJO45p/R1i
         ifwZaExuWTnEqurFR5sXQac6XTErhTE0YiIlRR75qKkuaPwLKu854gUJkwJdILmTO5GP
         ey2QrrNjNXtzuEEUwo+PzX1dDU86eoxs3WrbdO9C/PmuL9xbBLx1/Tnqdc2rr6one47E
         QIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745554; x=1783350354;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DAzrVW08LVfxI+Bn9EkRfmN0dtsivlXeptpZjuWvIi0=;
        b=TDm/JSDXUOn1FZqDRRlVfJ3GUiDh+hbDOr7kSZ09L/ZRfZ6lFspusVKE4BDYDJSXg4
         9m6N89qS0n7ErU8T84R0iyy1OPDlNzsTXaTDre9BDQpFS+jcQxIVYR+vqnX+hHrQhu7A
         qLruD3MySci3Pb2+rspyJJHcREdMnR2FhoSzGY783rCOdmYjGISTQ3xEjIuyQI9EOWPU
         ajaSGJtxwUunXQkiDVetmESmM8VDYjWm1uf4FUc30c72yyyYxRDDIACduhD+XjZMPQnd
         KzHG1FUglSYXsDP8GXiA9S4RANGDT+MySaqyOsV+4nPSsfEerOfPFv2wlPYICZvUPA3F
         htjw==
X-Forwarded-Encrypted: i=1; AFNElJ+F/8kDb7ICxA1S23hWtgLWYIL1RurM5/2WFXZbW8KTcFIGGJxhKoLpq2IzHOk4nlxqcxbDlILYEyZg@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9Cnf5j7WfuSiPiIneMlrJlsj6PzrDcCVx6DILYCOi9Z7ikPp
	rbZ7Xv/WUmksmfqGZDWJSxdSZxD9KKx1WjcNL5XhSnnIN5TTkdl4lmd9ZHhKbN7Nd7M=
X-Gm-Gg: AfdE7clOrp6WuPrKq2aH7euKwYcQScOvRvDzFYvyN1b+3ONCcCTHxz5pubIbfQ60cZ5
	c0Kq91N4Ldwclw48QqnqRGSc7vggeGPmvYyWDirbRZNt5O53CuQXskS6QMFHc0rtLutwFkoOX6L
	vQwJnkVIajd5JespGqFh0igZ3m8hqbzkVtHnH7VyKvGKJ5WKQJSAcDulVQ2a2qTOvqEytKxgYdL
	XuRP+v3WoRRG6ikjjysjaqMLM+MlNwYo+RBR06d53kI14ab7QcDvQOUgsyNWtJPAl60GWH5JgaT
	PFxnmqSRdbY9c/ktNaEOLblclEONs3RCMAC2seAsrpTWlO7D9SqNcfGuKcv7fQeP2gVQalitTEH
	Delfo1/Kdmz55P5BgZMqrX1Ow6pV00P0PxDe+qADZFc+rdQMPlwMIDfYhc/xrU1w6AylnWJA9bj
	L9vQeKWNLjLLQ=
X-Received: by 2002:a05:600c:45c3:b0:493:9b02:484c with SMTP id 5b1f17b1804b1-493b82b9e7amr734905e9.29.1782745554300;
        Mon, 29 Jun 2026 08:05:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4932f100e4asm220013365e9.1.2026.06.29.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:05:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-sunxi@lists.linux.dev,
  robh@kernel.org,  devicetree@vger.kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
In-Reply-To: <20260629125305.0DF981F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 29 Jun 2026 12:53:04
	+0000")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
	<20260629125305.0DF981F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 17:05:51 +0200
Message-ID: <1jpl198jzk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 29 juin 2026 at 12:53, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `clock-output-names` property has a global `maxItems: 3`
> constraint and a description limiting it to three clocks, which contradicts
> the new clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
> --
>
> commit a1565b632e372c724867216463a453c9d1600ad2
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> dt-bindings: rtc: sun6i: add sun60i-a733 support
>     
> Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> peripheral oscillator clock gates of this SoC.
>
>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> index 9df5cdb6f63f2..197a6f67b180a 100644
>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> @@ -33,6 +33,7 @@ properties:
>>            - enum:
>>                - allwinner,sun20i-d1-rtc
>>                - allwinner,sun55i-a523-rtc
>> +              - allwinner,sun60i-a733-rtc
>>            - const: allwinner,sun50i-r329-rtc
>
> [ ... ]
>
>> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
>> index 3bd3aa3d57ce1..5132a393ca4b6 100644
>> --- a/include/dt-bindings/clock/sun6i-rtc.h
>> +++ b/include/dt-bindings/clock/sun6i-rtc.h
>> @@ -6,5 +6,9 @@
>>  #define CLK_OSC32K		0
>>  #define CLK_OSC32K_FANOUT	1
>>  #define CLK_IOSC		2
>> +#define CLK_HOSC_UFS		8
>> +#define CLK_HOSC_HDMI		9
>> +#define CLK_HOSC_SERDES0	10
>> +#define CLK_HOSC_SERDES1	11
>
> [Severity: Low]
> Will adding clock IDs up to 11 conflict with the existing clock-output-names
> constraint in allwinner,sun6i-a31-rtc.yaml?
>
> The clock-output-names property currently has a global maxItems constraint
> alongside its description:
>
>   clock-output-names:
>     minItems: 1
>     maxItems: 3
>     description:
>       The RTC provides up to three clocks
>
> If a device tree author attempts to define an array of clock-output-names
> to document all outputs for the allwinner,sun60i-a733-rtc node, won't it fail
> dt_binding_check validation because it exceeds the maximum allowed items?

Not quite sure what to do with that one.

The h616 compatible devices all exposed more than 3 clock through the
provider, even if the higher IDs did not have define.

The clock output names for the h616 compatible device are not really
supposed to be defined through DT ... at least AFAIU ??

-- 
Jerome
