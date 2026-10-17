Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC992BE7BE
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 00:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792196708; cv=none; b=UYDlHRwdzqDbDMx6uYnPCRC+mPeprahY7uoY4rGgy+CdfO5Z2wWtzMjea8vjlpRxNmNv8Eoznf/4iXMyaDV7+/Pvor6+t907y70xhPttFKHyb8BTi+yohqozpGtR8IDjHRJPCFex5cc+zPsh7ZUSG6IO3CyewS1ubqjt8WINEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792196708; c=relaxed/simple;
	bh=pvafrKxSU5zxjlQLlFNzhdnz8xG307cI4yk5uKoo5Jg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kY9/hd7m4a5V6hmXeFk0gXQwuf8EIl+daUyLisaX9KcMtfP+uU+ZA2pb86RxZQqLRjW8wrOwkjPGmKNlpnWNF3ZdUD8GKAn/yDgD28lC8PrH52V5L2MRi0zAZ0pInCyyFd3ztzV+X64VAymOlcSaIQ6zj44pBTbqgaRXCKzyZ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8CZxrgD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8CZxrgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C4D1F000C4;
	Sat, 17 Oct 2026 00:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792196706;
	bh=M8KqzuZiCROsNZPtu/FljRLgXT1DJX8xlacA3Iv9ff0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F8CZxrgDtv+iTNVBnWUImwsbYqkMsG1j9Ict06bsbD+zg3q4irHo7ncp8a5IIhEvQ
	 nYakvSodxWro5bOkziy+dCR94IWiRBJ3D5HkZPJevq5bkOiILBG6t2Pj9uXJunGEqR
	 +BPGyZHzdMVMtsKVuVrZdFYnM3b0fCweRyd0/xLo90XuHyNIvPHmVXgoNfqzkzuqcq
	 PCLd9g7P1IryD3rma3SXtLvnyY5j/RZbAM2VvEuJNAoxrVRupijihptACACSRwYelN
	 jSnDLZZ0xUzE+e7P6lFj6xt8OPvm6cTjnWBMsWqGyj2B6MU5a05eUv2Pkxlzosqdx7
	 EDKR+zlhPEL7w==
Message-ID: <sashiko-outbox-175065@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy
 providers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anusha Arun Nandi" <anusha.nandi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261017001116.2318647-4-anusha.nandi@oss.qualcomm.com>
References: <20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com>
 <20261017001116.2318647-4-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 00:25:06 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: kodiak: duplicate CSIPHY MMIO and IRQ with camss=
 node
- [Medium] arm64: dts: qcom: kodiak: undocumented qcom,sc7280-csi2-phy comp=
atible
- [Medium] arm64: dts: qcom: kodiak: missing #phy-cells in csiphy0..4 provi=
der nodes
- [Low] arm64: dts: qcom: kodiak: opp-table-csiphy placed inside simple-bus=
 soc@0
--

commit 8059004601c54f69c5b842a91e910a3594ccac37
Author: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

This commit adds five standalone qcom,sc7280-csi2-phy device tree nodes
(csiphy0 through csiphy4) and a shared opp-table-csiphy operating points
table to arch/arm64/boot/dts/qcom/kodiak.dtsi, disabled by default.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index f2da3706d5c88..bdac6b149aee8 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5151,6 +5151,178 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ace0000 {
> +			compatible =3D "qcom,sc7280-csi2-phy";
> +			reg =3D <0x0 0x0ace0000 0x0 0x2000>;

[Severity: Medium]
Is there a Devicetree binding schema or driver series that this patch depen=
ds
on?

Neither Documentation/devicetree/bindings/ nor drivers/ in the tree contains
the compatible string qcom,sc7280-csi2-phy (repeated on csiphy0 through
csiphy4), and camss_detect_legacy_phy() referenced in the commit message do=
es
not exist in drivers/media/platform/qcom/camss/. Running dtbs_check fails on
the undocumented compatible string, and enabling any of csiphy0..csiphy4 at
runtime leaves the platform device unbound.

> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +			clock-names =3D "core",
> +				      "timer";
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
Will enabling any of csiphy0 through csiphy4 alongside camss cause a resour=
ce
conflict (-EBUSY) during probe?

The standalone csiphy0..csiphy4 nodes declare the same MMIO ranges
(0x0ace0000, 0x0ace2000, 0x0ace4000, 0x0ace6000, and 0x0ace8000) and GIC_SPI
interrupts (477, 478, 479, 448, and 122) that remain listed in the sibling
camss node (isp@acb3000):

arch/arm64/boot/dts/qcom/kodiak.dtsi:
		camss: isp@acb3000 {
			compatible =3D "qcom,sc7280-camss";

			reg =3D <0x0 0x0acb3000 0x0 0x1000>,
			      <0x0 0x0acba000 0x0 0x1000>,
			      <0x0 0x0acc1000 0x0 0x1000>,
			      <0x0 0x0acc8000 0x0 0x1000>,
			      <0x0 0x0accf000 0x0 0x1000>,
			      <0x0 0x0ace0000 0x0 0x2000>,
			      <0x0 0x0ace2000 0x0 0x2000>,
			      <0x0 0x0ace4000 0x0 0x2000>,
			      <0x0 0x0ace6000 0x0 0x2000>,
			      <0x0 0x0ace8000 0x0 0x2000>,

During camss_probe() -> camss_init_subdevices(), the CAMSS driver
unconditionally iterates over all camss->res->csiphy_num entries:

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
	for (i =3D 0; i < camss->res->csiphy_num; i++) {
		ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
					     &res->csiphy_res[i],
					     res->csiphy_res[i].csiphy.id);
}

And msm_csiphy_subdev_init() claims exclusive ownership of each memory regi=
on
and non-shared interrupt line:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
	csiphy->base =3D devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
	if (IS_ERR(csiphy->base))
		return PTR_ERR(csiphy->base);
	...
	ret =3D devm_request_irq(dev, csiphy->irq, csiphy->res->hw_ops->isr,
			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
			       csiphy->irq_name, csiphy);
}

> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "top";
> +
> +			status =3D "disabled";

[Severity: Medium]
Should csiphy0 through csiphy4 include #phy-cells =3D <0>?

Because these nodes are named phy@ace0000 through phy@ace8000 and act as
generic-PHY providers, phy-provider.yaml requires #phy-cells during
dtbs_check, and _of_phy_get() in drivers/phy/phy-core.c requires #phy-cells
when resolving a PHY phandle:

drivers/phy/phy-core.c:_of_phy_get() {
	ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells",
		index, &args);
	if (ret)
		return ERR_PTR(-ENODEV);
}

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
>  		camss: isp@acb3000 {
>  			compatible =3D "qcom,sc7280-camss";
> =20

[Severity: Low]
Should csiphy_opp_table: opp-table-csiphy be placed under the root node
(alongside qspi_opp_table and qup_opp_table) rather than inside soc: soc@0,
and should phy@ace0000..phy@ace8000 be ordered after isp@acb3000?

Because soc: soc@0 has compatible =3D "simple-bus", placing opp-table-csiphy
without a reg or ranges property inside it triggers dtc simple_bus_reg
warnings (under W=3D1) and simple-bus.yaml schema validation errors in
dtbs_check. Also, unit addresses 0x0ace0000..0x0ace8000 sort after
isp@acb3000.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017001116.2318=
647-1-anusha.nandi@oss.qualcomm.com?part=3D3
