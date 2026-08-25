Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719323AC00
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656145; cv=none; b=g44fE6W2krfBLJSARvSGnaJpXosKHBs4CyRiGoJ/IlbI3rL7POJCfR7DeCAJfcqhDuYVuqsXNSqKXb1bIFmzbByRuf67eZRfeaPHD26aakGo8ectEKr6hMNP6dvwL7uH7GIAGFfGzRbXi2r2J7Nguq7jYec1DUq9WMxoEUlvqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656145; c=relaxed/simple;
	bh=6t3zAru9h1/FdafexW7ABLtjm1bS2oFBnFtibTmoYd0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBbSvv2zu0hw29BbDEgwHaWALICZ6nSix857eIIBOLb7LSbjJhQTBCyagLz5pTM8CwpNKFJPEPS1jnkFHHNd/OamCTEhIvl+dgLcR0SOsVR5ON7vaoaq4bUBiGGyAkbDKbT54uMItb8ksdWUmT4AgHfbrwo8B2SOOuFNlht3Zz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0hDeyZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0hDeyZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11AD1F000E9;
	Tue, 25 Aug 2026 11:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787656136;
	bh=Cv2KfJB4hx+YL0Q5vMRzFtMKgQq5DyKrkRjHEQpr1Ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0hDeyZq1bes8RDQIsZwWJE4Rm2fPFleaO0+tLLxuXEruB+MUseeQ9k0pI6sodX67
	 uqspzOYGFlnFvqubkyGhahmR7nw2+kYIzXRewvvzTFEIFftRMpoYMEx3f7ZMq3T94/
	 J2L8GLqX/o0Tvkt6JVdFOWcKfpg64NslW3UUv4mGBczCHy/BShLZrk4bLWYPomz5aP
	 5RezfTwldsD44pyioXy9EqFVz2MQyf4zD7qKvaU8HNdIWLN6tf0xzh4L90zZv+dBMN
	 8MZndLG5KbQYvu20K3cDLxtYI/w39fThhOiFVXd83HxALaa7lRMuVJIFYwre9sObNq
	 NSWEdvBQdfpuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: ipq5424: Flatten usb controller
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-ipq-flatten-usb-v1-6-5c1f3170bbe9@outlook.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-6-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:08:55 +0000
Message-Id: <20260825110855.D11AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect interrupt-names array order triggers dtbs_check failures.
--

--- Patch [6]: [PATCH 6/9] arm64: dts: qcom: ipq5424: Flatten usb controlle=
r nodes ---
commit 7fc908a77a39f9104c77c013b5b7e44175c43038
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5424: Flatten usb controller nodes

This patch flattens the USB controller nodes and updates them to use the
latest bindings and the flattened driver approach. It also adds a property
to select UTMI as the reference clock for the DWC3 core.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5424.dtsi
> index 702061e16a58d..648f95d70448e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -663,33 +660,32 @@ usb2: usb2@1ef8800 {
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
Will this order of interrupt names cause dtbs_check failures with the new
schema?

The qcom,snps-dwc3.yaml schema requires the interrupts for
qcom,ipq5424-dwc3 to strictly follow the order: dwc_usb3, pwr_event,
qusb2_phy, dp_hs_phy_irq, and then dm_hs_phy_irq. Leaving
dm_hs_phy_irq before dp_hs_phy_irq seems like it might trigger a
validation error, even though the kernel matches them by name.

[ ... ]

> @@ -755,34 +747,33 @@ usb3: usb3@8af8800 {
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
Does this also need to have dp_hs_phy_irq placed before dm_hs_phy_irq
to satisfy the qcom,snps-dwc3 dtbs_check requirements for this node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-ipq-flatte=
n-usb-v1-0-5c1f3170bbe9@outlook.com?part=3D6
