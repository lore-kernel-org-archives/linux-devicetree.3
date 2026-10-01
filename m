Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1DC42C500
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841888; cv=none; b=gQyrx4Cr3AKS5bn8eFY0bIVY0xrlV+Qqa70aGUoTj7pXQdM7Pvk+KHwCz68o8kiiNAK7MhbxDvfc2Ga72uwoWJF50kbLnVtIhS+OqmpGbXYjzDIi0A3edgNDWdEfvOZtS1en+EcYSubJIAD+hMPxIios9mvpoTaJY4A/4DK5K/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841888; c=relaxed/simple;
	bh=e9mgx710RzWBEeNRVu8z2X8yhX4Iq0YJ/9NtU3UyhbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qExpo2yHtITuzdlCq5wRnNf2uK6JmszCnGv3JiSaoc0swsA4NCDFtWv8KNh8t864DzW5AbHSBX8nqePSkJwvbM47E0wQQLYAKEubkZBOm69+VB3HyV6kppI+wAmg5HP2M/lHAdCSNLGDY5pxrhy0Um6IgM22L2j3Cu/KPfX8xx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH5GNqp8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH5GNqp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFA51F00898;
	Thu,  1 Oct 2026 08:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790841886;
	bh=D79J0kjdiqmEn/M6+Ozr8yZhr6sNwqTeKF1tGYg2FYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WH5GNqp8vS3Un2TkisgOty9qxIgf9GPcl8bYfYGEGoaAKTpSKxYLhpoLnCoyd9Gaf
	 fWVtd4XYNu3GIbK3nPi28J1bnjuAP4KyFBnIwWRgMcFQ+gtqw9QuphsOxmxFx0D1we
	 hIIky6ATN/Y4gNWk1YnI83vnjOMVEtMwFfZzp3q7Hw25akW84iT8KJgYQpJWmHLRkx
	 bpiS1N/PmlsmdYJs1a69fhZNKpt3duZmr0a2tjsQNUDS92HYuadImV8sUktuL4sw2h
	 RNBaDeJwwL42lTdfqBARH+EyY0N+BAEVAJ3IiHgVyO4zR2qcE197JibIuXxKueUrEO
	 jARyi0QYb+1Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/8] arm64: dts: qcom: ipq5424: Flatten usb
 controller nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261001-ipq-flatten-usb-v4-3-486a4d5ede30@outlook.com>
References: <20261001-ipq-flatten-usb-v4-0-486a4d5ede30@outlook.com>
 <20261001-ipq-flatten-usb-v4-3-486a4d5ede30@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 08:04:45 +0000
Message-Id: <20261001080446.5EFA51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: IPQ5424 USB clocks and interrupts order violates qcom,=
snps-dwc3 schema
--

commit 37ae00028e39229f3da1503fa9411f44830ec187
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5424: Flatten usb controller nodes

Flatten usb controller nodes and update to using latest bindings and
flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5424.dtsi
> index 23f851e9241fe..b1bfe31227e76 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
[ ... ]
> @@ -640,12 +640,9 @@ qusb_phy_1: phy@71000 {
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
Does changing the compatible string to qcom,snps-dwc3 cause a dtbs_check
validation failure here?

The existing array sequence for clocks in this node does not match the stri=
ct
ordering (cfg_noc, core, iface, sleep, mock_utmi) mandated by the newly
applied qcom,snps-dwc3 schema.

[ ... ]
> @@ -664,33 +661,31 @@ usb2: usb2@1ef8800 {
>  			assigned-clock-rates =3D <200000000>,
>  					       <24000000>;
> =20
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
Is the order of interrupts correct for the new schema?

The newly applied qcom,snps-dwc3 schema dictates that dp_hs_phy_irq must be
declared before dm_hs_phy_irq, but they are listed in the reverse order her=
e.
This will cause dtbs_check to fail.

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
Does changing the compatible string to qcom,snps-dwc3 cause a dtbs_check
validation failure here?

The existing array sequence for clocks in this node does not match the stri=
ct
ordering (cfg_noc, core, iface, sleep, mock_utmi) mandated by the newly
applied qcom,snps-dwc3 schema.

[ ... ]
> @@ -771,34 +762,31 @@ usb3: usb3@8af8800 {
>  			assigned-clock-rates =3D <200000000>,
>  					       <24000000>;
> =20
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
Is the order of interrupts correct for the new schema?

The newly applied qcom,snps-dwc3 schema dictates that dp_hs_phy_irq must be
declared before dm_hs_phy_irq, but they are listed in the reverse order her=
e.
This will cause dtbs_check to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-ipq-flatte=
n-usb-v4-0-486a4d5ede30@outlook.com?part=3D3
