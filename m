Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282EB27AC57
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788725841; cv=none; b=C4om6RkKB+QD2WovDqeBeItpeR5HcrB1TWkabJR6g9z5oAP27cu7fqYiIlm5H1JJu1p5aDOrEl/h7Ummc374veEgBzY7k4oeZzlB7yYmuxiaomHdhsTtfLfT/Iy7o8WNpT5M92wgAZexdlGFe7VJYKwf4nUvwvUJdlI6ld5CXbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788725841; c=relaxed/simple;
	bh=TUt4IgCxtrSPH172R2/R8p3roroqSOduOa+0501w83A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=S3YQ1+lSitIg11lTVln0cu1HXbXr13Kcn7oyP3HZ3oHIUyeJZCw9WkmQieS2Rt/EvkGAAqPlbVYn8Dk6IhydSslG+hz7GvVGEEuJGMK2Plb1Y9y3dALle7z2DZ67hBME5BNauniz7mmY6egdLR/FOImkB+p6geq2HfwfeU7UCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNBTDmmn; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNBTDmmn"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-783d429d0cfso2184630137.3
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788725838; x=1789330638; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FPcJdKOhEGIyKqoQExd+dXzrnHFFn879UVtG9q8zpck=;
        b=rNBTDmmn0gWyg8hXGmA9c0qKadTeXlz46B+np9BjS9WYNX8nWz448l9OYnxkyKR7FW
         lsRI3lAvE7IYSwCw6lrscRaDjg5HIhP18uOZBhC9ue6s7xN70HxkY96RDrhuf9ItrTdn
         g4XshRZIsltf0vNKng4e58VHY2wCZloQ7IqH3Ig3mREQSgGdEcMp2YnqRlCZg8G3K41g
         StVHCV1+04JKbt+EmtRM30iwoxMKShJyucXEHr9zo1HRY0CtfyoubdDzg82SegZxR3PZ
         6QM8wWZvM2vm2La28fQXATLQORw1ODcO+X07FE5dKs5vCwUJQ4oliP2G2kZbUL/wIrOh
         LzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788725838; x=1789330638;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPcJdKOhEGIyKqoQExd+dXzrnHFFn879UVtG9q8zpck=;
        b=subH6VrqIN1oxhRCkK1e9N/Z5kAT4UYiYJr5gwzGLWcfpDj5clQMY7V06ie9u4+U9u
         G8plmvOcu895fvAepaXtTl9wd5ingtxF938ylkD1e55WMfI7Wqk6cO4Gwc4EEoAMEe5y
         poYmZkG9BRi6e8SJMVNVtLyFTWyPBcgkugnsGN7RXMopb2DtZVoPAejIOUXEdPowvSrH
         bJ4ruhCw6GOHXFbkc6futg7wWavmmpnx/l/BzeWdMfsy88bfnT5Ve1V/3tU3gA1xMBWO
         f0gcrRf5Px5SyqhktMFw+PdF4++cuqpTq20cPagZjFhMp6715GS/YvfpqcSq9iEneo8j
         gtHw==
X-Forwarded-Encrypted: i=1; AKwUvBzojC27Ye0B19U7JdKOJi1KrBO1aLBVbO5EciADPW2Gz+5RKqAiAPNq/O+c5DuC1hfyJnBJ3Z0eBnLS@vger.kernel.org
X-Gm-Message-State: AFuF++kugHSLgsCR6+e8fuHag3KiwrLaNcAxmsLDmBF90h/pR4Z9x3zC
	5Ym0zJF5669w7mOdAtp9B0nrjaver6DgS6CZITWia+/RKHvjeR21gsz7
X-Gm-Gg: AYBFou3NkI60cIqLyYPP45orov3ZAVZYBT7zGoLnJmLFWja0CW0ppgenAwb/4pbqvTK
	Fhiojkwpu2MeomBTwDJ/tvqe9XxxVYMfOUL7vgOi2KXEHQzCOHuWV1eNUZREn+jo/bLP0SmHMke
	tUyxkf42qjqYIxlG34bzPcHP9dtS207DF2PqSFjac0HtMMTGkjG9XT0xcF0aQyN9eAtJyk8JRvH
	DvcspPYuhMTn2E1lHIE2hPp25QONmjW+4JLWJxyQSpFBpH61ttvp573Puxw7ayFpbSDBuIUEcew
	d6OFPj0lrPJprYE+aNTg+yoyUsMwF+IXJhxDYwaMnqqoYPmr40e2hCJjVMuotBYOTUFXssV6rc6
	qnpgM71PeA3qJsFciQgoOEkCYecq+215jamk/ac26vkc0cFGd10qMDfVV4Kf6ErbJ9oBDqZCnYG
	U/yoOVGBNnoPrr2GFZJdsb16lUtVlhRhXI5wPD/g5Nqp06kIOx4w==
X-Received: by 2002:a05:6102:f8a:b0:786:c86c:8fe4 with SMTP id ada2fe7eead31-78a4ab73095mr7872878137.13.1788725838086;
        Sun, 06 Sep 2026 13:17:18 -0700 (PDT)
Received: from localhost ([2800:40:44:f1f5:f400:4c49:91c1:9905])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76512sm5832057137.4.2026.09.06.13.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 13:17:17 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 17:17:13 -0300
Message-Id: <DL8IDZLLS2KT.31M9BO759E5H0@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/10] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-2-1dc27e9c0260@gmail.com>
 <aae42329-f531-41fc-80df-2cb5e445f1db@baylibre.com>
In-Reply-To: <aae42329-f531-41fc-80df-2cb5e445f1db@baylibre.com>

On Mon Aug 31, 2026 at 4:44 PM -03, David Lechner wrote:
> On 8/28/26 1:38 AM, Kurt Borja wrote:
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 is compatible
>> with ADS1262, but includes a second auxiliary ADC (ADC2) to perform main
>> channel (ADC1) cross-checking measurements, system background
>> measurements, or temperature compensation of the primary sensor.
>>=20
>
> ...
>
>> +  '#io-channel-cells':
>> +    minimum: 1
>> +    maximum: 2
>> +    description: |
>> +      The first cell selects the channel by its reg. The second cell se=
lects
>> +      between the main ADC (ADC1) and the auxiliary ADC (ADC2) as follo=
ws:
>> +        0: ADC1
>> +        1: ADC2
>> +
>
> I like the suggestion to make this always 2 cells. Makes it simpler. And
> to put ADC first.
>
> And maybe make the first cell take 1, 2 so we don't have to make the
> translation?

Sure!

>
>
>
>> +  "^channel@[0-9a-f]+$":
>> +    $ref: /schemas/iio/adc/adc.yaml#
>> +    unevaluatedProperties: false
>> +
>
> ...
>
>> +allOf:
>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,ads1263
>> +    then:
>> +      properties:
>> +        '#io-channel-cells':
>> +          minimum: 1
>> +          maximum: 2
>> +      patternProperties:
>> +        "^channel@[0-9]+$":
>
> These don't match the pattern above (missing a-f).
>
>> +          properties:
>> +            reference-sources:
>> +              minItems: 3
>> +              maxItems: 3
>> +              default: [internal-p, internal-n, internal]
>> +    else:
>> +      properties:
>> +        '#io-channel-cells':
>> +          const: 1
>> +      patternProperties:
>> +        "^channel@[0-9]+$":
>> +          properties:
>> +            reference-sources:
>> +              minItems: 2
>> +              maxItems: 2
>> +              default: [internal-p, internal-n]
>> +
> With those fixed...
>
> Reviewed-by: David Lechner <dlechner@baylibre.com>

Thanks David!

--=20
Thanks,
 ~ Kurt
