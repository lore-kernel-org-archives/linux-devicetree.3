Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A90165F1A
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 03:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158493; cv=none; b=LiLTeuXMZrnI7mE7UHuBHy+gtC/jE0lPyLH+wbXv1yJCKKYAZWiUvSaVwHu4rd7CxzMwsplgftIXNqy6wbkInnTk/ofDOgOvjvCEWUAUgsZVJi0FJwBHsOSelSsq7VKSYRQO6ugeYsSIF/vd7aydfC/Xl4YQtJPc0lTjhSHI4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158493; c=relaxed/simple;
	bh=5TYrsDRRH5fIfnRiTlF0WtlEaH4kFDmEfqEYBvkNla8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sV6zgbxcvxhUM2tzQxhZRKbIXddgBk40iWY33uWgopPtbWniZCFcBXt/d424xlydTZrgc9tmL2w0vTwj4fMRoX+uQ6srKdvoOIXqFIHLplhxB16c+TzPdC6byl0ACcxgRhAc1iSl4Mr2IrO06UElAXkI6Y58BXaxrtBq28/Nqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzFMqiop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzFMqiop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0FB1F000E9;
	Sat,  8 Aug 2026 03:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786158492;
	bh=Ii5yahzEDBYjBlHt3QoNEtQ+5bx9b2tqB0hgGA5f9kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QzFMqiopylRWqPnhDCQOGEynekKLP9ns3rN+j0RZpvw5O4U4lxlp7zwCxlxvrkQTn
	 PzTfUwIhIAaIH9ySnDwfsqVRPDJYoW7O8WyoStxdi/+to4WkgyVic2g+eliK8bLK+h
	 6f16kzBCDYr81VB0wggfYeSdtYd0jfABhW7BBuGK9kfWynRhHpR/zt3Xnw8bVYLpHB
	 Wrecj/sS9TDoPXZaQgO8TAsk9K5T2NxiJ1+1mMv5mu8+Xz2w6Ng7/jmnJb6d3K/e+V
	 XiCbhekWtDQ5aLCt3dPEuJiwlzx4fSN361827/1/9ZGv/AJgh6MRJo1PA9G68375PV
	 c63dfsLzZZ9Iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 03:08:11 +0000
Message-Id: <20260808030812.0B0FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Potential CAN controller freeze due to edge-triggered interrupt co=
nfiguration for active-low level-sensitive INT pin.
- [Low] Devicetree schema violation with non-standard node names for clock =
and SPI nodes.
--

--- Patch [1]: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for W=
aveShare 2CH CANFD HAT ---
commit b5cd8b12c94510c91e67da4257339818760852d2
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>

arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare 2CH CANFD HAT

Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD Expansion
HAT on the Retronix R-Car V4H Sparrow Hawk board.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-can=
fd.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dt=
so
> new file mode 100644
> index 0000000000000..de72680efa7c6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso
[ ... ]
> +&{/} {
> +	/* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +	clk_can0: clk-ws-2ch-canfd0 {

[Severity: Low]
Does this node name violate the fixed-clock devicetree bindings schema?
The schema typically mandates node names matching the pattern clock-* to pa=
ss
dtbs_check validation.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <40000000>;
> +	};
> +
> +	clk_can1: clk-ws-2ch-canfd1 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <40000000>;
> +	};
> +
> +	/*
> +	 * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +	 * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +	 */
> +	spi-ws-2ch-canfd {	/* SPI_1 */

[Severity: Low]
Is this non-generic node name likely to trigger devicetree validation
warnings? Standard devicetree practices recommend using the generic spi node
name rather than spi-ws-2ch-canfd.

> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		compatible =3D "spi-gpio";
> +		sck-gpios =3D <&gpio0 10 0>;		/* CN7 pin 40 */
> +		miso-gpios =3D <&gpio0 9 0>;		/* CN7 pin 35 */
> +		mosi-gpios =3D <&gpio0 12 0>;		/* CN7 pin 38 */
> +		cs-gpios =3D <&gpio2 13 GPIO_ACTIVE_LOW>;	/* CN7 pin 12 */
> +		num-chipselects =3D <1>;
> +
> +		can@0 {
> +			compatible =3D "microchip,mcp2518fd";
> +			clocks =3D <&clk_can1>;
> +			/* CN7 pin 18 */
> +			interrupts-extended =3D <&gpio1 25 IRQ_TYPE_EDGE_FALLING>;

[Severity: High]
Can configuring this interrupt as IRQ_TYPE_EDGE_FALLING cause the CAN
controller to freeze?

The MCP2518FD INT pin is active-low and level-sensitive. If a new interrupt
condition occurs while the INT pin is already asserted low, a new falling
edge might not be generated, causing the new interrupt to be permanently
missed. Should this use IRQ_TYPE_LEVEL_LOW instead?

> +			reg =3D <0>;
> +			spi-max-frequency =3D <20000000>;
> +		};
> +	};
> +};
> +
> +&msiof0 {	/* SPI_0 */
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	pinctrl-0 =3D <&msiof0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	/*
> +	 * Native MSIOF chipselect does not work with MCP2518FD
> +	 * because MCP251xFD driver needs to keep the chipselect
> +	 * line asserted between transfers. This requirement is
> +	 * fulfilled only by using GPIO chipselect.
> +	 */
> +	cs-gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
> +
> +	can@0 {
> +		compatible =3D "microchip,mcp2518fd";
> +		clocks =3D <&clk_can0>;
> +		interrupts-extended =3D <&gpio1 26 IRQ_TYPE_EDGE_FALLING>;

[Severity: High]
Similarly, can this edge-triggered configuration for the native MSIOF CAN
controller lead to missed interrupts if the active-low level-sensitive INT
pin is already asserted when a new interrupt arrives?

> +		reg =3D <0>;
> +		spi-max-frequency =3D <20000000>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808025724.1319=
43-1-marek.vasut+renesas@mailbox.org?part=3D1
