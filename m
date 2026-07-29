Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF723AAF62
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340013; cv=none; b=Z8YzchY4NadYsXFBTri/Geb97eGEJQ5+aI0w/UkOOEf1GPPBNsLTfQPQYjeZE4dR7dZ3xZPySEN/8iDVWLOqgAWoRsNmnAUvOE7sVEAgMbqvkp3Z3epQEi/VwWqqKUD1AuYf/bew/RGFXByzYi9w0FGMvehIIzIP6yBQ5NhahxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340013; c=relaxed/simple;
	bh=AwtC2Vk/e25mKSAtZVL/nN3dGg3IVM2moyjndh4WFh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kpOOlSMwH7A/dK82v5nUYV65nHpbMp9QSH461xbDetjG7LCIu7Q1L6ADDXbtBhvh88Eo3Qd6x2LxhgFAIJjHa8lFsaVnUMxSXdpOFbpsSInMFJDbA7PNSENMHNmE1/BHyqDtwmIe/hYLrmfb7d/BNoDyaG/1oToURPTNcaxnqXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxvTU4Hl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxvTU4Hl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4487B1F00A3D;
	Wed, 29 Jul 2026 15:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340012;
	bh=9/gICmgpQsIG7y/BUNXjH3rTMUj/lvBJ8lPEwg3PD9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kxvTU4HlFf84vbTkj++zf+bWMsS2JVZIqRlCfCJd3TABbO0+ywgoh6JJNMmUP+qRh
	 9UU//bhQLOhslnRMWzfo4Nmc0qXngI9b0wx9PWMgm4Njf2C6AWJAAeXX64pYED8sIZ
	 VDmgQDeiFWGXKFIXfEWS+BDOCqYeRhCerfenO96sx1Ht5JeKHaJs2GIc4DncfpxObc
	 xiYww7DCxXAt/LNkADlcx2qtN6O98jLrJg34Xq1vEkYHNi+XxwBPxc9l2QKCqjRckY
	 gRvSpasjc1YBYkZtN/epcUg6aBgc1k6ZeZN0QiyDGQHavfNKQuYUNPFbW0JbAvjC5u
	 ne89E5dyxRzow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-shikra-usb-v6-dt-v6-1-72ffb4796a08@oss.qualcomm.com>
References: <20260729-shikra-usb-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com>
 <20260729-shikra-usb-v6-dt-v6-1-72ffb4796a08@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 15:46:50 +0000
Message-Id: <20260729154651.4487B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The USB PHY nodes (QMP and QUSB2) use unsupported compatible str=
ings without driver support or generic fallbacks.
- [Medium] The `usb_qmpphy` node provides an incompatible set of `reset-nam=
es` and `clock-names` for QCOM QMP combo PHYs.
--

--- Patch [1]: [PATCH v6 1/2] arm64: dts: qcom: Add support for usb nodes o=
n Shikra ---
commit 1acb18d251027fe95cb37671784abeadb72b31a3
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: Add support for usb nodes on Shikra

This commit adds support for both USB controllers and their respective phys=
 on
the Shikra platform.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 4e5bc9e17c8ed..b5cc159e5dcd4 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> @@ -442,6 +443,85 @@ gcc: clock-controller@1400000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		usb_1_hsphy: phy@1613000 {
> +			compatible =3D "qcom,shikra-qusb2-phy";

[Severity: Medium]
Are these compatible strings supported by any driver upstream?

It looks like "qcom,shikra-qusb2-phy" does not have driver support or gener=
ic
fallbacks, which might prevent the PHY node and dependent DWC3 controller f=
rom
probing successfully when enabled by a board file.

> +			reg =3D <0x0 0x01613000 0x0 0x180>;

[ ... ]

> +		usb_qmpphy: phy@1615000 {
> +			compatible =3D "qcom,shikra-qmp-usb3-dp-phy";

[Severity: Medium]
Similarly, does the "qcom,shikra-qmp-usb3-dp-phy" compatible string have
driver support or a fallback?

> +			reg =3D <0x0 0x01615000 0x0 0x2000>;
> +
> +			clocks =3D <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
> +				 <&gcc GCC_AHB2PHY_USB_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names =3D "aux",
> +				      "ref",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			resets =3D <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
> +			reset-names =3D "phy_phy",
> +				      "dp_phy",
> +				      "phy";

[Severity: Medium]
Do these reset names match what the driver expects for a QMP Combo PHY?

The QMP Combo PHY driver typically requires reset controls named "phy" and
"common".

If the driver attempts to find these resets and cannot due to the names
"phy_phy", "dp_phy", and "phy" provided here, will it fail probing with
-ENOENT?

> +
> +			#clock-cells =3D <1>;
> +			#phy-cells =3D <1>;

[ ... ]

> +		usb_2_hsphy: phy@1617000 {
> +			compatible =3D "qcom,shikra-qusb2-phy";

[Severity: Medium]
Does this node also need an upstream-supported compatible string or a gener=
ic
fallback?

> +			reg =3D <0x0 0x01617000 0x0 0x180>;
> +
> +			clocks =3D <&gcc GCC_AHB2PHY_USB_CLK>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-shikra-usb=
-v6-dt-v6-0-72ffb4796a08@oss.qualcomm.com?part=3D1
