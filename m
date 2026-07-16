Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D83A83A8
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784220425; cv=none; b=Z2DOxw6TDXqS7qfXVD0XW3337tG1hiVJkZzOwwX+UQTBblO/txPYlUi/oMEnV0t7krGOiFlyyg1d/DDVit/JbIvV1o24+e9Nr4dNsYe0dYFRGWOQmyXy8XFM9Zf4tKLBih0EAd8MARosY4TOj+wx419yw4IT87mmmgGAwunaexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784220425; c=relaxed/simple;
	bh=/r2LElpVqUW1qCE97uDVQadU8M1z7RiyPYft6iP6XX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KQl3tIT/6UESsi0XMM+7wuCIoF/Kf+BkYVzTkW0vZesBg7OngG/5KZf+mSBsAi6WLE/lLgXYu7Knem1qf5gpVmx8sXYcB0675DrV3NCV1dqcN3kRm6AOVerjYIOg1xuRsHHPJVmyfTNF7AVZWJ/rpKa6G0ZLTsFn/EkPhasuBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N95Abyv9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N95Abyv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19781F000E9;
	Thu, 16 Jul 2026 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220418;
	bh=wEeOo3r4np1YGE4VOa5wwo+gdNApgQ4mXUtX986v0lY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N95Abyv9D5yCN/Df7sGD1dxUloRoeeqLeJ851QTVvcQBt011Cr44WiDzIkIvRsMkn
	 oUBqAh/rurTsVozmL9n8NJGA50/w2EC9TDkMMRM/23qSBQaXm+qpI39VIupYoIPtn/
	 mp+OgGqve7jjGv9YAr16sTSb6Tu/nfryMjh+IeYmw3YD1wvtKOKN8ZnJAvu7Zg0bPY
	 nYEP7U/LlhyTiZ7uzToFLAvY4wjeiiPt9/ZJqAoQQeKU7v3kHRKk+XF9roTdqFlIWC
	 U5/tU5unocVq4mGFT5aDqTvqlT3dB+ALX3lIOYRWX/kuefYP/H/engUND3wWnqIPL+
	 EQXdzCoVaEP8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-1-13f73a0571bb@oss.qualcomm.com>
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-1-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 16:46:57 +0000
Message-Id: <20260716164657.C19781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The 'usb_2' node incorrectly assigns the Configuration NOC clock t=
o the 'iface' clock instead of the System NOC clock.
- [High] The newly added USB PHY nodes specify SoC-specific compatible stri=
ngs without driver support, and the QMP PHY uses non-standard clock/reset n=
ames causing fatal probe failures.
--

--- Patch [1]: [PATCH v3 1/4] arm64: dts: qcom: Add support for usb nodes o=
n Shikra ---
commit 9325329fd1f5c498b9188ae6a3b6adc14bd363e9
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

arm64: dts: qcom: Add support for usb nodes on Shikra

This commit adds support for both USB controllers and their respective phys
on the Shikra platform.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -442,6 +443,85 @@ gcc: clock-controller@1400000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		usb_1_hsphy: phy@1613000 {
> +			compatible =3D "qcom,shikra-qusb2-phy";

[Severity: High]
Does this compatible string have driver support merged, or should it include
a generic fallback? Using an SoC-specific compatible without a matching dri=
ver
implementation will prevent the PHY driver from probing.

[ ... ]

> +		usb_qmpphy: phy@1615000 {
> +			compatible =3D "qcom,shikra-qmp-usb3-dp-phy";
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

[Severity: High]
Should the clock name "pipe" be "usb3_pipe" instead?

The upstream QMP combo PHY driver strictly looks up "usb3_pipe" using
devm_clk_get(), and failing to find it will cause a probe failure with
-ENOENT.

> +
> +			resets =3D <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
> +				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
> +			reset-names =3D "phy_phy",
> +				      "dp_phy",
> +				      "phy";

[Severity: High]
Do these reset names deviate from what the QMP combo PHY driver expects?

The driver typically requires "phy" and "common". Deviating from this
list may prevent successful probing of the PHY and the dependent DWC3
controller, causing the USB subsystem to break.

[ ... ]

> +		usb_2: usb@4c00000 {
> +			compatible =3D "qcom,shikra-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x0 0x04c00000 0x0 0xfc100>;
> +
> +			clocks =3D <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
> +				 <&gcc GCC_USB20_MASTER_CLK>,
> +				 <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,

[Severity: High]
Is the Configuration NOC clock intentionally duplicated here for the "iface"
slot?

The "iface" clock index usually expects the System NOC AXI interconnect clo=
ck.
Leaving the System NOC clock unvoted during USB2 operations could lead to
unclocked AXI transactions, potentially causing silent DMA failures or seve=
re
interconnect bus hangs when the controller attempts to access system memory.

> +				 <&gcc GCC_USB20_SLEEP_CLK>,
> +				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
> +			clock-names =3D "cfg_noc",
> +				      "core",
> +				      "iface",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-shikra-usb=
-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com?part=3D1
