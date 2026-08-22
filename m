Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646FC35677B
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 22:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787438249; cv=none; b=cCrtgrmlAmsiQRn+V5cqsmCEIQrVqDNYs2VpXAyk84xlYn87siMsYhg/gDByyt74u6r7bT+tcPGFJJBPBWRDRhPDVp+1ef2h3EIVH/14Jt1iEBIhDNO4ockaDtgavbRoKdVURQNWEnULZZuXrGMIy/1BD+LRLPcraz3lHQtHKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787438249; c=relaxed/simple;
	bh=DH+J42rJRU47iRWVqVay7ZwyKA1pmoS9rIXhXaUE1ZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AExHs1t1/xOdckes1UNpH2HJsnCk4ARPMP2UgKH1Bm4RCVY1gCOk32oof5lbP1sFsPupHIe4AoL14mo0qQcvKNAWBV7jHZpzZPjAKg9UYVLQFhcC4WkHnO+KdLBU52xnHs/iTZYJSGXtRlVhwVvdozXrWCpwO1uLuJg2yqOiRdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HJkHYFBv; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HJkHYFBv"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44cd237446cso1926312fac.1
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 15:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787438246; x=1788043046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpJFDAtg7SWcM0ZQElBMQw5ahKUR/8XcA/uOWdRC5MA=;
        b=HJkHYFBvDlqwO+XFzEhCHWA+ZPus8DlnfUjrNsVmYeLRSsB+2mfbKijy4hd15huDGq
         Tx7qbT0Ruo8AsmuTEbUxN6CWHa1sV7BfNBzdjWaDpDK1tuGgq9Vm7RRg2qVnL7hUG4Zm
         AGuBkUbOBmo+9jVN3PNxjOQPQ7c3Ov8Ah3V0mraC/ezs/H/qX3NV70LKETdnRZ/Jxa7H
         JVakQjO5SGu9AUggdHr/eOUDhM5Ec5SwGmGeqhAaH+2DP7+nBgUobINY5fpX/SV5FjPM
         TAfs1PhiyiOLYnMuN8RnfK5xs0QWrV5OqO3tfR/gvh7QtZAxJE/ckYuqmUWQOgyTbcCY
         l+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787438246; x=1788043046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpJFDAtg7SWcM0ZQElBMQw5ahKUR/8XcA/uOWdRC5MA=;
        b=WorLRiJjs94aypgUlYRsBg8vgC6enum7JxyrcJq60bSiKTa66p9z4+hRQAzkoKRBrD
         /qhoKSomjutb9ZvcHI3cZ7XvK2BhIp3561qip2q66FQTclpou/FoBemGuV/xJXuzA25b
         Dtcu6UE+WvI5QILDQ+XdoS9GUA5dd0cMYqDZn8QAW9msKMHZ050GV5+z+VOE0rgV4Tog
         EiSHEFxdGLR9fe2FnvwG0aaXOSjv72OMSyyFWpIpf0ZQ0JXT+P4kc7+CvEhzCRK2BpbB
         N8tGNJg3AIVFZmNv26TTeXiYi8LXt9lSxaur8e36U68+MvaWMoapVRcQYksMHXoeh+IQ
         nRSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqltTXVQG5SiIWyMqNirIr2mGPRGZSIQaOk3t1K+CHesV4WAWbXH8H1a9dVEMwDZwf4LBQyj4ng2yuM@vger.kernel.org
X-Gm-Message-State: AFuF++ndfkdJIurwyXxPUOr8ARFUbmGtmNdaFcYUlxub43lncVhVGF2f
	sFhVy/7rW1JXxmNankBs7zJ2zkB2tlcD86aVCihR+Yc4CAnFqw4IF7Shv2/S425c408=
X-Gm-Gg: AR+sD139V4nU/yv9O9iUkGANxoq+V+BqKOlanNA+3kLMsgNPXZkJfIyjptLZDkXLOgC
	QH5E8iDnB/QotGFdGS+JCkeNr1dgv4QU36ROy972NnnXkY3aLAGzTq/npuwj99wWi8Xb2ElPSqT
	ob82j6Dqy5XO6gmIOcsybA2n0EZEcIMqtBIxo1koU1CKXQNE6oeBNyrQt2JodAqgW93BoP+jL6I
	u7Q97tbJ2tIVxd5A4mts7Zo4os5rfurU7xk9j3Wqf2AWx0Gncmm+GfeOpIJlO+ZtS4U9NP99cQ0
	t+vJ1YVQGvzgAiLWyQmNv+vOSjMQsus4mhysk0OhnFh042iOSixfVYmjm9gyQ9TDQyDC5W+1qT/
	/Yr+vidWOMiFyPjidX5bjBex+Z3Q52PzXmOGgfDEQQTouKwHsNxA3meDtpU3+eS7h6mvtEW2axN
	YvcMn+KGEhiOJe8bPzGByOQy9J4IhyFjJZWDniseJ+iAuql2gELPZSXsvUJM11r10TEaZV1oG6k
	h27QQvWfLbqxwU/wsd6yEtcbS29cuEFucVzo9Q=
X-Received: by 2002:a05:6870:4589:b0:448:89e3:4c58 with SMTP id 586e51a60fabf-463514dfc38mr16883387fac.18.1787438246236;
        Sat, 22 Aug 2026 15:37:26 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e0ca:316a:4629:d835? ([2600:8803:e7e4:500:e0ca:316a:4629:d835])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4638354650dsm2255165fac.16.2026.08.22.15.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 15:37:24 -0700 (PDT)
Message-ID: <c34ed727-9ece-48f4-a7b7-45b0f5f558e3@baylibre.com>
Date: Sat, 22 Aug 2026 17:37:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: iio: dac: ad5504: add output-range
 and missing gpios
To: Taha Ed-Dafili <0rayn.dev@gmail.com>
Cc: Michael.Hennerich@analog.com, andy@kernel.org, conor+dt@kernel.org,
 conor.dooley@microchip.com, devicetree@vger.kernel.org, jic23@kernel.org,
 krzk+dt@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@analog.com, nuno.sa@analog.com,
 robh@kernel.org, skhan@linuxfoundation.org
References: <f35aea7d-0844-426e-ac81-d5b156b60e4a@baylibre.com>
 <20260822193621.18800-1-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260822193621.18800-1-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 2:36 PM, Taha Ed-Dafili wrote:
>> This is one that is starting to emerging as a common name, so I would
>> call it clear-gpios instead to match the same name on chips with a
>> similar function.
> 
> Worth noting Nuno asked for the opposite in v2 review, specifically
> to match the datasheet's /CLR pin name:

Normally I advocate for matching the pin name too. But there are some common
things like reset-gpios where we try to always use the same name. This clear
input seems to be one of those common things.

> 
> https://lore.kernel.org/linux-iio/a79296dc96215a579c29c5c9eda464f818f050d6.camel@gmail.com/
> 
> Let me know which name you'd prefer given that context, and I'll
> update it in v7.
> 
> Best Regards,
> Taha Ed-Dafili


There is only one binding currently with clr-gpios (adi,ltc2688).

And only one with clear-gpios (adi,ad5791). Plus at least two more coming
soon [1] [2].

In [3], there is a /CLR pin, but we called it reset-gpios because it also
resets the control registers.

I didn't re-check the datasheets on all of these, but hopefully we are being
consistent.

[1]: https://lore.kernel.org/linux-iio/20260820-ad5529r-driver-v9-2-ba62e0b2a816@analog.com/
[2]: https://lore.kernel.org/linux-iio/20260802-dac8163-work-v3-1-3ecc7bc66d0d@gmx.net/
[3]: https://lore.kernel.org/linux-iio/20240714133000.5866-5-kimseer.paller@analog.com/



