Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F45650F0
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972926; cv=none; b=h4vqcf/135jlL3BJJBwYAv9Acs2NpaXMt/U3wEsyTxe0do5QucnrSTatYUOGmTnbfv89p9HEHFncVap4+16FFtpXQNP1mgOmar3AMCK5uxf+zpEpRUKicO6wciJK9bRQ4c/4/17rIBO+WQwqxwUrjRKIlU4SVu3IyyhR2eODxDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972926; c=relaxed/simple;
	bh=EqPfBWZRQaF29Wq+Z5qVZJKJdi7Vrmi/taAU8N7AUFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JAqnz9083LVtzoIZGGBSjMbMxJZorwg9OhmxrY8BM0jV3KM/duVD3/X4kw+rCi0An2XMPnDxjLaYN9NsuAX1BKdF48RqvpCJbZiBFt6Q1BTUdQAkX/uOHssG7J+4gIiI6ml7osp+OsPOqdZZLdV+vwmHPFfo3OCBUTZXt7ZjMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn3lddSV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn3lddSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F151F000FF;
	Wed,  9 Sep 2026 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972925;
	bh=7PW5o/UbuhmvLlZxVgPuPaMUQvNhY4BgPzEKN5Vj1Rs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hn3lddSVY04qlDK1ep8fZY/aSI7Zt3dT05tfEVcCIaB5BZ0lxHnYXU0Ti5R5+4f0A
	 mnoAzorDxJB2qMsV9lFd/qGNzdNhkI2nZkO3DEnURyuZKaKQGVQT0Iki7SpaTTyL8m
	 HCr9wXJs3dvvnrJ1ZuVHMCmP0ik4G4ra3QNWY1Q2dDS3092Q6+uxbJ4/C10N7/hVK9
	 rWHybPU3eBOeARYXtHkQjeoZK47fLlTp35yJ5aW80cI//Kvvy1ZOKSR30QdEq+aXzf
	 Wz970p5QP3VxQbB4u87CFNIRUtK5fJdK1dbLDjcss5Y7lFOrnihk1YsdCJ5k+OnGJS
	 IxsQAGLewLhCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909164423.97288-2-marex@nabladev.com>
References: <20260909164423.97288-1-marex@nabladev.com>
 <20260909164423.97288-2-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:55:24 +0000
Message-Id: <20260909165525.22F151F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The TI DP83822I PHY is incorrectly declared as a Clause 45 PHY, wh=
ich will cause MDIO probe failures.
- [Medium] Contradictory RGMII internal delay configuration on gem1 forces =
TX delay on a mode that explicitly requests it disabled.
- [Medium] USB0 interface is not enabled despite commit message claiming 'U=
SB host interfaces' (plural).
- [Low] Magic number '1' used instead of the standard 'GPIO_ACTIVE_LOW' mac=
ro.
- [Low] Non-generic node name for LM75 temperature sensor.
--

commit 9efb3b575525e794cefe9379fc0090ce8f78e409
Author: Marek Vasut <marex@nabladev.com>

arm64: zynqmp: Add ifm ZynqMP VHIP6 EvalBoard

This commit adds support for the ifm ZynqMP VHIP6 EvalBoard reference
design. The board configuration includes four ethernet ports, QSPI NOR,
eMMC, UART, and USB host interfaces.

> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts b/arch=
/arm64/boot/dts/xilinx/zynqmp-vhip6-evalboard.dts
> new file mode 100644
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

[Severity: Medium]
The commit message mentions USB host interfaces in the plural, and there is=
 an
alias for usb0 here, but is the usb0 node actually enabled in this file?

The zynqmp.dtsi base disables both usb0 and usb1 by default. While usb1
is enabled later in this file, there is no corresponding override for usb0
or dwc3_0. Does this inadvertently leave the first USB interface disabled?

> +		usb1 =3D &usb1;
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
Will this compatible string cause the MDIO probe to fail?=20

The TI DP83822I is a Clause 22 PHY, but the ethernet-phy-ieee802.3-c45 stri=
ng
sets the is_c45 flag in the kernel MDIO core. This forces macb_mdio to emit
C45 frames, which the DP83822I will ignore, causing the read to return 0xff=
ff
and the probe to fail with -ENODEV.

Should this just be ethernet-phy-ieee802.3-c22 or rely solely on the ID?
This same C45 compatibility declaration appears to be applied to gem1, gem2,
and gem3 below as well.

> +			reg =3D <1>;
> +			reset-gpios =3D <&gpio 78 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <10>;
> +			reset-deassert-us =3D <10>;
> +		};
> +	};
> +};
> +
> +&gem1 {
> +	phy-handle =3D <&phy1>;
> +	phy-mode =3D "rgmii-rxid";

[Severity: Medium]
Does this PHY mode contradict the internal delay property defined below?=20
The rgmii-rxid mode specifies that only RX delay should be added by the PHY.

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
The DP83822 driver interprets tx-internal-delay-ps as a request to enable t=
he
PHY internal TX delay, overriding the rgmii-rxid contract.=20

If the MAC or PCB also applies a delay, this double-delay on the TX clock
could cause connection instability. Should this property be removed, or sho=
uld
the mode be changed to rgmii-id?

> +		};
> +	};
> +};
[ ... ]
> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +	status =3D "okay";
> +
> +	lm75@48 {
> +		compatible =3D "national,lm75";

[Severity: Low]
Does this node name align with the Devicetree specification?=20

The guidelines require node names to be generic and describe the function of
the device rather than the specific model. Would a name like
temperature-sensor@48 or sensor@48 be more appropriate here?

> +		reg =3D <0x48>;
> +	};
[ ... ]
> +&usb1 {
> +	reset-gpios =3D <&gpio 77 1>;

[Severity: Low]
Is there a reason to use the magic number 1 here instead of the standard
GPIO_ACTIVE_LOW macro?=20

The dt-bindings header is included at the top of the file, and GPIO_ACTIVE_=
LOW
is used correctly for all other reset-gpios definitions in this board setup.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909164423.9728=
8-1-marex@nabladev.com?part=3D2
