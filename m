Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934813;
	b=3ArjamWdASQ/a85OsnGrkpEmhlnQnhQ4DSHaK6yow+6sO3zi5WTOfohXFsdzY1mqeuZm
	 Um+lxjvaxv1owdQPN4QYLJW72EyQMkpHq6V0z2LwNoo+TU9DmGrjf2SrBSumWGDZwUlnh
	 iAhJFBVTOp9uV0T8f9690eNVP9fWVKZZOno01a+5SSdZVi+Vb6rPcnen2VkJVBKkHTrga
	 F2Vn+dBVvn7EakkqUsZpy0jvF5sr9ZM/8AkEQHoXJWlKEMXYHenlyz5owqHyXifEQ4eMa
	 43vMXfwWqqwOq3HUsZo3VYJvotT4K2PP4epCUFSIIzWlkfI0JWvIUhG0jhD7+bCcuAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934813;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fK+YGxQi2g0kB3mY8O28uWorWjYWpJxaaOpfGo/4K+0=;
	b=j7Tn77oFadOu0qxq02zx+y+nGrJzemIU4IzqCQPJDSEUJg5GbrY2nTDhmretBHXXDKob
	 bSshVUAbkIm/TLWmUkc9j/sc6fjiuBdROzn3FSG9CU0FS7pP4uAM8eus7yjBr0FChSoEG
	 KjkJcfQ8DUWxRMABfyXL385m2gtM+unu/L1uynsJ0RLZEwqiIzF2JtkuXm3mh6BZYPFh0
	 WdCmkPO5XnalKbLJVlIT3jWWUDTGsyOibRWlgEzADVcetNJWjt3YZJPxnfsovgHtW0Uqq
	 1IySS5B2gbahJFkLWTtMGmHj/0FLxeKA69bPm4Gkge0UQEFcJNycUAhVjRc9DFuugfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CwpnI1Rc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA5606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 03:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CwpnI1Rc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7351F008A1;
	Fri,  6 Nov 2026 03:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793934813;
	bh=fK+YGxQi2g0kB3mY8O28uWorWjYWpJxaaOpfGo/4K+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CwpnI1RcqoyqPU943rhej/cC6j/sZpqpV4x9KpKg6iacFcdjH8N02h3RnF2W5zJCi
	 4Muxr+kkp0kzvwZKePtWoJTQvC1rH9Yxev+NcjcJarHpYxHRyWGGLf8R8nRVJ76on/
	 OVD48mXvcxW3joYMGnqx4eyo7zbymk0Qlq+oABfGo3M/I4ax8UchHGzeqcxRhXybfc
	 xu5qaWlwNo22zjqPPPxJqOqgPD/Gts72goGv54CMc44JArJUdgGzsq21F5qftRS1rw
	 uxRbPeB/fk7jxhA/FFa5GYW1W9WhBcDdtvEmcmGq8wxSs4uJ3kRb/pcvyvmPtMMYDX
	 YDDMqiJPkb/MA==
Message-ID: <sashiko-outbox-200632@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: monaco: add CSI2 PHY
 common-phy providers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anusha Arun Nandi" <anusha.nandi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106030212.2811027-3-anusha.nandi@oss.qualcomm.com>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
 <20261106030212.2811027-3-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:13:32 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: monaco: undocumented and unmatched qcom,qcs8300-=
csi2-phy
- [High] arm64: dts: qcom: monaco: single power-domain on csiphy0..2 causes=
 -EEXIST
- [Low] arm64: dts: qcom: monaco: csiphy0..2 placed before camss out of add=
ress order
- [Low] arm64: dts: qcom: monaco: commit message describes inter-version de=
ltas
--

commit 73bdfe66a74e3ebe09640aa912bd64a757bca278
Author: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers

This commit adds an OPP table and three disabled standalone CSI2 PHY
provider nodes (csiphy0, csiphy1, and csiphy2) to the Qualcomm Monaco
(QCS8300) devicetree.

>     arm64: dts: qcom: monaco: add CSI2 PHY common-phy providers
>    =20
>     Expose the three QCS8300 CSIPHYs as standalone
>     qcom,qcs8300-csi2-phy generic-PHY provider nodes (csiphy0..2) at their
>     existing register addresses, each with its own OF graph (port@0
>     sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
>     the non-legacy path once a board wires a sensor through one of them.
>     The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
>     unchanged, so boards that don't use a provider still get the legacy
>     binding.
>    =20
>     csiphy0..2 drop the extra "csiphy_rx" clock: QCS8300 binds through the
>     sa8775p soc_cfg (no dedicated QCS8300 camcc driver exists), which only
>     declares two clocks ("core", "timer") for this PHY, not three.
>    =20
>     csiphy_opp_table moves to the root node, not inside soc@0 (a
>     simple-bus), since it has no reg/ranges property of its own; its
>     opp-300000000 entry is dropped too, since QCS8300 shares SA8775P's
>     camcc, whose cam_cc_cphy_rx_clk_src only defines a 400 MHz rate.
>    =20
>     The provider nodes are disabled by default; a board or camera overlay
>     enables the one(s) it uses.
>    =20
>     Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>     Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>

[Severity: Low]
This isn't a bug, but arch/arm64/boot/dts/qcom/monaco.dtsi did not previous=
ly
define csiphy0..2 or csiphy_opp_table. The second and third paragraphs
describe changes between patch revisions (dropping the csiphy_rx clock,
moving csiphy_opp_table to the root node, and dropping opp-300000000) as if
modifying existing definitions in the tree, and also refer to the CSI2 PHY
driver soc_cfg as a camcc driver.

Should the inter-version changelog notes be moved below the --- tear line so
the commit description only explains the final state being added?

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 35fbee63d4c65..a66c04a1d3063 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi

[ ... ]

> @@ -5577,6 +5585,102 @@ cci2_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: phy@ac9c000 {
> +			compatible =3D "qcom,qcs8300-csi2-phy";
> +			reg =3D <0x0 0x0ac9c000 0x0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +			clock-names =3D "core",
> +				      "timer";

[Severity: High]
As reported by Sashiko on v2 [1], csiphy0, csiphy1, and csiphy2 declare
compatible =3D "qcom,qcs8300-csi2-phy" with two clocks and no fallback
compatible string such as "qcom,sa8775p-csi2-phy".

In Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml, only
qcom,x1e80100-csi2-phy and qcom,glymur-csi2-phy are documented, and three
clocks (core, timer, ahb) are required:

  compatible:
    oneOf:
      - const: qcom,x1e80100-csi2-phy
      - items:
          - const: qcom,glymur-csi2-phy
          - const: qcom,x1e80100-csi2-phy

In drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c,
phy_qcom_mipi_csi2_of_match_table only matches qcom,x1e80100-csi2-phy, and =
no
qcom,qcs8300-csi2-phy or sa8775p soc_cfg entry exists in the driver:

  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D {
  	{ .compatible	=3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi2_dphy_4n=
m_x1e },
  	{ }
  };

When a board or overlay enables any of csiphy0..2 and wires a sensor endpoi=
nt
through it, camss_detect_legacy_phy() selects non-legacy PHY mode and
msm_csiphy_subdev_init() in drivers/media/platform/qcom/camss/camss-csiphy.c
calls devm_phy_get_by_of_node():

  	csiphy->phy =3D devm_phy_get_by_of_node(dev, remote);
  	of_node_put(remote);
  	if (IS_ERR(csiphy->phy)) {
  		ret =3D PTR_ERR(csiphy->phy);
  		goto done;
  	}

Without a matching PHY driver and binding schema, will dtbs_check fail on t=
he
undocumented compatible string and camss_probe() defer indefinitely with
-EPROBE_DEFER whenever one of these PHY nodes is enabled?

> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names =3D "top";

[Severity: High]
As reported by Sashiko on v2 [2], csiphy0, csiphy1, and csiphy2 each specify
only a single power-domains entry.

When a platform device has a single power-domains phandle, platform_probe()
calls dev_pm_domain_attach() -> genpd_dev_pm_attach() in
drivers/pmdomain/core.c, which attaches that domain to dev->pm_domain before
the driver's probe callback runs:

  	if (of_count_phandle_with_args(dev->of_node, "power-domains",
  				       "#power-domain-cells") !=3D 1)
  		return 0;

  	return __genpd_dev_pm_attach(dev, dev, 0, 1, true);

When phy_qcom_mipi_csi2_probe() in
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c subsequently calls
phy_qcom_mipi_csi2_attach_pm_domains() -> devm_pm_domain_attach_list() ->
dev_pm_domain_attach_list() in drivers/base/power/common.c, it checks
dev->pm_domain and fails with -EEXIST:

  	if (dev->pm_domain)
  		return -EEXIST;

Furthermore, Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.y=
aml
and drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c expect three power
domains (top, mmcx, and mx). Will having a single power-domains entry cause
phy_qcom_mipi_csi2_probe() to fail unconditionally with -EEXIST?

[ ... ]

> +		csiphy2: phy@aca0000 {
> +			compatible =3D "qcom,qcs8300-csi2-phy";
> +			reg =3D <0x0 0x0aca0000 0x0 0x2000>;

[ ... ]

> +		};
> +
>  		camss: isp@ac78000 {
>  			compatible =3D "qcom,qcs8300-camss";

[Severity: Low]
As reported by Sashiko on v2 [3], this isn't a bug, but under soc@0 in
arch/arm64/boot/dts/qcom/monaco.dtsi, MMIO child nodes are ordered by
ascending unit address. Here csiphy0 (phy@ac9c000), csiphy1 (phy@ac9e000),
and csiphy2 (phy@aca0000) are placed before camss (isp@ac78000) even though
0xac9c000..0xaca0000 are higher than 0xac78000.

Should csiphy0..2 be placed after camss: isp@ac78000 to maintain unit-addre=
ss
order?

[1] https://lore.kernel.org/r/20261103221026.3662383-3-anusha.nandi@oss.qua=
lcomm.com
[2] https://lore.kernel.org/r/20261103221026.3662383-3-anusha.nandi@oss.qua=
lcomm.com
[3] https://lore.kernel.org/r/20261103221026.3662383-3-anusha.nandi@oss.qua=
lcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106030212.2811=
027-1-anusha.nandi@oss.qualcomm.com?part=3D2
