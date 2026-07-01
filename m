Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AF53EDAB6
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782943639; cv=none; b=AqNj1HSWuN41L7TjeFP1ugyj2KSAoLJA5kd0CKq98sUlP3rAjAIewU6Wmrw5YME0pExXQTCW1AKtEmZljgnTbRBlnp0qvMn7jG8T42F/3d7gF1zpNWEb2LBuH5d3OmA9/WfNQmoFtPCzPax3pqdISfZoPIn6wO7DmSPgW+79RH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782943639; c=relaxed/simple;
	bh=CrpNqwYFbROwfChNL5ll5/GzTfwpskYniMG1vJ5UhFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWmlSys9vUFyflbL/UnTQbHh6geAixW0KZaLkuwZV/e3dU8YTFM2SJBe2DLEEUJIEM/3MePPhXhOSCycpTkYK3HhkaAlQDbmhna3u+FFpCQTxJUneS+eAVeGFOxi9uM0Dz3K+ch360SeRHcTleJrmkpEnZaFwLAdPL6Ttq/692o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hfz12u1j; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hfz12u1j"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6a1133217easo456245eaf.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 15:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782943631; x=1783548431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0W+YFg7WrnuWDqmzXv1zo2hy7v44Z4ropHEq/o61SnE=;
        b=hfz12u1juqOIDNEohMBR75n7rMtD5+8ucC7+it9EHFDQLv+DkAERe/OkS64X77GYs5
         kHJ2kg5WmlPCg7LwsblYah6y/MiCGSR0clVllfKP7YRXg74I/71HxLjIrH/9+hiQDq2X
         F5I6zYcMNjYE71gQUqT70CLMdodxZ9QuahduMOLJrwtfgEwnJ7D0K2gjWehSZltKEnMw
         XQhcBQ55cd+xwQrz8kwyzV3TuvjxZ8h011O4q+hBd0teM9Si+tqXVHUGu/edahS7n82x
         sE64ygSNvnEdoRC8Sm65HRaa1f+FF4H7qDn7T2cyE8vWHiw5ehHuz9F/HzIOhk3YVLet
         4iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782943631; x=1783548431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W+YFg7WrnuWDqmzXv1zo2hy7v44Z4ropHEq/o61SnE=;
        b=jP51tGXJmAafFy70S0sVkU6FQzCW2v7CrpADpAk4YZGT7CRcsSe/A+tX1tFNfqG0jy
         X8dElBiVx5YCp09NpmjjitJ8dM0kmGmiSUYt+lu6NVU6fouNoEWQHwDufpnohMJl4Hcc
         DSSPduQSbQoAG4pjqmJtNdWk3ccCyxTAYeV7r/7ow19DLajvIkqUH8sqUHUp6am99evA
         qwxBUXRBV9X1I5xZYnlICTAIUavn/YFGnca1leys1yGezAVwqq2WxjxcrGeHlnwRGdmE
         zqpurERvyA+z0I2ngeSKtoX7fsGv6PIF6Z9HH3FrFFYvg+OoTBCgpQymjdxVKM5wmj/k
         HFrQ==
X-Forwarded-Encrypted: i=1; AFNElJ818xEmz/0/rGKnv9jQwjPlL4z56j1+GK7LoLfSlmk7SL6i3DUEv4Uuz4vdfPVTlhDs26TJWUUCrhht@vger.kernel.org
X-Gm-Message-State: AOJu0YzfG3QW2V6vySvcD1axrw0ErE7HEk7UwoQ3gaDoBYVpykogDsL8
	a7HavYWW211t7ecNJYrv0jJSucp8e7UO9izTyv8KxmOufvNGpqYzCDzEuo7Mocy1udE=
X-Gm-Gg: AfdE7clmC+hQx6o/ZTEbwKykFS2fPqw4fS/KdVPTXRR8ENndzOjFQqWYYC6WNnbSvb/
	+jbCzSJrF3elsKe044PonOiymIXvCpwz3bVNT6IgM9JWBHEkQBrfE4nAR/NsA4YRRpdKq8kAOXN
	mVlFecDj79/8xi3aLBot0kiGuD3kUR3vtMonOw0ldaeZaAifkQcroa229d1006+Hyzcawm8B4yP
	J5mEZwZWyUXrri0LTAgrAa0Xp1e+QLQExxGKQ2tLm0+79byBceEs3RU1nMJdpgOW446/eN6fYPk
	aKV/PDHztY/LYJJ08bGPKmS3/8eIC9ygbqkqg4LpNkw0di9P5KYd0tkO5NsQvXFvbCAEEXWm0JY
	DHHYTTmegf08+XEs0ikw40LFsHhrG7UITaJh51uF21qimqsiu6LVCJlOTKLquRJoufD0Wr8D2KW
	eEs7XwJG1QEv3+eY2mwgMRODPmTOdYV2v47OCiB+kdS5XX6mwwNt50fuwRkXBf
X-Received: by 2002:a05:6820:810:b0:6a1:1978:59f3 with SMTP id 006d021491bc7-6a309a9a8f0mr2133372eaf.28.1782943630851;
        Wed, 01 Jul 2026 15:07:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:d4c1:7681:5df:9500? ([2600:8803:e7e4:500:d4c1:7681:5df:9500])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbe84f609sm1119946fac.1.2026.07.01.15.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 15:07:10 -0700 (PDT)
Message-ID: <fa7c348c-119e-429f-9806-2c76d328695b@baylibre.com>
Date: Wed, 1 Jul 2026 17:07:09 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: iio: adc: Add excitation current
 sources properties
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Nguyen Minh Tien <zizuzacker@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-2-ceb9b0b561cb@baylibre.com>
 <20260701203932.20e688db@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260701203932.20e688db@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/26 2:39 PM, Jonathan Cameron wrote:
> On Thu, 25 Jun 2026 16:55:04 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> From: Kurt Borja <kuurtb@gmail.com>
>>
>> Some ADCs incorporate current sources that provide excitation current to
>> resistive temperature devices (RTDs), thermistors, diodes and other
>> resistive sensors that require constant current biasing.
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
>> ---
>> v2 changes (compared to Kurt's RFC v2):
>> * Make units nanoamps instead of microamps to fit known devices.
>> * Drop bit about allowing single value for multiple channels.
>> * Add bit about semantics of the array index.
>> ---
>>  Documentation/devicetree/bindings/iio/adc/adc.yaml | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> index 12800737d4fb..860601ec5334 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
>> @@ -81,6 +81,26 @@ properties:
>>        ADCs usually allow choosing between internal reference sources or a pair
>>        of external pins.
>>  
>> +  excitation-channels:
> 
> How would this apply if a device provided excitation on pins that didn't correspond
> to channels? i.e. some extra ones.  Perhaps such a device that also supports
> configuration (rather than a static set up) would just need a different binding.
> Feels like I'm creating a corner case we may never see :)
> 
We could have e.g. a ti,current-output flag to say that this
is just a current output channel if we really needed this.
In that case, I think we would use single-channel to specify
the pin and not have excitation-channels or excitation-current-nanoamp.
But as you guessed, this not something we would expect anyone
to actually do with these chips, so we'll leave that out.

