Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3BB368D7B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473557; cv=none; b=jj93d9F14tKE+oPtEPuCtSoKeIubplAPolCt54I+KZWLcjKy3F0wxFAdzgDCKJtIaAQnMoR0marqmngeaCAYxmylDM1hOofFGbONsknj/QPeihGg5cf4yQPsP/jvj402g7b6VZOc7qHPPUkqRZ642mdysBXAAnyyoATD99cVJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473557; c=relaxed/simple;
	bh=2WUvPIDP0yllMvmVkSondPkOVrs1/799rgP5Nsveg0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=avSfB5kRNj9s8BmWYon6NpKdUHSBB+TJr8JzVMD68uO8BKj8nvOnh08F7QlxwOfaX05pNFmzO4kYiJ+LsipLxTVcjUnKpXyg22FauXoU35UdhDh0jpeDOUa6KX5sS4m9Ae0X0Yh+h7LtFSFVJ6DfOOaoDyn4J3s/5aSDk3oBy/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVnYPH4v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVnYPH4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE22E1F00A3D;
	Fri, 22 May 2026 18:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779473553;
	bh=oKbMjWnGh3JcCUkSvcM0SEgCIlPW9GQEOt9bZnx5mNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVnYPH4vwcI42lAOPKnYCx1L41e6vNxbg9LgkH9dbZPF04SEg1nYJP5k4EUMmr6Sa
	 kryxXYTIU9K1iIvzqC1kJBSt9KfXh8iOSPUlR7V3h3qVe/Yb/orjXQHMv43BHIq1me
	 +6y6SAqLkuXglvskjQ/tX72/tqaD9Yro2dcNwRIzXdMlS9cWSk2TVxpnBNYxKbyFBV
	 2QqU0Qb3ZoJnWOYe6ayP/o1I5pJu5jN4m5AjQBarXiSzM8AlO368NE29yLnhO2PB/R
	 0BPhmhwRY5TGfZd6f6XKrGy+ksQW+7o5daBJSFAKNoMWf3U69oK4Zfmae8GVQLCrPT
	 QJ2gSMESqJXqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
References: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 18:12:32 +0000
Message-Id: <20260522181232.EE22E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Undocumented compatible strings for new hardware variants
- [Low] Inverted brightness-levels array violating semantics and causing lo=
gic error
--

commit 8e773037ec40fa18ba2cb58aa7b9d32280d8b5cb
Author: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>

arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist

Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
of peripherals.

> diff --git a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts b/arch/arm64/=
boot/dts/renesas/r8a779md-geist.dts
> new file mode 100644
> index 0000000000000..11024bd12eb63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Geist board with R-Car M3Le
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "r8a779md.dtsi"
> +
> +/ {
> +	model =3D "Renesas Geist board based on r8a779md";
> +	compatible =3D "renesas,geist", "renesas,r8a779md", "renesas,r8a77965";

[Severity: Low]
Are the YAML device tree bindings for the new renesas,geist and
renesas,r8a779md compatible strings included in a separate patch?

According to the subsystem guidelines, new compatible strings must be added
to the schema. For renesas,r8a779md (a variant of renesas,r8a77965),
omitting it from existing if-then conditional blocks where previous
generations appear causes schema validation to be incomplete, rendering
dtbs_check unable to validate the node correctly.

[ ... ]

> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		pwms =3D <&pwm1 0 50000>;
> +
> +		brightness-levels =3D <256 128 64 16 8 4 0>;

[Severity: Low]
Does this inverted brightness-levels array violate the device tree
specification to work around missing PWM_POLARITY_INVERTED support?

The DT common.yaml specification requires brightness levels to be strictly
increasing, with 0 being the darkest.

This inverted array introduces a logic error in
drivers/video/backlight/pwm_bl.c. In pwm_backlight_is_linear(), max_val (0)
- min_val (256) triggers an unsigned integer underflow (4294967040).

This underflow creates a massive arbitrary error margin, completely
breaking the linearity check and causing the driver to unconditionally
misclassify the backlight as linear in sysfs.

> +		default-brightness-level =3D <6>;
> +
> +		power-supply =3D <&reg_12v>;
> +		enable-gpios =3D <&gpio6 7 GPIO_ACTIVE_HIGH>;
> +	};

[ ... ]

> +&i2c2 {
> +	pinctrl-0 =3D <&i2c2_pins>;
> +	pinctrl-names =3D "default";
> +	clock-frequency =3D <100000>;
> +	status =3D "okay";

[ ... ]

> +	/* Pin-to-pin, register map, and control compatible with CS2000 and CS2=
200 */
> +	cs2500: clock-controller@4f {
> +		#clock-cells =3D <0>;
> +		compatible =3D "cirrus,cs2500", "cirrus,cs2000-cp";

[Severity: Low]
Is the cirrus,cs2500 compatible string missing its YAML binding schema?

Just like the board compatible strings above, adding a new hardware variant
requires updating the device tree bindings.

> +		reg =3D <0x4f>;
> +		clocks =3D <&audio_clkout>, <&x12_clk>;
> +		clock-names =3D "clk_in", "ref_clk";
> +
> +		assigned-clocks =3D <&cs2500>;
> +		assigned-clock-rates =3D <24576000>; /* 1/1 divide */
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522172000.1509=
6-1-marek.vasut+renesas@mailbox.org?part=3D1
