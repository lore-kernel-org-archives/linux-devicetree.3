Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496D52253EB
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505958; cv=none; b=bGkYi3PB+VPSk2b/pSJDt85D03amsoroSDC9ArdROu47lmfd0AyCL/L0k3yF1SneAFerCauf6jwoYZqZJV4jt4Q7pq41cxAW1vKX9T9reNJA269KDoYayHz4dU3ONmEjrDMTFsvDgrpjES0qMm39liOQ+NQVSJ2B1D4m25elAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505958; c=relaxed/simple;
	bh=lSZ+/tv9wX7w51bK6R7N7Sqsdlr7yLBGjQShbkEuqZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJkkY/PY7uivsYGITkJLg+XnZyvR2efB+EPrWnTEOGUN8yS5ryBkIIogpV7wkfNem2zSFRLNGypEtoiPj0Cn0O3SS0h80dTcAxJfCd7J0TUcUQhztWF1N/j5MVgQ2+AJkYxxfvcMB71mMMAHLnfTzQ24Bc0g3Xc6ZgUfcbk+caA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lmmWoqP1; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lmmWoqP1"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb787dec99so751625a34.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785505954; x=1786110754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsZfkDKXnNJmRKluxq/2lt4f+eKCbGLQWu+itVq10m8=;
        b=lmmWoqP1KgsDx3pYF+Keo8N13MBpcUFNNbKDJq74TJkzPQrqizqy9c/w+PLZi+h2qm
         We0bz/bT2+m2IS8g2crmvQvf0swQ149nUMfEbM1sJZd3Dq5mxYvk13mZjz5ZW71wgGPA
         hune1U8ZiAq3i76z4bmeGxFIA4OYMS/3M12LwiRBjWOKkZyAYCUf14e9plwTrvZTo0zU
         RYgprHlckkRhvXMjqRJ6dtWvmi/2FVd9xZDqw+J0d1tP9wEtLPzd6RHvZSdJRqf4kPld
         4UuLP6/26572oRaMCjV1pHBy3hZdhchqJWhANaZVUC/qwqZgZG2HWbySN0QEnz9HE5gS
         C6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505954; x=1786110754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsZfkDKXnNJmRKluxq/2lt4f+eKCbGLQWu+itVq10m8=;
        b=m98XfIFDg/uxr+DqNVKV4eJhsjSOxr282mSJSXdjIIGYaZvm2UFlz0kAsNQZj79vnz
         6G6phCZasvSW6wJhqG9EEYBhi7T8wKPF4SUnFw55v2yk3WEZXnvACwvLPuRtMdisA5Go
         MLqztBV/mZFa0HplxO1syuJVxNQ0ZQiQFi73v7cfCVRNcOnkbY5uVaSUe9RkRwrE93r6
         uMV5+ExqXtvQf1YelEZZuT7NxZI0xH3UkrRn+TUZHdXN16jXQoR/7FPUUFawC3Xcdqqv
         FkrPRqinlvY5KybtU0/NFpKRmfauEY7w4vUiVHJdGbhsivrpsbb+ukXpUk4quBm0yNX1
         cG1w==
X-Forwarded-Encrypted: i=1; AHgh+Rp7N85QhfS6RnJL7chFXv7kqMsL34vohD3wBg/u8Wnyi6gImOKMIlWNP4vLO3n9orgSLiR0vQBMnnsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3wTTooML9gLYdMYxvhplui7eUuRJPt5O5buHZeIxpqG3KnS42
	s6sE6o8Da6mxLpNBoxjs68reshQA+q5BkhSi2n/Lj2d1/O41hlG143OdDQBUvxetcTQ=
X-Gm-Gg: AR+sD10eUMICB4F/0EeHL0vscTKu+dtg96J4AuI/b/3m98C5tZfK3tIax0e6xfe1rqM
	ruqsJxXI1vkmZS2zkSy1Cn8lXSjltr3h7bAf+WiB4s8blR03Gdpkwa62pUBU9LB6Is+UqAdozgQ
	KltGHGkApfqsYWDMZuXuH1lQsdmDEvnXRj9uPXT59sC29cmXqyNpK9GZMUhTok+melmgzve1yvC
	lvoYNfG1vfAoprAwn6+5vTn7p9iLmvsydeG87wY+P6mK6OKhISnDxZk9YmoK+/RLzATq+vZ6EZO
	Dns7BLDMrf8tGde04lmC2LfzdxzvZepXvVWfR6ki90fOt/sLvkEKrZ1C4CVPyFeomh8lrFoDcww
	ut1NpKK3eCRxCeQigsSx254YndGMQ6zSA9UTe2eCIMmNG169+baaSMb+4TxHnC6qV56agzK7/Wp
	uvakd/7Y8U8cXPE3zB18srQ9yITgQOkeJrH3df8tFReTGZrL7biLVeaZqda7DkGlmfMOZ/LrX52
	QCVJnvI2xNNPhVAP4yXkAXiOO/Y5fBPaY2uFcY=
X-Received: by 2002:a05:6830:4983:b0:7dc:df37:844b with SMTP id 46e09a7af769-7f189afca30mr3300344a34.4.1785505954129;
        Fri, 31 Jul 2026 06:52:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:fa40:746f:401a:3b75? ([2600:8803:e7e4:500:fa40:746f:401a:3b75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18ed9af83sm653269a34.10.2026.07.31.06.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 06:52:32 -0700 (PDT)
Message-ID: <b2297241-e0ae-4058-a406-348440798e38@baylibre.com>
Date: Fri, 31 Jul 2026 08:52:31 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding
 for ADS112C04
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260731-ti-ads112c04-driver-v2-1-aab0168c3c01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 9:58 PM, Kyle Hsieh wrote:
> Add device tree binding documentation for Texas Instruments ADS112C04
> I2C Analog-to-Digital Converters.
> 
> These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> interrupt output.
> 
> The binding uses child nodes to dynamically define the connected
> single-ended or differential channels.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> index 000000000000..6a5ffda84b80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/ti,ads112c04.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments ADS112C04 ADC
> +
> +maintainers:
> +  - Kyle Hsieh <kylehsieh1995@gmail.com>
> +
> +description: |

The | isn't needed in this case. (It is only needed if we needed
to preserve formatting, or if there is a : in the text that would
be interpreted as a dict key.)

> +  The ADS112C04 (16-bit) are precision analog-to-digital converters (ADCs)
> +  with an I2C interface. They feature a flexible input multiplexer, a
> +  low-noise programmable gain amplifier (PGA), two programmable excitation
> +  current sources, a voltage reference, and a precision temperature sensor.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,ads112c04
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Data ready (DRDY) interrupt output.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to the RESET pin. Active low.
> +
> +  avdd-supply: true
> +  dvdd-supply: true
> +
> +  refp-supply: true
> +  refn-supply: true
> +
> +  ti,refp-refn-resistor-ohms:
> +    $ref: /schemas/types.yaml#/definitions/uint32

As the bot said, don't need $ref here because it is a standard unit.
(So don't forget to run `make dt_binding_check DT_SCHEMA_FILES=ads112c04`
before sending.)

> +    description: Resistance of the external resistor between REFP and REFN.
> +
> +patternProperties:
> +  "^channel@[0-9a-f]$":
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        items:
> +          - maximum: 15

This chip doesn't allow arbitrary combinations, so there
are actually only 12 possible single-channel + diff-channels
values. So maximum: 11 and channel@[0-9a-b] would make sense.

> +
> +      single-channel:
> +        maximum: 3
> +
> +      diff-channels:
> +        items:
> +          maximum: 3

For this chip, we should also have excitation-channels, excitation-current-nanoamp,
and reference-sources.

> +
> +    oneOf:
> +      - required: [ single-channel ]
> +      - required: [ diff-channels ]
> +
