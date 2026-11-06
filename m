Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934747;
	b=zD8rELT5NpJ5K+eMjOdpHZQE5nRu9ggaEsZhF3Xh+Lb0AOKRgTRWvF8I7GQtoaePWEX8
	 ZLuS0VF71072gETl9CJhxwmX7bGJEohzs130TCEJnWc1obT9kYozf72N6hNzo9aZhoLpK
	 X5nb7N56gIZQlyygE3dEOVGq1Hh0LZUU3S+LapnU/pli57YqWtaMax1YcHap3pf/D0iaM
	 GSZzhxRIcorwGi26GK8xHXtDgXI1vG3bohoY6O9NfnotePlcOkzoDzHHd8lRHLaMhVDyF
	 BjSmcZycpcH/JG0mMyzfrCB5SJm+NorKDtuXZrpEiucyokwLeCn8gIzW1UhaZ+PGA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934747;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EZU+3WyaynGOwUTlwPT0cPMIsa3p/R/mZC47pLYvp9Y=;
	b=QYwmrFvQtfSwQ4IBoqZJZIzLni0+9LFd7SAo1Ao6M1VnlArR/6tDgQ7O3zzxwxk9tFD3
	 B3oIo9yY5DYeTDgQYgFBCUb/1MeqA24S/vVzH6N7cpMP5T1pDbrzd3NgOTj+1O81dS2Bx
	 0O1SosVEJr1s5ostzmpDQMDamjqxoJ1RRt/jug7muLLWJZHEwE5Z3DZRABp9tLQYiPg24
	 UnNA8y4sTyaA0oi5N1NA3FE6YlKv6JXzSx5Z6QLiUPnPMPW60xKFLpmCS3xqFyOkxA8QA
	 xv0LlWR3bS6+cFx0ljHjY+QvBZwmoqPpSCCnHOQWfTCL7GWnSbFw+bZzL1vI/VsA41A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RD7/hafj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08DF606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RD7/hafj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F7F1F0089F;
	Fri,  6 Nov 2026 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793934746;
	bh=EZU+3WyaynGOwUTlwPT0cPMIsa3p/R/mZC47pLYvp9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RD7/hafjy63klwPxJDROxuiUPKbYFnwT9JNFc102akUCiBXB8hxt2Cr2WWH1rCUQ8
	 3pDJhiLrEQma4pqouIU135Q8rpWXHQ9Nw+NRBGAngL3Dz7QuQLP/Cwzw4mBRWQEP7U
	 7QqAapR/MPMDo32KYg8V9vvewH1Dulnm/d9vI7jLUi6LnUpQzUgCp5I1DTsiBy+hA6
	 CJDY92MN/qaOA2M1kWKiQZkVtoY1zVq1cbW/yUGAZpl3VPBe2DLmGifGa+x7060RgO
	 2dVoOe7iImUiaZuZswVc4wDtxI8OfoXEVW98H7bBHYrlFJYe+qI0SUGPyPb8Wxjnqh
	 3zoMlHmQk22Ww==
Message-ID: <sashiko-outbox-200629@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY
 common-phy providers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anusha Arun Nandi" <anusha.nandi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106030212.2811027-4-anusha.nandi@oss.qualcomm.com>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
 <20261106030212.2811027-4-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:12:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: kodiak: undocumented qcom,sc7280-csi2-phy comp=
atible
- [Medium] arm64: dts: qcom: kodiak: single power-domain on csiphy0..4 brea=
ks probe
- [Low] arm64: dts: qcom: kodiak: csiphy0..4 placed out of unit-address ord=
er
--

commit 052b5f2483e5e0bfe39a886df72e88b30b2413ff
Author: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers

This commit adds five standalone CSI2 D-PHY generic-PHY provider nodes
(csiphy0 through csiphy4) and their operating points table to kodiak.dtsi
for SC7280.

> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/q=
com/kodiak.dtsi
> index 8c7523602d271..e0e1fef7882ec 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi

[ ... ]

> @@ -5164,6 +5176,166 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ace0000 {
> +			compatible =3D "qcom,sc7280-csi2-phy";

[Severity: Medium]
As reported by Sashiko on v2 [1], is the qcom,sc7280-csi2-phy compatible
string used on csiphy0 through csiphy4 documented in the Devicetree
bindings or supported by a driver in the tree?

In Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml,
only qcom,x1e80100-csi2-phy and qcom,glymur-csi2-phy are listed:

  compatible:
    oneOf:
      - const: qcom,x1e80100-csi2-phy
      - items:
          - const: qcom,glymur-csi2-phy
          - const: qcom,x1e80100-csi2-phy

Likewise, phy_qcom_mipi_csi2_of_match_table in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c only matches
qcom,x1e80100-csi2-phy:

static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D {
	{ .compatible	=3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi2_dphy_4nm_=
x1e },
	{ }
};

When a board or overlay enables one of csiphy0 through csiphy4 and connects
a sensor through it, camss_detect_legacy_phy() selects the non-legacy PHY
path and camss_init_subdevices() -> msm_csiphy_subdev_init() calls
devm_phy_get_by_of_node():

	csiphy->phy =3D devm_phy_get_by_of_node(dev, remote);
	of_node_put(remote);
	if (IS_ERR(csiphy->phy)) {
		ret =3D PTR_ERR(csiphy->phy);
		goto done;
	}

Without a matching PHY driver registered for qcom,sc7280-csi2-phy, will
dtbs_check fail validation and msm_csiphy_subdev_init() return
-EPROBE_DEFER indefinitely?

> +			reg =3D <0x0 0x0ace0000 0x0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +			clock-names =3D "core",
> +				      "timer";
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "top";

[Severity: Medium]
As reported by Sashiko on v2 [2], will specifying a single entry in
power-domains on csiphy0 through csiphy4 cause probing with the Qualcomm
MIPI CSI2 PHY driver to fail with -EEXIST?

When a platform device has a single power-domains entry,
platform_probe() -> dev_pm_domain_attach() -> genpd_dev_pm_attach()
attaches that domain directly to dev->pm_domain before invoking the
driver's probe callback:

	if (of_count_phandle_with_args(dev->of_node, "power-domains",
				       "#power-domain-cells") !=3D 1)
		return 0;

	return __genpd_dev_pm_attach(dev, dev, 0, 1, true);

Subsequently, phy_qcom_mipi_csi2_probe() calls
phy_qcom_mipi_csi2_attach_pm_domains() -> devm_pm_domain_attach_list() ->
dev_pm_domain_attach_list(), which rejects devices that already have
dev->pm_domain populated:

	if (dev->pm_domain)
		return -EEXIST;

In addition, shouldn't csiphy0 through csiphy4 and csiphy_opp_table also
specify the RPMHPD voltage rail power domains and required-opps needed for
scaling between the 300 MHz and 400 MHz OPPs in
phy_qcom_mipi_csi2_set_clock_rates()?

[ ... ]

> +		csiphy4: phy@ace8000 {
> +			compatible =3D "qcom,sc7280-csi2-phy";
> +			reg =3D <0x0 0x0ace8000 0x0 0x2000>;

[ ... ]

> +		};
> +
>  		camss: isp@acb3000 {
>  			compatible =3D "qcom,sc7280-camss";

[Severity: Low]
As reported by Sashiko on v2 [3], this isn't a bug, but csiphy0 through
csiphy4 (phy@ace0000 through phy@ace8000) are placed before
camss: isp@acb3000 even though 0xace0000 is higher than 0xacb3000. Should
phy@ace0000 through phy@ace8000 be placed after isp@acb3000 (and before
camcc: clock-controller@ad00000) to keep the child nodes of soc@0 sorted
by unit address?

Also, the commit message states that csiphy_opp_table "moves to the root
node" and that its entries "are both kept unchanged", which describes
changes between patch revisions rather than against the baseline tree.

[1] https://lore.kernel.org/r/20261103221026.3662383-4-anusha.nandi@oss.qua=
lcomm.com
[2] https://lore.kernel.org/r/20261103221026.3662383-4-anusha.nandi@oss.qua=
lcomm.com
[3] https://lore.kernel.org/r/20261103221026.3662383-4-anusha.nandi@oss.qua=
lcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106030212.2811=
027-1-anusha.nandi@oss.qualcomm.com?part=3D3
