Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD33A875F
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173765; cv=none; b=ZXSeq0VCjDrGAX5VfLKjM+DjZR/3Osy80yc+PsIfLzGTrKR9BaFa7yb/NQfNHu12Ii9pqtkA9UaE11eKdv7bgsy4ZbgtAgYy7hYN1nomTTifVesFIyyWgbPIBeAP1TgAhYa/t3sazWLhVvgdWu7j+JDC1r+g9b6FmM6WuK4B0OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173765; c=relaxed/simple;
	bh=A+23uLQLzH2qQrDwu2mwAHSU4wNnmzaN26nspzv0uu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sr/rmQ1kCTbhARnMKtbHbw2PT+pvA+0c/uVFqcXwlmkgCkVqXCmh5fba9HOVrwUPJEc21KOEv0VQdSsL+jL7UTr/NXfZWVYLfIAq4oAZYW9HlCRwIhd6rkeSCs4qnOvFt+OGAsZESCU2gFKb+NuBck1LEpTiQBX8pPzd4DZwbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+di65vk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+di65vk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso19235275e9.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779173762; x=1779778562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itPcGM/gwKQ3p1FhYekN6m8pyKpHNYH8z+J/IPhR2cE=;
        b=a+di65vkzeNAlL1M26ty27XmMAR68h2B+P4COk+Xg7sE71SqeOwIqhZcuPfe70Txrf
         M/2zJIqIeM0Lcvhc9I4lP2IasGlB1+7HFdEeL1kNGvaB0ow9uLKNDLDu9EjWFjW3uIGM
         OQjGh7DjuKKp8bxakQBsuTESCxXsmMBG0d/UJG2rW06/Co6idvc01OkmbuWys4Ggr9m+
         QNXNsHELV1Lb/LH1L9PMRKj+T0oixiNxSh3HpWSlOe5Ld3fHvyCcmIIBE+/Bve1ta1h1
         6cSAfzPwRbljR3sxysnWO3J0aP3WDfzP0xx4ciey0GnbU+n/Vs1wBMbE0PbxNnY9PdCc
         Abpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173762; x=1779778562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itPcGM/gwKQ3p1FhYekN6m8pyKpHNYH8z+J/IPhR2cE=;
        b=mMMtYtnvwImQdTLSYSVYHmiXpYzbeAfQnY45x53qOTcqs76iEY1rodfaHeEXFUMWto
         TcTD2UpYJ+SAHCXPUnARm0t+x6Qd4YIreGQzCRykMC1XMtSS72aK1WuB4+gLIuISWbo3
         ADL3iKwc2VkCyzExpB2I6h+Mj7HazeaOhPiRJFfMlqb2vnS4HHF2pD558BzHlLpT/CKi
         d5L19/jVDtuytbYSWrHjDSfd3gQp1VLIYFWGjeO3DgicaH33TPOjtXh8NkCgVX/DrB9y
         AOmPoFbmHPP3hB1KFqwjESlKl/4XTGS332gRTzFFHNBKg6x2qlv+MDDC6nPyRhJgd75k
         NCeA==
X-Forwarded-Encrypted: i=1; AFNElJ+0mnuwaJlMg89NxNrXxEoaMJx2oEMumkDG7eGq75MTE5gNvkqzhMoOIAO+irAHKXc/35Lj+GjGWZWt@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQqV95zbUIhzo5actzsCKjovXDjWEogCO+U4VHDONml4voKUC
	qb71cCYHI1/ZaANpBd8TuIZvmEpZdzEssAAfCvp4rD8gNcDXXYR+/8Vu
X-Gm-Gg: Acq92OEsTg6nlJVKf4BUFN7omIZ0+J4Z+I30ymKGudd9WCIQu8g3DfGLDdOvL9h8ZlD
	oUM1aYetVyIWo9F5H0sP+7rO9mGgbuZbBk3oIqzCEPbGqAYfWKTRA2UdXi3JtpkHDOwQy0ykBNV
	0FLAia1iLntAhGU5flBUaHWO9KtmfqYRa/lpp+WwlhRfkxgoo2DtEpZHbxzlhj176hoplI/13Kx
	nxtTynvVQRwz977hM/BKqFVQKIO+L2FIilvEQdoP0qy1d0pqffe60q85w0dpQzsOfi8Cyc2/Do5
	lKxSRE4CFdhQ8PivPS+vHJP/JH1dSJmm3zkmTNgfvuf+GQaawtntq0fg1zqORgXkPCElUnObU9r
	xZ8bmA3RvQ4KBSYJaWaxaeWm6sphlO1Gpg/VdxZQS9qoy5D15WKsawer9a71juMT6TL8recxQBf
	V+KKOxM4RwQ5gunbntZLmulW7oZl3ii7Q7yIuId4NIP2OBhthIIC0xHEKNWE4N7TeSnCWujjxPG
	0Gl7sw=
X-Received: by 2002:a05:600c:a30a:b0:48e:62ec:f264 with SMTP id 5b1f17b1804b1-48fe61f29femr220648785e9.17.1779173761829;
        Mon, 18 May 2026 23:56:01 -0700 (PDT)
Received: from ?IPV6:2a02:3033:6c2:b9c5:ec15:f5ad:b85f:a3b8? ([2a02:3033:6c2:b9c5:ec15:f5ad:b85f:a3b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694f2csm306900785e9.4.2026.05.18.23.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 23:56:01 -0700 (PDT)
Message-ID: <3d94a704-05e7-445c-9238-a77d22541ba3@gmail.com>
Date: Tue, 19 May 2026 08:55:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 rodrigo.alencar@analog.com
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260508134843.7646c4f5@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/8/26 14:48, Jonathan Cameron wrote:
> On Fri, 8 May 2026 13:55:47 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
>> buffered voltage output digital-to-analog converter (DAC) with an
>> integrated precision reference.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
>>   .../devicetree/bindings/iio/dac/adi,ad5529r.yaml   | 96 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  7 ++
>>   2 files changed, 103 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
>> new file mode 100644
>> index 000000000000..f531b4865b01
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/dac/adi,ad5529r.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices AD5529R 16-Channel 12/16-bit High Voltage DAC
>> +  * Multiplexer for output voltage, load current sense and die temperature
>> +
>> +  Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ad5529r.pdf
>> +
>> +properties:
>> +  compatible:
>> +    const: adi,ad5529r
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  spi-max-frequency:
>> +    maximum: 50000000
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO connected to the RESET pin. Active low. When asserted low,
>> +      performs a power-on reset and initializes the device to its default state.
>> +
>> +  vdd-supply:
>> +    description: Digital power supply (typically 3.3V)
>> +
>> +  avdd-supply:
>> +    description: Analog power supply (typically 5V)
>> +
>> +  hvdd-supply:
>> +    description: High voltage positive supply (up to 40V for output range)
>> +
>> +  hvss-supply:
>> +    description: High voltage negative supply (ground or negative voltage)
> I don't mind doing it this way but in some similar cases where 0 is something that
> can be considered the 'default' we've made the supply optional.  What was
> your reasoning for requiring it in this case?
>
> dt-bindings should be as complete as we can make them - with that in mind...
>
> There are some more interesting corners on this device the binding doesn't
> currently cover such as mux_out pin.  We'd normally do that by making the
> driver potentially a client of an ADC
>
> Easier though is !alarm which smells like an interrupt.
> !clear probably a gpio. TG0-3 also GPIOs.

You are right, for unipolar operation, HVSS can default to ground. I will make HVSS optional.
I will also add bindings for alarm/clear/TG1, TG2, TG3 and mux out.

Best Regards,
Janani Sunil

