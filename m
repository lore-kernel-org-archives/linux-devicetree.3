Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233E3CFF6F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496241; cv=none; b=YE8jEuc0mfd020Aph9vU+3GqCRWivAxAGikhwy+WIRJfJrwXu9CTBbDRYQnyp5V2SRMZET3dHC9kFAsEaDRtN1c67gWxpaG8fa8/fuvpwUndej76qQf2NDKwyUUi9Qsczhnc+TfbsofJXhQRePlW+ctHhyNImrux+zh9go5f4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496241; c=relaxed/simple;
	bh=RhdInbOmWtiuTXxtdNvqUyqvKPi/PSddY1cRe09C2X4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FllX97VirbE0bWzxHnrDUVwJRAImMcsG657kcbIDb8ZUktwPWJ23NXAFnTP4pdaiajL9Y4FDjtOKgJOFxtKL6TgIUPARHPP7HRujh67leyhfwPvRYqHN0Y4oi7pMtNknoHWc5uRPs6/ijzB3BPFhtY7ZzHon1UzfCLBiw5uGB8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxS/jSOD; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxS/jSOD"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3937014be0cso37201051fa.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496238; x=1779101038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9ClfHjcGORkb1ZqNXsd9yYJQtHroStE/CQmUs64xX8=;
        b=sxS/jSOD8iqjjzGYaQwEvTEzsymSTU0UWFZvsd94lecG4qScqOZPcF5XKlMdNgucyh
         S4RT0JBmcVP0Of4qn6bWLScRi4Sv8WEzjymp19uNohdpOq7c94Q7WlIVTDKlUf5Z2MaH
         87/2rbn3ujPKL1aImPpoKe8R6gj6GOr19ieC/yXUruxF8c9o3hiKlp/sKDgc7fhXoOzj
         BIUET1q7oG1owPo+Y8kX7pmCn2ASE19o//24VoOCIpjF42WEoVuorjn5xXINChNcu4aa
         6eo6kd/CApGViG+uEunBuGWUJ2b//6v8XriL6z5/DVp2qCA67hdP7Iv76fZHGpnYl7yp
         nHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496238; x=1779101038;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9ClfHjcGORkb1ZqNXsd9yYJQtHroStE/CQmUs64xX8=;
        b=bu0a+jVhHHkuGSKRlBGy6patWTTy9BJcusfMbW1ULHDTlznupHN27srOcyCJjLKz8x
         17C3U3xGg4TzMXZL+IK3Rt3mhZVlgZLoRq/dRRLf7j5WrT7YnIAYgYUX2yllMcT8b+/v
         m/NN9qaQUajmFDAMbVQM4WT5p+4u23Lr3nOW7tDX1OamYyzaXE4Co3mvEJe/S5fvDiok
         F+/bGu0Rc6iEBldIWTN025do8xuwjzArJ+oU8dp6w6I8uAVS0e5HFDvh0qi+CUM2l22q
         l1xlNvJKzrktQ2VJH2HIvZB6Sx2DWNZ7TAPv8UE7Q175xMHfmBifMevb7cJJOWE1p/Kv
         I3Qw==
X-Forwarded-Encrypted: i=1; AFNElJ9JsiC772siBDowxEtsdslogVsnfH4TaPvikmr9p337dLkIa+LeakzJWtlFqQWD6UPe8phnJGZxl4Uf@vger.kernel.org
X-Gm-Message-State: AOJu0YwQp52xXiwloPu5NCAHF5qGbTsDZ/xQ8dq9b2yMlPqw7P++CPCB
	c1djdeRPuPGHkoZcRg5fMwTPmPP2lu0HgBFim8T2jkqMgw+g+C4O8w/t
X-Gm-Gg: Acq92OFxKW47wTVf8GeMIhcs/U3aZnkc/e+ts7kym2MhTdyzCacj7xIm+4UgvxwDvo1
	22P+XOm7oLt6IYFcvWJxM3W5t/P2s+K/tYKBenzWgXCA0okVMwJ8eMmoi3p+IMMPFYpuusRruUi
	rr8HO/w56hSboS7r8rGek6qmQ96lh4kUMpAgJSnfCVnv4qOemZDcZ7p1ymVDzIv2AWPVmC1xu9u
	ov1WW2En8//M4lFsf0w6chyRpKTKZYRUYy3QcgPznYCUYRC+E0MKuV8LtwJEcSMgo2H2FGBwIiC
	LUYLQOJjdHwDUxw5U01isLaXdTk8jZQXF8zr+2O4IZR1psA5nq4aZNcqv4hW3sSQDDunc7RegiC
	5HRh/SqpjnMaFEPOx4uqPyg6EBVVokKj8+Ouer4zyB+dPRLHVmNNIJIKoFeDRjTVywDWu9tSw1a
	NgHE1d3w/TiBpXs6pBqRxftD0DRfDj7loxNi1s0SchNQeLPtteQzZbwMKNiNHlcwqcpAZeVPrWy
	nno+7pNWhxTeRvy33k=
X-Received: by 2002:a05:6512:15a0:b0:5a3:d375:f587 with SMTP id 2adb3069b0e04-5a8a94c8226mr4904025e87.35.1778496237829;
        Mon, 11 May 2026 03:43:57 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951cfb4sm2546655e87.20.2026.05.11.03.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:43:57 -0700 (PDT)
Message-ID: <00855a46-20f9-4b4c-8bec-bb64d9d8efe6@gmail.com>
Date: Mon, 11 May 2026 13:43:56 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: Add ROHM BH1730FVC binding
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Alexandre Hamamdjian <azkali.limited@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, CTCaer <ctcaer@gmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-bh1730-v1-0-e0df1f499135@gmail.com>
 <20260511-bh1730-v1-1-e0df1f499135@gmail.com>
 <92e2d1ab-c973-45a2-b0c4-d7c672c610e0@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
In-Reply-To: <92e2d1ab-c973-45a2-b0c4-d7c672c610e0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/05/2026 11:22, Matti Vaittinen wrote:
> Thanks for patches Alexandre!
> 
> It's nice to see these upstreamed :)
> 
> On 10/05/2026 21:09, Alexandre Hamamdjian wrote:
>> From: CTCaer <ctcaer@gmail.com>
>>
>> Add a YAML binding for the ROHM BH1730FVC ambient light sensor.
>> Documents the required compatible string, the als-vdd/als-vid
>> regulators, and the rohm,integration-cycle, rohm,lux-multiplier,
>> rohm,opt-win-coeff and rohm,gain-coeff calibration properties
>> consumed by the driver.

// snip

>> +  rohm,opt-win-coeff:
>> +    description:
>> +      Optical-window calibration coefficients. Specified as a flat 
>> list of
>> +      triplets <rc cv ci>, one triplet per window region, where rc is 
>> the
>> +      visible/IR ratio cutoff and cv/ci are the visible and IR weighting
>> +      factors used in that region.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    items:
>> +      minItems: 3
>> +      maxItems: 3
> 
> I am not sure if I read the driver patch (2/2) correctly, but if I did, 
> then these coefficients are used to compute Luxes out of the raw sensor 
> data. I believe it would help anyone integrating (or investigating) this 
> sensor, if you added the actual formula here as a comment. If I read 
> this right, the formula is _somehting_ like:
> 
> 
> Lx = (cv[win] * ch0_data - ci[win] * ch1_data) / gain / int_time
> 
> Here the cv[win] and ci[win] are selected from the opt-win-coeff -table, 
> depending on the measured ch1_data/ch0_data ratio, right?

One thing came to my mind. This 'window' -approach for lux calculation 
is not too unique. For example the rohm-bu27034.c uses similar approach.

The thing is that some of the sensors have more than 2 channels. (For 
example, the first version of BU27034 did. [That was BU27034NUC, which 
got cancelled when BU27034_A_NUC emerged]). These ICs may still may use 
similar approach of having light regions, determined by ratio of (2) 
channels. BUT, they may then have more than 2 coefficients / window.

So, maybe this could be made generic enough so it could be re-used for 
such devices if needed? I am not sure if other manufacturers but ROHM 
does this in Lux computations - if yes, then it might be worth making 
this more generic and not just a ROHM property? Maybe Jonathan has some 
insight on other Lux computations.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
