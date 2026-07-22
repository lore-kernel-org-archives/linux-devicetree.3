Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E572133ADBF
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707557; cv=none; b=ChJEi/Y1Yw5EPapPQqy3dNbgDnCzPQ0xjH9REknBD81Z3I069ec2uOMrl4Lo9We6prplPROvZiMVgR2Ca/gBLc46484hRWW3z949XU5k5usrj10sHR1A9iVfLY0ntA2pAOpVjyoQnqS9OEYrEt7nh9dEDMYE/FKU6B0j0Jin1Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707557; c=relaxed/simple;
	bh=WEiwfVYcNbLGX7OZ8Sj2CWYiu9XYZvw1ktfrNMqWR60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ljW8P71pjl7W6Ht6Tj2jaP94jalbi3Sa4lqodgkKbafKY5DwMTpMgpSRbYWJ5suyzCt5+58tfK0ulbW7We3O9PrB7GWaV03aHeTRk3VdGgZNROu7hshv6rRax1fRg303Uo84O7ydDHDo1nuKrF8dSYTZQXjOeuFDHbTwJZZuGJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDsdn5yR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDsdn5yR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560FF1F00A3D;
	Wed, 22 Jul 2026 08:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784707555;
	bh=2UQyJZV6qA9sdKv7aB6MBCycYUhwIcCk3DbmLF2jB1Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDsdn5yRoRsO6SqAxPdGhLXijWpKERnt46XHplb4OUGv96zs0cYGq671yP1JSzig2
	 Y5NbUH7/PVuL9QkZcCWQmnVJsfcyBxhDVfJ5DO8wijxB+h6WavRnasjEEKXJyXNTLA
	 K1P4O6w0L/SX/HA6xqnySZuZ5QOeQ+XZnIiT6RdDBq/5TOBXjFL/tQEypqFhk8d3oz
	 eZ4FAVJcJfUell+2fmnfCYy5mLGaTB1+TTrJknQ8oLJsZaF5W0pJQpUA5axXrBiTsq
	 FSeZqShsmacjRqmL07gWfZId53GGnKeoIEp6edLpPKUM3kAJyadIax2/SqCrluxcji
	 ywQKYqGrDjv/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/7] dt-bindings: iio: adc: microchip,mcp3911: Add
 spi-device-addr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-ad5529r-driver-v7-4-7781cd74ad75@analog.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-4-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:05:54 +0000
Message-Id: <20260722080555.560FF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The dt-bindings update deprecates `microchip,device-addr` in favor=
 of the new generic `spi-device-addr` property, but the `mcp3911` driver wa=
s not updated to parse it. If a device tree uses the newly recommended `spi=
-device-addr` property, the driver will fail to parse it, fall back to devi=
ce address 0, and fail to communicate with hardware configured for other ad=
dresses.
--

--- Patch [4]: [PATCH v7 4/7] dt-bindings: iio: adc: microchip,mcp3911: Add=
 spi-device-addr ---
commit 9e6e246369fd97fd7587432780e30a16297f1eb0
Author: Janani Sunil <janani.sunil@analog.com>
dt-bindings: iio: adc: microchip,mcp3911: Add spi-device-addr

This commit adds the generic spi-device-addr property to the binding.
It also deprecates the existing vendor-specific microchip,device-addr
property.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> index 3a69ec60edb91..36da2bee1db28 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3911.yaml
> @@ -57,6 +57,13 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1, 2, 3]
>      default: 0
> +    deprecated: true
> +
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: [0]

[Severity: High]
Is the driver updated to parse this new property?

Looking at mcp3911_probe() in drivers/iio/adc/mcp3911.c, the driver only
handles the deprecated properties:

	ret =3D device_property_read_u32(dev, "microchip,device-addr", &adc->dev_a=
ddr);
	if (ret)
		device_property_read_u32(dev, "device-addr", &adc->dev_addr);

If a modernized device tree uses the newly recommended spi-device-addr
property instead of microchip,device-addr, will the driver fail to parse it
and leave adc->dev_addr at 0?

Could this cause communication failures with hardware configured for non-ze=
ro
addresses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad5529r-dr=
iver-v7-0-7781cd74ad75@analog.com?part=3D4
