Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BD3DB65D
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839688; cv=none; b=F5VptLqpLELbBnPxzHoj/KopI3z+gDUlC6Y+xO/3j46ZWz8Lu0dO7gLox1X/+jUX7/EigIJ/LpgXNBmBeakWOGEaagA+bMZ4Ud5ZxRlhtW7QcfqXzmyAGEdelWfESHq+iP7c6bpH93OBcVlvng7Xp24X5wuW3rsgvljMjaSUCIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839688; c=relaxed/simple;
	bh=yI4LIb23rfKE/21+3syEgft1Xeo2c0ZRsRWLnRGk4wc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fqaR4YtqO3ZVIV3Gaoe+L4Kpvy+zi7SMGZkqE35zRdXCgYe4NN3xMDXcbYOODvGEJMFN7g5jD0M87MMSNkxDuve4kKwUr1yRs4eiTJqa5CusYRY+H51XQzne/9qckfYs4OCGjqaBUYXT5Sjc0NKHp4BU5KIRUZSWSbEcXihlXlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PR2Nh1tf; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PR2Nh1tf"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso586459241.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839686; x=1783444486; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yj0dzyKkgM+YsTOclkY88VSZr2slrmcvgTQm6yEB8ME=;
        b=PR2Nh1tf9U45X2QPsNMjst7ZwGhxnGXhjDNwcur0Llo8NsqsykiXkUt9lvx0T23OwK
         ymp+6ljMMOa/z/OLuagQ49NrKixAp1JPPYYF1KgCLnGuEf84RaywJNM5CuMKxB8QqcIG
         gUtcYQ5cKwM+1+cP93GVTDGsZs5f59wpf8+Gv3UnlYeJNF2vWqRHedCblxFmhu/4QTWj
         Y3gxg2WE6mShEjrsGVX2cCSGQ59OED6BH9ZJLvOd3bi5Q8xPYQFfFoW3486lXgL7C58Y
         owy4CgGeKhvfItdjkCAQJiy229dmrH2g0TT5k/irjgkwHbtX2aKXf+/+tZ29WJ7Wenp/
         JDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839686; x=1783444486;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yj0dzyKkgM+YsTOclkY88VSZr2slrmcvgTQm6yEB8ME=;
        b=GrCG0TpS07QR9Tohbb3w8AwYSRaVbzOSPtlCRdWaoDLrQS+wihj/K9EJUpE4MzdcQp
         DMACfdRR6gW4mAm/zK9X1F2rVW1cAbOWkyW/PW7lstF/x/nAofvHN5d3uX6zPh99fdn9
         kLjHMuUECp0JcYje9Cw3XnRutYNALxymdGqEjwXPTlgHPdCwlsxKYEp0D3aWSPTZQ7sJ
         TQUMXdDX9wFWoVIX0BnqQtaZTcktmOSxnS8f6SJHIn8RWX96nsqsUhcNmo4Ug/Tz5dmY
         y3pBfHAvbqw0Y4N/LEVvpNGdXDjVX/Gw1MGa1QsL7ULT4vp3zDiPseSRmSQAnAEQJl3O
         /16A==
X-Forwarded-Encrypted: i=1; AHgh+Rr2zn+ghMOsgY4enEeXVnR1CuGsaKVvtsL9pgG1Gk7W0CRR5JlZWL57hNIGhH/HTiyFj9dOTvzo6pXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/eIkN0sNvP0Ux4xQ5fwDJOvbh2xZSC/MjZLjdXd3Yg0x9h+9N
	H7rI3F1Zpp00BjoTFlnCHJ/nCGh0tEdWSGX9QqMKi7aBPkbHBqdzlVaO
X-Gm-Gg: AfdE7cnZnGZVMmI5YsbRnOtegr6Qx40XzN4ank1qgKX2gALWLtFr3tvEor8lmpKhEpL
	PxbsTCqGxpEqxtB8sSIPBdwqSk6d4W2WqkO7X2psQQErTVxXBRFFUx5594wJrCv2Y2v6qiJj9DB
	Kz5ROovwdRgxTN+RGLPfN0Ody4wjrh+Lw367jEiKUv+naBYuZmt/1XcRPTomjVbrfd8PsH+IUbR
	I8rDPZq16piAkqkoPQDlpbwyOXVID0OSdxWH2aTHvq5I62QVceqi05F4o0cBkY7N57+CnyhSmQr
	RzWU02/mv9GkeLps6U0zBgwtx+rcfkHh0hjDOOh7C4wx0B6tkIGB7ZbymqxyFeescU7qeBwoVU0
	Hcw0qWoHvYMntFDnwWLYOsidBgW1qhpUelvMkUZN5sdVeqoFcXN8NEQowe1KdXOWxaB4AbhRXSj
	TBXjY=
X-Received: by 2002:a05:6122:4b11:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5bdbed0ba9dmr1958656e0c.7.1782839686037;
        Tue, 30 Jun 2026 10:14:46 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc184957csm1836979e0c.2.2026.06.30.10.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 10:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 12:14:38 -0500
Message-Id: <DJMJX5FGSZ9X.1GQK24K6CI60X@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: iio: adc: Add TI ADS126x ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-1-4b1b231325ba@gmail.com>
 <946a30c9-01e9-42f1-bd2b-b7934fda85cf@baylibre.com>
 <DJKX600ONL4O.1YUTCD1L9FU8F@gmail.com>
 <a16f61fb-4e98-4c30-8d4f-da084e27ebeb@baylibre.com>
 <DJLOAISPZLG7.VZYX8B16QU4K@gmail.com>
 <22e1e1c2-659c-4991-857c-b38d66769c7e@baylibre.com>
In-Reply-To: <22e1e1c2-659c-4991-857c-b38d66769c7e@baylibre.com>

On Mon Jun 29, 2026 at 11:43 AM -05, David Lechner wrote:
> On 6/29/26 11:27 AM, Kurt Borja wrote:
>> On Mon Jun 29, 2026 at 9:21 AM -05, David Lechner wrote:
>>> On 6/28/26 2:12 PM, Kurt Borja wrote:
>>>> On Sun Jun 28, 2026 at 10:45 AM -05, David Lechner wrote:
>>>>> On 6/28/26 12:36 AM, Kurt Borja wrote:
>>>>>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with =
an
>>>>>> integrated PGA, internal reference, excitation and burn-out current
>>>>>> sources for sensor biasing and diagnostics. The ADS1263 adds a secon=
d,
>>>>>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>>>>>
>>>
>>> ...
>>>
>>>>>> +
>>>>>> +patternProperties:
>>>>>> +  "^channel@[0-9]+$":
>>>>>> +    $ref: /schemas/iio/adc/adc.yaml#
>>>>>> +    unevaluatedProperties: false
>>>>>> +
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        maxItems: 1
>>>>>> +
>>>>>
>>>>> If we want to allow single-ended/pseudo-differential inputs, then we =
should
>>>>> also allow single-channel (positive pin) and common-mode-channel (neg=
ative
>>>>> pin) properties.
>>>>>
>>>>> This will also require additional common-mode-<N>-supply properties t=
o allow
>>>>> for the negative pin connected to something other than GND.
>>>>
>>>> Ah interesting. Why the N though? wouldn't a single supply connected t=
o
>>>> AINCOM be enough here?
>>>
>>> In theory, any AINx could be a common mode input by connecting it to
>>> a constant voltage supply.
>>=20
>> Technically yes, but there is a pin named AINCOM intended for this
>> purpose. Can we do a simplification here? I propose having
>>=20
>>   common-mode-channel:
>>     /* AINCOM pin */
>>     const: 10
>>=20
>> That way we would only need one common-mode-supply. Would that be okay?
>>=20
>
> Ideally, we shouldn't limit how the chip can be wired up in the devicetre=
e
> bindings. It doesn't mean that we have to implement everything in the dri=
ver
> though.

Makes sense.

I just have a doubt: In the ADS112c14 bindings, is there a specific
reason why you didn't describe common-mode-<N>-supply?

--=20
Thanks,
 ~ Kurt
