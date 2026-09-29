Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A050EC04
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687613; cv=none; b=eiw/Ihn8N26UHtLEwGRMo0GQrmSa40QY1o5rbJhA5nsV84FvrG4Gc1BJmIRQpc6ayO3D+WtI858oHt8WfYqtnig7GYmeoStYTZ4unkkMmU25prxEKWg04DrKcnkvK1u/0UdrBzOAuJRHlth7VDccKERdzpz1EhJ7bJHLE4XH1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687613; c=relaxed/simple;
	bh=Z04lRAhqkLZES2LFKWoCA+8xTyeJGe1KPq71h1jRrHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tn/sTm0TI3S4wGo+qM1XVB+A6M4HKTLouGNSKXnb1/RCTHrID7QLIduc9Apg32p2GBjVgD4Okmvxr8goXNlDkrqbQcNqNYcJvxWZEuXLH2gxOi8Bj9kzLtI09ne53bVvReOVU93Fw5DmAHPrYk5F5Uo4uVkCTW1fR9WNlncm0dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKWNvAVd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKWNvAVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CB01F000FF;
	Tue, 29 Sep 2026 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790687611;
	bh=wxEqfYgyIJGjlLtVyHg0VUMoimEQ4oTZJKSeFS9S3So=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YKWNvAVdUaTC2S/VU1DiLjsgkS9XaqaOvwatQSoqhOtquIJ8IvDqR/C862ThVH3Y+
	 mspigYB6QlVoldRYWqnrU3yHM8TRyYzq4tATL69p6eTxEJVFow74lQP6ONdnKedHN9
	 wkByl+nlcqBBGYrfbhDLnu9DYeV53DOasNRNqrGFUDH7sc943qaD/h6ONPIbQXrkb0
	 BgwQWOZ/O5/en1K/1ppIXaAbqXMlfR/3ATy1rtf2GIWIsIb0Fl4JRkEUktTZGuPd7P
	 YqqaQKQ1mhqI2LcBq86AX7QI0CBzL51H1kLNljCRMnkvxUo+B22TkaWNGqdcd4AtLY
	 3BMCu9jujJY1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g056: Add ADC nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260929124829.237997-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929124829.237997-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:13:30 +0000
Message-Id: <20260929131331.68CB01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: undefined CPG module clocks and reset IDs in ADC nodes
- [High] arm64: dts: adc1 and adc2 nodes incorrectly share adc0 clocks and =
resets
- [Medium] arm64: dts: missing #io-channel-cells property in ADC nodes
--

commit 227934acdf450f4bc0b48d576add5c164d83a5ed
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

arm64: dts: renesas: r9a09g056: Add ADC nodes

This commit adds three ADC device nodes (adc0, adc1, and adc2) to the
Renesas RZ/V2N SoC device tree.

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g056.dtsi
> index 77c2221a9e2a3..f03855f705312 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -626,6 +626,150 @@ wdt1: watchdog@14400000 {
>  			status =3D "disabled";
>  		};
> =20
> +		adc0: adc@11c00000 {
> +			compatible =3D "renesas,r9a09g056-adc", "renesas,r9a09g057-adc";
> +			reg =3D <0 0x11c00000 0 0x400>;
> +			interrupts =3D <GIC_SPI 918 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 919 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 920 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "adi", "gbadi", "gcadi",
> +					  "cmpai", "cmpbi";
> +			clocks =3D <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
> +			clock-names =3D "adclk", "pclk";
> +			resets =3D <&cpg 0xf6>;

[Severity: High]
Are these CPG module clock IDs (0x107, 0x108) and reset ID (0xf6) defined
in the r9a09g056-cpg.c clock driver?

If they are not implemented, the rzg2l_adc driver will fail to probe or
infinitely defer when it calls clk_get() and
devm_reset_control_get_exclusive_deasserted() during probe.

> +			power-domains =3D <&cpg>;
> +			dmas =3D <&dmac0 0x24c8>, <&dmac1 0x24c8>, <&dmac2 0x24c8>,
> +			       <&dmac3 0x24c8>, <&dmac4 0x24c8>;
> +			dma-names =3D "rx", "rx", "rx", "rx", "rx";
> +			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[Severity: Medium]
Should there be an #io-channel-cells =3D <1>; property defined here?

Without it, the ADC nodes cannot function as IIO providers via device tree
phandles. Any consumer driver trying to reference the ADC via an io-channels
property will fail to parse when calling iio_channel_get() to look up its
provider.

[ ... ]
> +		adc1: adc@11c02800 {
[ ... ]
> +			clocks =3D <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
> +			clock-names =3D "adclk", "pclk";
> +			resets =3D <&cpg 0xf6>;
[ ... ]
> +		adc2: adc@11c02c00 {
[ ... ]
> +			clocks =3D <&cpg CPG_MOD 0x108>, <&cpg CPG_MOD 0x107>;
> +			clock-names =3D "adclk", "pclk";
> +			resets =3D <&cpg 0xf6>;

[Severity: High]
Do adc1 and adc2 use the exact same clocks and reset lines as adc0?

Since the rzg2l_adc driver requests exclusive reset lines via
devm_reset_control_get_exclusive_deasserted(), probing adc1 and adc2 will
fail with -EBUSY because adc0 already holds the exclusive reset line.

If they were shared instead, resetting one active ADC instance would
inadvertently reset the others, leading to state corruption.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929124829.2379=
97-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
