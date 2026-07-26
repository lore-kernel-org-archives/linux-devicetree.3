Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F983C1400
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080280; cv=none; b=VXxErUBi3oHE9tt8ksEhvCQM+6a6wSjnw77KlZUlta47tGbmf1hWMMwfHqQBKl1BvlKmhFNCYjBNul7Xh9fEjJbim4gkdu/Xsfox2rKGAHM204qn/xVGUkwk8PqNqSRAKSis2G+dtckDyhYg+nwfpyrIDlllhqvZJJgGxZVXzuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080280; c=relaxed/simple;
	bh=2WZER4o6v0Hx8PfdeNj46jlYkr2QO/bQWZIQs/AAsUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3wZvcpzFJMWqXB+omMvHjAKu4KzZxKlRaUBvATOtSbuYfte4ywTONpoNnrnHkOPnlLD3SxJMs+7m3zvFWmu+rKr2hLA9807BCgaY7KVRQPCBHw5pNJ1xGabanGZB1bsf4eQ9lbuRQrBiAYKMwnFSQFbGFZEk18WxE2BFi81aqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cJI9l0pA; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cJI9l0pA"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so47325b6e.0
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785080273; x=1785685073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iZf44bRNZi4EavQ0T3yVwCCro6xvtHUrPxwZYFjPgs=;
        b=cJI9l0pATcynKd0FnHdTvt58QaGanpa7zhfpT9JbR/3PyFqq/n+dgpoC44CP3RRfuv
         4dm/u81lTsBSi9d/S/sg3BmYgO1siDok2r5u3U8cVPwiWFu12AyGugqmfT8cEiLQRDvy
         Kx6jv8x4joKoyEQi9WViAxMuBRiIrQ9hWiNQq0ZU5Cm5M5+x7OH5RkZJ6746DjzlbX9B
         KFItqqjGO992904srSXcZYISB1Dwsk8Vq0Z8cPngACVR+/qy5L0ZQsYtjskxMr4tYiyK
         ANe8e597li4UGuQNlwjFkLybFT92XLWbAVvMu5++SNjtyEbmk1meZBP/qi3bomLgQS2L
         PvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080273; x=1785685073;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iZf44bRNZi4EavQ0T3yVwCCro6xvtHUrPxwZYFjPgs=;
        b=isnkecKd6fHaYoGrwOZ4bgkTUXdsUj9jqltlzPlvJ2VFVxOY67XeqCd59Fj6Sm7J+4
         caRjzuKuC9XQoSqjetOXbY0Ps9Ljp+RewH5clqHgPOjoGPNg2ckSGJ0WHBKA8lHU8xeE
         1VelVs8ikjyyKCBl9D8L+AjOGb/ESwTPetrc129VL/zJSLAhazKyjuwjtcz74KPMqcmp
         XFa8PYsTvXwuVPBT0jZT37Ajgi1ivMC6c2jaYVngX4Q/eKtoKrZhUXZs3XzwOwPjh5pG
         U2DAnMafnty78QEYHpZfn3LmDltX0l21gl3TFFZkqLSPE0sn4c5sDkSpSjwa6Scr8rnc
         66lg==
X-Forwarded-Encrypted: i=1; AHgh+Rp93ft55w4eD9S0iEeVwwqGi73f4CD6JiMIDXeudEFZatdBoxdIYVT6g/C95R/WIqAXlYVvIFOrEDrx@vger.kernel.org
X-Gm-Message-State: AOJu0YyICCqpvKzZmJiA1eRHEeui5gHbhqbly7Dc76TWxtWrXaECcPH9
	MdpkspA6LihtuIyF8KjxEMLHB7KVFp4bKt+7m0Vhzn/zpLZJgtjieVeji57uVJ5Sxpk=
X-Gm-Gg: AR+sD10s3z9UO8CmSSjjBDz+n/RouBqPXxauX2LtRAWa+PmkAKsYKDwjolvoJ5xrz1+
	v6hH0DTBUSJLeW9d7q9BoQBzCGDg1Spjqe30SU9dh59/ewz01biTkjzmEPSHY/JeIYOIuhGKkCF
	4FMTjjet5S3U31SYjtsTLJbXaECRHx7o9d0soRC7JtdkXKmo5oEzKRsllk2JU9arYoulzQdyJdj
	JcUm2iy8PHapWM0UdsKVnMv5IPHDhKsfQJdKwBcrdDVf+OY34VNOGIgvfa9bJHJJHXPM4GkT48S
	e61Gx40/LPZhGen+VfGn+HkSp+mHCu6IejJ85pSuo4AQ79ANYBXROul2vZ2O67T9rMdkt2CdTfM
	dOmMMDVlkxXu6cF0OpKITMFEH5kO8NFa3BbslMbkwIGnVcAEzv0ZHsv98DzhDR87/yGDM50mckf
	ZbkdtHBOTzCdOTrfZdyWAKgEUbbKOeOPlfukPeOHzCDcjZo+bPdNTD7zwTcw==
X-Received: by 2002:a05:6808:3190:b0:4a2:ca6b:4214 with SMTP id 5614622812f47-4ab6a298532mr4860974b6e.29.1785080272888;
        Sun, 26 Jul 2026 08:37:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:105e:29ca:45cc:c7? ([2600:8803:e7e4:500:105e:29ca:45cc:c7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab3505ac2bsm7308907b6e.10.2026.07.26.08.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 08:37:51 -0700 (PDT)
Message-ID: <39bac146-227f-4155-a80a-78b84a89ef20@baylibre.com>
Date: Sun, 26 Jul 2026 10:37:49 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: adc: add maxim,max40080
To: Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jic23@kernel.org, andy@kernel.org,
 nuno.sa@analog.com, linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ciprian.hegbeli@analog.com, siratul.islam@linux.dev,
 u.kleine-koenig@baylibre.com
References: <20260723065036.2683075-1-stefan.popa@analog.com>
 <20260723065036.2683075-2-stefan.popa@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260723065036.2683075-2-stefan.popa@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 1:50 AM, Stefan Popa wrote:
> Add device tree bindings for the Maxim MAX40080 bidirectional
> current-sense amplifier with a 12-bit ADC and an I2C/SMBus interface.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> ---
>  .../bindings/iio/adc/maxim,max40080.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> new file mode 100644
> index 0000000000000..170bf4eff8706
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max40080.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/maxim,max40080.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim MAX40080 bidirectional current-sense amplifier
> +
> +maintainers:
> +  - Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> +  - Stefan Popa <stefan.popa@analog.com>
> +
> +description: |
> +  The MAX40080 is a high-precision, bidirectional current-sense amplifier with
> +  an integrated 12-bit ADC and an I2C/SMBus interface. It measures the voltage
> +  across an external shunt resistor and the input bus voltage, and stores the
> +  results in an internal FIFO.
> +
> +  Datasheet:
> +    https://www.analog.com/en/products/max40080.html
> +
> +properties:
> +  compatible:
> +    const: maxim,max40080

adi, (the part is owned by ADI now)

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Value of the current-sense shunt resistor connected between the IN+ and
> +      IN- inputs. Used to scale the reported current.
> +

Missing vdd-supply for power and interrupts for ALERT_ output.

> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@20 {
> +            compatible = "maxim,max40080";
> +            reg = <0x20>;
> +            #io-channel-cells = <1>;
> +            shunt-resistor-micro-ohms = <100000>;
> +        };
> +    };

