Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C035A384
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791224; cv=none; b=WpuD3I1sQweL1kY2JmRSzhmFpkhEh5JwzgBoWdplw9a5xk5rgQ+SZR7OErdr+mYmEei2RepUERlyLt7pZP47oO6P/ARgeatBxJP3x5yaJuZkSaz3XhSb0W3n4IFZKeTvAn/XF0jcXLNdk2LGDvwt9dDNHDBc3DW5mI0UnzzBhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791224; c=relaxed/simple;
	bh=s5jP9u0JRTqt5gO23kuCrmJTSSJHCQEPoQQltRN4c48=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SgwH9NDu7GQhmVzak/TzcmM7evHdytVoGL6oRM6G6hIql50Re6QNY8WSkXUV8QoTyfxBmIRzWUcOh8CDNTGg0wR7YSTIoElWW1+ybdhAsT2aQLDfl5F6ii4fVKuqaUQaMUsXkTn5vbPInHlAalDDtvXw8jj3ZQVT5zUa1m/WdWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9WS7m2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9WS7m2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57B11F000E9;
	Tue, 26 May 2026 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779791223;
	bh=DazMTjL7rdUhvhBH001E/pN+qSftDoUEOhCdgaC1eSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9WS7m2q8Cr8N03yNUIV/zgjHBHW1vrT1EJhhgqHOueRdgxNm08jHGMlnyX58ol5c
	 +QFFf7t2yw2mKTJ/j2y7iHtMlw6MADzass+lsVJD4RMHeEaL669ZvTPVhzZtcYdM6A
	 zRcbGRJIBuqxXAHIlc/hOW1oOJ8WD1kbLwFvkSlhBX9itJmfI0cMSv2Jvb8G7OxObB
	 ZklQPIRCCk5qxPuVC6Tq6GfGa0eBA80pjfDcLuIWpyMNoYZt15CLbouOmTIkl7td2x
	 cygh3BHTwVd5h2Xj0n9i82yrx1EYXlU+7A5vujIH0CXI+V+AhLEUOviHu/FJ0yyxYG
	 /Xi9N6ZATy5Jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp15 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-upstream_uboot_properties-v7-6-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-6-e17cd424d5db@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:27:02 +0000
Message-Id: <20260526102702.E57B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing boot phase tag on the secondary flash node.
- [High] Conflicting pinctrl properties due to missing `/delete-property/`.
- [Medium] Meaningful code and commit message mismatch regarding the scope =
of added tags.
- [Low] Redundant boot phase properties on the same node.
--

commit 14d5fc0d2bb2bdd48adf7a7f9c0b21cba6b63b86
Author: Patrice Chotard <patrice.chotard@foss.st.com>
ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards

The bootph-all flag was introduced in dt-schema to define node usage across
different boot phases. This patch adds these flags to ensure SD boot for
various stm32 boards.

> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag

[Severity: Medium]
Is this commit message accurate regarding the scope of the changes? The text
only mentions adding the bootph-all flag to timer, gpio, syscfg, clock and
uart nodes. However, the patch also introduces bootph-pre-ram and
bootph-some-ram tags to other subsystems like QSPI, PMIC, LTDC, OPTEE, SCMI,
PSCI, and SDMMC. Could the message be updated to reflect the full scope of
the modifications?

> diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts =
b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
> index 60ce4425a7fdd..ac4e313ca3716 100644
> --- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dts

[ ... ]

> @@ -53,6 +53,16 @@ &uart4 {
>  	status =3D "okay";
>  };
> +
> +&uart4_pins_a {
> +	bootph-all;
> +	pins1 {
> +		bootph-all;
> +	};
> +
> +	pins2 {
> +		bootph-all;
> +		bias-pull-up;
> +	};
> +};

[Severity: High]
Does this introduce mutually exclusive electrical configurations? The base
definition for these pins in stm32mp15-pinctrl.dtsi already specifies
bias-disable. Because Device Tree append semantics merge node contents, the
resulting tree will contain both bias-disable and bias-pull-up. Should this
include /delete-property/ bias-disable before setting the pull-up?

> diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts=
/st/stm32mp157c-ev1.dts
> index 0e65a1862eb53..c4be802ef1e78 100644
> --- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts

[ ... ]

> @@ -314,6 +315,7 @@ &qspi_bk2_sleep_pins_a
>  	reg =3D <0x58003000 0x1000>, <0x70000000 0x4000000>;
>  	#address-cells =3D <1>;
>  	#size-cells =3D <0>;
> +	bootph-pre-ram;
>  	status =3D "okay";
> =20
>  	flash0: flash@0 {
> @@ -323,6 +325,7 @@ flash0: flash@0 {
>  		spi-max-frequency =3D <108000000>;
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
> +		bootph-pre-ram;
>  	};
> =20
>  	flash1: flash@1 {
> @@ -335,6 +338,41 @@ flash1: flash@1 {
>  	};
>  };

[ ... ]

> +&qspi_bk2_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};
> +
> +&qspi_cs2_pins_a {
> +	bootph-pre-ram;
> +	pins {
> +		bootph-pre-ram;
> +	};
> +};

[Severity: High]
Will this omission prevent the secondary flash from being accessible during
the SPL boot phase? The patch adds the bootph-pre-ram tag to the QSPI
controller, flash0, and the pinmux definitions dedicated to the secondary
flash (qspi_bk2_pins_a and qspi_cs2_pins_a), but it is omitted from the
flash1 node itself. Should the tag be added to flash1 as well?

> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/b=
oot/dts/st/stm32mp15xx-dhcom-som.dtsi
> index 4cc633683c6b7..04e91d02cc287 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi

[ ... ]

> @@ -253,6 +299,8 @@ &i2c4 {
>  	pinctrl-0 =3D <&i2c4_pins_a>;
>  	i2c-scl-rising-time-ns =3D <185>;
>  	i2c-scl-falling-time-ns =3D <20>;
> +	bootph-all;
> +	bootph-pre-ram;

[Severity: Low]
Are both of these properties necessary? Since the bootph-all property
inherently specifies that a node is present in all boot phases, adding
bootph-pre-ram to the same node appears redundant.

>  	status =3D "okay";
>  	/* spare dmas for other usage */
>  	/delete-property/dmas;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-upstream_u=
boot_properties-v7-0-e17cd424d5db@foss.st.com?part=3D6
