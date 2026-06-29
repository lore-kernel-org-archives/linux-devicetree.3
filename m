Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989EB3E8C59
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744873; cv=none; b=VBJw0ezYIwOTkPx7B32aSu/Qm+0PkeYtp0tVzy5t7SWqEy/g2xl2B8zLMWneohMu7cfKD1dVVHXk9UBRVS5ixlNCBV/it9ipAnerqQC6zKsdIU0ti0nnTO/xZM/pdyoJuj9mXOXAhE80fdz3yLrFc3k8TrQTBE0n6c5CfKi7jpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744873; c=relaxed/simple;
	bh=v8CIyeLb1wkX+wqVPNxYQnc2a8miRec7mlz6SuvIKW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XvVyWJpAHvPPE43lTdFZEbhiGTIUu5IHeGfV6NQjNnkKWlVk3kmDMFQ8qXGH/T4luynRU9miOHpo1QXOD9o8qCoHLbkvDryLrPqlZZHa8vVJ/pXUAXy/bk+jwsgjYTbRQqda6OFNERQcL8hZqgTE2IDsL6jQkUgsQ41mw76AJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Gb6cUZ+M; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Gb6cUZ+M"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a0c7c4f55fso2542708eaf.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782744869; x=1783349669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z8Fz1fRVkTQIb2KN3JUG08EPIq1mQm84WayplzduZo=;
        b=Gb6cUZ+M9gtsVEyfnuz8i+HOjiNJOqHJjhwLfazTdEdCh7Hhdp8aLRxgJHHFHXkj06
         3Cs5wSFyNqGfDDq3/o4Hh1mjIkYN107xhn800h72ZrkQ5JWpfeVVNo3OXGVQYV+TrPqE
         49TIpK7j2TDEKBk7wtwtjOk2OgSLOdbHop8+jX+pGWWsTscQybbeGEP4DuH/wfxlks4i
         FMzEMbBsS3mYSzeHOFp0C9dd+4xmBYqAy3L2LNj0Nc8kdbsQdWGGKMywJMUFjjxQ+1tj
         kq9HEDKdirAUFOOZKjABl2W66HYZBaSJoKiMJdYI4CZEeSv0md+R8G5rQEzcIVjbVpIS
         j5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744869; x=1783349669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z8Fz1fRVkTQIb2KN3JUG08EPIq1mQm84WayplzduZo=;
        b=YyhwkCNShcVUsIxHWdk0cyn74lTCW/pCe3hnB9TmbFs3CR9nytSUO40NX2a1K15P+m
         hnx2oEHkpJiO6vH6bmWaNQRp2VGGDxLLb/BdG4VVopRbJ3k6LQQvoxeUPWnUbVhYyyZJ
         lbONLG1UgtEXxfG9/7Oad2SMeq6dAdL2Woe5fQEisYIe7Gcho8Ve0m6J7n2UThJ7p9/N
         mJhSJda2pq0Cv7Y7t9ECDGb35gUiTDQZD1GfwIJO9Bamd74vOjCGykH9BhRb4AVZwhxZ
         GK+LlObKZIeBuAjCfe9g1fJdbqYXpLmwwiOECF2TJl5o1aqnNSFRv1knQ/ei3TjDpFVG
         aAwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TuG+giV+vmWTloS9y/KmKBN80VLAy43bfFS0K1S1Hq95B+rjq95m/u/9VGebS/weob2h4UnRnciwb@vger.kernel.org
X-Gm-Message-State: AOJu0YxXet8tkViwUOvSvbscGY7uoCduOj8GHeyWH+LUC7d7F9fslKta
	OQBswLB9omucl/iBjjW8JD5Q+RisOuCPYbF11UuQgWSyHoFVpPE/yFsD9XGeq3CTUqo=
X-Gm-Gg: AfdE7cmdyvyMybJtuhQSWCNrLsB3M97N2X+4//vWhTBeWTaFSpbtpdRajFM6PkraEGp
	VopbzcnIshgG1n3+8+TqFEe84KA2DdSktOp3u1/05uRvwEfUKkQvA/XWclLnLRqYer1rl5Twlw+
	VmBJdgOvO7PEWqeA9W3FrGmV9jA8i7MfY0nR5fxZPhvbw3u8TPZZBdP9HYv16uxfOgRPlSJK3sE
	RcXYU/DejZJUsd/x1ZFcbk0wP/oAPH856cSsk69eP5iSF6MB1lUkhJGndfKgS9929eluGkF4PSu
	XC50HCqgobe83jN2h3JckBNhH0CWLuMJq3S49gT/g0NnvudMKURz+w3WjguTo0QMwf3VmxjV/eu
	gVm3qNePj4glWsyL2i4iDYDv5WFlc2TXPojEdpGxLqSqKCMt4kt1WQ5Jy6bWoYjQZmcuYQsPxr1
	5+DKXXSNXQHzwNXU/cSCOrDq3WR/E7I1a9xlvuZsH1PppG/l2tQfvbxwnE1HBB7aI=
X-Received: by 2002:a05:6820:708d:20b0:69d:f864:d35b with SMTP id 006d021491bc7-6a1890a067dmr11074eaf.23.1782744869202;
        Mon, 29 Jun 2026 07:54:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db51ef14sm36094fac.0.2026.06.29.07.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:54:28 -0700 (PDT)
Message-ID: <06ce8972-55f6-4114-a3c5-1d3bd6f45d73@baylibre.com>
Date: Mon, 29 Jun 2026 09:54:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
To: Petar Stepanovic <pstepanovic@axiado.com>, Akhila Kavi
 <akavi@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
 <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
 <6770a7af-06cc-4240-9b20-c299e7080ab1@baylibre.com>
 <b06005e0-b7bc-4967-ac7b-cb170219f131@axiado.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b06005e0-b7bc-4967-ac7b-cb170219f131@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/26 9:33 PM, Petar Stepanovic wrote:
> 
> On 6/28/2026 1:07 AM, David Lechner wrote:

...

>>> +};
>>> +
>>> +static void axiado_saradc_disable(void *data)
>>> +{
>>> +     struct axiado_saradc *info = data;
>>> +
>>> +     writel(AX_SARADC_GLOBAL_CTRL_PD, info->regs + AX_SARADC_GLOBAL_CTRL_REG);
>> People usual make read and write wrappers or use regmap to avoid having
>> to write `info->regs + AX_SARADC_GLOBAL_CTRL_REG` so many times.
> 
> My understanding is that simple read/write wrappers are not always
> preferred unless they provide additional value. Would switching the
> driver to regmap be acceptable here to avoid repeating the base address
> calculation?
> 
Yes, regmap is always nice because it brings a lot of extra features
for free.
