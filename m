Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602534;
	b=5kkxWPhTyiE8L/AqukyzvEYsRuJb1zZJw/sU3R9nHZqjQ7mBZdYtEL8knVd42mlVmwbf
	 Wgv2e5RPasCZjQJWT5G/OVlpSu2KdE+bz844E1HMJSsE52fQa6yYrzyM8yIrvqrVXG3X6
	 OZFzUaoyUANfvsMtHnTl8AaHEsssbe4wjPrCMXuqskVJcW2fPiXbbODLiTEyb8o5Nirlo
	 wkCSQCO+wAmZZNHljI3atAt6aJ5z2bXAwej3666F5YIsHWhjOGQBHPUVRx6vGzXFN6FOF
	 UgS+cQ4eefjGKSFasayUgYtfcC0j9B1MMG+qxvQv0Yd91M+fhQU69pMRgNWSNHq8rSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602534;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J0CieMNiVDys8o2ZoDyaXhwprb45agbi/GcrfD6eBrw=;
	b=5O3OaIY8UalrwRAkHI7A4x4CMo3g3J7ynX1HJ+QaGqwUjAoQyKgmvWdBRKY/TgL1LfM8
	 zBnQ/75eIwbHwDmUYr66Mrt1rG0UQvOep0ETAMWf+w1gc2/DLKp1ON7Q486G8rEHkwo/m
	 rCDVV0t6nGoUr7cGhecdYRs5qDanyy8e3duczpE5NA6rbe3UB2/RreKI3sagCK1hsU93K
	 +MWmrp5BT3LKrkIgLubIzT0rzdRvMVWBHT8Un9MEOuy9j0hmlryDSk7kt0LzP95Se4bbl
	 J81ez2ml7ZAobim3aZD7VJ0k8jffKI7veRm0erfpckHfxGF/ufgn5iu5IkDL1kjaM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEFthO1W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86920606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEFthO1W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065A91F000C6;
	Wed, 25 Nov 2026 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602534;
	bh=J0CieMNiVDys8o2ZoDyaXhwprb45agbi/GcrfD6eBrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEFthO1W8G8r5YNLpHEnGZOu61GBWe+KhpB09NK+jhhr6RUdNMIWfoHJlWzL2N/di
	 z2JDS+/YWkxl4qt+jdk8R+ed6O4/zNE2SoJi6aSVm3QLe1Y3n1A6hCbSZgAl9/sz1k
	 6oWeF1Meu/bbGz+Pslg1wQ7VrO+lZ6SC+GlYxMOki9dwQhcyaFKXIez+0oxGWQE6pI
	 ddbhMRo0xgJzebS9t3d6VeyeSWU2RhQ/dBeVUaOiYdQWmIq2zamAmsTgmJMayBgog3
	 t9KVAmNrpHHO3N6n9X6AveRQMWk9eQiRdg3a6+9t6oCPk7exdjyDbf0Ndp8DebgwrX
	 R2HDzF/L3bqaw==
Message-ID: <sashiko-outbox-233123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: iio: adc: add AD7793 and similar ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-iio-adi-legacy-platdata-v1-5-54e4c8830b57@analog.com>
References: <20261125-iio-adi-legacy-platdata-v1-0-54e4c8830b57@analog.com>
 <20261125-iio-adi-legacy-platdata-v1-5-54e4c8830b57@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:28:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: iio: adc: interrupts listed before clocks in
  adi,ad7793.yaml
--

commit a644054890dbc9f4a727627a933313f4001d68f3
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dt-bindings: iio: adc: add AD7793 and similar ADCs

This commit adds a Device Tree binding schema and MAINTAINERS entry for the
Analog Devices AD7793 and related sigma-delta ADCs.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7793.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7793.yaml
> new file mode 100644
> index 0000000000000..c4a0be06e5c0d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7793.yaml
> @@ -0,0 +1,236 @@

[ ... ]

> +  interrupts:
> +    description: Interrupt connected to the DOUT/RDY pin.
> +    maxItems: 1
> +
> +  rdy-gpios:
> +    description:
> +      GPIO reading the DOUT/RDY line. DOUT/RDY also toggles during SPI
> +      transfers, which usually triggers spurious interrupts. Reading thi=
s GPIO
> +      allows to tell those apart from real conversion done events.
> +    maxItems: 1
> +
> +  avdd-supply: true
> +
> +  dvdd-supply: true
> +
> +  refin-supply:
> +    description:
> +      External reference applied between REFIN(+) and REFIN(-), or betwe=
en
> +      REFIN1(+) and REFIN1(-) on the AD7794 and AD7795. If present, it i=
s used
> +      as the ADC reference. If neither refin-supply nor refin2-supply are
> +      present, the internal 1.17 V reference is used.
> +
> +  refin2-supply:
> +    description:
> +      External reference applied between REFIN2(+) and REFIN2(-). Used a=
s the
> +      ADC reference if refin-supply is not present.
> +
> +  clocks:
> +    description:
> +      External clock connected to the CLK pin. Either 64 kHz, or 128 kHz=
 in
> +      which case it gets divided by 2 internally. If not present, the in=
ternal
> +      64 kHz clock is used.
> +    maxItems: 1

[Severity: Low]
This isn't a bug, but in the canonical DT schema property order, clocks
comes before interrupts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-iio-adi-le=
gacy-platdata-v1-0-54e4c8830b57@analog.com?part=3D5
