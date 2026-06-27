Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2E336896
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782585687; cv=none; b=ddO4DfBNtU6s/DBMX0RoyoCh6Kfvq8bCBrXYrBtnncTqgHWGT1/tM9GRnAR1GSUw7bofwc6RW4IKzsfxv4hBfg5Uopo6kRdlozabvOAEedgYnQmZnzh9x2CgrhyiEg2gBnFv5dBy75ogSS7RV2ZsbZJRYsV4Ii6DyD8M6cQfpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782585687; c=relaxed/simple;
	bh=8fNyIkfw/0xYqHeJkX6O72fskcyAw69K6eCvgFE0iuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRbg8aC/SkpBjZ7q7ufJad7NMRSrLOfyjPQepUJ/XN+zq5DSnd+bjlmYcs2GAed1xUKtYlxD+QY9Oqh2PR1zN6LsnvBAKAwGx79Ujutca+gNz5Sh2c9AX43/JB6FuaWu9G++o55u1N0iAGKJGgMZBwQdF5Yj5VhHgAD35An6yec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FO8ydpiN; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FO8ydpiN"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-491bc1d4e6bso1554075b6e.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782585683; x=1783190483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SD3aaAda6IdwUA5LxoT3zVkkP/l61F3rjfDVOmdi7Lc=;
        b=FO8ydpiNWjOvHCtFrQsVIZd6/Awsw2mj0Lgc5U7fSNosJDASmpl0PPH8UZeCoFQXt6
         Gz9oabHaOI1mTyB0cr+JYY5GvaV47mgSVIxAaxWEwnoOS0y1KnEEwfxmd9EuhLuR3iIw
         Fet9Dg41aB5lupk19NgfdNlDhyUQivL2cZT8vmP8fc4UezcCKEbc+U+O68DZnFCn+lrS
         CRp9ILS5190UPKGh3nbqMx4VvSKhLrbKBD+NWo1lLOy1zKOJdKXho2URF2ZKTYRfjabD
         jAh9GU7l0n5fe0BiOITp5bB9j5a/FHslqLh7vrfONcYQb114lRYk7+wlMe3rCRkFY+Y2
         qDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782585683; x=1783190483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD3aaAda6IdwUA5LxoT3zVkkP/l61F3rjfDVOmdi7Lc=;
        b=jFYr2Fk/qWiDe+zPw3lvCxmdPw8gk57/O5ygNfYw1mecEPIrT4OBPuz1fBsKLCyY2q
         TSjbS9SekIYfSOPS2Dpq3UHRSSQJggvRaZvHakLCYeArcnqhV9y01NA0IYmlcti8Li67
         WZWhygyj2MXRpdOJGndP0JoNI5ieto60yrN+BTzTTKC2LuMU/Q/PJB44qV3tOE+xx5RJ
         3od7BfpW69ZnMH8Kj+TC3y5AFLB4UHI0KtgSb4Mw5ZnT2eLUIsKpth4uen67rfzxmmLz
         kmWQaAncxjoDOrG9Rrv86ZhN1jEQjgcBDpsLFO3nbJQdr1/UX+lpnQBGaRCM+FWfUA05
         oUoA==
X-Forwarded-Encrypted: i=1; AFNElJ+Sn0hnVkTBucCKEC9SY1p+9/flPVmBoOxTrf7/2PE4j4xAYWnejmiLFioXFMfnNJFdJRAvzGfpqqB6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9Jt7muUhxiwYu+rK+T1tWZR3KoFJYYL+5gDu9dEg95iPial6
	KQZIXJlkpLX/Ui9yDI1v4vx7/ciOXt2R3R/GWF9Py9WjF7AOKZ6JV0t2MhMiMQrpfbI=
X-Gm-Gg: AfdE7clJigmQGi64k1qtd3gFMpaAoLBcv5hbW55fI2ala9tnxhjbkdMscBcJsz+P4Mt
	Pg9B+142MJtUUT3TAkQG6IvlDftyMlrv/nA0kit8YLpdV6inzBPqJK8vt9kq5LRZZ1JvlcdENCS
	C48HtIjYaYbxQM/1NTp4VO3CQvBZOb7I3F9ngQJCXr+O8s3bTQsCQwd+nJa4gerdK1Brw8bSsid
	t0wCEy5Gs6ybXQTcKwQ9RiecnSq4tidgMpLqWimASA7gj0lY5a762Ndx4AUeQ3t4ovgG5JgqL2j
	S5IqI1HCwMJkP8O645Wj8avVxjXGLrY6VofeMox1XbPHv+kI2e2UwPLEBCxt/vvNI2u/wc0IHoG
	Yy/5u5TaMsDqo6MqmbZYB6SHTVM43HfPjKpkxcxq0Ksec2tzu2MK29RoK1Joy2NG9D9MG669RD4
	iJWKlSldIZQn7RquWxBjAXwW2+AGidtuIhYCsYwTHxSmadKaqdSLNizuZlxDiT9cw=
X-Received: by 2002:a05:6808:6411:b0:489:97a6:a72a with SMTP id 5614622812f47-49217238baamr9016207b6e.4.1782585683662;
        Sat, 27 Jun 2026 11:41:23 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49352b05f2esm3723287b6e.7.2026.06.27.11.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 11:41:22 -0700 (PDT)
Message-ID: <aacfec88-da09-45e2-9e33-67e0c7af8e87@baylibre.com>
Date: Sat, 27 Jun 2026 13:41:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: magnetometer: add Melexis
 MLX90393
To: Nikhil Gautam <nikhilgtr@gmail.com>, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 u.kleine-koenig@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260627005843.7786-1-nikhilgtr@gmail.com>
 <20260627005843.7786-2-nikhilgtr@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260627005843.7786-2-nikhilgtr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/26 7:58 PM, Nikhil Gautam wrote:
> Add devicetree bindings for the Melexis MLX90393
> 3-axis magnetometer and temperature sensor.
> 
> The device supports magnetic field and temperature
> measurements over I2C and SPI interfaces.
> 
> This initial binding documents the I2C interface.
> 
> Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
> ---
>  .../iio/magnetometer/melexis,mlx90393.yaml    | 54 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
> new file mode 100644
> index 000000000000..33ab0be66345
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/magnetometer/melexis,mlx90393.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Melexis MLX90393 magnetometer sensor
> +
> +maintainers:
> +  - Nikhil Gautam <nikhilgtr@gmail.com>
> +
> +description:
> +  Melexis MLX90393 3-axis magnetometer and temperature sensor.
> +
> +properties:
> +  compatible:
> +    const: melexis,mlx90393
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  trigger-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - vddio-supply

The supplies are required but are missing from the properties and the
example. Running `make dt_binding_check` before sending would have caught
this.

See: https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        magnetometer@c {
> +            compatible = "melexis,mlx90393";
> +            reg = <0x0c>;
> +
> +            interrupt-parent = <&gpio>;
> +            interrupts = <17 IRQ_TYPE_EDGE_RISING>;
> +
> +            trigger-gpios = <&gpio 18 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a92290fffa16..469ae3f9aa0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15501,6 +15501,12 @@ F:	Documentation/scsi/megaraid.rst
>  F:	drivers/scsi/megaraid.*
>  F:	drivers/scsi/megaraid/
>  
> +MELEXIS MLX90393 MAGNETOMETER DRIVER
> +M:	Nikhil Gautam <nikhilgtr@gmail.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
> +
>  MELEXIS MLX90614 DRIVER
>  M:	Crt Mori <cmo@melexis.com>
>  L:	linux-iio@vger.kernel.org

