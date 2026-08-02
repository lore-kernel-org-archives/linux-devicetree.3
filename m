Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60B282F31
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687570; cv=none; b=WNp2JlGhlvPVZHCNkAdOn27OBGiN2gYTzVsr3DE/G89BkK0e8HTvimJdtVnW0L5H0KJc08LPZI8YQZwQKBR53yuorQpgkxCsO+YGEjcf+wuTyf/4EVryWuxxPQgFpPDQt8otTRfWVLsCReXzj3k+tXEmW0s3iC4DFnvGuxXSQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687570; c=relaxed/simple;
	bh=KxHPKoiDCurUCtsWQ6ggtOoQgw/61uc4/tX7qUf9nEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmMIKWf1FV63JA40q5YyTMr6lPZMJgLUCMlaEhFEFHDdUOgeyWud1Jy8LO4KG8k7MdK3n4xwI0neC0Sb5ywBm8y1kWjFnQr0bwes46TSDNFS5DcyQp6JybQebWjq6GW7mSoWA7pXmWD+PqufFl+0kCKMVorTlU7hsIlholHc8P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WUykbia9; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WUykbia9"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6aca105971eso1620748eaf.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 09:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785687566; x=1786292366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfhxQUwsFgYF3mH3fJ4GDJgiou41ziE3NPkuGjACN5Q=;
        b=WUykbia98RhxPYI9X2HerLBNqFPJdf1Zc8R/EfcrZZzg6KxEdQMC7R9N1xxMX4uGm7
         OHhmds1mdlqpbPfYWL0e7qzuaHk+BxDhFylOMy5ybEq/mHYw1WzAEfR3k29m+dRYvPU4
         mjUNTjh3s91lciiP/Mw2eo7rxRQaBmWPBrESOSGLh3Z1103NPP1lBOZH22C+yMaIRfOE
         YUobl9q0cgKEVzQRejTbyezag20G7EpHJboo0GsCVtT9/uRupsPk4wfZzznK2dse1BRF
         uTR/v/cJxKgmmzoJkDwXsa++uxXLcpd/UZ6qYzNnmoU88/97WsrVVX4ZKTp0RArD3ZHv
         1Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785687566; x=1786292366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfhxQUwsFgYF3mH3fJ4GDJgiou41ziE3NPkuGjACN5Q=;
        b=JWNL+dclLvXTjfIKm5r6IT4v1edMfImg62FaDrObsiUCdrQWIOr8bjCRM0FlEPyh0B
         aSoWiGzPd1q1iKSOS2/W1a5k48rLPoDVrusYxeNinwz9mgG5nwYFHAO8Ls32xBLHsxFg
         aq2y6UtKtjVHSuFV8rOo8wJgpMU2qksI01JHY2JscrWaFaFcL5Zzo9hn3P0BKagrfiQJ
         PHlENUvZtpSL+SQT1maG/1ygeIwcejlcS803Ch5wXkfAWn72xYIn49++nhx1YFanEect
         /PRdB+KJAbqnxFC2EzPRk4VimnKDhaBVc3JIZlteRjxG0Kh/DAA6pT2V9UU5xWj6l/T1
         5Gkg==
X-Forwarded-Encrypted: i=1; AHgh+RrY66K7MatG3hm0BPF/8Q+2l+CJ9BShmTgKiHf0RkRN0AUU2v7jdcl/iMkpvfh11uBe2aUs4UfV2FIw@vger.kernel.org
X-Gm-Message-State: AOJu0YxgsYJzdXoIW4zmU4+BbxMeH8Hhw1ZXtvCi+vLrNMKiYq3xx1Vz
	H+nLG4KUnjeO/ZqfQEf1oAXlcgDyxVWXEpkb48TXWQQzbyL19LcgUJufj/OYIlXAMfTVCxyyI5R
	X4iFSrtI=
X-Gm-Gg: AR+sD13HiBvwS2jo7oTf+UnOReOMt2q3qBf8Suw1oibuYCDT46ideeX/jSg7GMN4HOc
	pSnz3ukCSziNkja/+BHHdTdAsEl0aI9oqvhGvrNgeFRgjcd3ITtGr9oK5zJnRSM3eVfIxi1glij
	zWv1+S9IGHygCSy35iyvNuxE7ukzb93DYHI7I5es7N9BMC9kTdh8WGJY1HMr7LjjRnNqBTcBcdU
	Sg7COa8sUu1MFIchAYmDYIofBEMIyQmA3fIT0DoI0XkuNrimTLdPGrp1rOCWvZ1+jP23x5QpPm5
	+F8JjV+m6YdYS6MrMqpDuPRu9OAa4hqq002T5vFLI3uawGBix55EJ6mU4mvUa2AIpvUOs9NbYOL
	hNQcWHAr2QStr3oEeZo11iV10mA8L+fPrdjUZJ9M5qAkQb1A9tKbR7mSxQGo0s53HLM904q9q5x
	CzuEHoOO9h6SEuYIURHEcy3BY1YWGjZMvxXoPyKv4Qil9LjJbxbltFWrhWvsdF4AwO6+HlmUSUo
	P3d2DoYj7aNiO6CmKZFQbddkf9WRIRUUycTM8xR
X-Received: by 2002:a05:6820:88f:b0:6a3:8b32:3ecf with SMTP id 006d021491bc7-6ae43217e3dmr12146792eaf.12.1785687565710;
        Sun, 02 Aug 2026 09:19:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c724fsm4864613eaf.9.2026.08.02.09.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 09:19:24 -0700 (PDT)
Message-ID: <fde82f14-c0da-489a-81e9-cd047f8e5862@baylibre.com>
Date: Sun, 2 Aug 2026 11:19:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add DAC8163
To: Lukas Metz <lukas.metz@gmx.net>, Jonathan Cameron <jic23@kernel.org>,
 Siratul Islam <siratul.islam@linux.dev>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260802-dac8163-work-v3-0-3ecc7bc66d0d@gmx.net>
 <20260802-dac8163-work-v3-1-3ecc7bc66d0d@gmx.net>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260802-dac8163-work-v3-1-3ecc7bc66d0d@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/2/26 11:07 AM, Lukas Metz wrote:
> Add device tree binding for the Texas Instruments DAC8163 family
> including the DAC7562, DAC7563, DAC8162, DAC8163, DAC8562 and DAC8563.
> 
> Signed-off-by: Lukas Metz <lukas.metz@gmx.net>
> ---
>  .../devicetree/bindings/iio/dac/ti,dac8163.yaml    | 87 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 93 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
> new file mode 100644
> index 000000000000..ba4099c78e06
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/dac/ti,dac8163.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments DAC8163 family of DACs
> +
> +description:
> +  The DAC756x, DAC816x, and DAC856x devices are low-power, voltage-output,
> +  dual-channel, 12-, 14-, and 16-bit digital-to-analog converters (DACs),
> +  respectively. These devices include a 2.5-V, 4-ppm/°C internal
> +  reference, giving a full-scale output voltage range of 2.5 V or 5 V.
> +  None of these devices are fallback compatible because they differ in either
> +  resolution or output register values after reset. The sync pin on the device
> +  acts as chip-select pin.
> +
> +maintainers:
> +  - Lukas Metz <lukas.metz@gmx.net>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dac7562
> +      - ti,dac7563
> +      - ti,dac8162
> +      - ti,dac8163
> +      - ti,dac8562
> +      - ti,dac8563
> +
> +  spi-rx-bus-width:
> +    items:
> +      - const: 0
> +
> +  spi-max-frequency:
> +    maximum: 50000000
> +
> +  spi-cpha: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd-supply: true
> +
> +  clear-gpios:
> +    description:
> +      When asserted, the device output registers are reset to their default
> +      values (zero for dacxxx2 and mid-scale for dacxxx3 devices).
> +    maxItems: 1
> +
> +  ldac-gpios:
> +    description:
> +      Pin needs to be asserted permanently when updating the DAC synchronously.
> +    maxItems: 1
> +
> +  vrefin-supply:
> +    description:
> +      External reference voltage supply for scaling. When no vrefin-supply
> +      is present the internal voltage reference is used.
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - avdd-supply
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dac@1 {
> +            compatible = "ti,dac8163";
> +            reg = <0x1>; /* CS1 */

Comment isn't really needed. The bindings already define that this
is the chip select. And I would just use 1 instead of 0x1. This isn't
a memory address.

> +            spi-cpha;

Missing spi-max-frequency and spi-rx-bus-width.

> +            ldac-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
> +            avdd-supply = <&avdd_3v3>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d238590a31f2..314f235332f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26394,6 +26394,12 @@ S:	Odd Fixes
>  F:	drivers/clk/ti/
>  F:	include/linux/clk/ti.h
>  
> +TI DAC8163 DAC DRIVER
> +M:	Lukas Metz <lukas.metz@gmx.net>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/dac/ti,dac8163.yaml
> +
>  TI DATA TRANSFORM AND HASHING ENGINE (DTHE) V2 CRYPTO DRIVER
>  M:	T Pratham <t-pratham@ti.com>
>  L:	linux-crypto@vger.kernel.org
> 

