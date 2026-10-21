Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548519;
	b=X9mf/Hu+lG76MZgrNeP9L4YSNP1GDBErGREjfJMkT7NYUmGvy658UNL4YFErX5yrL1Oy
	 2L6gUfeE0Wqjsaf/Vbh693xJUThPQWpMlKfjjq2h07jk/kEPvB38VQplYK+IpsHaz/2v2
	 bEruiNbgAYf7OmOBJLZ4Yf3JaTzBqBE2kGfpObWAcWO7sNeiNQGUXqmEk6Z0VpTnY2GGC
	 alYzxIPafylhJlAom2Ym8C/6xqW80Bacy/51hNo38AwONkFmXXixdjQTxJKxpv16n2Y+U
	 2C2/+nJw1BCBPTywCdvrB2cyl1GkjlZwjbMLj1uEfkLqE0+DTZUR1SXZRyClS0hSgxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548519;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T+ddyWOAwGYNPU/DygfD4MEKraUkNTmlPq/uzGCPY1I=;
	b=qib7dq4LlURkQ7ibNIqlVCir2foX+cSstG29OHgYXyxAp3Uybml6G58ePjkJln/JRlEk
	 rZIKrEOY80HGBf3uj6GFAnWO+0GXPAkGZL7ZFsSQQT9d+/X6RMNScJNT3tiWErFXbLpIw
	 msxY9K15+87VGdWlsB7/Qx5Qp4WZUaZ5Ub4WQHJKomAo+vLi+kBNrKydPYxFL5NvtaGMH
	 Ag4hqW8jxVOvIqcmSWmQoe4FDNJIxjTfScSIdUB7V3aiQPPOXddZhO4CNXBbURGnqnLVN
	 I0lIJULoF722b5oOv+43Q9D6TyXjXMTwUgAwdDuhF6SashYd2EJPRIJjxC31qOKBRWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgqdXLjv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E0606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MgqdXLjv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E996F1F000CA;
	Wed, 21 Oct 2026 02:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548518;
	bh=T+ddyWOAwGYNPU/DygfD4MEKraUkNTmlPq/uzGCPY1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MgqdXLjv+SD8Jke2F6WTyd3BkJgjyVbJv+nRUJBPit8wLCT2zB5jIaSV/Ghetp9Yc
	 FeP801GB2elHB2A7+qZYPPho6w2abTWY/Esn0YoiC59XKU0I5QUXkiC9rbleiMCgDT
	 dt7JpjVkjLiqJWAdkptliq6fJETfj2CFP4gKdaW8MbYzf4Ekv6NllYx7fug50mrfKh
	 lQ7BTCsBMmfAVgLEsnDERGU5nQPlZIT5M+e0gR9ZQk+8e1WU4FIOQY9CrZMpR5PrnG
	 AVHARpNTVTqktY2XQ3blEuZx8RYS5gF+EobEjbm8cOszNhGFgqavn/wrJWzz2dv9OE
	 YRTP67ikckWjQ==
Message-ID: <sashiko-outbox-179683@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: iio: adc: ad7768-1: Document
 multidevice support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonathan Santos" <Jonathan.Santos@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <6e2176d5547c59c39bb692e9768d7ac079b40f71.1792435248.git.Jonathan.Santos@analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <6e2176d5547c59c39bb692e9768d7ac079b40f71.1792435248.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 02:08:37 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: iio: adc: ad7768-1: missing schema constraints on spi-=
rx-bus-width
--

commit 6ac23a15419b8807e67f7b54e0a33ca605e1e6c8
Author: Jonathan Santos <Jonathan.Santos@analog.com>

dt-bindings: iio: adc: ad7768-1: Document multidevice support

This commit updates the adi,ad7768-1 device tree binding to support
aggregating up to four devices on a single spi controller using multiple
reg entries, spi-rx-bus-width, and spi-cs-composite.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml =
b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> index 7b72d14e104c2..64c1cbeaa5762 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> @@ -26,7 +26,10 @@ properties:
>        - adi,adaq7769-1
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      Chip select number. For multi-device setups, one entry per device.
> =20
>    clocks:
>      maxItems: 1
> @@ -109,6 +112,12 @@ properties:
>    reset-gpios:
>      maxItems: 1
> =20
> +  spi-rx-bus-width:
> +    description:
> +      Bus width per CS. For multi-device setups (multiple reg entries), =
one
> +      entry per device must be provided. Required when reg has more than
> +      one entry.
> +
>    spi-cpol: true
> =20
>    spi-cpha: true
> @@ -203,6 +212,16 @@ allOf:
>        properties:
>          pga-gpios: false
> =20
> +  # Required properties for multi-device setups
> +  - if:
> +      properties:
> +        reg:
> +          minItems: 2
> +    then:
> +      required:
> +        - spi-rx-bus-width
> +        - spi-cs-composite
> +
>  unevaluatedProperties: false

[Severity: Low]
In Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml,
properties:spi-rx-bus-width only adds a description without constraining
minItems, maxItems, or the per-item value. Because this binding references
spi-peripheral-props.yaml, spi-rx-bus-width inherits an unbounded
uint32-array allowing values from [0, 1, 2, 4, 8] even though each ad7768-1
device uses a single 1-bit data lane and at most four devices can be
aggregated.

Also, in the allOf conditional block for reg with minItems: 2, the then
branch marks spi-rx-bus-width and spi-cs-composite as required, but does
not require minItems: 2 on spi-rx-bus-width or disallow spi-cs-composite
when reg has only one entry.

If a device tree node for adi,ad7768-1 specifies multiple reg entries with
only a single spi-rx-bus-width entry, or specifies unsupported bus widths
or more than four lanes, it will pass dt_binding_check and then fail at
probe time in devm_spi_new_ancillary_device_with_lane() when rx_lane_idx >=
=3D
spi->num_rx_lanes.

Should properties:spi-rx-bus-width specify minItems: 1, maxItems: 4, and
items: const: 1 (similar to
Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml), and should the
allOf entry enforce minItems: 2 on spi-rx-bus-width when reg has
minItems: 2?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792435248.gi=
t.Jonathan.Santos@analog.com?part=3D2
