Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51F31578E
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108439; cv=none; b=RBd7tBTVa7Lopszx1XQvnCnySL9dKVkHTrxd3B/ZMXOEoBOTr7iw9gRA5FZqJ53hBgVa++8tsBj+iqRzpNp+DXTqx1yF5Eghk9GuYzvYGOm+UWNHz7VQFQ4AXgcRbSxRR54psbw60l/K+34fB8N0TVaCX7D5uGJn9zWsNdOWa/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108439; c=relaxed/simple;
	bh=v43gHqOv0Sv6E3MIyz69B260cpGpYz2DipnyoyIf/G8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hc7D9EmN8GzM9xEuH5iBAAJ5BkRTeniN76M4+L4Ki1va+WD6ehfZJe+xT4Cb0sWMrhK/MTEz8Ac2faiNDg3w6ob6KnpsviSBHKpGi3DRgyoAXL2eUYbFde2FkXV76ytgr4WXQWu45nUFdGGly6YNZuB+Jm/1xYNRLgJdbbNp6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISkBc3Wq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISkBc3Wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304A01F00893;
	Wed, 10 Jun 2026 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781108438;
	bh=DrYm7WbczMVrcxHmJwbzp64/9jgA9QiCCNz2GNt4C38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ISkBc3Wqs5QzToCmkiPrh5j6Kh0YcOPkR122lAjQ0ob98SLGoEWc1KJz6b+H6XQrW
	 Uf5DooFgUgN3bLiQ8HeM9T9N++MNRTyAEcRwrCEZLB0iAAd6VHbIJBaCLs0sP0cTs9
	 BEyqd6VAkIH7dHyLDC62m1nwbHTsvL8P65bnlFVhLOxFyjubyNm/hmmDSlYMYYm+Lm
	 ESm5PX3ZCsv2z1GCKFFxVuj1VGtswL4J1tvoPaOxUu/H/VJ+Jp9h4uZLLlMqVQanld
	 haXR7BOOMKSn7qzIV1IEIfTpPgRC7FFpegOQRcalu201jl7vMPrPrJhSyQxP4QSLdP
	 fNF/cjEUJf9IQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: nuvoton: npcm845: Add peripheral
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomer Maimon" <tmaimon77@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610160816.2828713-3-tmaimon77@gmail.com>
References: <20260610160816.2828713-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 16:20:37 +0000
Message-Id: <20260610162038.304A01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DTC Warning (unit_address_vs_reg): The `apb` node includes a unit a=
ddress but lacks a `reg` property.
- [Low] DT Binding Schema Violation: `nuvoton,sysgcr` property is undocumen=
ted and forbidden by the ChipIdea USB2 schema.
--

commit b1b96db36d76cd5dd1f935613798ed29aade275d
Author: Tomer Maimon <tmaimon77@gmail.com>

arm64: dts: nuvoton: npcm845: Add peripheral nodes

Extend the NPCM845 SoC DTSI with the peripheral controller nodes needed
by the evaluation board and downstream platforms. Add the Ethernet MACs,
USB device controllers and PHY, MMC controller, FIU controllers, memory
controller, RNG, ADC, PWM/FAN controller, and I2C buses. Also add the
OP-TEE firmware node needed to describe these blocks.

> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/ar=
ch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index 7976baafb9942..1e21b2704784f 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
[ ... ]
> @@ -51,7 +57,255 @@ clk: rstc: reset-controller@f0801000 {
>  			#clock-cells =3D <1>;
>  		};
> =20
> -		apb {
> +		gmac1: ethernet@f0804000 {
[ ... ]
> +		udc8: usb@f0838000 {
> +			compatible =3D "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0838000 0x0 0x1000
> +			       0x0 0xfffef000 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM8XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +
> +			nuvoton,sysgcr =3D <&gcr 0x9C 0xC000 0xC000>;

[Severity: Low]
Does this undocumented nuvoton,sysgcr property cause a dtbs_check warning?

The USB Device Controllers bind to "nuvoton,npcm750-udc", which is evaluate=
d=20
against Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml. This schem=
a=20
specifies unevaluatedProperties: false but does not document nuvoton,sysgcr=
=20
internally or in any dependencies.

> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
> +		udc9: usb@f0839000 {
> +			compatible =3D "nuvoton,npcm845-udc", "nuvoton,npcm750-udc";
> +			reg =3D <0x0 0xf0839000 0x0 0x1000
> +			       0x0 0xfffef800 0x0 0x800>;
> +			interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&clk NPCM8XX_CLK_SU>;
> +			clock-names =3D "clk_usb_bridge";
> +
> +			nuvoton,sysgcr =3D <&gcr 0x9C 0x3000 0x3000>;

[Severity: Low]
Is this the same undocumented property issue as seen above in udc8?

> +			phys =3D <&udc0_phy>;
> +			phy_type =3D "utmi_wide";
> +			dr_mode =3D "peripheral";
> +			status =3D "disabled";
> +		};
> +
[ ... ]
> +		fiux: spi@fb001000 {
> +			compatible =3D "nuvoton,npcm845-fiu";
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <0x0 0xfb001000 0x0 0x1000>,
> +			<0x0 0xf8000000 0x0 0x2000000>;
> +			reg-names =3D "control", "memory";
> +			clocks =3D  <&clk NPCM8XX_CLK_SPIX>;
> +			status =3D "disabled";
> +		};
> +
> +		apb: bus@f0000000 {

[Severity: Low]
Will changing this node name to include the @f0000000 unit address=20
trigger a unit_address_vs_reg DTC warning?

According to the Devicetree specification, if a node name includes a=20
unit-address, the node must also have a reg property where the first=20
address matches the unit-address. Because the apb node defines ranges=20
but lacks a reg property, this might introduce build noise.

>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
>  			compatible =3D "simple-bus";
> @@ -59,14 +313,6 @@ apb {
>  			ranges =3D <0x0 0x0 0xf0000000 0x00300000>,
>  				<0xfff00000 0x0 0xfff00000 0x00016000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610160816.2828=
713-1-tmaimon77@gmail.com?part=3D2
