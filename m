Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023944CF477
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792196366; cv=none; b=sniOOYItqLPVB+gPceS/lNghVHkoxkw2ZGr0kUF/vfeGm1nSJOeL8yBqMHwDtGKjqVOZFntU07dZlbJ3MWvfllLMnKdjVOHnjiBuXL46O2rlwHziuyWZqESFIZKkyURbV6QnIW3zzskNpY58XQOPGnolNP4nDbfQJbvFWwBc6Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792196366; c=relaxed/simple;
	bh=8f+XDfP/P6xEkbYLBLzY3WlKn9qg/Gj/jD5N6M/o5hQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fFdf2ENwo4g4eJbh3fxxOwYtwKqPY4rP/tolt4PdxyUgGBn4Jfe8+eIzD7qcFT3xhByd4Zn59rUvddlCgCIowUy/QcOq7eCwQfIlbI4uFJ+Cwed9T0MwDGzTIcJQ/5tfrt4sI9wwun1e8uY3/JFKCW5QaxG5cIzO87LFfqmqH34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWHmQ8Qz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWHmQ8Qz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E5D1F000C4;
	Sat, 17 Oct 2026 00:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792196364;
	bh=qnuqF05D0VYSabEnj5Xu9FSqeIx59gcj3O998nY5H5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWHmQ8QzLMxsWvLm1fxADQF1vV3/UIX1ihlFyDjoij82R6xtwj6VRYAvOw34jHNvl
	 uEIYygq+qSgFcfVT6r8gUJ0Sqo2+FH4WWByW/6Pv6L/vF0bx/WtOw0wj5edC5ZZL6c
	 wAjbcixb3TfsAcRXsvJY/+y64ZeiYQzIdAghCOtbiEzs2NnxYIj6ct3EDkMUWAvAxn
	 SBkfXW/qrJSLLi9rpflLQIksRUKJOKSvOvcFovPFB9Eqyj1eYRup2YFSTosbZDtbsi
	 Ix99/wMvaEYNg2ksQnmzmgM16ja9bhCSN7VIvDUZ34gpPq+C6ArJyt6oavG2LhNolk
	 eg+mCQdu9n8Ig==
Message-ID: <sashiko-outbox-175063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy
 providers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anusha Arun Nandi" <anusha.nandi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261017001116.2318647-2-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
 <20261017001116.2318647-2-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 00:19:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: lemans: duplicate MMIO and IRQ resources in csip=
hy0..3
- [Medium] arm64: dts: qcom: lemans: undocumented compatible and missing cs=
iphy driver
- [Medium] arm64: dts: qcom: lemans: missing #phy-cells in csiphy0..3 provi=
der nodes
- [Medium] arm64: dts: qcom: lemans: invalid csiphy_opp_table bus placement=
 and 300MHz OPP
--

commit 86878cdbb9d7bba4aeea8079cca2e39342692dee
Author: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers

This commit adds four standalone qcom,sa8775p-csi2-phy provider nodes
(csiphy0..3) and a shared csiphy_opp_table to arch/arm64/boot/dts/qcom/lema=
ns.dtsi,
while leaving the existing CSIPHY resources on the camss node unchanged.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 695eae1b72569..a92a06a5d4865 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5166,6 +5166,154 @@ cci3_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ac9c000 {
> +			compatible =3D "qcom,sa8775p-csi2-phy";
> +			reg =3D <0x0 0x0ac9c000 0x0 0x2000>;

[Severity: Medium]
Does this depend on a binding and driver series that has not been merged ye=
t?

The compatible string qcom,sa8775p-csi2-phy (used on csiphy0, csiphy1,
csiphy2, and csiphy3) is not documented anywhere under
Documentation/devicetree/bindings/, and no driver in drivers/phy/ or
drivers/media/ matches it. Currently,
Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml defines the
CSIPHY resources inside the qcom,sa8775p-camss node.

In addition, the commit message mentions that camss_detect_legacy_phy()
selects the non-legacy path when a sensor is wired through one of these
nodes, but camss_detect_legacy_phy() does not exist in the tree. In
drivers/media/platform/qcom/camss/camss.c, camss_parse_ports(),
camss_subdev_notifier_complete(), and camss_find_sensor_pad() expect camss
ports to connect directly to a MEDIA_ENT_F_CAM_SENSOR subdevice:

drivers/media/platform/qcom/camss/camss.c:camss_find_sensor_pad() {
	while (1) {
		pad =3D &entity->pads[0];
		if (!(pad->flags & MEDIA_PAD_FL_SINK))
			return NULL;

		pad =3D media_pad_remote_pad_first(pad);
		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
			return NULL;

		entity =3D pad->entity;

		if (entity->function =3D=3D MEDIA_ENT_F_CAM_SENSOR)
			return pad;
	}
}

Will this cause dtbs_check failures and prevent boards that enable csiphy0.=
.3
from probing a PHY driver or linking the media pipeline?

[Severity: Medium]
Should csiphy0..csiphy3 also include a #phy-cells property?

Because these nodes are generic PHY providers,
Documentation/devicetree/bindings/phy/phy-bindings.txt requires #phy-cells =
on
each provider node, and other phy@... nodes in
arch/arm64/boot/dts/qcom/lemans.dtsi specify #phy-cells =3D <0>. In
drivers/phy/phy-core.c, _of_phy_get() looks up #phy-cells when resolving a
PHY phandle:

drivers/phy/phy-core.c:_of_phy_get() {
	ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
		index, &args);
	if (ret)
		return ERR_PTR(-ENODEV);
}

Without #phy-cells on csiphy0..csiphy3, won't _of_phy_get() fail with
-ENODEV and dtbs_check report schema validation errors?

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
When a board enables both camss and one of csiphy0..csiphy3, won't the
duplicate MMIO and interrupt assignments cause probe failures with -EBUSY?

Here, csiphy0..csiphy3 claim MMIO regions 0xac9c000, 0xac9e000, 0xaca0000,
and 0xaca2000 (size 0x2000 each) and GIC_SPI interrupts 477, 478, 479, and
448, while the camss node (isp@ac78000) in
arch/arm64/boot/dts/qcom/lemans.dtsi retains the exact same MMIO ranges and
interrupts for csiphy0..csiphy3.

In drivers/media/platform/qcom/camss/camss.c, sa8775p_resources defines all=
 4
CSIPHY entries, and camss_probe() -> camss_init_subdevices() unconditionally
initializes every one of them:

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
	for (i =3D 0; i < camss->res->csiphy_num; i++) {
		ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
					     &res->csiphy_res[i],
					     res->csiphy_res[i].csiphy.id);
}

msm_csiphy_subdev_init() then requests exclusive ownership of the memory
region and a non-shared interrupt for each CSIPHY:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
	csiphy->base =3D devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
	if (IS_ERR(csiphy->base))
		return PTR_ERR(csiphy->base);
	...
	ret =3D devm_request_irq(dev, csiphy->irq, csiphy->res->hw_ops->isr,
			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
			       csiphy->irq_name, csiphy);
}

Won't this conflict whenever a standalone csiphy0..csiphy3 driver and camss
are both active?

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
>  			compatible =3D "qcom,sa8775p-camss";

[Severity: Medium]
Are the placement and frequencies of csiphy_opp_table valid for SA8775P?

First, csiphy_opp_table (opp-table-csiphy) is placed directly inside soc@0
(which has compatible =3D "simple-bus" with #address-cells =3D <2> and
#size-cells =3D <2>) without a unit address, reg, or ranges property, where=
as
shared OPP tables in arch/arm64/boot/dts/qcom/lemans.dtsi (such as
qup_opp_table_100mhz) are placed under the root node or inside consumer
device nodes. Also, phy@ac9c000..phy@aca2000 are placed before isp@ac78000
even though 0xac9c000 > 0xac78000.

Second, csiphy_opp_table includes opp-300000000 (300 MHz), and csiphy0..3
list CAM_CC_CSIPHY0..3_CLK as the first clock in clocks (which the OPP core
scales by default). In drivers/clk/qcom/camcc-sa8775p.c, both
cam_cc_cphy_rx_clk_src (parent of CAM_CC_CSIPHY0..3_CLK and
CAM_CC_CSID_CSIPHY_RX_CLK) and cam_cc_csi0..3phytimer_clk_src use
ftbl_cam_cc_cphy_rx_clk_src, which only supports 400 MHz:

drivers/clk/qcom/camcc-sa8775p.c:
static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] =3D {
	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
	{ }
};

Should csiphy_opp_table be moved out of soc@0 (with phy@ac9c000..phy@aca2000
ordered after isp@ac78000), and is the 300 MHz OPP supported by the SA8775P
CAMCC clock driver?

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017001116.2318=
647-1-anusha.nandi@oss.qualcomm.com?part=3D1
