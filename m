Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44F33B6DF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780973830; cv=none; b=ak1Zu0tfo6oRlJLN8y0n6Hq043GF1v9XmeRZGRB/Z6jMTQ4Rxr3nUbhJbN84SQBoAEsD2blubRwDpNupnjQixrvKIccOSX2aD79VG4roBYpSc1qiCydRn4onrKzlI2RNpNy2804vlhHjirjHNbBUryqlRFfl7owoRVhDp+ZBmWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780973830; c=relaxed/simple;
	bh=e7zMf1WwJVC1VXppd5xMgumTwolSMYxVbWNtC1xpQWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QdqTXUB4N78pssUTFyUt2eDLMvQEnz9+uKscg7KEnfTdbZut5qM7/6SqZnGmPkLd2MiKJoSyPlaTsbCJPu4/KY43QpnfHXZ/RfoC10KjkKOgp0aRZOVobSlRBRSeZnKjMwwR3eKf2Yk67bb9gDgWnm4nSTqCCjHVbE3yPh2xHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJBGC8Yb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJBGC8Yb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBFE1F00893;
	Tue,  9 Jun 2026 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780973828;
	bh=2mfBoopnz75GU6+HletF8uD6Wcgrs9mNwFWWxHVZVeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LJBGC8YbntrsOK8qnMvwBGz1t6HdRuGaPGwqWH5h8IZlpAmyX3cxOGXccydky0j/a
	 +zQKfOrHNxC/2bK14V3hYjn06hIYFTzg61UQibV3OyeBNgkg13mnUamk9QSI9Lkybh
	 BIAYrlrjc0F4kYcU2rh/FsgrMDb85pGHbfbnnO30SQSaJZWVkKfUpzUWc3Ej+86HQS
	 MCIkVMVnU32R/jU7ZoxQ/4CjVKnqEJZagaodwrwamSrXz1LAPrELOWwAoQTVH6Sm2P
	 S81KhpXVvYDOlpfEB16B4Ov/pu5Ge9Pa1IWh32rW7pGIOVI+20ZFLcOQUoncm4mqEO
	 ckPjhsSs7IQTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/4] arm64: dts: aspeed: Add initial AST27xx SoC
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-upstream_ast2700-v9-3-f631752f0cb1@aspeedtech.com>
References: <20260609-upstream_ast2700-v9-3-f631752f0cb1@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 02:57:08 +0000
Message-Id: <20260609025708.ADBFE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] INTC1 maps its summary interrupts to INTC0's TSP routing range, pr=
eventing SOC1 interrupts from reaching the Cortex-A35 GIC.
- [Low] The device tree defines ad-hoc top-level nodes ('secondary', 'terti=
ary', 'bootmcu') that violate standard naming schemas, and embeds direct Li=
nux kernel source URLs to justify '#size-cells' behavior.
- [Low] Duplicate label definitions in the pinctrl device tree include for =
multiple pinctrl groups in SOC1 will cause a hard DTC build failure.
--

commit 92031db9a3c255cefbfcc33df4ca0cb9780dd226
Author: Ryan Chen <ryan_chen@aspeedtech.com>

arm64: dts: aspeed: Add initial AST27xx SoC device tree

Add initial device tree support for the ASPEED AST27xx family, the
8th-generation Baseboard Management Controller (BMC) SoCs.

> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi b/arch/arm64/b=
oot/dts/aspeed/aspeed-g7-a35.dtsi
> new file mode 100644
> index 0000000000000..ef283d95649a3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-a35.dtsi
[ ... ]
> @@ -82,10 +82,10 @@ l2: l2-cache0 {
>  	};
> =20
>  	secondary {
>  		#address-cells =3D <2>;
>  		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/of/address.c?h=3Dv6.16#n491 */
>  		#size-cells =3D <0>;
>  		/* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/of/address.c?h=3Dv6.16#n430 */
> =20

[Severity: Low]
Are these OS-specific comments and ad-hoc root nodes ('secondary', 'tertiar=
y',
'bootmcu') appropriate here?

Device trees typically provide an OS-agnostic hardware description using ge=
neric
nodes (like 'bus', 'soc', or 'remoteproc'). Embedding Linux kernel source U=
RLs
suggests the hardware is being modeled around a specific Linux parser
implementation rather than providing an independent hardware description.

>  		ssp_nvic: interrupt-controller@1,e000e100 {
[ ... ]
> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi b/arc=
h/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..72d93323593d5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1-pinctrl.dtsi
[ ... ]
> @@ -475,10 +475,10 @@ pinctrl_hvi3c15_default: hvi3c15-default-state {
>  		function =3D "I3C15";
>  		groups =3D "HVI3C15";
>  	};
> =20
>  	pinctrl_tach0_default: tach0-default-state {
>  		function =3D "TACH0";
>  		groups =3D "TACH0";
>  	};
> =20

[Severity: Low]
Is this label duplicated? There is another pinctrl_tach0_default definition
earlier in this file.

Defining the same pinctrl label multiple times (such as pinctrl_tach0_defau=
lt
through pinctrl_tach15_default, and pinctrl_ncts5_default) in the same
device tree will cause a fatal syntax error in the Device Tree Compiler.

>  	pinctrl_tach1_default: tach1-default-state {
>  		function =3D "TACH1";
>  		groups =3D "TACH1";
>  	};
[ ... ]
> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi b/arch/arm64/=
boot/dts/aspeed/aspeed-g7-soc1.dtsi
> new file mode 100644
> index 0000000000000..bc990f79e693f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7-soc1.dtsi
[ ... ]
> @@ -396,10 +396,10 @@ sgpiom1: sgpiom@14c0d000 {
>  		bus-frequency =3D <12000000>;
>  		status =3D "disabled";
>  	};
> =20
>  	intc1: interrupt-controller@14c18000 {
>  		compatible =3D "aspeed,ast2700-intc1";
>  		reg =3D <0 0x14c18000 0 0x400>;
>  		interrupt-controller;
>  		interrupt-parent =3D <&intc0>;
>  		#interrupt-cells =3D <1>;
>  		aspeed,interrupt-ranges =3D
>  			<0 6 &intc0 480>,   /* M0  ~ M5  */
>  			<10 6 &intc0 490>,   /* M10 ~ M15  */
>  			<20 6 &intc0 500>,   /* M20 ~ M25  */

[Severity: High]
Does this incorrectly route SOC1 interrupts to the TSP instead of the
Cortex-A35 GIC?

Looking at intc0 in aspeed-g7-soc0.dtsi, interrupts 426 through 553 are
linearly mapped to the Tertiary Service Processor (tsp_nvic):

    <426 128 &tsp_nvic 0 0 >, /* linear to TSP */

Since intc1 maps its cascaded interrupts to intc0 in the 480-520 range,
won't this break interrupt delivery for all SOC1 peripherals (like uart12,
SDHCI, FMC, and SPI) on the main CPU by routing them to the TSP instead?

>  			<30 6 &intc0 510>,   /* M30 ~ M35  */
>  			<40 6 &intc0 520>,   /* M40 ~ M45  */
>  			<50 1 &bootmcu_hlic 11>; /* only 1 pin to BootMCU */
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-upstream_a=
st2700-v9-0-f631752f0cb1@aspeedtech.com?part=3D3
