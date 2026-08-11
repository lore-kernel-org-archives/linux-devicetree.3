Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80048401A37
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480264; cv=none; b=M/xj3NnOyfr3hJwDqNEo90EarQb/k5Jef6HBm474sSdKF31J3HXD4c8wpg4+y/VDRVLQ63TXdNUkV77VeMd8++TwYhoerAHm+YTbe759ri7jOX1eTfBnufl6dCVBJwy3cm75EcC97UIZ55LoPyxX91AxC3ySEp/KDiao/kaOHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480264; c=relaxed/simple;
	bh=nP2BkfFJnQphu11QYPQKd8H0vAxIMGGhnW6vlhSokZw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UFgbDqqzagnNgkYDktTRGayf1c1dObMATaifUzPhD0uWTIHcrKW8Ua1qo8vMrJyUkKxCMPl/UbPjzOrnul2YdbmPFlabUi6YwP5QYnNzJ6X1Yvm8UBww0eyIurkqmCVraJheKjwSYDUu08TW6ZmNaLNL5zalWAniNhw/MCTOrA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppOZ4+ez; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppOZ4+ez"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c4105393feso158819e0c.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786480261; x=1787085061; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cXXshufKt38Q+I8OQnjAW1gFfz5ltvbPboX96YRZjHs=;
        b=ppOZ4+ezv8zYB6JiRMqvqWOlqCFw4rbvosI2qQVQOpgjl3ox0zo2YB40FIAS6U7GEM
         2TLz/GsESYDi1WCpye6zgTdRsfAUsUvf13eE/BdoJAxOaELeFJNA4nyndj5dEU8d+oL3
         DxhCG5cGBTSaCY3eAcFZ7xIMCysoPd94SsgUXIqCP7ZiIxSX8S9w2M2/i5vXoZLficR3
         iLSA8lPPYFRE3rxlz5gFnEZYb9ielVEI9s3CyrBk7PCma3Ud/eCsLiqyYilWAWd4Nu0o
         puV3gi27Te3MqDD6DeSLMasIGH8G0Xd3fERIzPxiIJ0DOcfPc6DXbTfoiyZg/Cb0OSIF
         Whqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480261; x=1787085061;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXXshufKt38Q+I8OQnjAW1gFfz5ltvbPboX96YRZjHs=;
        b=lfNskIMrAcGgsD0722D+QdkwsA6lNbQ1ssKI8+rZF5hL/esD4XPc9QXtDohTGSg0oX
         Mt85QWsr83BK4Z33agrA/TZfmSJZ716vB7cE5JeFtnyWDMqEVNi2NCCa02TKUPbwQ8Wd
         GksX55JMguDPlDm+ywXYF4ok04pGRTZs5j0JmZQ+m1KGSKzCe2qGZM8byxotjiT3O2FI
         emFBzBIZiSUrEc/T6MtcgW2no89Uo6cdop9uSSdJMenJY948kplT/VvPkOWggWavGhIn
         o7/g6kUrBX659oaKcJO/xG6RkplYUfY6DRb2FxtbtcVXbB33dhpBCSmN15EeG1/9XMkw
         9k/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrDefjPLHU1MNaoOabK3gHsVs/OaA7cLa+r2aoWLlBDpaQAU/gLU0iezwhodcRmKqoam/Ov/oNYoaN2@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCI5J80iCqJ4ZV5mBCRZCwR2sfzHJOfDwuDFJZmv+C8ecIVfo
	6/UGFVHSiCswvgXD5lDb5lpJ9R/CKIzWP5MYpHorvAED5zYyi/zVgoNw
X-Gm-Gg: AR+sD12cl7NQpOO6zg02++uubUqi6Jf7PTRuyj1NxKdTr5cH6AoCvmbKYvlwNYHdwuv
	2obkKAgzoWSURAj0MclqEwWsJhcRPd5ODLO8DzxfafnVyKHZgcSbQTEj7UQ7d2EKdQ6v5pWR+qE
	pqXGAkbiSlbDjAmjJf5d4LDMIzhm1P5fipEc/d0NRGhqnKgvfZH1n9EXu+2+3wsO88ROxDgcc3E
	W4vxcC3tRmePHfzopbkzBC8uqBAX6gshrXhlE14t3zXbaapz7as8PPwPqcaI/LuICvFgEbJn/pj
	PLKnGhBqViqLB5Nfq5D13tKaQt2apXpU9F+6cY++BcWzollePWV/+7DGNmuM5iztr0sxJP32oCp
	TzmHZFLVx51SBIYcTWCkdmaaCfhnHaWUrOaO0wMc0M+Ln+/KVteHh11PXPddZABdc6uy4Ffa+EM
	tcBDZYxzwilE+9aqK+bmQRXxCgHOhc4RtiApc1MEigQ56E+XdLOeYRxztgoroh20th
X-Received: by 2002:a05:6122:4589:b0:5bd:9c71:11e with SMTP id 71dfb90a1353d-5c4503af414mr923181e0c.4.1786480260918;
        Tue, 11 Aug 2026 13:31:00 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b716010sm438942e0c.10.2026.08.11.13.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:30:58 -0500
Message-Id: <DKMEECTI6D9J.3L6PWZQ442ZCU@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-1-f89925d72792@gmail.com>
 <c7faac0a-e3a5-42bf-8cc1-aee1370ef662@baylibre.com>
 <DKK9QKE0OYZA.3BCNK78VTHNYN@gmail.com>
 <c902cbe5-6435-4548-ae92-7399d8d48d62@baylibre.com>
In-Reply-To: <c902cbe5-6435-4548-ae92-7399d8d48d62@baylibre.com>

On Mon Aug 10, 2026 at 11:42 AM -05, David Lechner wrote:
> On 8/9/26 3:26 AM, Kurt Borja wrote:
>> On Sat Aug 8, 2026 at 1:38 PM -05, David Lechner wrote:
>>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>>>> integrated PGA, internal reference, excitation and burn-out current
>>>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>>>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>>>
>>>
>>> ...
>>>
>>>> +patternProperties:
>>>> +  "^ain([0-9]|com)-supply$":
>>>> +    description:
>>>> +      Common-mode voltage supply connected to AIN<N> or AINCOM.
>>>> +
>>>> +  "^refp[1-3]-supply$":
>>>> +    description:
>>>> +      Positive voltage reference connected to REFP1 (AIN0), REFP2 (AI=
N2) or
>>>> +      REFP3 (AIN4). If not described, its assumed to be connected to =
ground
>>>> +      (0V).
>>>
>>> Would we really have a case with a negative only reference? I would say=
 if not
>>> described, assume the pin is free for other use.
>>=20
>> In bipolar supply configurations, I believe it would make sense to wire
>> the negative reference to -2.5V and ground the positive. Also we have
>> the ti,reference-reversal case, where you may wire the "negative"
>> reference to say 2.5V and the positive to ground.
>>=20
>
> OK. I guess the better wording for both of these would be that if any
> channel references one of these in reference-sources and it is not presen=
t
> assume it is connected to ground (0V).

I'll go for this wording.

>
>>>
>>>> +
>>>> +  "^refn[1-3]-supply$":
>>>> +    description:
>>>> +      Negative voltage reference connected to REFN1 (AIN1), REFN2 (AI=
N3) or
>>>> +      REFN3 (AIN5). If not described, its assumed to be connected to =
ground
>>>> +      (0V).
>>>
>>> Assumption is only true when corresponding refp supply is described. Ot=
herwise
>>> we should assume the pin is free for other uses.
>>=20
>> I'll clarify it.
>>=20
>>>
>>>> +
>>>> +  "^ti,refp[1-3]-refn[1-3]-resistor-ohms$":
>>>> +    description:
>>>> +      Magnitude of the external reference resistor connected between =
REFP<N>
>>>> +      and REFN<M>. In ratiometric configurations, such as RTD measure=
ments, the
>>>> +      IDAC excitation current returns through this resistor, generati=
ng the
>>>> +      reference voltage for the conversion.
>>>> +
>>>> +  "^channel@[0-9]+$":
>>>> +    $ref: /schemas/iio/adc/adc.yaml#
>>>> +    unevaluatedProperties: false
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +
>>>> +      single-channel:
>>>> +        minimum: 0
>>>> +        maximum: 10
>>>> +
>>>> +      common-mode-channel:
>>>> +        minimum: 0
>>>> +        maximum: 10
>>>> +        default: 10
>>>> +
>>>> +      diff-channels:
>>>> +        description: |
>>>> +          In addition to the analog input pins 0 (AIN0) - 10 (AINCOM)=
, there are
>>>> +          special inputs that can be selected from the following valu=
es:
>>>> +          11: Temperature sensor monitor
>>>> +          12: Analog power supply monitor
>>>> +          13: Digital power supply monitor
>>>> +          14: TDAC test signal
>>>
>>> For reasons mentioned in the reply to the cover letter, I'm not a fan o=
f the
>>> monitor channels here.
>>>
>>>> +        items:
>>>> +          minimum: 0
>>>> +          maximum: 14
>>>> +
>>>
>>> ...
>>>
>>>> +      input-chopping: true
>>>> +
>>>> +      ti,idac-rotation:
>>>
>>> Should we make this one a standard property like input-chopping?
>>=20
>> Maybe excitation-current-chopping or excitation-channel-chopping?
>
> I suppose. All of the TI literature seems to call it "rotation" rather
> than "chopping", but I did find a few other sources that call it
> "chopping" and that would be consistent with input-chopping.

Yes, IMO it makes more sense to go for the chopping term.

>
> I would go with excitation-channel-chopping since we are swapping
> the current generators, not just the current magnitude.

I'll add the patch.

--=20
Thanks,
 ~ Kurt
