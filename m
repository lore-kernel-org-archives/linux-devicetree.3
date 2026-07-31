Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F0412276
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507792; cv=none; b=ErLcNiSNNv1uIkO2bldM4c6qIUx3M7qWkuYAtE1OXJOPUzZEoCn7/9y4d/imxh+Pi+EjC4MwqzrWT+/wPNlbPmM9teTVghc7MXvcEIv9rLDTnG07WOKDHzjU5BzClVDy98aBnmzsFshDzn1SwoghFeDzPSxTwsxmNhMGoKKTb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507792; c=relaxed/simple;
	bh=7wWRfOgAHNVaTxFv3Orz/thFdJ+yQdiNQGRNQ2UkQIw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HFA8PnFac+u1Rs0f/RPhMT3xZz++Gj/tHMA67KD9A476GMMf7K4GFvQq+c18NzhxkWV8Uz9TozokXt/U+WKrwDGCvoXiP4pJ3QbIr+xOVuILaZxwQKaIvgPvYTJlLVVVrI/9CusXfsuxMLmlJP3anTT8VRANPR4Q9Bgl8p6rpso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ENvhzYLJ; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ENvhzYLJ"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aa9606ddadso691976eaf.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785507790; x=1786112590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OT5kpLMx1NAQDxJj+okIQJAeHFw/yj3RKxDWm0fm7Ys=;
        b=ENvhzYLJIbBAvpyvAKKDUgTilyUnExp8cLnLmFOuuX27cHm/SpZOrT2gd1/BPIHZmG
         z3SCPNvbHqeAlER6iaOzgOhedUISpNhpTW0cK0qwAMqBmeaBYY+/3xItF1VfMwsCZnkv
         nI9e/WNXFai1TY43TalsMNrgEHU62CVPfP6V9dciiFGZQB+X7X3HUuHpzk8QkR06yJvT
         AN9n9xFPMQKfJwdkkvjFbfG2QL20H036GmTyf24XA67j19ayurXV4mUQ8eiazZoiASv4
         Utmn4qc0YwtFKOOebV6SgsTiE0B6QFzF3zG6dwJPpGV737AZNvqd0cWbBYCRBbBrBGt/
         5PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507790; x=1786112590;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OT5kpLMx1NAQDxJj+okIQJAeHFw/yj3RKxDWm0fm7Ys=;
        b=a8b1i4YSM03RuqrEQD1vSp9JukCbP6ssTX5BtcH/kITgTqp0jCLlZmRfuKwemoN8OO
         cw9/J5sD5IzzdT9pBsNp01c30DFOUiBI56OYwPxyd0i2J4f/tjGpauPkedwX1mgD8y+L
         2GO3NTL20zD5X6WBb0dQ8csV5m0n4uTNCV/+jpIaQOfny4AOkjJe7JyVm/16Ey7ioTNC
         o+cGQ4xcado9Gjia6SdPPv3Ipy9CWMdcvdq6xm6Uxx6Ll931DAWxYfqUw3y78coZIK2R
         jUpCdJB9Dzg5km8F/qKseWK3SS8w9byeK7diKUdc/SUYREd+ZTVe+eE4pg/abZxlvFCs
         PDvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjO572VqC+I07yp5gqDWRVqIStxBNY8cHhcEGF65y2tPkYGICY1FbjxAVLUfh4ZsXMoRDf7x03lQZQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9fdl+7Rein4WOOsr3BzX7OkFUS/rUBXmIxzrxy2xeCmVUxSU1
	xda4fZoolBdE22fnf5gniS062hGUD3eMLzfVnXGayliwzOfG4ZhktATeKqCUS91Bty8=
X-Gm-Gg: AR+sD13FeUSdif/j+gBjEaOPFceorZhaNPP/nIsIpomkdFf1U9VhNIUzVfd7E88xNxz
	qyxTVmrfcCja4gplrDRa+PJdFV4n6+HBjkmkqYa78O4qZbHsF3gWNuqc4Wx9fDn1Ed4aAEmMOYo
	vZuCdecNfif43wc+iTVvFCEW5uvhNZpJpQZ2TfzWovKzd8NbCima+VJJ7xWTqfOrE40nUPr0tkq
	js3bzAD7RfKKvmfDdjoAWlj5Z0BYs7imNaLZ2YX9yn8+Jb84P9nngJiFLPtmXCQr0/i/VFPLnAK
	kNiIXfYauYo9CByqZUCiKgS+hJpZkHjJem7+z/GHrzqveYDQBg9j8HmOaM7DOPYmPukqZZsJzt3
	4mwbGISyExOScfIhI39eivJD5Xi/FrpDdqMW99bPYjlP5xO5PAbBUW6kVJjyhnvXZjCyM001UUy
	n8RbjTp+L9F7ZcZNc1nU+Qx+HCJvkluZDkx7BqEAFdQ8/bIxsbWBc4cF54YOo6CTpTKd7QZg4g5
	WQUJHXPwlB+ohpUMvcj1s2gdoRPUQNqUUFPal4=
X-Received: by 2002:a4a:e90d:0:b0:6a1:4af2:f8e4 with SMTP id 006d021491bc7-6ae4339556cmr468939eaf.31.1785507789733;
        Fri, 31 Jul 2026 07:23:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:fa40:746f:401a:3b75? ([2600:8803:e7e4:500:fa40:746f:401a:3b75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c5dfdsm957497eaf.10.2026.07.31.07.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:23:08 -0700 (PDT)
Message-ID: <8860e628-69e6-40de-94fc-4dd9154e23a4@baylibre.com>
Date: Fri, 31 Jul 2026 09:23:07 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
From: David Lechner <dlechner@baylibre.com>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-1-aab0168c3c01@gmail.com>
 <b2297241-e0ae-4058-a406-348440798e38@baylibre.com>
Content-Language: en-US
In-Reply-To: <b2297241-e0ae-4058-a406-348440798e38@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/26 8:52 AM, David Lechner wrote:
> On 7/30/26 9:58 PM, Kyle Hsieh wrote:
>> Add device tree binding documentation for Texas Instruments ADS112C04
>> I2C Analog-to-Digital Converters.
>>
...

>> +
>> +      single-channel:
>> +        maximum: 3
>> +
>> +      diff-channels:
>> +        items:
>> +          maximum: 3
> 
> For this chip, we should also have excitation-channels, excitation-current-nanoamp,
> and reference-sources.

And burn-out-current-nanoamp.

> 
>> +
>> +    oneOf:
>> +      - required: [ single-channel ]
>> +      - required: [ diff-channels ]
>> +

