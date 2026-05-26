Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D2F3C140D
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830607; cv=none; b=nydKYUxqROcgjg7HYrU6X6U4LX8xcUQvCY6Dv28EozAh6n3hG8uw+pkci4iNKDerjSCSkoU0GNqws5sbzlkm9jkZwqtgLvxskHfSF557eS9K/FnQfdZGMCYvCssbBsqSXKh+TKgVrH/wjWdccHSLA/12FgfVsT/QBH3oLjxAniw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830607; c=relaxed/simple;
	bh=DsvXdMa0WCl87GxgcSXIbd/hTc3CegQO4+efQVuS2Ak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nEFNibIDXnvYRCKRG6lz+oZJMmMKY4ip1WxyDxJME9tnbpZuWJorsEwobIIo9RIzHxVfPu96tvhvhG47rwJ5YMemMgZA9YZG/OBOYavTuh2N2CqcNaEWRN1Eq6VWZcWQNWKyTuktYTJwi4ieo7kqiOacdCpHVjkLsE6Iw61p8RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEe9J4Fi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEe9J4Fi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EF31F000E9;
	Tue, 26 May 2026 21:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779830606;
	bh=T9siKw/U1zx4d3iUGndgAJbcN9oFhWM0yKaxxaC0LGo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEe9J4FiXtJUyBgSYMq4tZevB71ZW4L7m7WI83q+6ADFl51QTFUSFLNrXtC3xhQ0d
	 /MIJ5C/3pSgA6JPcstEb/H+ZGSm/8PvIImdy3SD9g3b/Spo3kvWHZqf7Gh3rl5YrfE
	 R3IOMaT7IEFF8UhrOWyCKX51ogwQGfgq/6MeknUQ2jWNgI4rO5Z/h2zrt3J6KZlt0N
	 X6tO6qFwVVh3kN/Ayh+mV6SxIvlVlH/xzifvxmgejRshLUnRpMcgZoCN+fLErh/w2U
	 uFf9/gYyA58CbR8cPGw7RNaPLJaNYBko/Uk6REqPI83+cATpAmv47YkVON1lBWOaN+
	 xHC6HU600zz9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526204045.3481604-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260526204045.3481604-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 21:23:25 +0000
Message-Id: <20260526212325.D9EF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The 'spi-max-frequency' property is missing from the SPI NOR fla=
sh peripheral nodes (flash@0) under both xspi0 and xspi1.
- [Low] The unit addresses in the partition node names for xspi0 do not mat=
ch their corresponding 'reg' base addresses.
--

commit 61aa7aa9a0a6654d6fbf30169801908b8247d8cd
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

Enable the xSPI0 and xSPI1 controllers on the RZ/T2H N2H EVK board.

> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index f87c2492f414a..fff63d08e3a3c 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi

[ ... ]

> @@ -395,3 +451,86 @@ &wdt2 {
>  	timeout-sec =3D <60>;
>  };
> =20
> +&xspi0 {
> +	pinctrl-0 =3D <&xspi0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	assigned-clocks =3D <&cpg CPG_CORE R9A09G077_XSPI_CLK0>;
> +	assigned-clock-rates =3D <50000000>;
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;

[Severity: Medium]
Should there be a 'spi-max-frequency' property specified here?

Standard SPI peripheral Device Tree bindings require the 'spi-max-frequency'
property on child nodes to explicitly specify the maximum SPI clock speed
the device can tolerate. Omitting this property will cause 'dtbs_check'
warnings.

Furthermore, without it, the SPI core framework initializes the device's
max_speed_hz to 0, forcing reliance on the controller's internal clock
fallback behavior.

> +		m25p,fast-read;

[ ... ]

> +		partitions {
> +			compatible =3D "fixed-partitions";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			partition@0 {
> +				label =3D "bl2-0";
> +				reg =3D <0x00000000 0x00060000>;
> +				read-only;
> +			};
> +
> +			partition@1fb000 {
> +				label =3D "fip-0";
> +				reg =3D <0x00060000 0x007a0000>;

[Severity: Low]
Does this unit address match the first address specified in its 'reg' prope=
rty?

The Device Tree specification requires the unit-address (the part after '@'=
) in
a node name to exactly match the first address specified in its 'reg'
property. Here, 'partition@1fb000' defines its base address as '0x00060000'.

This mismatch will trigger 'unit_address_vs_reg' warnings during device tree
compilation.

> +				read-only;
> +			};
> +
> +			partition@300000 {
> +				label =3D "user-0";
> +				reg =3D <0x800000 0x003800000>;

[Severity: Low]
Does this unit address match the first address specified in its 'reg' prope=
rty?

The Device Tree specification requires the unit-address (the part after '@'=
) in
a node name to exactly match the first address specified in its 'reg'
property. Here, 'partition@300000' defines its base address as '0x800000'.

This mismatch will trigger 'unit_address_vs_reg' warnings during device tree
compilation.

Additionally, does the size value '0x003800000' contain an extraneous leadi=
ng
zero?

> +			};
> +		};
> +	};
> +};
> +
> +&xspi1 {
> +	pinctrl-0 =3D <&xspi1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	assigned-clocks =3D <&cpg CPG_CORE R9A09G077_XSPI_CLK1>;
> +	assigned-clock-rates =3D <50000000>;
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0>;

[Severity: Medium]
Should there be a 'spi-max-frequency' property specified here?

Standard SPI peripheral Device Tree bindings require the 'spi-max-frequency'
property on child nodes to explicitly specify the maximum SPI clock speed
the device can tolerate. Omitting this property will cause 'dtbs_check'
warnings.

Furthermore, without it, the SPI core framework initializes the device's
max_speed_hz to 0, forcing reliance on the controller's internal clock
fallback behavior.

> +		m25p,fast-read;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526204045.3481=
604-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D3
