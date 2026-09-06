Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A007324B04
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788670723; cv=none; b=KnE4nELwl2EUMTaw1IxTUy+ba3o1CAz4CEMEChXkZjrDO8Uw2LcPoUJbjVKu89a7OB6JEV2PEdRo+COQ1rvUPvmP2m2hZy2AWv+a/mgti+V/IRFb29jALpK+xNDKtpsCOyQPuq7TphKI0SPaYc6AFCSqbecjGutX+IBkC62yq94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788670723; c=relaxed/simple;
	bh=Csc1CEV9PKy4j9gfmrTWADHmWqAga1F9Z0Eeoku61wY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdzijHn3SOH3Fls+ruFRpPZwuE8lMf0ugPrSiPN853lPOf93rh+j5x1pPY+L7ZFBv/Qq1zZWiQBdCN9u8G2cGnJ2vhIcDv80ypnJ0v2/m335KOE9pTnXqDkFmejw05x5Iw2VQpUMUHHXnyVaa4S4WYcngELcpsTjskoUp0z62j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIl4xFqx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIl4xFqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC5C1F00A3A;
	Sun,  6 Sep 2026 04:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788670721;
	bh=GeBVEIlDAkyG3XyMIT+zYPp6K8PmOUkXFMDFEnL/CjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIl4xFqxsW8/XLJ6/QRBaNsd/boKsQTZuYbJxs65akE7UawoSUS0vt/I1x82AsbLa
	 sGrNBHcc9o+1+KAMwBlprtR9WBJOyxH+3/Xnn1wRdcAkFLie0VfRSwQb758Z1VQ4ff
	 zQSYqlBVOaiTHDUD2NoTFtA0l/whISW0s+ltaDzMZB2rAn/laA7nPxAqlu8zXtM1Mw
	 UHcqmLK0EZCg4dPMQrM5Me+ClrRd2SMcQbhBSuoKO9TUMjR5iJuoUgjjdu/FFBfn6Z
	 On3v/38f1b0m9gNdEXqotPpJgxJlnSDt5wDRfmaN3fmwabcJ9z9Wj1bINhKDoZx0ub
	 3ME6g/60V6Ncg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] arm64: dts: qcom: ipq5424: Flatten usb
 controller nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-5-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 04:58:41 +0000
Message-Id: <20260906045841.9DC5C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] DT Binding Violation for `clock-names` order in qcom,snps-dwc3.yaml
- [Low] DT Binding Violation for `interrupt-names` order in qcom,snps-dwc3.=
yaml
--

commit fcf10b565c6f9fc462b1aa533f0c8d822af73877
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5424: Flatten usb controller nodes
   =20
Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5424.dtsi
> index 702061e16a58d..de795ca2a905b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -639,12 +639,9 @@ qusb_phy_1: phy@71000 {
>  			status =3D "disabled";
>  		};
> =20
> -		usb2: usb2@1ef8800 {
> -			compatible =3D "qcom,ipq5424-dwc3", "qcom,dwc3";
> -			reg =3D <0 0x01ef8800 0 0x400>;
> -			#address-cells =3D <2>;
> -			#size-cells =3D <2>;
> -			ranges;
> +		usb2: usb2@1e00000 {
> +			compatible =3D "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0 0x01e00000 0 0xfc100>;
> =20
>  			clocks =3D <&gcc GCC_USB1_MASTER_CLK>,
>  				 <&gcc GCC_USB1_SLEEP_CLK>,

[Severity: Low]
Does switching the compatible to "qcom,snps-dwc3" introduce a dtbs_check
validation error for the clock-names array?

The new qcom,snps-dwc3.yaml schema requires a strict array order: cfg_noc,
core, iface, sleep, mock_utmi. However, the existing clock-names array for
this node has a different order:

    clock-names =3D "core",
                  "sleep",
                  "mock_utmi",
                  "iface",
                  "cfg_noc";

Since the dwc3-qcom driver retrieves clocks regardless of order, this
won't affect functionality, but it will cause a compile-time schema
validation failure. Should the clock-names order be updated to match the
new schema?

[ ... ]

> -			interrupts-extended =3D <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended =3D <&intc GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "pwr_event",
> +			interrupt-names =3D "dwc_usb3",
> +					  "pwr_event",
>  					  "qusb2_phy",
>  					  "dm_hs_phy_irq",
>  					  "dp_hs_phy_irq";

[Severity: Low]
Will this interrupt-names order cause a dtbs_check validation error?

The new qcom,snps-dwc3.yaml schema strictly requires dp_hs_phy_irq to
precede dm_hs_phy_irq. In this array, dm_hs_phy_irq is listed first.

Since the driver uses platform_get_irq_byname_optional() to request IRQs
by exact string names, functional behavior is unaffected. However, this
ordering will trigger a schema validation failure. Should dp_hs_phy_irq
and dm_hs_phy_irq be swapped to satisfy the binding requirements?

[ ... ]

> -		usb3: usb3@8af8800 {
> -			compatible =3D "qcom,ipq5424-dwc3", "qcom,dwc3";
> -			reg =3D <0 0x08af8800 0 0x400>;
> -
> -			#address-cells =3D <2>;
> -			#size-cells =3D <2>;
> -			ranges;
> +		usb3: usb3@8a00000 {
> +			compatible =3D "qcom,ipq5424-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0 0x08a00000 0 0xfc100>;
> =20
>  			clocks =3D <&gcc GCC_USB0_MASTER_CLK>,
>  				 <&gcc GCC_USB0_SLEEP_CLK>,

[Severity: Low]
Does switching the compatible to "qcom,snps-dwc3" also introduce a dtbs_che=
ck
validation error for the usb3 clock-names array?

Just like usb2, the existing clock-names array for usb3 uses a different or=
der
than the schema strict requirement (cfg_noc, core, iface, sleep, mock_utmi).

    clock-names =3D "core",
                  "sleep",
                  "mock_utmi",
                  "iface",
                  "cfg_noc";

Should the clock-names array order be updated here as well?

[ ... ]

> -			interrupts-extended =3D <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts-extended =3D <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
>  					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "pwr_event",
> +			interrupt-names =3D "dwc_usb3",
> +					  "pwr_event",
>  					  "qusb2_phy",
>  					  "dm_hs_phy_irq",
>  					  "dp_hs_phy_irq";

[Severity: Low]
Does this interrupt-names array also violate the qcom,snps-dwc3.yaml schema
validation requirements?

Similar to usb2, dm_hs_phy_irq is ordered before dp_hs_phy_irq, whereas the
schema strictly requires dp_hs_phy_irq to precede dm_hs_phy_irq. Should the=
se
entries be swapped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-ipq-flatte=
n-usb-v3-0-13e4e0f63123@outlook.com?part=3D5
