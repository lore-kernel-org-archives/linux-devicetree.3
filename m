Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF832B11F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 17:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160993; cv=none; b=tUZgv6DvuycwPxaqWV1AacpQIEkJndgUBTD2Hk10CidbAxawHVFj6FTSlgCwMrY6h6FioXzT9HZ4z5jlw1P1XkG86ZDQdticdMiCIE9Q/a2RO63knVb5VbTP0vX+ktVKAVbfhU0auBRtoh//LJI9M7FPmAy/7/8BktbZNE5qvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160993; c=relaxed/simple;
	bh=5Ta/Ad5RxbHJEHKxgSoE8mnWZLrY4no3hDJEMqLfwYM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XFyVpE3WaulB1hqjT0Iba40J4YFvKWI9ZbTXtj+x3cmdtO2XT0od6FB5faNw8kUKnibsUsP4A0ioJr2j+HP1aA1sonYQG1pAkhoucRrlbmp91SdIPvXx7z4eeO7bNC+e2XcTyOnSevU2lWt/Hp4/6SMpp5q2rRA84QZFIWNFh8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0j7BIa0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0j7BIa0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D6B1F00899;
	Sat, 30 May 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780160992;
	bh=kCNI1G8dzWXUyoJbVI/+/1Gp8h3R+my7oXuY9lOh54o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0j7BIa0ko2iCTemEJPzwD6zVIolnkcIhqCMgUrBi945SXRUnoAFriuf6dmqwm+zp
	 lk0AtNXNIVlKs0tpls5XzWLSYPOgLyP2mjvTRSQvQuyM8UVdMpneCewxIICEzYNeD6
	 wL78/1JbpM/Pxv6Vy2QgiK2M76J3C5xgZA/1o62f2vkJywfbC30Jb8T215pz/TU1y6
	 zwHTVPKstvY66Uj2xUJasz0smytkrUiNvm2iylz87G23rFgEr2w7w0eLon9BG2j20K
	 ODyuZlADmy0YEZ3ABwBgB5i6nozDei9y9D63LK5v1pgeFihk8NaZIyMJRF5NhYjO0d
	 kq2X7MkTQ6iHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 RFC v3] dt-bindings: iio: adc: add ad7816/7/8 digital
 temperature sensor / ADC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Narimani" <tahanarimani3443@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530165917.55767-1-tahanarimani3443@gmail.com>
References: <20260530165917.55767-1-tahanarimani3443@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 17:09:51 +0000
Message-Id: <20260530170952.48D6B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Strictly disallowing `busy-gpios` for `adi,ad7816` breaks the exis=
ting driver probe.
- [Medium] `rdwr-gpios` and `convert-gpios` are unconditionally required fo=
r all variants, forcing dummy GPIOs for 8-pin devices.
- [Medium] The `vref-supply` property is incorrectly allowed for AD7816 and=
 lacks a schema restriction.
- [Medium] The `interrupts` property is incorrectly permitted for the 8-pin=
 AD7818.
--

commit c95479a0b55dc8599b178909579f060bf75eb282
Author: Taha Narimani <tahanarimani3443@gmail.com>

dt-bindings: iio: adc: add ad7816/7/8 digital temperature sensor / ADC

This commit introduces YAML device tree bindings for the Analog Devices
AD7816, AD7817, and AD7818. It formally documents the required properties
and uses conditionals to restrict busy-gpios to the AD7817 variant based
on hardware capabilities.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> new file mode 100644
> index 0000000000000..48563e4eab446
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml

[ ... ]

> +  vref-supply:
> +    description: |
> +      Optional external reference voltage supply. If not provided, the
> +      internal reference is used. Applicable for AD7816 and AD7817.

[Severity: Medium]
Does the AD7816 actually have a VREF pin?

The 8-pin AD7816 lacks an external reference voltage pin due to physical
pinout constraints (power, SPI, CONVST, OTI), and relies entirely on its
internal reference. Should the description limit this to only the AD7817?

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - rdwr-gpios
> +  - convert-gpios

[Severity: Medium]
Are rdwr-gpios and convert-gpios present on all these devices?

The AD7816 and AD7818 are 8-pin devices whose pins are fully consumed by
SPI bus communication, power, and their specific analog or interrupt
functions.

Since they physically lack dedicated RD/WR pins, does making these globally
required force device tree authors to invent dummy GPIOs to pass validation?
Should these be conditionally required instead?

> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,ad7817
> +    then:
> +      required:
> +        - busy-gpios
> +    else:
> +      properties:
> +        busy-gpios: false

[Severity: High]
Will this break the existing staging driver probe for the AD7816?

While the hardware lacks a BUSY pin, the driver unconditionally requires th=
is
GPIO for both AD7816 and AD7817 during probe:

drivers/staging/iio/adc/ad7816.c:ad7816_probe() {
    ...
    chip->busy_pin =3D devm_gpiod_get(&spi_dev->dev, "busy", GPIOD_IN);
    ...
}

If a device tree complies with this new binding by omitting busy-gpios for
the AD7816, devm_gpiod_get() will return -ENOENT and the driver will abort
probing.

Can we address the driver dependency before strictly enforcing this in the
binding?

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: adi,ad7818
> +    then:
> +      properties:
> +        vref-supply: false

[Severity: Medium]
Should vref-supply: false also be enforced for the AD7816?

Since the AD7816 is an 8-pin device like the AD7818, it seems to rely
entirely on its internal reference without an external pin.

Additionally, does the AD7818 physically support the OTI interrupt?

The AD7818 sacrifices the OTI pin to accommodate its Analog Input (AIN) pin.
Should this conditional block also enforce interrupts: false for the
adi,ad7818 compatible string to prevent physically impossible device tree
configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530165917.5576=
7-1-tahanarimani3443@gmail.com?part=3D1
