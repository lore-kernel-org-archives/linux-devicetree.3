Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE54DE712
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592249; cv=none; b=XYgjlqJNbIj9W87uV8jKVyuAxnJnaiwzVlZ9Sm5Z5/wEWCf0I8/fPg0Ne1W5UHtt4N/CYL0bIiuY9NwdLASUeA3OhZP6Pwx6OzCGCwWsbRzfQTdjeqSRyskxut5nSwe/bM66qwDcnlM9ccVvZozx3M+1GzRS6K1W0b9XVIc3kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592249; c=relaxed/simple;
	bh=7tVGP7L48hOA48g/e768bd2I2t2l06juNh1dyYts8Hk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q47wkpBATqyTqkq3/9vQgZvnPqjbiEXElpOWz09Ksdmh/MZa9YUpXO/T/GCiLPtUggD+WDZatouoVkypjE+RgJ2QXBqHkwVjst8lgB8t5J2SUpuvZMJG8iG0xKa0WfnOzObPEGet4PRdV4UIArVCtQ67T5QDgR6H4zQl7tT8Pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR2dwZuC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR2dwZuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307311F000FF;
	Wed, 16 Sep 2026 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789592238;
	bh=UkOIxedOim3UpPseLtMEFVar54O6iRa/9oXHiK/X/AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GR2dwZuCruetmeryinA0F698CGA/ZqY7N3jyTiMmmzkkLrvLCyrXgymRz5sAsaabx
	 A2kxaBfk6lVUhVBukzZItmV8LX9kG2jfN9LaPle50DctbHThNOzOjrpS4it0ZVYcNh
	 W2cbgqtnrs661+V7eDARebOq+uQplbENwAlRgRt2GpvGMIZBzDsnFYcfwhq/IqdYYD
	 2pxHg1TFHwof50/zgFD2aDEZObxEqgAcJPY40LnzSOWLgXi8rCSsxU3VGaPjXQcXHq
	 XTeJl/5DXJzn8efZuBHiuA9XSYRrleu5m7oLUytp/o3NJn+UoP2Y9zvUonpQKYcZnK
	 OjO/mCNfLxhag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916204509.166633-2-marex@nabladev.com>
References: <20260916204509.166633-1-marex@nabladev.com>
 <20260916204509.166633-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 20:57:17 +0000
Message-Id: <20260916205718.307311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] net: dt-bindings: Incorrect Clause 45 compatible string forces inc=
ompatible MDIO probe on C22 PHY
- [High] net: dt-bindings: Insufficient reset deassert delay for DP83822I P=
HY
- [Medium] net: dt-bindings: Contradictory RGMII internal delay configurati=
on on gem1
- [Medium] mmc: dt-bindings: eMMC node lacks 'non-removable' and 'bus-width=
' properties
- [Medium] nvmem: dt-bindings: 8-byte NVMEM MAC address cells will be rejec=
ted by the kernel
- [Low] dt-bindings: Dangling alias to disabled usb0 node
--

commit 2e2a25c7bccf2c438229b39299b352c4fb573831
Author: Marek Vasut <marex@nabladev.com>

arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard

Add support for ifm ZynqMP VHIP6 EvalBoard reference design.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts b/arch=
/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> new file mode 100644
> index 0000000000000..ed2c6d170426d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts

[ ... ]

> +	aliases {
> +		ethernet0 =3D &gem0;
> +		ethernet1 =3D &gem1;
> +		ethernet2 =3D &gem2;
> +		ethernet3 =3D &gem3;
> +		gpio0 =3D &gpio;
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		rtc0 =3D &i2crtc;
> +		serial0 =3D &uart0;
> +		spi0 =3D &qspi;
> +		usb0 =3D &usb0;
> +		usb1 =3D &usb1;

[Severity: Low]
Does this map usb0 to a disabled node? In the base zynqmp.dtsi, usb0 defaul=
ts
to disabled and it is never enabled here, which might cause confusion for
bootloaders or userspace indexing.

> +	};

[ ... ]

> +&gem0 {
> +	phy-handle =3D <&phy0>;
> +	phy-mode =3D "mii";
> +	status =3D "okay";
> +
> +	mdio0: mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: phy@1 {	/* TI DP83822I */
> +			compatible =3D "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";

[Severity: High]
Does declaring "ethernet-phy-ieee802.3-c45" force an incompatible MDIO probe
on this C22 PHY? The fwnode_mdiobus_register_phy() function sets is_c45 =3D=
 true
when it sees this compatible string. This forces the Cadence MACB MDIO
controller to send Clause 45 MDIO frames (Start Code 00).=20

Since the TI DP83822I is a Clause 22 PHY (expecting Start Code 01), will it
ignore the frames and cause get_phy_device() to fail with -ENODEV?

This same compatible string is used for phy1, phy2, and phy3 below.

> +			reg =3D <1>;
> +			reset-gpios =3D <&gpio 78 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10>;
> +			reset-deassert-us =3D <10>;

[Severity: High]
Is a 10 us deassert delay sufficient for the DP83822I PHY? Section 8.4.1.2 =
of
the TI DP83822I datasheet strictly requires a minimum of 150 us before MDIO
access. Accessing the PHY before its internal state machine has initialized
could cause the MDIO probe to fail or read garbage.

This same deassert delay is also used for phy1, phy2, and phy3 below.

> +		};
> +	};
> +};
> +
> +&gem1 {
> +	phy-handle =3D <&phy1>;
> +	phy-mode =3D "rgmii-rxid";
> +	status =3D "okay";
> +
> +	mdio1: mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy1: phy@1 {	/* TI DP83822I */
> +			compatible =3D "ethernet-phy-id2000.a240",
> +				     "ethernet-phy-ieee802.3-c45";
> +			reg =3D <1>;
> +			max-speed =3D <100>;
> +			reset-gpios =3D <&gpio 8 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10>;
> +			reset-deassert-us =3D <10>;
> +			tx-internal-delay-ps =3D <1>;

[Severity: Medium]
Does specifying tx-internal-delay-ps =3D <1> contradict the "rgmii-rxid"
phy-mode requested by gem1?

The dp83822 driver's DP83822_TX_CLK_SHIFT logic disables the TX delay only =
if
tx_int_delay <=3D 0. Because 1 > 0, the TX delay appears to be erroneously
enabled here, violating the RGMII-RXID contract and potentially causing pac=
ket
loss or link instability.

> +		};
> +	};
> +};

[ ... ]

> +&i2c1 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	eeprom@51 {
> +		compatible =3D "atmel,24c128";
> +		reg =3D <0x51>;
> +		label =3D "ifm-deviceinfo";
> +		wp-gpios =3D <&gpio 37 GPIO_ACTIVE_HIGH>;
> +
> +		nvmem-layout {
> +			compatible =3D "fixed-layout";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[ ... ]

> +			/* Each MAC address is padded to 8 Bytes */
> +			cfg_eeprom_mac1: mac-address-1@c8 {
> +				reg =3D <0xc8 0x8>;

[Severity: Medium]
Will this 8-byte NVMEM cell be rejected by the kernel? nvmem_get_mac_addres=
s()
in net/ethernet/eth.c strictly verifies that the read cell length is exactly
ETH_ALEN (6). Because the reg length is defined as 8 bytes, the
if (len !=3D ETH_ALEN) check will fail and return -EINVAL, causing the
programmed MAC addresses to be ignored.

This also applies to mac-address-2 through mac-address-8 below.

> +			};

[ ... ]

> +&qspi {
> +	status =3D "okay";
> +
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0x0>;
> +		spi-max-frequency =3D <80000000>;
> +		spi-tx-bus-width =3D <1>;
> +		spi-rx-bus-width =3D <4>;
> +	};
> +};
> +
> +&sdhci0 {
> +	xlnx,mio-bank =3D <0x0>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Since this is an eMMC controller, is it missing the mandatory 'non-removabl=
e'
and 'bus-width =3D <8>' properties?

Without these, the sdhci driver will initialize the device using default
properties meant for hot-pluggable SD cards, which might cause the eMMC to
fail probing, operate at degraded speeds, or erroneously poll for a card
detect signal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916204509.1666=
33-1-marex@nabladev.com?part=3D2
