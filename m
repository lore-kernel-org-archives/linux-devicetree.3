Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A562EC54A
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775482769; cv=none; b=EkoCgo4PkEPoQbRfifk0g+fWzFWiFWXZK05I8dKDcgMsnbX5uCUr8jclP9gp2TAsN7Ru+yqDlgSM+Bo7rQqSetU+pfNK9BLdxX9NkqYioqfM1F4VBABBC8J244aazJtLXtU4dO3y0aPhwhWc1xsGQ//pADNZ+Tpa8G4vMRSdiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775482769; c=relaxed/simple;
	bh=wkrJeNFWF2uMlRZnWrjqBwY2c14k9cP+d6D7rKAU8LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzLYKg+IlTdVEfUBerpDrmGRCXpfMWYExO6zYf3aWPwymC894+QhJJjEz3uz0PSCELDNZbG3yej4r0DnQWFINyEfgs8sYc4xCSx/A/r0eDeoidF9TB0F9pc6/+xEl9V6UKmIZcFpWV5sX25PccIGT3OH921kCJP5lax0Vdjgkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=aD3K9pC7; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="aD3K9pC7"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d86eb7c854so2014246a34.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775482766; x=1776087566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lorUh8imlkbzF1MrlVYRw6zvFFtCWMp5F11QdFDe9Y=;
        b=aD3K9pC7+rTAKV/iXTsVgBDse/4vpMthyb/KDFQgV63WpPiEnmyCldJO5vJ628jicF
         3WKrk3tArUltkrCCMjwlyCILDZxdyRHEIJ1T2R28pEXs6+LTU/GnaJELtrizwWZZlU9Q
         SPjLyu7ddgigIsKfds4wcIwDshAvMZFoXlB9Urc3Qk2y4frxfSFyr92qGtcLVNP6wys8
         WV2s5v29oBCfykNFmTDjLmofeNxwjXw2EXyIgbdndHEJEGyi09kbjg3YJIFqvHmjQVMM
         n1zRdgVrZ+OfNAUsCIOpTnHDzH0oFKV7rNwnicJ4rqISh3FcUtjWRPRy3u+meSjWUQeI
         Mstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775482766; x=1776087566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lorUh8imlkbzF1MrlVYRw6zvFFtCWMp5F11QdFDe9Y=;
        b=k2iqyVuhArUHYxodR4bGEwdBP9H2wxnjjv5RY7QJcCvxzEiKCKoKUtOwHGiVQtQDX8
         t6o/GoeNSuISKa+iHCgsKnMDtNGcW5CqZZvawPxXNkqioflyQC8+hIFs/vG3dbp2dQqS
         LQHdiguq6AI2sRoKujj0/cI3YvptUOdQCxaC77tKsLJlZBN9IaGPUe1ILcAjNwV3mmX8
         Qolw2RHzTPHNLaAuI98rbNXFVRcuLl63PsXxtInxC5Mrctt5H78y9DVONUoWZe9DRLXP
         RPfNmNN7dppr6UTLA2xXwnJFAe9gXZqSRMpUzJihJPPB8OuXMzv13xV6AYDo+zKce33v
         1DWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMVfDOhKZQzPqLj2CoZvOxILWCQn3rb68VFpuNPjO8gndRwYA84S2w+lq3aMiSS+FazTBOdhuo5Np6@vger.kernel.org
X-Gm-Message-State: AOJu0YyCTFhLMdZyis5py4okO+1mTQwZCvj+5x/AqmtKjhWyPHfQroi+
	X4r948/m+mj4PvW9nGFMRuVQ76okwxjIpvhndSYAroDcE3xEZI0OsHGxXspoZs4g1lA=
X-Gm-Gg: AeBDievd86I7ea0EFYGSeO9BmsYXaBmvjQLEue3tkAJ8Pn8Peq1PKjbtaoFOZ7AzqcL
	cql5FX4Odh9VhJhqLF1Lgx/xf4VGuxa81p2wb7q3AXXU/qSdFZLkj+6CpF/TZnVYeC966EVvIow
	wq/Wd8cKjeeDl6yEhPelPD8CR1T79lT8xRXbWUB+U77EjQ13s0drjj5sxafqgqLgVP3RHrrMcxH
	wrWCmSyK17V2Y7ViSw1QcfcXfmIDm4z8jOwc/ENEXJZK9PEyhv2PZTVY+f3Xk26Ta72u4r99rRo
	lznIpDiqoj0ivCn/g0ZTIOAOJrWSpt2sSWMrKgX2SrvN5YLJV15UjQ9lgHyEDE6lpF7en+fl11D
	2DAGloPkDXwWRKzMVXL33BGwVkbgSg2IEeeZ+OPm5QHDj3FZd9bxTIZWdVQEnSljpLwJtO3UsRR
	nfcPanQ9kUa3tifdKpjvW0a/RoMbmUI561JJuVJ3xQiUITcRzCVdkN62vsiecijtpqYuMcqiQ=
X-Received: by 2002:a05:6830:3783:b0:7d7:b6b2:6352 with SMTP id 46e09a7af769-7dbb6f961eamr7766540a34.13.1775482766251;
        Mon, 06 Apr 2026 06:39:26 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:90d7:b13f:c53:8ca3? ([2600:8803:e7e4:500:90d7:b13f:c53:8ca3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbb7c3a0c8sm7531599a34.12.2026.04.06.06.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 06:39:25 -0700 (PDT)
Message-ID: <18f79a5d-2f64-4984-9df0-40234f72646d@baylibre.com>
Date: Mon, 6 Apr 2026 08:39:24 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] iio: adc: ad4691: add triggered buffer support
To: "Sabau, Radu bogdan" <Radu.Sabau@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 "Hennerich, Michael" <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260403-ad4692-multichannel-sar-adc-driver-v6-0-fa2a01a57c4e@analog.com>
 <20260403-ad4692-multichannel-sar-adc-driver-v6-3-fa2a01a57c4e@analog.com>
 <e38e5b97-e90f-4613-a15e-6c3d08cd77f7@baylibre.com>
 <LV9PR03MB84143905DD2E10BAC2151EEFF75DA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <LV9PR03MB84143905DD2E10BAC2151EEFF75DA@LV9PR03MB8414.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/6/26 4:22 AM, Sabau, Radu bogdan wrote:
>> -----Original Message-----
>> From: David Lechner <dlechner@baylibre.com>
>> Sent: Saturday, April 4, 2026 6:12 PM
> 
> ...
> 
>>> +
>>> +/*
>>> + * Valid ACC_DEPTH values where the effective divisor equals the count.
>>> + * From Table 13: ACC_DEPTH = 2^N yields right-shift = N, divisor = 2^N.
>>> + */
>>> +static const int ad4691_oversampling_ratios[] = { 1, 2, 4, 8, 16, 32 };
>>
>> It would be nice to add oversampling in a separate commit as that is a
>> separate feature.
> 
> Do you think this would be suitable after the offload commit?
> 
Yes, I think that would be OK.
