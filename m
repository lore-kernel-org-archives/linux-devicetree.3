Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587F7340283
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280869; cv=none; b=dEivj48YYhDuNb8p6i6LdqLTJ5R+z3CfXzpuHNYV75VRn2W2dlLaE9QSllu5tdFitkJXzzwAhn75b9H4BXIwwM+R+lw1wEnSzLAAcEI2Jnv548+xPEnqSJSgPGKz3YSQ0Jk1Ps+mYwMLSOC8A6h6uLwyLKwxfZMVgyJmfHGvChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280869; c=relaxed/simple;
	bh=iBJgYumyLmZ06Ll91fzabhgMTbaPApdwNrYiKE3VKu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoG0xL+1eL4UzUtJQ2yBNoS9gWYcvmGAvCsHjlim9IyfMq+y5uolsMjm0PijV+bgCj+9haQ1pK+ib1xh7N4SeGMMVFyZCEEDZrduKsMNF0S5rWjuzjDIZoyCfnRx89qU0tGqvxyCKP9LKDc+x+3RDy0d6AUvfdIboGGfmbmA3Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bnSv28Ta; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bnSv28Ta"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-69d7aa0ac14so816768eaf.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781280867; x=1781885667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iBJgYumyLmZ06Ll91fzabhgMTbaPApdwNrYiKE3VKu4=;
        b=bnSv28TaqwuZq/QSVGB0kFCIzEOsQA5cCG+wozVc/b/FtQbjJV68FFdIC/xJIgQas6
         CRGXbZhPv4j7zdmUeuRWRfRDl+eyz5DR8HCXe8MrGyKGjBty6Uk+gu/EfgSX34bLn64R
         3tvFdrQJLyvcs9FApapVyVKYYDvbKql2zO2PFUfqHGRsNipm67EgXJJxsc6uw3wPQ2PE
         0kwY4JU7H59X6vwYv7Pb6VAsotqhNRNxOMIte9UWqn0ejeQwUNfzqMfSOMXaZBckVYj/
         s2aweMj8XTFgyNW+rj5cyz6UT0dxAtcAGfFgRYnFWpFPwSkX1bRzahB1sC/+BFfA32QD
         3Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781280867; x=1781885667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBJgYumyLmZ06Ll91fzabhgMTbaPApdwNrYiKE3VKu4=;
        b=gfFUCIdRQamL4AzZuJOB6ia4gZngWMAk/0KlJ1Xy9xXyz+47c3KR7U3eivkM12liKV
         EwPeBMvxKeLbnFyMvR0gXUdbINEsqxKPryDigAK6OIdwfknPWKOdiMAKv09DkMycP175
         BNusgnFb1Uxti6Nd5un/NiXytQvQjKGd7V7sI7p9sX+H0r2Nk2RIEljgdqFhGoZFneAJ
         SSY7qck8VdhCoN8g1GYN0qNZesvE5w6dqIJMIuKWh/OftX288k8YILdQtuiToYXOBNZE
         iMQLQpJ9jIs2rMSzX7DKTQ1jpCyrkKRETGzUyDdv2IPtd0ECVHaR4V3nR4rMFpYIThix
         Q8sg==
X-Forwarded-Encrypted: i=1; AFNElJ8T1a2vZTtnovFcPee2IKPsEDAEPqPIi6I3h+8NaRbDaLQYrwQCvUvWyFVssXaRL/zvvq6FuFp0hEvf@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMo2HbHw8RZ5ZqTsNi4a/stSOpYK2KUKP3mwih7ioQ1A/NGRe
	/1Zq9B5gcsxGuz8OsVHngAG6d3F2BGfMX6hAATC+Af0ToecGXVubnXeJzAj2HJNcWDo=
X-Gm-Gg: Acq92OH2DHZ5rNA4yT8jVaRPZ19iT/na4vVTShlMUYYeXxCLSD/li35H7Spz7zMRCKY
	gRH12MDzRHbDURirXXYshNiQzGjcWGw0yrDsXPBf8dgWGB5/VpdAgF0Rs0ytgsFDAd5SLjeGTOI
	sHpM+zvIHoT8OpJUXmMSL1ElpGGTNJqgszX+rXi+gMQXcnIunbSRD+BQ0s7CpTYbZTR3wMcoSiD
	ZyY0LlsS7hIzumIC3hIpfSd3/CkxIBzjc3XSgb2zk9Gx5vvfU9T21Dq9bt+t5eotvWZR66BCRGS
	Qjx0FIVhY4xFMueNMRWeH27/OWvL6HpBcH8mdHBg6Jxp7tR4ofrdugA0kjBbUVtjpPRU0W3JjKA
	56Om2ZVBG35DAAMenH5ajiVkS/En61gAnWOCGGRUEp7KsSwBdzG6yJf0HDLaNxtKJ6i7lPj902Q
	Xza+f+li5OOiFIZhQyj1deP9AG51ltY743POiHjNB97A4UpjJTSIzXCcNM6hRABTrjGWiVvJY=
X-Received: by 2002:a05:6820:1992:b0:69d:81ec:1a61 with SMTP id 006d021491bc7-69edc76c613mr2675655eaf.46.1781280867362;
        Fri, 12 Jun 2026 09:14:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:cba0:23d4:353:6048? ([2600:8803:e7e4:500:cba0:23d4:353:6048])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4426b30ee99sm2065001fac.15.2026.06.12.09.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 09:14:26 -0700 (PDT)
Message-ID: <5beef321-021b-4432-b24b-f473661a41a2@baylibre.com>
Date: Fri, 12 Jun 2026 11:14:26 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: Add TI ADS1220 driver
To: Nguyen Minh Tien <zizuzacker@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260610151342.44274-1-zizuzacker@gmail.com>
 <20260610151342.44274-3-zizuzacker@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260610151342.44274-3-zizuzacker@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/26 10:13 AM, Nguyen Minh Tien wrote:
> Add an IIO driver for the Texas Instruments ADS1220 24-bit delta-sigma
> SPI ADC. The driver supports single-ended and differential voltage
> channels described as device-tree child nodes, per-channel programmable
> gain (exposed through scale) and data rate (exposed through sampling
> frequency), the internal 2.048V reference, an external reference via a
> regulator, or the analog supply (AVDD) as a ratiometric reference,
> single-shot conversions and a DRDY-interrupt-driven triggered buffer.
> Conversions are gated either on the DRDY interrupt or, when no interrupt
> is wired, on a data-rate-derived delay. Runtime PM powers the device down
> between conversions.

As I mentioned in the DT binding review, I have a driver for ADS122C14
that I should be able to send to the mailing list next week. ADS1220
looks like a simpler version of that but shares many of the same features.

So I would suggest to check that out when I send it and see if we can
share the driver.

