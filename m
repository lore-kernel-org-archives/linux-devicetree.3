Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8D53BB136
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790605; cv=none; b=Jzki29DgzQcwxOvkHTxMzFJZRm5GtnWINIFpgkt0RNVQ6fGMv6SVBOSYv0Lex+OpRh4dlTLnrlW0MS0JZtoRPwosjqwH4ac/W+3nnNmXFd4GR5/61CyT80YYut2IhWh+Dq+FqPG4RbgVLHuIwk4c2BhzQVK8bNlOPtH9CyWUlHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790605; c=relaxed/simple;
	bh=uja7P95pf23DiRGV0iXhbwRLeeajAeGAslmaIVuYJyg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=siRNPpWshe7WobeDKBlFNNs9sVJaAtDKYzgUXG10+t/xoX2wKeVV/mgf0QIE2thXL814ioB7TZeQtIJaVLWA4MH93MSheFjLjB7pM9KInH0aqyUAot/Gz3IHzRRu4fnJKISnZ6okysE6m+AizF3+wSYObfLMbBHa/USdaK82irI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oflPKcfT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oflPKcfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA1B1F000E9;
	Tue, 26 May 2026 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779790604;
	bh=rYeAsQRMdEc57kT97hFhTE4xAmOyvQk1nsE54xgWdgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oflPKcfT7Yx8rLQmJmOFXJuIRvoDxoXP4fbUI7w6ikcZgftO+xOHBurAAKNPp5H7+
	 5Gbb3c0fWRugbu2FkBpSO9UBV24/tPo8kjLbjSPzHaS4F0BzRopRHcbwMX4dtLLUQy
	 7WDXkqfOu1P9926PW8zsX3XNeehNlr6exVxjeU8fZFLdr4Qh+1e2GK9o8Qml3jwjOv
	 wL/nZ5fEPVZItv+DAbkfSUdCe4Bwooi0jQ3fQCGwd6/iZfWzF6QPAyFBU4RkSPQVJY
	 3BKPVQRKl3rWoZ1p2FWG489vbou5k+pyuCdpnavqMsSe7HXU7SbSogSQYb+zOkGPPG
	 qeXefRc9LbUVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics mp13 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrice Chotard" <patrice.chotard@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526-upstream_uboot_properties-v7-5-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-5-e17cd424d5db@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:16:31 +0000
Message-Id: <20260526101632.5CA1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing Parent Boot Phase Tags
- [High] Missing Supplier Boot Phase Tags
- [High] Unfulfilled Commit Message Claim
--

commit 7c0b7128d099d18d1bcdd89ea128ab291f4eeb89
Author: Patrice Chotard <patrice.chotard@foss.st.com>

ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards

This commit adds bootph-all and bootph-pre-ram flags to various device
tree nodes for STMicroelectronics mp13 boards. The stated goal is to ensure
these nodes are present in all boot stages to support SD boot.

> To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
> present in all boot stages, so add missing bootph-all phase flag
> to these nodes to support SD boot.

[Severity: High]
The commit message mentions adding the bootph-all flag to timer nodes to
support SD boot, but no timer nodes appear to be modified in this patch.

Does this patch miss the required timer updates, or is the commit message
inaccurate?

Without the timer node in the early boot device tree, could system timing
functions and SD boot break?

> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/=
boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> index 70d85af467353..06b5b68e5f784 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
[ ... ]
> @@ -436,6 +455,7 @@ connector {
> =20
>  /* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev=
.200 */
>  &vdd_ldo2 {
> +	bootph-all;
>  	regulator-always-on;
>  	regulator-boot-on;

[Severity: High]
Will this bootph-all tag, as well as the ones added to child regulators
like vdd_sd, vdd, vddcpu, vddcore, vdd_ddr, and vref_ddr, be effective
during early boot?

Under U-Boot's fdtgrep reduction rules, while parents of tagged nodes are
structurally retained, their properties (including the compatible string)
are stripped unless explicitly tagged. Without a compatible string, U-Boot's
Driver Model will fail to bind drivers for the PMIC and I2C controller.

Do the parent nodes (e.g., the I2C controller and PMIC) also need the
bootph-all tag to ensure these regulators are probed in early boot?

> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/=
st/stm32mp135f-dk.dts
> index 6022e73f58afd..43b8a7eed01b9 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
[ ... ]
> @@ -448,9 +518,24 @@ &sdmmc1 {
>  	st,neg-edge;
>  	bus-width =3D <4>;
>  	vmmc-supply =3D <&scmi_vdd_sd>;
> +	bootph-pre-ram;
>  	status =3D "okay";
>  };

[Severity: High]
Since sdmmc1 is tagged with bootph-pre-ram, does its vmmc-supply
(&scmi_vdd_sd) also need a corresponding boot phase tag?

If neither the scmi_vdd_sd node nor its parent scmi_regu are given a
bootph-pre-ram or bootph-all tag, fdtgrep will strip the target node
from the early boot device tree.

Could this result in a dangling phandle reference for vmmc-supply
that prevents the MMC driver from resolving its power supply during
early boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-upstream_u=
boot_properties-v7-0-e17cd424d5db@foss.st.com?part=3D5
