Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97D3A2576
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785764531; cv=none; b=Rn+yKZ09l9RdYv51ZDEf+0oQke6ZolMKDV4I0YLy/Zf3qwtyg9mtczITEl3rv7uONV13zvTPdapfinBysBfNvftmiiCa4vGWoAIWr28Rqc/PwsWTh7m/suE96mcaU7tKukaHoV1lLjhntRtTlGm3trltZ3WW7xkP36OUIx53L+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785764531; c=relaxed/simple;
	bh=oGmjKkdANcszWWeB7hVj7Roa1B24F4uV2BexEwNone8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErUh+BBj1Gkk84/GYqbrc7R2m5ZFWEc+gAFg35s6N3o9/WyJlN4UPX5ydJV4R9Y/og1jfSKXfnzO3GSREr9YXyVqMO8KE2memZRcrfxjKyylIDd9F0n9ZQCMEdYuG1sRwFYTNuRCK9L/7/9mpXM6kFRD9MT9H9wcbKdy8USp010=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YzbPaD11; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YzbPaD11"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ae6e407bfdso371144eaf.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785764527; x=1786369327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pLzSiAF7h+MHs5QbYnjTgM1XAsnbqoEGTBpx5mogmc=;
        b=YzbPaD11JY0YwaLYuV9RidYx9eNGzdEZX19bWHsj1oi4ffVdwQmQxBdx2psC/C4H8J
         7yWgvG7d5b7HC80k58HfqLaVmOJpcT0XFr2x3D+Fc+GLBQYiAkSW/uAtz8y3u9JlzbWi
         d2pFNDFns/js4NbjYk8RSiqX08ap/WpeDKhjny0eTSLCkoRGID2Z/I+3BhC0vz1j3Op+
         rhFDS23bpGDcaI5Uf1viqla8lD2ArxTfMWQmxjwJKdPUdjI74B9uCbecMsH/dkWPmWxA
         kaEwGawPLkHP2kZ9AOg0Dh0wLvcB0lLcbG7+XzE8EfR5CrcoOsp6ofI/bDdaVERZGynD
         +DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785764527; x=1786369327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pLzSiAF7h+MHs5QbYnjTgM1XAsnbqoEGTBpx5mogmc=;
        b=WlgccN9jk1+VqkIpFVIvLMSO3QoWq7Huzb1fD7zXFzCIt7rmvKWK60n5LZuoiKhWlX
         XY+2lgoq2eS7LmLZCT8iXeCnkHhYoBjHs+ZX8/IJWUfgmpsCwff44/pjjXszFfjbaitY
         NVCZi10HMAfGllMkj+GjQa/yZo6LPs427Jaa+JRIiHKw55JqNKEOA9KX67N244uFI01T
         +mkmier+a35inX14nYjaTCl2PYsiREssw4QHaB52gFjvJXdsUDmOSIYaCCd0zfN0llPq
         44ZLzDvTGeSaHcxAWWl3FVClpFuI5hwVdmpMYAU0GUtKHQGeHD8AgRtmmkttyo2K2rhl
         V4JA==
X-Forwarded-Encrypted: i=1; AHgh+Rohmv7Wm5g5TkLUcX0BVlISfKcTFWmD8NAJDersH3YYu2AubURBRk6e8qBmJsXUbTWX0UqpY71hkzH5@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDcWi6zOfDJC4GGAo+T1xI82zRebpP/kwo244mGXY6DAAy6GX
	jXQLi3p/Udfx2RLqn+jZYsFGPnc26PwSFMC/OfVh5ron1gXoFr96Dm5F5y+ZZAre0r4=
X-Gm-Gg: AR+sD10QCmnrpjz0eNnBA/pg+ieJGtfS6V1ca0GeGVNebIWaJgdiJM8ohsXaGaHmenV
	eVNXI69/EiabyZCaIAVV0b+o6qgN4CnONjsV9GJh1BAa5/6uICJITJM6Upey5EK0M1/FaE9BOWo
	DEUgwh3LlEpUUfVhknEP0BMG+6ydaHnjCB6X0JxU/6ATqLGB4r0XPz6HkqcwiH3D/J4znvWduPT
	J2X1KV9GNjpkjlaTUY3DnmW/NCdD9vN9uPnCXT0C7zWkRupcG5I5vgZRairavrRHv3QnyZAMv8D
	uKi5BJCYSrNa3hYFXeO3uwYQUkp7CqkCbut5371ZMxUXWlRpjlEMVM3dpOpTMlGDfAkTMLMyLSg
	AVJ82ECwl/RvEySifjsBzgmXI/hED6OYxTigcQn3kTZm+QE7HIDatdXBuPsCJLy0OckUi85CbLJ
	U56SBGSX1MbbR9DyhOZEspXqRSYeEbzyU6/8SH9nDRFso3SDYa09IpZ5BZiSr/WfQdwpLt+G2kk
	fvqboMu4Wt9lR2FbN9AhNDoQhX6Mu/O/Rk2y3WuqSKFTxHGfMwdBBdj
X-Received: by 2002:a05:6820:8106:b0:6a3:d77e:725a with SMTP id 006d021491bc7-6ae432bbc33mr13969350eaf.20.1785764526752;
        Mon, 03 Aug 2026 06:42:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b8f7:1f5e:7c:a7d1? ([2600:8803:e7e4:500:b8f7:1f5e:7c:a7d1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm9428382fac.3.2026.08.03.06.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 06:42:06 -0700 (PDT)
Message-ID: <93d0f625-9a84-445c-98f8-fb3e569dc833@baylibre.com>
Date: Mon, 3 Aug 2026 08:42:05 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-1-aab0168c3c01@gmail.com>
 <b2297241-e0ae-4058-a406-348440798e38@baylibre.com>
 <CAF7HswOr1CbsR2+K06NwCNty=xJg5mgCa8mXxY_nSP8um-YBRQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAF7HswOr1CbsR2+K06NwCNty=xJg5mgCa8mXxY_nSP8um-YBRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/2/26 9:32 PM, Kyle Hsieh wrote:
> On Fri, Jul 31, 2026 at 9:52 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 7/30/26 9:58 PM, Kyle Hsieh wrote:
>>> Add device tree binding documentation for Texas Instruments ADS112C04
>>> I2C Analog-to-Digital Converters.
>>>
>>> These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
>>> interface, programmable gain amplifier (PGA), and data-ready (DRDY)
>>> interrupt output.
>>>
>>> The binding uses child nodes to dynamically define the connected
>>> single-ended or differential channels.
>>>
>>> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
>>> ---
>>>  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 122 +++++++++++++++++++++
>>>  1 file changed, 122 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
>>> new file mode 100644
>>> index 000000000000..6a5ffda84b80
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
>>> @@ -0,0 +1,122 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Texas Instruments ADS112C04 ADC
>>> +
>>> +maintainers:
>>> +  - Kyle Hsieh <kylehsieh1995@gmail.com>
>>> +
>>> +description: |
>>
>> The | isn't needed in this case. (It is only needed if we needed
>> to preserve formatting, or if there is a : in the text that would
>> be interpreted as a dict key.)
> Understood. I will remove the `|` from in v3.
>>
>>> +  The ADS112C04 (16-bit) are precision analog-to-digital converters (ADCs)
>>> +  with an I2C interface. They feature a flexible input multiplexer, a
>>> +  low-noise programmable gain amplifier (PGA), two programmable excitation
>>> +  current sources, a voltage reference, and a precision temperature sensor.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - ti,ads112c04
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: I2C address of the device.
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +    description: Data ready (DRDY) interrupt output.
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +    description: GPIO connected to the RESET pin. Active low.
>>> +
>>> +  avdd-supply: true
>>> +  dvdd-supply: true
>>> +
>>> +  refp-supply: true
>>> +  refn-supply: true
>>> +
>>> +  ti,refp-refn-resistor-ohms:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>
>> As the bot said, don't need $ref here because it is a standard unit.
>> (So don't forget to run `make dt_binding_check DT_SCHEMA_FILES=ads112c04`
>> before sending.)
> Yes, the `dt_binding_check` robot caught this right away. I will
> removed the redundant `$ref` and resolved the warning locally.
>>
>>> +    description: Resistance of the external resistor between REFP and REFN.
>>> +
>>> +patternProperties:
>>> +  "^channel@[0-9a-f]$":
>>> +    $ref: adc.yaml
>>> +    unevaluatedProperties: false
>>> +    properties:
>>> +      reg:
>>> +        items:
>>> +          - maximum: 15
>>
>> This chip doesn't allow arbitrary combinations, so there
>> are actually only 12 possible single-channel + diff-channels
>> values. So maximum: 11 and channel@[0-9a-b] would make sense.
> I will update the regex and set the reg maximum to 11 to strictly reflect
> the 12 possible MUX configurations supported by the hardware.
>>
>>> +
>>> +      single-channel:
>>> +        maximum: 3
>>> +
>>> +      diff-channels:
>>> +        items:
>>> +          maximum: 3
>>
>> For this chip, we should also have excitation-channels, excitation-current-nanoamp,
>> and reference-sources.
> I will add these properties to the binding to fully describe
> the hardware capabilities.
>>
>>> +
>>> +    oneOf:
>>> +      - required: [ single-channel ]
>>> +      - required: [ diff-channels ]
>>> +

In the future, you don't need to reply to comments you agree with.
Just reply to ones you don't agree with or have further questions
on. We have way too many mailing lists emails to read, so anything
we can cut out helps.
