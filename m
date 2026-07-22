Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12638A72C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707531; cv=none; b=iSxMjGXw//+QqUx9bb4u/uXyGV9ZwNsI5W0IevblEXrVhrNrSu8HETeecyjCrLRNdueBPG0f9i3vi7QHwjmdZkttE2BYZ7kZRk0W2C2R9HfZUa8uuXmWFds2HYRbNNjAxOlb5L52vPYl3yvY57e6X1/znDxwhGXuVyGU6ksOvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707531; c=relaxed/simple;
	bh=Qlj02uqGakQDAUSpw//v+mag3l7FkwVhcvv59Qf0058=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aqSOCvyWTjKJ69Y5dHwJsZ33En1HsdxgnZ3XJntA95GHLfenwjP8HBchzxjNcoXllzbmbg6zM/om1+6VOuOt34bvfuKP3qoe50qZl/XlBewd3VCNuldFo4C0m8XZIVTEnSkTMImTUsSf7E2VlLrAyn262OA0J4oljBUO6c4GNGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYgKyw1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYgKyw1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829941F000E9;
	Wed, 22 Jul 2026 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784707529;
	bh=6arUth0R48+6VEyMhow5nCpJ3esZl38NWhSMlzjBq78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EYgKyw1tFLrbjUsarHgeVItH/zAMnQsVriAOSoFo/aKMUct2wJ7zBE4/Cjy4aHpLK
	 AjK+ZFzOzdGlt+2c+DXTbArPJ5y4RySdTrzD6e9SpVPBMMdx4NhbieHlYh+UJFWltW
	 9CfjIIAjxrKjaqaaDEcpe32tgPExbfrr5IaDfJ6dq/pZcR4pFlSg+ZQkoqHwp8c6YI
	 4Ep4SlA9aIEQAi4e0/65M51+RW3xxUxel71lZfRWqvzc4jSSnwFIm2xhoePBNBGuPV
	 kOJ2AL68UCmlmlrjcvQ+BJ/XIUqRN0HFvd36cIRI1mhtxhYr8EIX2FRk2V+13phLKb
	 sktB4aLuO9Q1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/7] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:05:29 +0000
Message-Id: <20260722080529.829941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The dt-binding introduces `spi-device-addr` to replace the depreca=
ted `microchip,hw-device-address` and removes it from the required list, bu=
t the driver has not been updated to parse the new generic property.
--

--- Patch [2]: [PATCH v7 2/7] dt-bindings: iio: adc: microchip,mcp3564: Add=
 spi-device-addr ---
commit a3bb549053e31953c445885e8d6cb1988514c7b0
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: adc: microchip,mcp3564: Add spi-device-addr
   =20
This commit introduces the generic spi-device-addr property to the mcp3564
binding. It also marks the existing vendor-specific=20
microchip,hw-device-address property as deprecated and removes it from the=
=20
required list.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> index 6753192761971..de1ea289e7f52 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
[ ... ]
> @@ -91,6 +92,12 @@ properties:
>        clocking of the device address (BITS[7:6] - top two bits of COMMAN=
D BYTE
>        which is first one on the wire).
> =20
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: [1]
> +
>    "#io-channel-cells":
>      const: 1
[ ... ]
> @@ -123,7 +130,6 @@ dependencies:
>  required:
>    - compatible
>    - reg
> -  - microchip,hw-device-address
>    - spi-max-frequency
> =20
>  allOf:

[Severity: High]
Since the old microchip,hw-device-address property is removed from the
required list here and replaced by spi-device-addr, does the mcp3564 driver
need an accompanying update to parse the new generic property?

Currently, if a device tree author updates their configuration to use the n=
ew
spi-device-addr property following this binding, mcp3564_config() still
explicitly checks only for the deprecated property and will silently fall
back to 0x1:

drivers/iio/adc/mcp3564.c:mcp3564_config() {
	unsigned int tmp =3D 0x01;
	...
	device_property_read_u32(dev, "microchip,hw-device-address", &tmp);
	...
}

Could this cause hardware state machine initialization and SPI communication
to fail for any device physically strapped to addresses 0, 2, or 3 if they
drop the old property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad5529r-dr=
iver-v7-0-7781cd74ad75@analog.com?part=3D2
