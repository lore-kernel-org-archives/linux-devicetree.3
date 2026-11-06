Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934813;
	b=dUz9H/gVm8cQ64F3Bxe/FGa1s3PCgp4uRjllge28BK5iF6ZcuslkZWEJQSoTqHG7Y/05
	 3RV+j4yYuqm+tl85OkH9JMLdhBcp4Ouc6cwk0wfd6j2W5Q8LNPQAITec1V201dgHbjKfI
	 kqRAZ9p/J70SYaZ7R9YCxWoowsmTHtmT7R8fLgepb/bkQVYfFIOxI3BuaVbtLT4vFCZWa
	 vz/7GMorodhPKJQNzopGKRr9i9Dd/Rh4IHBJccbtZquZdj0vyPl7PxgKOcjzVLiA6VtHL
	 JnDYwkVrd0bNnpAq1CSW20wYhWaPjoKqucWyKpCLnSp/X3E5/6y8iMuTRreuD5rhHyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934813;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y+wMYlqVPcFuPv5xtgTDphiySAohyok5ha6qNDUl6/E=;
	b=enIivMKLN6D7vCsv8xEq+D4bIR7qZhC1XVuiVMUBHOQov2Nx7RE4YqetCOuAGITHg6j4
	 RCvBVAoYUxncXC+1PnNd/pZm/AGnZDP8qvmYHsRdDwdaEeIFMPkNZmJbeYR0/Z8Ld8keE
	 Ih9xVXZzBBUq7nE6jiytSMGC/lsWD8riyEJ66Drc1fMHfo63+L/4w4AUaMjgFVOlccEK8
	 HB2nL/v3yfjruwHc+VpJLxx0xZkqrh2+XGnpcSq3pXv/VTxq8zG3d0cGnOW2KUfezGHog
	 4Lsm1o+KrqMryvducE/QfGBymph9IZPlP83EznP5uQHjyoHK6nyKcaARI33vdX++HQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDZj6yyt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7A606A31B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDZj6yyt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA01F0089F;
	Fri,  6 Nov 2026 03:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793934812;
	bh=y+wMYlqVPcFuPv5xtgTDphiySAohyok5ha6qNDUl6/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nDZj6yytsXj1OJ9/TQ3xnQz0LPzATqmZDYyOAqVILc3MMbJAtmT22NvUoqOfBi4s9
	 nJhxPBKOccIUYlWYw2Tom3eR9+QFbaljf5ESQMTJBSZrTO2AlWsB6OVD0wDQ/t6p3d
	 crR/s6Z2EFrBAq8gQsaWh1pdickmR55N0MozHWWoP5DINhBAw2AFz0xYYvl10Vn+lq
	 btCaEJXKaDwA6YwD136m8bNIJhFWMyL7xzYt21s/B/y1tWc8GbnAZvSh2+A5BGHbZI
	 zawWCLPzja8jZdMeYtNl9Y2mDTiVuuAjqSs5QmFLe8bpmDMZz945qXBmbxoJTYB20p
	 sberfUzr/ljzw==
Message-ID: <sashiko-outbox-200631@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY
  common-phy providers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anusha Arun Nandi" <anusha.nandi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106030212.2811027-2-anusha.nandi@oss.qualcomm.com>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
 <20261106030212.2811027-2-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:13:31 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: lemans: undocumented qcom,sa8775p-csi2-phy com=
patible
- [Medium] arm64: dts: qcom: lemans: single power-domain in csiphy0..3 caus=
es -EEXIST
--

commit 03beee1895ec9b19424b0689817a5a264d09433f
Author: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

arm64: dts: qcom: lemans: add CSI2 D-PHY common-phy providers

This commit adds four standalone qcom,sa8775p-csi2-phy generic-PHY provider
nodes (csiphy0..3) and their shared OPP table to lemans.dtsi so boards can
wire camera sensors through the non-legacy CAMSS PHY path.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 1fdb72fa55184..6909dfa06d867 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi

[ ... ]

> @@ -5348,6 +5356,134 @@ port@3 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ac9c000 {
> +			compatible =3D "qcom,sa8775p-csi2-phy";

[Severity: Medium]
As reported by Sashiko on v1 [1], is there a devicetree binding update and
driver support accompanying qcom,sa8775p-csi2-phy (used on csiphy0..csiphy3=
)?

In Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml, only
qcom,x1e80100-csi2-phy and qcom,glymur-csi2-phy are documented, so dtbs_che=
ck
will fail on these nodes.

In addition, phy_qcom_mipi_csi2_of_match_table in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c only matches
qcom,x1e80100-csi2-phy:

static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D {
	{ .compatible	=3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi2_dphy_4nm_=
x1e },
	{ }
};

When a board or overlay enables one of csiphy0..csiphy3 and wires a sensor
endpoint through it, camss_probe() -> camss_init_subdevices() ->
camss_detect_legacy_phy() in drivers/media/platform/qcom/camss/camss.c sees
the remote port parent node named phy and sets camss->legacy_phy =3D false.
Then msm_csiphy_subdev_init() in
drivers/media/platform/qcom/camss/camss-csiphy.c calls
devm_phy_get_by_of_node(dev, remote):

	csiphy->phy =3D devm_phy_get_by_of_node(dev, remote);
	of_node_put(remote);
	if (IS_ERR(csiphy->phy)) {
		ret =3D PTR_ERR(csiphy->phy);
		goto done;
	}

Without a driver matching qcom,sa8775p-csi2-phy to register a PHY provider
(and a corresponding 5nm v1.3.0 PHY configuration in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c), won't
devm_phy_get_by_of_node() return -EPROBE_DEFER indefinitely?

> +			reg =3D <0x0 0x0ac9c000 0x0 0x2000>;
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
As reported by Sashiko on v2 [2], will phy_qcom_mipi_csi2_probe() fail with
-EEXIST when power-domains only contains a single entry on csiphy0..csiphy3?

When a platform device has a single power-domains entry in DT,
platform_probe() -> dev_pm_domain_attach() -> genpd_dev_pm_attach() in
drivers/pmdomain/core.c attaches that domain directly to dev->pm_domain bef=
ore
the driver's probe callback runs:

	if (of_count_phandle_with_args(dev->of_node, "power-domains",
				       "#power-domain-cells") !=3D 1)
		return 0;

	return __genpd_dev_pm_attach(dev, dev, 0, 1, true);

When phy_qcom_mipi_csi2_probe() in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c subsequently calls
phy_qcom_mipi_csi2_attach_pm_domains() -> devm_pm_domain_attach_list() ->
dev_pm_domain_attach_list() in drivers/base/power/common.c:

	if (dev->pm_domain)
		return -EEXIST;

dev_pm_domain_attach_list() returns -EEXIST because dev->pm_domain is alrea=
dy
set, causing phy_qcom_mipi_csi2_probe() to fail. Furthermore, both
Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml and
drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c expect three power domai=
ns
(top, mmcx, mx) and three clocks (core, timer, ahb).

[1] https://lore.kernel.org/r/sashiko-outbox-175063@kernel.org
[2] https://lore.kernel.org/r/sashiko-outbox-196105@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106030212.2811=
027-1-anusha.nandi@oss.qualcomm.com?part=3D1
