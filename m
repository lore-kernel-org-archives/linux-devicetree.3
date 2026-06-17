Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88D934DCE0
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 22:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781733871; cv=none; b=CpQWFvWEnRp72aOzg9OGAlGJPRLRvTqJzYs42KYe3iJ6PR4jpyMRG4Y9B8ijMDwNB6XzHgycwq+ycV8xBAoTMuNZrWcVQZwBSaIcXOWS3cuO9ig7yrgyQc3exg4MgTTfgthkykLEoDBTblX0Reh9k2ZLa1nv+Q3QIoXiy55F9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781733871; c=relaxed/simple;
	bh=hoUViAfvoZsdvCJtYfwxPDW+hJ/pqsKtq6bGvWIPTOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgGn66RCxSnUehcLsB1Wv7GO+MR9Rokdj0aLDKGrB0qqUEbMdxddD3jw625O/8vwtLS1+i1CM9zMzii0i+rLvzmm8uR8qwPC4zW1xOr4A8Vy+j4C5KGnt2ShP2MBSlrpsZIHVtygdRQYO5ZsJPQbZTqvWy8GvQqKyQCATg7+vO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ysn+SBqX; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ysn+SBqX"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43bf9548df4so164036fac.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 15:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781733869; x=1782338669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T0LbBI+FU/KDwYzYSVcJiiga5DiPx/zovQTtBWvE53c=;
        b=Ysn+SBqXI9WDcmUjDYpQ108eXB9EZsjleIZlOwCrV3wIQKjSmFs443VTnfxuD62Ql+
         NDlsSMr2TaxLwR5YlF4Pt72HyODQJIN6NLuZq+BJmFtPztLTKUalNh1mFwx3/q3qu9Iv
         FhAUTQbKfUwoUVqTg4Zl326LCP7prLPKHwD+hD16YzxnC+UbO8zveP2SRDK+IVU6iuRW
         /lAp/HXgIbn1qTTJ6ajXMGADh7DLKC/8VmxixG+40ZPfgB8qWl8j880ob9g1bgifAU9H
         F86g8wEhw3G/q2FbT+wwv8hh4PdFfjXDf9H12UEsT19H0+dKiitu9SJVorR83uNg04z+
         a2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781733869; x=1782338669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0LbBI+FU/KDwYzYSVcJiiga5DiPx/zovQTtBWvE53c=;
        b=FBjkmo5TL+zPN6A1PX1ezarjMKd9J5wHpMKDlQevwwMEeAwDLOrehEuNLWe6UZXq+B
         9Mxmu+JRuSvcjoUMLGPqOtJj8ms3e62FbIgHjdtO2XPVRfCC9VfpULSaBIDoSd3qfi9Q
         FISEn6MJV3KkGH7VgSiVTgBeUCo+ewbPzzVT4PIAo1lderAnzQkspsG8wWrkA0jRO43a
         jWVoTxCq1nDEm1aDeONksKQwvCb5w7DHd58DMfBLpqU50PQIsL3dWTHvkRPcLt33zYIU
         HiQPLIIIeO0lDYtNPQby4K877ly1rHil8Wi4qh2KFpra+kUwCkIMH6q8b4v54dJIOAz5
         aSsg==
X-Forwarded-Encrypted: i=1; AFNElJ+bp3Tmy2Ey4nyRFI1Z59sI7C+rFDwNP04pS4uid8e1Oou+W2RqbO6QhUdTj46Q4mL/QFTSqQvkWUIz@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ77G+Y05gl5TqWmXHwulNnFsdFocQpRQ4+9ScbTt38I0JghZK
	HcpANi0P6cs/sPWIv4Ic+393E647Ok+mPqXReS02Ukq8WWhT+ryFELcI3kA6XosGqYs=
X-Gm-Gg: Acq92OGYSw6g1+h29RcOJrcP3a4+sqqQTKEcrOfrIoIA23LTPzWufaX7FLgkId69g8v
	rxtxGO3oINIbaDZ6sQIYjCcBaFfuzeg8e2/6ZokeseiOIwYYQ/dDxk7cxWbr3a2xntLtUe5jJjB
	Rlm5KCO3DMYLhhNDzJAg5xhi1mPbcVn1ZXC926nIXQWaZm3EY56WT5mCA4DPNRY//WzmoF3s186
	8iamu/7NP9OBsJaCXOUNZf6NiGh9+ZrJvXQWSXEqIeDbKKBsz5nCCbNlvkjY++eMfRW5dQGalpw
	tRla7p15QecGtgb2nRsiHNwB4q2hNsKmPgUh3LlPKSIq7RIFXo3nJZyKhRTvEeV70h3Oyd7BG2w
	GU8R3FnTXgpXDSiKVl83sc7YoqPUsMnDhE1YvvhVS/YTQINIxvkfpFvkMN0nyQx+mUUsrZ3k/pJ
	mjpJKbL3N3KrWHjTifXfvxfWRtyZQbzivALkCCMsL/jedl5qr8t7F/ceHfU4RGM74=
X-Received: by 2002:a05:6808:3084:b0:487:4d74:ca6a with SMTP id 5614622812f47-4894467fb82mr5608088b6e.39.1781733868747;
        Wed, 17 Jun 2026 15:04:28 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:9458:d356:778c:22ac? ([2600:8803:e7e4:500:9458:d356:778c:22ac])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dfb2d32sm6991645b6e.15.2026.06.17.15.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 15:04:28 -0700 (PDT)
Message-ID: <76d39d2a-051d-4706-8433-3d3eb97e7f2a@baylibre.com>
Date: Wed, 17 Jun 2026 17:04:27 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: iio: adc: Add ltc2378
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 pop.ioan-daniel@analog.com, marcelo.schmitt1@gmail.com
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <f9e88abdbd23df8039282497a81d3c8698a10665.1781661028.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <f9e88abdbd23df8039282497a81d3c8698a10665.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/26 9:03 PM, Marcelo Schmitt wrote:
> Document how to describe LTC2378-20 and similar ADCs in device tree.
> 

...

> +  vdd-supply:
> +    description: A 2.5V supply that powers the chip (VDD).
> +
> +  ovdd-supply:
> +    description:
> +      A 1.71V to 5.25V supply that sets the logic level for digital interface.
> +
> +  ref-supply:
> +    description:
> +      A 2.5V to 5.1V supply for the reference input (REF).
> +
> +  cnv-gpios:
> +    description:
> +      When provided, this property indicates the GPIO that is connected to the
> +      CNV pin.
> +    maxItems: 1

Missing pwms property for when CNV pin is connected to PWM.

> +
> +  interrupts:
> +    description:
> +      Interrupt for signaling the completion of conversion results. The active
> +      low signal provided on the BUSY pin asserts when ADC conversions finish.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - ovdd-supply
> +  - ref-supply

I only looked at LTC2338-18, but it has a REFIN, which is optional.
Nothing named REF that is required.

