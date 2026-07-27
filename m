Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670B03EC6B5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146703; cv=none; b=osA1vhqPsjpNW0Ut00rFLeyHiOpaoAA1alR4uXRoVGhb0FjpjjWgC4uoqS5cS6wu8sjWe3vX1sIT5ITF4jSgOKXBb5KHNtrh9zF5EvfquYNXBM/VJtqpLOof++ZvbBJ9aRszxAjE0da/Kt1yEqMV+KcUSYY864/ZasMg2/c8Z04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146703; c=relaxed/simple;
	bh=gzY8Akr0dKM9rpDCBTxjqyvNGVIaIqOJiVO8xNiZPcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pU/KxfTqywUbBTDmnkRlYYWSo5Fl2b6DtFk8h6j2CzKvoGYfkj4UGt228C4T/QFayNzRNbxLsxzaBNMHZlkMRnNx8EWfqGbEHTwZZduRJbBOKctxjPcRwFvzo3wVVQ5H2j9qcYoY2u9350c/vkWQJA7Rgvv3ozMp7K8RyF7ztIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt616MWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt616MWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D731F000E9;
	Mon, 27 Jul 2026 10:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785146699;
	bh=aRzd3jz/bDaiK05/fg3Gqlphw4OUNqs34yo1ELPYIIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jt616MWOCotUIIoMWHmXv2+0J3T6n7uFff60jq/Nq2UOubmARzQ5UYPyynokzBHQd
	 yhsRWvc+pjgQB4n8xVBxc8p+frF9ZMC57XPf1tLUD3wOxNtZl0m1bSiqJiyI/H4Hj1
	 a+stmtRSpkFlb2wCDxloSPVcpYPT/3drEdtWZqB0HOeYdPjz1T2U8f1bYN+1SoFBPp
	 eNNaxzOEl7PmA6yOAyS8Be77y7AXm7nV6MjgUPXkeJbCmc/rM/A6ni9xdmq2zaOeb8
	 BsbsgWg/Un8rh9YV1ygSlgScOv1U0E4xzQFfbwgpq0nBtiPmG3SGXHhS30tISD1r3H
	 TzBFURjQLZhJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller and
 USB phy support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727094726.890179-2-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
 <20260727094726.890179-2-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 10:04:58 +0000
Message-Id: <20260727100459.36D731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The `spacemit,k3-combo-phy` compatible string is undocumented and =
lacks a driver, causing the `usb3d` controller to endlessly defer probing.
- [Medium] The `phy_type` property is ignored by the DWC3 controller driver=
; the standard `snps,hsphy_interface` should be used instead.
- [Medium] The `combophy` node violates devicetree layering by defining int=
ernal SoC routing at the board level, relies on undocumented properties, an=
d omits hardware dependencies.

Pre-existing issues:
- [High] DWC3 hardware resets are toggled before clocks are enabled, violat=
ing synchronous reset constraints.
--

--- Patch [1]: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller =
and USB phy support ---
commit fc8b62c47a78ea5ec792c1be2a1f162dc04c118a
Author: Inochi Amaoto <inochiama@gmail.com>

riscv: dts: spacemit: k3: add USB controller and USB phy support

This commit adds USB device nodes to the Spacemit K3 SoC devicetree. It
introduces configurations for the DWC3 controller, USB2 PHY, and a combo
PHY, enabling them for the K3 Pico-ITX board.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/bo=
ot/dts/spacemit/k3-pico-itx.dts
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts

[ ... ]

> @@ -182,6 +182,11 @@ dldo7: dldo7 {
>  	};
>  };
> =20
> +&combophy {
> +	spacemit,apmu =3D <&syscon_apmu 0x11>;

[Severity: Medium]
Since spacemit,apmu defines an internal SoC connection between the PHY and
the APMU, should this property be placed in k3.dtsi rather than the
board-level file to avoid duplicating internal topology across boards?

> +	status =3D "okay";
> +};
> +

[ ... ]

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi

[ ... ]

> @@ -438,6 +439,47 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
> =20
> +		usb3d: usb@81a00000 {

[Severity: High]
This is a pre-existing issue, but it directly affects the initialization of
the newly added usb3d controller here.

The core hardware sequencing in dwc3_generic_probe() asserts and deasserts
hardware resets before enabling clocks:

drivers/usb/dwc3/dwc3-generic-plat.c:dwc3_generic_probe() {
    ...
    ret =3D reset_control_assert(dwc3g->resets);
    ...
    ret =3D reset_control_deassert(dwc3g->resets);
    ...
    ret =3D devm_clk_bulk_get_all_enabled(dwc3g->dev, &dwc3g->clks);
    ...
}

For synchronous bus architectures (AHB/AXI), does the clock need to be
actively toggling for the reset signal to propagate through internal
flip-flops? Toggling a synchronous reset while the IP's clocks are gated
might mean the hardware ignores the reset, leading to a synchronous bus
hang or initialization failure.

> +			compatible =3D "spacemit,k3-dwc3";
> +			reg =3D <0x0 0x81a00000 0x0 0x10000>;
> +			interrupts =3D <149 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent =3D <&saplic>;
> +			clocks =3D <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
> +			clock-names =3D "usbdrd30";
> +			resets =3D <&syscon_apmu RESET_APMU_USB3_D_AHB>,
> +				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
> +				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
> +			reset-names =3D "ahb", "vcc", "phy";
> +			phys =3D <&usb3d_u2phy>,
> +			       <&combophy 4 PHY_TYPE_USB3>;

[Severity: High]
The spacemit,k3-combo-phy driver does not appear to exist in the tree.
Because the dwc3 controller explicitly depends on this PHY via the phys
property, will devm_phy_get() indefinitely return -EPROBE_DEFER and
prevent the USB controller from ever initializing?

> +			phy-names =3D "usb2-phy", "usb3-phy";
> +			phy_type =3D "utmi";

[Severity: Medium]
The Synopsys DesignWare Core (DWC3) driver does not read the phy_type
property. It strictly relies on the vendor-specific snps,hsphy_interface
property.

Could this cause the controller to silently fall back to suboptimal
hardware defaults instead of the intended UTMI configuration?

> +			snps,dis_enblslpm_quirk;

[ ... ]

> +		combophy: phy@81d00000 {
> +			compatible =3D "spacemit,k3-combo-phy";
> +			reg =3D <0x0 0x81d00000 0x0 0x600000>;
> +			#phy-cells =3D <2>;
> +			spacemit,apb-spare =3D <&pll>;

[Severity: Medium]
The spacemit,apb-spare property appears to be undocumented and points to
a clock controller instead of a syscon.

Additionally, this node maps 6MB of register space but omits the clocks
and resets properties. Are these properties required to safely access the
memory-mapped IP block?

> +			status =3D "disabled";
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727094726.8901=
79-1-inochiama@gmail.com?part=3D1
