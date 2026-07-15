Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80994448CF0
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116207; cv=none; b=i1HygRGSghS7yYnABmL0Yg7pxk9LDv3whn+ZfhRMkGISpkwTE8i2FsySvUtuX2WfjMe0iS/TtOmYKg/KFdfz1od2w7g5tCeieqNK0UTFYaA27pIO6epqPKtwWc/xoDqWSZX086x7ErhzHX0JxMDISCpJY555Na69tN7qFyG7690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116207; c=relaxed/simple;
	bh=Yf1BIY/vSknlVoJsDkyTJA7s2g2eK/ws+xJgdhLjugs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R+yINluAuweoQGRJTEyp0pu2IaPtofJFF94e+rlHYJghShVnvdSrJyDyw70c6/un65irjiSa+wk9DI/ZbVXr5tZOo72y+cBOUTKcX65dDaqlCQ9432eWs0m9bXu85PV9ejKHI2Y/COm+4kUj0lD2Jj6dHenUeWmyWZMwtJLXp38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrzGA+8o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrzGA+8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AA31F000E9;
	Wed, 15 Jul 2026 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116205;
	bh=mb8afvFP6bDPUNnd2HCD5hjk0V37axigim6Lb/PkRMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrzGA+8oPEdZzjApaPl0sAHT8H56eI4g+T2y7BWQSWblwfVgcmuMc1lgZyCPIgr6f
	 ZJh+ERmOqdyxzJ8VJCc8pm/OdQmAm11FrqzkJF+jXOpo/skW4xXuiVXHzDxn4wF+cY
	 W2UiHbA4t1ir0rscZToplH1zb7biS6kshG6pQQ01fj7yCnTjtov7O1dL8vd6ZwCvVC
	 6/ukaNqpE8iMGLU51TXuG5VRr73mAm8POvjgbcqugWLqi0qkFYFqx+QalR2e+H5RHC
	 6erc8YfeKNWld8xACbYXbXO7zeNAfINaqsFTsltz4XLrj868sLwOCrR0COJ39mI6t5
	 GNXq304QLXwQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-ad5529r-driver-v6-2-cfdf8b9f5ee3@analog.com>
References: <20260715-ad5529r-driver-v6-0-cfdf8b9f5ee3@analog.com>
 <20260715-ad5529r-driver-v6-2-cfdf8b9f5ee3@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:50:04 +0000
Message-Id: <20260715115004.C2AA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The mcp3564 driver is not updated to parse the newly introduced ge=
neric `spi-device-addr` property, causing it to silently default to an inco=
rrect address if device trees are updated to use the new property.
--

--- Patch [2]: [PATCH v6 2/5] dt-bindings: iio: adc: microchip,mcp3564: Add=
 spi-device-addr ---
commit 63ce2b7ebde9aedefae19c7bc6bdc66fe833659e
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: adc: microchip,mcp3564: Add spi-device-addr

This commit adds the generic spi-device-addr property to the binding and
deprecates the existing vendor-specific microchip,hw-device-address propert=
y.

> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.=
yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> index 6753192761971..02bb198e9fa73 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
[ ... ]
> @@ -91,6 +92,11 @@ properties:
>        clocking of the device address (BITS[7:6] - top two bits of COMMAN=
D BYTE
>        which is first one on the wire).
> =20
> +  spi-device-addr:
> +    maxItems: 1
> +    items:
> +      enum: [0, 1, 2, 3]
> +

[Severity: High]
Has the mcp3564 driver been updated to parse this new generic property?

If a device tree is updated to resolve the deprecation warning by replacing
microchip,hw-device-address with spi-device-addr, it looks like the driver
will fail to parse it and silently default to address 1:

drivers/iio/adc/mcp3564.c:mcp3564_config() {
    ...
    device_property_read_u32(dev, "microchip,hw-device-address", &tmp);
    ...
}

If a device uses address 0, 2, or 3, wouldn't this break SPI communication
with the ADC?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-ad5529r-dr=
iver-v6-0-cfdf8b9f5ee3@analog.com?part=3D2
