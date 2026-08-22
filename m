Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21428493636
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787422849; cv=none; b=qQl6hTLQrC+oggKdMcwSi7sKl+FfQgK8LK6lSNYSTkUE4a6h0owFuev0JgbQeSDY8reN7DrfRjNLTxCCbDonMz5Wa2BO22+kQQhLqPTt1qec3dfAzCFbhudUPp9f75dhE8/O0oI1YuNjUSsvzcb72ZD7NfTzThrEgoVWgTSVdKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787422849; c=relaxed/simple;
	bh=yAd7mVfoTBbWlzpS260BpQ70itHd8Zbdwg1YAKphL9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QA2S4gARQfMSsI07QCYCTXQsZVphgzuuaw9wuafI7wlvmvm0fHPLFJe/a6oGkS9gb07j4ngzoRY4+u/Rg0UeG/iFzeKJ1M0HKavZFzPdJUy4wMozcTmp8vMb282rmyqRIOjxVK5/wHX4x2sSEG8zxEfIC8+WrpswMgIBfLE1VUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QtdB0DiS; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QtdB0DiS"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7f434cc1c5eso1904014a34.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787422846; x=1788027646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQNhgPr9yKeFxbuFf8eNz2imAjAUqFj9cvzQCXV9ESs=;
        b=QtdB0DiSzSVUfDZCjXeD9nEncE0SZ5qIlVFYDFNoIKJMeSlyjWcPg0ucyxPo3DZVfe
         KWr9do1iFWeblA8KhMWJhLkdGx9CRogPHU0ozgglmnUOIVeb5R46lIkrYHyTPPwsOGuk
         YuWsFh6BHdy4j+60yDKckvtXR8jZBd6fvuyE6wBAdTn97A/+FZUZoa7JgoZRX3ShyHCE
         ampOQ+wdbk0/QkRE1sroDVPXNvMRdcik0MtGDAqZC8OwQf8/VKeqEaNnEgFaPDK13xYS
         6TgEpgRA7wIJUvlbgbJbVOSeI0sROy66nSR1OuHh8VJqOl5cdJmJSLxO2W7uYAfpgk3j
         8W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787422846; x=1788027646;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQNhgPr9yKeFxbuFf8eNz2imAjAUqFj9cvzQCXV9ESs=;
        b=X5bf573W3ZFV3/Yx95bCOQTCDMie4mSR2GUBCdVPnapWto2g/Rv2gYK80PIGE8lGaR
         uB5ylumGl+LUUFNr6+TKI60WEZ9KuReqQnGDv9xPI/MW6u7DtLyvpN/dH2mcsdoEAXhQ
         3xmTocVWstDidOyw3R4M2+RcNw4cIyUQ3RksXgJRIFcz+Q5d1VHcQ297FruZfVedUgFT
         m1huRE2bWeiDYdCn84y6Ah6/hGdG8M3zbq0j3wxvp6UsYzSvAEe5PxewlwADhRb0p9yx
         g+KuRZtV0RqBupfY7U7uMqTUuBo5+z7oD+TJhpSvlWpkDuwNQcprqkBD7CBwzCWc6iqi
         HaKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9LBn4XIpSpEMgE8nQesv5ALKhDr/6ib+hTgjBGAoweF8hgjVQSIGrt2eiRoOcrSLUmcav6FSL9xeD@vger.kernel.org
X-Gm-Message-State: AFuF++lsCNhXiH+I+bXC4HTFYxSFfQGrQiZcYs6nam6F+oPyWlzJrPju
	w7iv3D4APqviClnyO0Y12+tAzhsYLe9Pv4OuGc9E4zXXCW6qLv/aYaRgvKMGHUeBfaE=
X-Gm-Gg: AR+sD12YHnc2VgS0ZdtmFb22CnOiLuFZzZ6n8vwjCL2sirbz16e14VSFoPefZvkNK0q
	aTWsHj9TTO4GQp/NVKGwO7R5mrA677IifiErAd9Fm6HAgUrrCk45oJojefpbb9hJrXwvUDc3BOv
	mfMLocKHgr1CYh1gaHwiFW3bbx+Z6YQON42wGwzT5jodx9Ev69fVghiTa+snJXoUzpTQmsWeUBR
	4lkvHQ0XF9FO7DvV1mOmX7jz1AdHvFaRokrfCwtMpr7H74maGuygLE8TdDDAu84HD4jc9Rh7cXr
	2L+vN8Cc5iYi717Jc1cla0z4lkNNnVfy7Z8vhc9uXlqrMMxSfZbbGUVB2p3zAJpLPwIagMRJ2si
	5iuXq+dOWtQaKBu3fsWrt8Th3e4fcRrIlVOjjmjpSaKYGoU47qQJw1QKmIIybYY/4e91rozX+H1
	31979FaABrrFwbc43JJ7MCeNvmOM6xrILDXPHdjsHjL5YcZCqg+tWJfXLPfAeon65xc6yFfA58p
	Mw/Cu90FbB9+Arapj/j7HCeL0f0fY010FpjonA=
X-Received: by 2002:a05:6830:83a3:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-7f461349073mr19255634a34.1.1787422846094;
        Sat, 22 Aug 2026 11:20:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e0ca:316a:4629:d835? ([2600:8803:e7e4:500:e0ca:316a:4629:d835])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f43fe7065csm10638335a34.1.2026.08.22.11.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 11:20:45 -0700 (PDT)
Message-ID: <f35aea7d-0844-426e-ac81-d5b156b60e4a@baylibre.com>
Date: Sat, 22 Aug 2026 13:20:44 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] dt-bindings: iio: dac: ad5504: add output-range
 and missing gpios
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, jic23@kernel.org, lars@metafoo.de
Cc: Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 skhan@linuxfoundation.org, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260822085850.17527-1-0rayn.dev@gmail.com>
 <20260822085850.17527-2-0rayn.dev@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20260822085850.17527-2-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 3:56 AM, Taha Ed-Dafili wrote:
> The AD5504 output range (0-30V or 0-60V) is determined by the R_SEL pin.
> 
> Use standard output-range-microvolt and range-sel-gpios properties to
> describe the hardware configuration of the R_SEL pin. Ensure mutual
> exclusivity using the not/required logic. Additionally, add missing
> vlogic-supply, clr-gpios, ldac-gpios and datasheet links, and provide
> a complete usage example.
> 
> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/iio/dac/adi,ad5504.yaml          | 39 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> index 9c2c038683b4..e0123dceaa33 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5504.yaml
> @@ -10,8 +10,10 @@ maintainers:
>    - Lars-Peter Clausen <lars@metafoo.de>
>    - Jonathan Cameron <jic23@kernel.org>
>  
> -description:
> +description: |
>    High voltage (up to 60V) DACs with temperature sensor alarm function
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad5504.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad5501.pdf
>  
>  properties:
>    compatible:
> @@ -27,6 +29,29 @@ properties:
>      maxItems: 1
>  
>    vcc-supply: true
> +  vlogic-supply: true
> +
> +  output-range-microvolt:
> +    description: |
> +      Specify the channel output full scale range. The R_SEL pin
> +      determines if the range is 0-30V or 0-60V.
> +    items:
> +      - const: 0
> +      - enum: [30000000, 60000000]
> +    default: [0, 60000000]
> +
> +  range-sel-gpios:
> +    description:
> +      GPIO connected to the R_SEL pin to select the output voltage range.
> +    maxItems: 1
> +
> +  clr-gpios:

This is one that is starting to emerge as a common name, so I would call
it clear-gpios instead to match the same name on chips with a similar
function.

> +    description: GPIO that controls the /CLR pin (active low).
> +    maxItems: 1
> +
> +  ldac-gpios:
> +    description: GPIO that controls the /LDAC pin (active low).
> +    maxItems: 1
>  
>  additionalProperties: false
>  
> @@ -34,9 +59,17 @@ required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - not:
> +      required:
> +        - range-sel-gpios
> +        - output-range-microvolt
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
>      spi {
>          #address-cells = <1>;
>          #size-cells = <0>;
> @@ -45,6 +78,10 @@ examples:
>              compatible = "adi,ad5504";
>              vcc-supply = <&dac_vcc>;
>              interrupts = <55 IRQ_TYPE_EDGE_FALLING>;
> +
> +            output-range-microvolt = <0 60000000>;
> +            clr-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +            ldac-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
>          };
>      };
>  ...

