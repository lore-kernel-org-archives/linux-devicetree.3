Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE925FA29
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557729; cv=none; b=at3rNyOoB90YfCuFLT65fBFpm9T6lXTvdhfiRh93eruYjrbp1CrvsenxA12z0+chRsQXVRao3PUqRmwInQN788pUjb46JBkzH6QGKATggFUcONwJGf4q9Bq2QRiuxd2D8GIC6PM5L+F1Ney0HLh5ywVWbsdDBZNGRYxzySbOUtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557729; c=relaxed/simple;
	bh=JYBBJfdOSREOy1K2SpSsClh4Hdz6JKr4Fa40zJCEB9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hMhg2/yUDI4K2T+3N2e4Q7KhwgRd5sjOxno8H0PAkatwwOFuhBELam0gc2Mrb4L3HVuOLyq5xAHZcboQ9+f6bWzUQZWYBQG1F12hfmylrJqQHXEYIc3LMB3rFjH7Lweoa4aBqJ/BhJMeiuG1hxSEm48njpo03GMIfTGnIfYPxoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcdZ6KDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcdZ6KDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BABCC2BCB0;
	Tue, 12 May 2026 03:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778557728;
	bh=JYBBJfdOSREOy1K2SpSsClh4Hdz6JKr4Fa40zJCEB9g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jcdZ6KDgrIloPiWL+QLvZ6TTrTQPN1ZA/y6COWTwHFB+7CvjDX31MWoJnxPelDid8
	 C2TUEYSEjujEfkLIP+BGYbFTiwLgRUkQN27VrNo/exS39lWZwrR3yYNNTAdBuZkSEa
	 5kLgHVj/dgbcg/PhuLslGH4feHEUhV2E9xDiHDve/m9rD2s9hq6mqecBpQWPTUm7K6
	 ereAKoPkwr1ylxqitD4AlV/oSnbXPo0WQqg0MF2wX1na1NqnRBDpPInPfuebVhbUks
	 JSLwVlCCibLGyC0A6yODGE4+sTNwSR9lIYxMk7mGdHhHLULqGhEHSP6DYylL+iKD23
	 F1uglegzkknzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
Reply-To: sashiko@lists.linux.dev
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:48:47 +0000
Message-Id: <20260512034848.3BABCC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incorrect PMIC parent supply bindings (`vin-supply` instead of `vi=
nX-supply`).
- [High] Using `regulator-always-on` for SD card supplies breaks UHS soft r=
eset/recovery.
- [Medium] Excessively broad voltage constraints for SD card regulators.
- [Low] Dead Code: Unreferenced `reg_dc_in` fixed regulator.
- [Low] Ambiguous Devicetree Pattern: `cd-inverted` combined with `GPIO_ACT=
IVE_HIGH`.
--

commit ba761ed57c645870aad2395144a4d7a3530a081d
Author: Trevor Gamblin <tgamblin@baylibre.com>

riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2.

Link: https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-=
0-aefd3b7832df@gmail.com/T/#

> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/=
boot/dts/spacemit/k1-musepi-pro.dts
> index 29e333b670cf0..774a4640f0656 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -18,6 +18,24 @@ aliases {
>  		ethernet0 =3D &eth0;
>  		serial0 =3D &uart0;
>  	};
> +	reg_dc_in: dc-in-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "dc_in_5v";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

Is this fixed regulator used anywhere? It does not appear to be referenced
as a supply by any other node in this device tree.

[ ... ]

> +&i2c8 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c8_cfg>;
> +	status =3D "okay";
> +
> +	pmic@41 {
> +		compatible =3D "spacemit,p1";
> +		reg =3D <0x41>;
> +		interrupts =3D <64>;
> +		vin-supply =3D <&reg_vcc_4v>;

Will the regulator framework fail to resolve the parent supply here? The
spacemit-p1 regulator driver and bindings seem to require specific parent
supply names for each regulator group (e.g., vin4-supply for buck4 and
aldoin-supply for aldo1) rather than a generic vin-supply property.

> +
> +		regulators {
> +			buck4: buck4 {
> +				regulator-min-microvolt =3D <500000>;

Does this constraint allow the voltage to drop below the safe operating
area for the connected hardware? SD cards typically require exactly 3.3V
for VMMC, so allowing 0.5V could potentially cause brownouts.

> +				regulator-max-microvolt =3D <3300000>;
> +				regulator-ramp-delay =3D <5000>;
> +				regulator-always-on;

Will this prevent the MMC subsystem from properly resetting the SD card
during a soft reboot or initialization error recovery?

For UHS-I modes, the SD card switches to 1.8V signaling. To reset the card
back to 3.3V, the MMC core calls mmc_power_off() to power cycle the
vmmc-supply. If the regulator is marked as always-on, the disable request
is ignored, which can leave the card stuck in 1.8V mode.

> +			};
> +
> +			aldo1: aldo1 {
> +				regulator-min-microvolt =3D <500000>;

Similarly, does this minimum voltage constraint need to be tighter for
the VQMMC supply, which usually operates between 1.8V and 3.3V?

> +				regulator-max-microvolt =3D <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;

Does this always-on constraint also prevent the I/O power supply from
being properly managed during card power cycles?

> +			};
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-names =3D "default", "uhs";
> +	pinctrl-0 =3D <&mmc1_cfg>;
> +	pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +	cd-inverted;

This isn't a bug, but could the hardware polarity be encoded directly into
the GPIO specifier using GPIO_ACTIVE_LOW instead? The modern device tree
practice is to drop the cd-inverted property to avoid the ambiguous double
inversion.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-orangepi-s=
d-card-uhs-v9-0-ae48c0b2b2cf@gmail.com?part=3D8
