Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789DB2E738B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250118; cv=none; b=kTZ8i0cEeUzxLoQ5lP4N6yZIkT9nSpf9k6FEt8KUiWLNe3dnh392kjMCGm2/YoE7/8Xeu0HexvR7WqSApBnn1EJxUxzW/aEuRL2Rx4PXkTw77qf5gpYdhLx69HsuV+3BWxr6+yyZmcBj8DGZ3/NngKBnnJps5CRrO3lssXkOZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250118; c=relaxed/simple;
	bh=zW6A05WSx21AkPiRZpyj1UkmBaxxL2sAgRFl95ozvhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INC+9I8HcskqaCdYzuFCnuWw+g2eN+GmLzG1lGURmkuYVDg3muvrZjSvitEufsnGtsx3BhAYxZcqiymzrwuDk5qK2iiIoKDpbMzNKbnHUiKkq7Lrp9WykI6HQQgCS7/b7jMQT5t2HRo3pIO4A99a56pwFVIFS9D6G3ROdVVq+rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cQyMZ20X; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cQyMZ20X"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ab021f1daeso952510eaf.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785250114; x=1785854914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/feB+5dI2c1LpmJwW50wwLBRGwzUb62N/BMDthtwA2E=;
        b=cQyMZ20XODsxb5Gu0r8lNXmCuJ4Hf8EFyyX+qtqZRcldTTmJWtpAgYDOJwKk10iw5c
         CntjLXFunN/0IacX0hTQtbpq2t6PYJvB0zrhjO4ND47mt5X4cGHgjEWL8b9iDPpDuTZY
         6TrOiOTbTywZRPAwbPzAzNPSIzAa97rR0VuTMdN9gyrycZHM1K2Ux8E8tPQOZzZ2AM4F
         qQzBAH8Pv+4bBv73ljmX3Vz7ItzpzoCP4M0PTJ8NH+q3fS+Eq4WjqJwFmAEDCH4Pzj2s
         bsowyrfVwdWLl6JBFoaLzeW8Oaz/1I4lQNDxcLuAH1Jo9UJpCzEa8zTPaHiW8COkzzpm
         yqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785250114; x=1785854914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/feB+5dI2c1LpmJwW50wwLBRGwzUb62N/BMDthtwA2E=;
        b=q7CD7xYM5caeISakzlZ1f1e3oG5qDyl/6idSy9Gimk392LN2IRye/Q8pgnoFrtpuag
         NEDSVcwQgzmDcM1LGLJn1X3g4zLCrYpfOGPFY/gm1oLKqMUYMKP2xHXcTg/vaThweAuQ
         2QIxkpnE4SXUrRbKxMdGPzwrNN0mAUuy2MacSuvepd89rQoPv5LWsT7Safymzca9ajR4
         rjNZVKM+kMdq7Rt93qdV5IkUG4lAEVB4OZd9r7S7RxvrRTQAXuqwbkpEe/2RFhbU317b
         QYcw1f0vu57KDonzxjoLdkWRxImx/DCXrXvIHhPY4Fyqkmnlaqkw+MhYXUnG6kxzoxXs
         7cpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpU4kwiD83+rOR/u8+OrhhCGPIATt4BdE9r6JMWZ3Z/KF4zF3JL8dKdxyETPpIWGW5Rps3KRczkdUss@vger.kernel.org
X-Gm-Message-State: AOJu0YyINtOmb4tt+mcJUk4dfQ/avNO4WzVQ7A+sMPbTBHxrRknV1Dlr
	LLNOmeN0GByDZII7MdFnA287tXB6v8ENEXRkTw9kHx/Ov0cszFFgPSVdTsSgjFuDGFU=
X-Gm-Gg: AR+sD11spHH01oGOFa5t5ogW6OZePd9uuGRSdj6twg2yRtRqVt6K/awDybdiGIzEoy7
	8i/XB2J3aYGoaRx+aumgb79QTMga4ZByvjJQfQwa9cv92MQqgzkez3fk6IvZM5L4Jd+5FaChszM
	TFgibLPd/zTd6b1Khe2i/iUJjrA+97gbKSGsNtX9W+gRFYY2XzFp//SUy8Uoy4r9Eibd5hrfVY/
	VwEd/wNLWQEoTMnqoCtWEQCZvS2NqZz208Bs7PjVRMDIMrD8YUeGRYouN2/jjl15BKs4CAOfhK6
	5swp5zZAYc/7Se5wasJ5cOlw2bO/wkueyUjFF95OjtiMsVQTQ3HPgbi1LNADR/NaB5vkn4L1420
	wnuGLB/9WbgBoDcsIMfV7mqA/4OSIBsgUsYpfdLk6DIlDL8JYjmQdK09IxifDtoGell3P+yPD98
	Sn+LIDnS66sA2Fgz/P/nc75CSo/ZbYztN763qPmSR7NPV8gDj23RAhbUCT3CFv7I8=
X-Received: by 2002:a05:6820:2225:b0:6aa:d599:7b18 with SMTP id 006d021491bc7-6ac96be3affmr1025912eaf.21.1785250113628;
        Tue, 28 Jul 2026 07:48:33 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3026:75d1:db9d:8984? ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458867fab20sm71076fac.10.2026.07.28.07.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:48:32 -0700 (PDT)
Message-ID: <51752372-264c-4cef-b3d1-96030da117f0@baylibre.com>
Date: Tue, 28 Jul 2026 09:48:31 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: ti,ads112c04: Add binding for
 ADS112C04
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com>
 <20260728-ti-ads112c04-driver-v1-1-475efe4e2b78@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260728-ti-ads112c04-driver-v1-1-475efe4e2b78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/28/26 3:01 AM, Kyle Hsieh wrote:
> Add device tree binding documentation for Texas Instruments ADS112C04
> I2C Analog-to-Digital Converters.

If you haven't seen it already, I'm currently working on ADS112C14
which is a more complex, but otherwise very similar version of this
chip.

I think the differences are enough that it would be quite messy to
try to share DT bindings and code, so OK with me to proceed with
new bindings and driver. But we should try to make the use all of
the same conventions as much as we can. (And to make maintainers
happy, explain this in the cover letter so they don't ask why we
we need a new bindings/driver.)

For reference here are the bindings for that:

https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/tree/Documentation/devicetree/bindings/iio/adc/ti,ads112c14.yaml?h=testing

> 
> These devices provide 4-channel, 16-bit delta-sigma ADCs with an I2C
> interface, programmable gain amplifier (PGA), and data-ready (DRDY)
> interrupt output.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/ti,ads112c04.yaml  | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> new file mode 100644
> index 000000000000..55842fca1215
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti,ads112c04.yaml
> @@ -0,0 +1,76 @@
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
> +    description:
> +      Data ready (DRDY) interrupt output. It is asserted low when a new
> +      conversion is ready.
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the RESET pin. Active low.
> +
> +  avdd-supply:
> +    description: Analog power supply (AVDD).
> +
> +  dvdd-supply:
> +    description: Digital power supply (DVDD).
> +
> +  vref-supply:
> +    description: External reference power supply (connected to REFP/REFN).

VREF is an internal signal. Technically, these are REFP and REFN and both
could have a supply connected to them. Also, there could be a resistor
connected across these instead of a supply. See ti,refp-refn-resistor-ohms
in ADS112C14 bindings and 3-wire RTD example in the datasheet (figure 74).

Additionally, we need channel properties to describe a bit about what is
connected to each AINn pin.  We will need single-channel, diff-channels,
excitation-channels, excitation-current-nanoamp, and reference-sources
similar to ADS112C14.

> +
> +required:
> +  - compatible
> +  - reg

avdd-supply and dvdd-supply are required to power the device.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        adc@40 {
> +            compatible = "ti,ads112c04";
> +            reg = <0x40>;
> +            interrupt-parent = <&gpio>;
> +            interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +            #io-channel-cells = <1>;
> +            reset-gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
> +            avdd-supply = <&vdd_3v3_reg>;
> +            dvdd-supply = <&vdd_3v3_reg>;
> +            vref-supply = <&vref_reg>;
> +        };
> +    };
> +...
> 

