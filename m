Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8900F3382F4
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786699299; cv=none; b=r5he6EBU8SV7PTWFry5UQbV6EGy5V2QKzErALHgfarwlVVA8uQN5uK1LmB3xgNl1Q9rtph3SW16Y6kbK8/NSiMO8jnIWyPMBa/vbw0BBOBbbw6Dx74xeDKNVzEm2sXT9pd4D9kMIQ6UPvYcowzLhgKcR2mXG/KkBOoHYQcl8xH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786699299; c=relaxed/simple;
	bh=F3XPN48LFbBaEq7zQjGvUnRNGtF8Xvu/SUwsgoakoaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OyXIP+WYLLXhikyZjy+0mb4cEGg7azYuX1JSWp1St7d7XC5tTbcQMliF58L41GtUzHfHcPxxs2CmS0oJ38nJs/tdIphOyIfXzboIJ0Dvflxio6C/z6V59GQ2B4etNGaO5dv+abj+D5unAA8kTWkZQGEO2bbzTuOEoyWHWnLvm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jg9s+WGl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jg9s+WGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38071F000E9;
	Fri, 14 Aug 2026 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786699298;
	bh=+k6lz5wITIjgCMlv0GmnSzyUs9K7G705sJVOVK7tJN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jg9s+WGlonZZ7vPhUF+zERNYcHA+ZVS1EYatf6wnSCIF5z1DrUbOFoHZNpuP7lyjf
	 XFotqM4mjEh0qzJagc4pLm63kbG7NOvIQP/StCVxNaGmDs+6YnrWiwog7e07R9wU6y
	 1uyZ0Hjs8jKz1Uy1hgS6eGXyL5nyuR6j92y1aIK342kXG3B/Wm8/1n+5exlCQIMwQW
	 ehpX8YWB+tEqyykUSt9ZWCY5v2yp7maluJxgZdqWprP8G4ty3Iu+1ekRpU7K5nDFWf
	 pWl7YDIOWE1oY2xaKYcaSmGDintvx7Q795Wo8b8RpFJhR8qY45su0mgwBnwZgtPSVm
	 uxtOLCh1hbVyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] spi: dt-bindings: microchip,pic32mzda-spi: Convert
 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Udaya Kiran Challa" <challauday369@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260814083221.34606-1-challauday369@gmail.com>
References: <20260814083221.34606-1-challauday369@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 09:21:33 +0000
Message-Id: <20260814092137.E38071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema incorrectly restricts `cs-gpios` to `maxItems: 1` and=
 makes it strictly required, breaking multi-device and grounded-CS SPI bus =
configurations.
--

--- Patch [1]: [PATCH v4] spi: dt-bindings: microchip,pic32mzda-spi: Conver=
t to DT schema ---
commit fca958be633f7ae75e390f0bb61a2c6c29a85193
Author: Udaya Kiran Challa <challauday369@gmail.com>

spi: dt-bindings: microchip,pic32mzda-spi: Convert to DT schema

Convert Microchip PIC32 SPI controller devicetree binding from legacy text
format to DT schema.

Link to v3: https://lore.kernel.org/all/20260617101009.148851-1-challauday3=
69@gmail.com/
Link to v2: https://lore.kernel.org/all/20260615115311.515404-1-challauday3=
69@gmail.com/
Link to v1: https://lore.kernel.org/all/20260614175005.435826-1-challauday3=
69@gmail.com/

> diff --git a/Documentation/devicetree/bindings/spi/microchip,pic32mzda-sp=
i.yaml b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml
> new file mode 100644
> index 0000000000000..2ef3480fa63e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/microchip,pic32mzda-spi.yaml

[ ... ]

> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: mck0
> +
> +  cs-gpios:
> +    maxItems: 1

[Severity: Medium]
Does this limit the controller to a single device? The legacy text binding
explicitly allowed multiple pins to be used for chip selects.=20

The SPI core in drivers/spi/spi.c supports multiple devices by dynamically
expanding the number of chip selects if multiple GPIOs are provided. Setting
this to a maximum of one breaks valid multiplexed SPI bus configurations.

> +
> +  dmas:
> +    items:
> +      - description: RX DMA channel
> +      - description: TX DMA channel

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - cs-gpios

[Severity: Medium]
Should cs-gpios be strictly required?=20

Making it mandatory breaks device tree backward compatibility for valid
hardware configurations where a single SPI device's chip select is permanen=
tly
tied to its active state (e.g., tied to ground). In such tied-low
configurations, no software chip select toggling is needed, so the property
is legitimately omitted from the hardware description.

> +
> +unevaluatedProperties: false
> +
> +examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814083221.3460=
6-1-challauday369@gmail.com?part=3D1
