Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876984A64E6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531688; cv=none; b=OIGuiPVZ/V+3emgcWM91e0tjUW55ypcwtU+CkcXuRYcJ0W6NGruwoWdM+2nyVh/Nj2YUMwiERlB7qXoeY4iJygSu403LJTjbyvWbrn5MVm+3kHnOCdpz9IcmxE0R4oCLeRrQ1Iqxz1iSjrt0RLP0EY1hnnIVk8k3nF4PAaD025A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531688; c=relaxed/simple;
	bh=slIZAtuLaOWC+2W7tZ3v6jQ7tW17VnTS2EbwZIRkILI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u0UrXsXYQqqKfZ0R2KLRukK+JcPmcODN4n6L+A48Hc2st11qO3vYxH21iEmeCY0joAKehothJfsxFOvwX26rH0zwYwGVoe+t2mChuw6dFQaMtrUsEW1RoyEHaIZ0z4qakQp9lQBNxTinLf57TRpSkuFQa0zj1sVx3IVNGBn0qsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJHao4KV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJHao4KV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD79A1F00A3D;
	Fri,  4 Sep 2026 14:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788531687;
	bh=0owbcLwIlK4V3v+hmRwR3iLNBUEcZoQrMUlrx0Bi6XI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJHao4KV0MmfzwxKTWyQULcJY/88ZyKVrInT6HtGmJR2YYlVyg/ccURpadnJB1mTx
	 6t/af6JiCJ6J7c2ec0Wpj4L3EzxZmaeuCgTKxff9JEn8XDGbNRpXTjd2PDdyUBsdWo
	 paOaCY23nVI52D/B54cYMu6QQAWrzqN3kLmZCROy7NlhfFf6yhjp2haobEBqpdPhaG
	 JQLNA5OGGy+EZW2+cGB0RIWkQLnca4KTu9+IpJZA+yLhAMrrmea+laUSJm/26ZzLPu
	 74wBp4rnLNi6ZrCPQmGBZC+Kmn/XgiZlG0o8llilrI5VFykk8ToPwO8G3OogPg6leU
	 FwKZt4pjkqmxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/17] dt-bindings: iio: adc: Add AD7768
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-ad7768-driver-v6-2-e4378f946bfb@analog.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-2-e4378f946bfb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:21:26 +0000
Message-Id: <20260904142126.DD79A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding defines properties for a GPIO controller but fails t=
o include `gpio-controller` and `#gpio-cells` in the `required` list.
--

commit bc42d987ad118f0b1686ed33657b36a45a4a5392
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: adc: Add AD7768

Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
simultaneous sampling ADCs.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml
> new file mode 100644
> index 0000000000000..d8e489fa1f6ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768.yaml

[ ... ]

> +  sync-in-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the SYNC_IN pin. Receives the synchronization pu=
lse
> +      generated on SYNC_OUT in response to a START pulse. Must be synchr=
onous
> +      to the MCLK clock domain. In multi-device or daisy-chained systems,
> +      two successive synchronization pulses must be applied to guarantee=
 all
> +      ADCs are synchronized.
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  adi,data-lines-number:

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - avdd1-supply
> +  - avdd2-supply
> +  - iovdd-supply
> +  - ref1p-supply
> +  - ref2p-supply
> +  - io-backends

[Severity: Medium]
The binding defines gpio-controller and #gpio-cells earlier in the schema,
indicating the hardware has GPIO provider capabilities. Should these=20
properties be added to this required list?

When hardware acts as a provider, the subsystem guidelines require the
corresponding standard properties to be explicitly listed as required.
Without this, incomplete device tree nodes that omit the GPIO properties
will silently pass schema validation, which might lead to runtime failures
if dependent devices attempt to use the GPIO functionality.

> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-ad7768-dri=
ver-v6-0-e4378f946bfb@analog.com?part=3D2
