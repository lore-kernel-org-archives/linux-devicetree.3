Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4062264DB
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570249; cv=none; b=pTLeNJIBPDV4+kh7v5m5tafgvQV9miNRPnAElufG/RRPflfHkx/XQjjU53BNFtda3hGFowZ4T3xLxT7mqQ358Ab9uey2cJLEWqyuwFwzyekeVxLCU4pr9BElx3iaAZgXMkV2nHoY/ThSyQpRf+9wp/7o4XPfzx7aV18OP+tEcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570249; c=relaxed/simple;
	bh=myA6oResvMNhlOf3DmjQQjPK2ndQTUwRx5JXFlqAuIk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qzvuUrFdg4SrgsVJwTizCWVUJl5io6o+kEcDU8sr8aml3BTvEWkyNWbraB7cmd65l4ifMRYidoaeRMwmtLV9a75/omXx4COur0C3EzB2+eAnOu3aKdkmV4PLDVzh1X8PMSacCnrBWEGMrNqiBbYRqnUZFhdUskAKlKJ1CYbbon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnKMEqI/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnKMEqI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876CC1F000E9;
	Mon, 24 Aug 2026 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787570247;
	bh=fqMC6mNiciVQ7qjYK2TIpu5ETAbBK0agaCGIsCdcMVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QnKMEqI/I2MAskAV86S0Lg5xRJ568IpcIEaaPiYPKZOaliBAZFO0ffJ4ow6W6VghS
	 2VabFxBvqqTSncngUPmmBk5l1RWAEQCZNmd/2ifeakyruOZmKQFyg8MXEOPQWrK2dd
	 MGfCdpzzm7Eoy5fwbINJ5W545AI4Y0+S/xfBtG8X0gM0rFC2P4EQQnGmMJjWO6o8sb
	 HVLuS4hmVYQe2L9+pdzQwnSIqG2MxCZ/SgVgSLwwKAGwjwM6/gh84ERHeJaJc1PQ0x
	 Se7Nxz4VMHEWN0xrWLrnLxV3WUzrfcmHohRV67OoaeUh0ihBsKYnJP5YgBPXQkpAjp
	 nu0ZmVGJ2xyzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260824110432.1074136-2-robert.marko@sartura.hr>
References: <20260824110432.1074136-1-robert.marko@sartura.hr>
 <20260824110432.1074136-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 11:17:27 +0000
Message-Id: <20260824111727.876CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Potential clock calculation truncation bug with `45000000` rate in=
 `sdmmc1` leading to an out-of-spec initialization clock.
- [Medium] Identical clocks assigned to `hclock` and `multclk` in `sdmmc` n=
odes incorrectly model the hardware.
- [Low] Child nodes are not sorted alphanumerically by their unit-address.
- [Low] The compatible string 'microchip,lan9691-sdhci' is undocumented.
--

--- Patch [2]: [PATCH 2/4] arm64: dts: microchip: lan969x: add SDMMC nodes =
---
commit 3b81135d2fb8590ea896af2a6f1a054ed2baf2c4
Author: Robert Marko <robert.marko@sartura.hr>

arm64: dts: microchip: lan969x: add SDMMC nodes

Add nodes for both SDMMC controllers.

> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot=
/dts/microchip/lan9691.dtsi
> index a8541c6a098d1..2d943ea757689 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> @@ -414,6 +414,30 @@ qspi0: spi@e0804000 {
>  			status =3D "disabled";
>  		};
> =20
> +		sdmmc0: mmc@e0830000 {
> +			compatible =3D "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";

[Severity: Low]
Is this new compatible string "microchip,lan9691-sdhci" documented in the
device tree bindings?

Running make dtbs_check might result in warnings if the string is missing f=
rom
the dt-bindings schemas.

> +			reg =3D <0xe0830000 0x00000300>;
> +			interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks GCK_ID_SDMMC0>, <&clks GCK_ID_SDMMC0>;
> +			clock-names =3D "hclock", "multclk";

[Severity: Medium]
Are these clock assignments correct for hclock and multclk?

In AT91/Microchip SoC bindings, hclock typically points to the system perip=
heral
bus clock (AHB), while multclk points to the generated core clock.

By specifying the generated clock (GCK_ID_SDMMC0) for both, the driver will
never manage the actual AHB clock state, which could lead to power manageme=
nt
issues.

> +			assigned-clocks =3D <&clks GCK_ID_SDMMC0>;
> +			assigned-clock-rates =3D <100000000>;
> +			status =3D "disabled";
> +		};
> +
> +		sdmmc1: mmc@e0838000 {

[Severity: Low]
Should this node be placed after qspi2: spi@e0834000 to maintain alphanumer=
ic
sorting by unit-address?

The address 0xe0838000 is greater than 0xe0834000.

> +			compatible =3D "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg =3D <0xe0838000 0x00000300>;
> +			interrupts =3D <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clks GCK_ID_SDMMC1>, <&clks GCK_ID_SDMMC1>;
> +			clock-names =3D "hclock", "multclk";
> +			assigned-clocks =3D <&clks GCK_ID_SDMMC1>;
> +			assigned-clock-rates =3D <45000000>;

[Severity: High]
Does this 45MHz rate cause SD card initialization to fail due to exceeding =
the
400kHz limit?

During SDHCI probe, sdhci-of-at91 computes the base clock by dividing the
gck_rate by 2 and truncating to integer MHz (22.5 MHz -> 22 MHz). It writes=
 22
to the capabilities register with a multiplier of 2, so the core thinks the=
 max
clock is 44 MHz.

When requesting a 400 kHz initialization clock, the core calculates a divid=
er
of 110 (44,000,000 / 110 =3D 400,000).

However, the actual programmable clock source is exactly 45 MHz. Applying t=
he
110 divider to the real 45 MHz source yields an actual initialization clock=
 of
409,090 Hz, which exceeds the strict 400 kHz SD specification maximum.

Could we use a clock rate that divides cleanly into an integer MHz (like
48 MHz) to avoid this truncation issue?

> +			status =3D "disabled";
> +		};
> +
>  		qspi2: spi@e0834000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824110432.1074=
136-1-robert.marko@sartura.hr?part=3D2
