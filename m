Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03AA4CF477
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792196472; cv=none; b=pRKcpNAPF6sFXFQZZC/ceBEihZmuxrt99T8c7/bCOkXAoPs7oJBaWy0rc4STgQAKdR4UWPYlNGDQPzr5jTeNOkuEWGfnOhuXlVaocGJYU1v9yoK54+2h0RU9RZAU9Dv/+XZ+IL/wplHbMjxjROgsFmqlqtDIeVpbzaoQtLmx7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792196472; c=relaxed/simple;
	bh=crjMIFPQDTsrGV6zao3tYUrKAdG6+rFVGU8qBxlpMms=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QRcAf8enO93Dm0oMF0Fsu6btIiDhVXV965IVwCRC4ghG4aBhbmsEo6Vp6J2yGkh7hFgXiaxf0Pg/jqQi+Kjby6y9nWiFrOh46TGtiTzik40JefIu36EhsdHIbyXUHE3xAsfwD6KVQWZwkbpkB4q3G292unAQNhoIpZCeXGM+9PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBlRz7rk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBlRz7rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387B71F000C4;
	Sat, 17 Oct 2026 00:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792196470;
	bh=40zsI1ZDDEmJ3H6bbW/PLrhgxLCxvlzKWsdkZOne3mU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MBlRz7rkr/geH5SBideWHQMQw3F5L2+mBHHwPerSMaNXb4R0XM5iyx/1lwWHZsuh8
	 ncOOG6uY/XZHJKvY0VQmv8ylTo7zfrbn8jtE3CQ2Ebld3hyI9sTYGvDZDGJJ/X1z0R
	 OpggEqG8MABXYFxc/QCGOUdcyadBgYmeYkOq3Sciijn/DbDGIsmKM55MffL76PJnL1
	 igSS9D+/Lr7SPuofkHSjg90iyoKU9IwtmMkWUAoPZ00luDWFQz1uil60TFocTggNYW
	 lNv9QcLp7BcAlm9Xbe+XVfj13Na9itGoRElpwbfY3BbyrDn3dgS4jQwgqHD3be6RG1
	 4YCxU7+twc6Vw==
Message-ID: <sashiko-outbox-175064@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco: add CSI2 PHY common-phy
 providers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anusha Arun Nandi" <anusha.nandi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261017001116.2318647-3-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
 <20261017001116.2318647-3-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 00:21:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: monaco: undocumented csiphy compatible and camss=
 conflict
- [Medium] arm64: dts: qcom: monaco: missing #phy-cells on csiphy0..2 provi=
der nodes
- [Medium] arm64: dts: qcom: monaco: unsupported 300 MHz OPP in csiphy_opp_=
table
- [Low] arm64: dts: qcom: monaco: csiphy_opp_table placed inside simple-bus=
 soc@0
--

commit 6a19d429f6610cefdfd6dfc21d55e9665c60129f
Author: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers

This commit adds standalone qcom,qcs8300-csi2-phy device tree nodes
(csiphy0..2) and an associated operating points table (csiphy_opp_table)
to arch/arm64/boot/dts/qcom/monaco.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index cfe39f923224f..3d173a017122e 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -5563,6 +5563,120 @@ cci2_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ac9c000 {
> +			compatible =3D "qcom,qcs8300-csi2-phy";
> +			reg =3D <0x0 0x0ac9c000 0x0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>;
> +			clock-names =3D "core",
> +				      "timer",
> +				      "csiphy_rx";
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
How are csiphy0, csiphy1, and csiphy2 expected to bind and coexist with the
camss node when enabled by a board or overlay?

First, the compatible string "qcom,qcs8300-csi2-phy" does not appear to be
documented under Documentation/devicetree/bindings/ or matched by any driver
in drivers/phy/ or drivers/media/, which will cause dtbs_check failures and
leave the nodes unbound.

Second, the commit message mentions that camss_detect_legacy_phy() selects
the non-legacy path while leaving the CSIPHY resources in the camss node
(isp@ac78000) intact, but camss_detect_legacy_phy() does not exist in the
tree. Instead, camss_probe() -> camss_init_subdevices() in
drivers/media/platform/qcom/camss/camss.c unconditionally initializes all
CSIPHY entries in qcs8300_resources:

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
	for (i =3D 0; i < camss->res->csiphy_num; i++) {
		ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
					     &res->csiphy_res[i],
					     res->csiphy_res[i].csiphy.id);
}

And msm_csiphy_subdev_init() in
drivers/media/platform/qcom/camss/camss-csiphy.c exclusively requests the
same MMIO regions (0xac9c000, 0xac9e000, 0xaca0000) and non-shared interrup=
ts
(GIC_SPI 477..479):

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
	csiphy->base =3D devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
	if (IS_ERR(csiphy->base))
		return PTR_ERR(csiphy->base);
	...
	ret =3D devm_request_irq(dev, csiphy->irq, csiphy->ops->isr,
			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
			       csiphy->irq_name, csiphy);
}

Wouldn't enabling any of csiphy0..2 alongside camss result in -EBUSY MMIO a=
nd
IRQ resource conflicts unless the dependent driver and binding patches are
present?

> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "top";
> +
> +			status =3D "disabled";

[Severity: Medium]
Should csiphy0, csiphy1, and csiphy2 also include the #phy-cells property?

Because these nodes are named phy@... and described as generic-PHY provider
nodes, the phy-provider.yaml schema requires #phy-cells, and at runtime
_of_phy_get() in drivers/phy/phy-core.c requires it when resolving a phys
phandle:

drivers/phy/phy-core.c:_of_phy_get() {
	ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
		index, &args);
	if (ret)
		return ERR_PTR(-ENODEV);
}

Without #phy-cells on csiphy0..2, won't dtbs_check fail and _of_phy_get()
return ERR_PTR(-ENODEV) for any consumer referencing these providers?

[ ... ]

> +		csiphy_opp_table: opp-table-csiphy {
> +			compatible =3D "operating-points-v2";
> +
> +			opp-300000000 {
> +				opp-hz =3D /bits/ 64 <300000000>;
> +			};
> +
> +			opp-400000000 {
> +				opp-hz =3D /bits/ 64 <400000000>;
> +			};
> +		};
> +
>  		camss: isp@ac78000 {
>  			compatible =3D "qcom,qcs8300-camss";
> =20

[Severity: Medium]
Is the 300 MHz entry (opp-300000000) in csiphy_opp_table supported by the
QCS8300 CAMCC clock driver?

In drivers/clk/qcom/camcc-sa8775p.c, the parent RCGs for these clocks
(cam_cc_cphy_rx_clk_src and cam_cc_csi0phytimer_clk_src through
cam_cc_csi2phytimer_clk_src) all use ftbl_cam_cc_cphy_rx_clk_src, which only
defines a 400 MHz frequency entry:

drivers/clk/qcom/camcc-sa8775p.c:
static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] =3D {
	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
	{ }
};

Similarly, csiphy_res_8300 in drivers/media/platform/qcom/camss/camss.c only
lists 400000000 Hz for the QCS8300 CSIPHY clocks. Will requesting the 300 M=
Hz
OPP fail clock rate lookup or round up to 400 MHz?

[Severity: Low]
Also, should csiphy_opp_table be placed under the root node (alongside
cpu0_opp_table and qup_opp_table) rather than directly inside soc@0, and
should phy@ac9c000..phy@aca0000 be placed after isp@ac78000 to maintain
unit-address ordering?

Because soc@0 is a simple-bus node with #address-cells =3D <2> and
#size-cells =3D <2>, placing opp-table-csiphy inside soc@0 without reg or
ranges triggers the check_simple_bus_reg() warning in scripts/dtc/checks.c
and fails simple-bus schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017001116.2318=
647-1-anusha.nandi@oss.qualcomm.com?part=3D2
