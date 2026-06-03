Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF9E30148A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780515595; cv=none; b=dXTf1gUJyM2SqEnRjuyTRgr7McmLJYb6tVpg1OkXrF7DqiXNrbZTpst8PMo8xY2zUPk56sPlQ82/rd+Zsz41GKOFOegFoWRvR8Q74nCpZ5rUzIiFvIyaDx97IvgGnnwIpOyiGHtNfiPtZxWFt1F9BFYFwIHjhvGtXjW4HfIn7e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780515595; c=relaxed/simple;
	bh=Hl1lviby4C7lOBgxkI5/KhU8/mPwgyD8QSCAG3vMIqg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EbFz8AsWNHJPpRnZkr+vPjDydECt0TMCmhNdHEO60dAfF/HLDSR7HHGEi2s0Ryubx4BMxmj9RfkQazrdRUOenwzWCiI8XZ99o/oR/KKuB/LN3EpffeMOyLQ8kqEb2nTUsYo4RPyI1Z4iTuuzGR9zL+D22GLvi79w2/Si11u97IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQmrod55; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQmrod55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9771F00893;
	Wed,  3 Jun 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780515594;
	bh=m0rqIpqjDxNGshsU0wT2yaUd/FWI3So3A7UJTRmRqTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQmrod55WRK9ajm6AcNiegzGX52+i//UXD5gFv8B2X3guitcLT3OymlXqM4KYFuhC
	 2i0JxwDqFl2tJc776bItp13iG8Zc+xJ2gGoowALvh0SZyf9J1GlR11q9s10oAiJjvf
	 8IUBzaxPXED1ZXsRwOlSPRfH1JCtPUD4WqfyzzaBRs+tMVTQyVBi8TkiOuvN1PNxZE
	 FTjd7kR8y0OiQpjIZWiu73VPn57Af4JZpgB2M0lCaY2W8QYjclbglofHozpe8etgXw
	 Sn27Q88SFzFgPMaBDRXWuc75LPLARCXXQ6xGdQRuNFF4ukGAkVXbpYH/gHwP+d4U8L
	 Q1VklquErczdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] arm64: dts: ti: Add k3-am62l3-beaglebadge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603192305.1347908-3-jm@ti.com>
References: <20260603192305.1347908-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 19:39:53 +0000
Message-Id: <20260603193953.DD9771F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Driver-Binding Mismatch: The `mcp23s18` GPIO expander probe will f=
ail due to property size mismatch.
--

commit dda0de04ef0f2160008191753ea45cc6c9880fa6
Author: Judith Mendez <jm@ti.com>

arm64: dts: ti: Add k3-am62l3-beaglebadge

This commit adds the device tree for the BeagleBoard.org BeagleBadge, based=
 on
the Texas Instruments AM62L3 SoC. It includes configurations for memory, GP=
IO
keys, LEDs, regulators, MMC, USB, PWM, I2C, SPI, and other peripherals.

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts b/arch/arm6=
4/boot/dts/ti/k3-am62l3-beaglebadge.dts
> new file mode 100644
> index 0000000000000..ee2d562baf51a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-beaglebadge.dts

[ ... ]

> +&spi1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi1_pins_default>;
> +	status =3D "okay";
> +
> +	mcp23s18: gpio@0 {
> +		compatible =3D "microchip,mcp23s18";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <10000000>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		reset-gpios =3D <&gpio0 25 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&mcp23s18_reset_pins_default>;
> +		microchip,spi-present-mask =3D /bits/ 8 <0x01>;

[Severity: High]
Does this 8-bit property cause the driver probe to fail?

Looking at drivers/pinctrl/pinctrl-mcp23s08_spi.c, the driver attempts to r=
ead
this property using device_property_read_u32(). Because it expects at least
4 bytes of data, of_find_property_value_of_size() will evaluate the length
as insufficient and return -EOVERFLOW.

This would cause the driver probe to fail, leaving the MCP23S18 GPIO expand=
er
and connected devices non-functional. Should this property be defined as a
standard 32-bit value to match the driver's expectations?

> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603192305.1347=
908-1-jm@ti.com?part=3D2
