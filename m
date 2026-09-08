Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87D361670
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888570; cv=none; b=bTrr49R8EdrNaNS5aepTsYaDZ+suZrTM00oUq40mgwh9xQS3NhZ/vwRwr76Z414BtzYTdWej+frF31VkNCYytyJd6nQxRdrZO7wZfziVw0/d1PazfrR0m9QTe1RzoYtem28QaQCmJszD7AUUsd29cMklTCP4e44+8BwETCBOvKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888570; c=relaxed/simple;
	bh=uehikkHwQZWMhBbYZ1/N9EHdSLWKwaMtFxXUycqULPc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VOVxta9SfT3lmcZKGvxRTkXDp2G2mUSI0YnOxfHkOZNodqUyrNMhlwYDDPoee+D7pPfv3QDGnU4SgWiIW2lqckrx38CR3RBgr+5UwOqG00k9ezrGw0m63pHzuUqgKmNjEb9dvs2ZDb+eV7EQdAkNdPijDwDGKva56UNfg7hoads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewQZD6Yl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewQZD6Yl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0360D1F00A3A;
	Tue,  8 Sep 2026 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888568;
	bh=iW2rDRbfJicWgB/1O09v0nLVB+oOPrHqZq6l7sDlPc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ewQZD6Yl9ncWi3weUm7DNLHjpRaOXfHrM2/S5XBdVYzfxiuzyGhZdDnqmoqYlVyFk
	 nGpFwONnO3EuejeLT6riFimlOjJHn/ignA4ftVf616aVut9WCRHdAe8YXIZcYL10gK
	 4w1/5Uej8MX65rI2CMZCwYTPf8HWFtJlbb4s1MFwt73SdOiTH6eUov9nt5awmFqlFO
	 THQioN8bYmje2u0561YXhmeF4wduO+ukoNsjQhC0N2uynIyAUFpL0RkecfPIOcVJXp
	 f+u45R1Nd9j49hXs+vDK/mCUqxK8DKyyfnK468HukZv9UyGRXzcyiztUkj+rP3VCge
	 zUGZXoKGYSdWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] arm64: dts: intel: agilex5: add USB3.1
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ng Ho Yin" <adrian.ho.yin.ng@altera.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <17405f3736bb2fb20456d00b7bb75ffa8c1311b9.1788886615.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <17405f3736bb2fb20456d00b7bb75ffa8c1311b9.1788886615.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:29:27 +0000
Message-Id: <20260908172928.0360D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `usb31_bus` node defines a 1 TiB (40-bit) `dma-ranges` window =
that structurally overflows its parent bus (`soc`) which only has a 32-bit =
address space.
- [Medium] The `phys` property points to a `usb-nop-xceiv` node, but this i=
s rejected by the generic PHY framework and ignored by the DWC3 legacy PHY =
fallback, making the property dead code.
--

commit ea5388a5a6d3ab6b2ff68927da6ac8bb6e1fe941
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

arm64: dts: intel: agilex5: add USB3.1 controller node

This commit adds a DTS node for the Synopsys DWC3 USB3.1 controller on the
Agilex5 SoC. It places it under a simple-bus with a 40-bit dma-ranges window
to match the interconnect's USB DMA address width. The controller is also
enabled in host mode on the SoCDK board.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index f54767d1526e1..523f722a2a642 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi

[ ... ]

> @@ -493,6 +493,41 @@ usb0: usb@10b00000 {
>  			status =3D "disabled";
>  		};
> =20
> +		usb31_bus: usb-bus@11000000 {
> +			compatible =3D "simple-bus";
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x0 0x0 0x11000000 0x0 0x100000>;
> +			/*
> +			 * USB interconnect DMA is limited to 40-bit addresses
> +			 * (1 TiB window from 0).
> +			 */
> +			dma-ranges =3D <0x0 0x0 0x0 0x100 0x0>;

[Severity: High]
Does this 40-bit dma-ranges window structurally overflow its parent bus?

The usb31_bus node is defined as a child of the soc node, which only has
a 32-bit address space (#address-cells =3D <1>). Translating a 1 TiB DMA wi=
ndow
into a 32-bit parent bus mathematically overflows the parent's addressabili=
ty.

The kernel's OF DMA parser evaluates this window against the parent's 32-bit
addressability and truncates DMA addresses to the parent bus size. Any DMA
address beyond 4 GB cannot be represented or routed correctly.

This breaks 64-bit DMA for the USB controller, which can cause memory
corruption or IOMMU faults if system memory > 4GB is used for DMA buffers.

> +
> +			usb31: usb@0 {
> +				compatible =3D "altr,agilex5-dwc3";
> +				reg =3D <0x0 0x0 0x0 0x100000>;
> +				interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +				/*
> +				 * ref and suspend share the same hardware
> +				 * source; reuse the published suspend clock ID.
> +				 */
> +				clocks =3D <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>,
> +					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
> +					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>;
> +				clock-names =3D "bus_early", "ref", "suspend";
> +				resets =3D <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
> +				reset-names =3D "core", "ecc";
> +				iommus =3D <&smmu 7>;
> +				phys =3D <&usbphy0>, <&usbphy0>;
> +				phy-names =3D "usb2-phy", "usb3-phy";

[Severity: Medium]
Will this phys property actually be parsed, or is it treated as dead code?

The usbphy0 node has compatible =3D "usb-nop-xceiv". The generic PHY subsys=
tem
in drivers/phy/phy-core.c explicitly rejects usb-nop-xceiv and returns -ENO=
DEV.
The DWC3 core driver dwc3_core_get_phy() handles this error by falling back=
 to
the legacy USB PHY subsystem.

However, the legacy subsystem explicitly expects the legacy property name
usb-phy. Since this node uses the generic phys property name, the legacy
fallback also fails.

The DWC3 driver ignores the resulting -ENODEV error and silently proceeds
without a PHY.

> +				maximum-speed =3D "super-speed";
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				status =3D "disabled";
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788886615.gi=
t.adrian.ho.yin.ng@altera.com?part=3D2
