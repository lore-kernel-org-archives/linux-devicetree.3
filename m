Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899853;
	b=Y7yMdNroebH4PWrk9t9vg9dn4W8V9Dg2IiCC2fiJEAuCdqbYd9juu7kZzfqvpNoSz5rK
	 URfPnj4CV62D/PFB+V5BZP/Z0LPxoXLwd8rKWBdUu3mU7iVd+12MmMh0L2i1ZmJsf2ewS
	 fqr/ODq/faONVGIWaV/Cpqs167HugcdbOgXn82kFba6UyoWNpk/X0bvZR8p3psmr2qxpF
	 vUlgaDkzaY2k/QvED1kiojIl26SE88fBajCUcgGvX0KOJEkwmfykVTjr/YB10i9MZO2g7
	 TmU2jsD6WBBVrvMQjE/oi8Ya2wLY/ksDMgstyjhY++Bzpreqqgn/AW1BiPAZwyyiUag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899853;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3B8FSFySMXgVmqpSaZ5ZZGIrWYl20ZD9asecGND8meI=;
	b=iFaJtGs3EPX5jtyfhfPG2Sg/Z19N570rCehd642oW3SK5VZ36i5JgoMGK4syP0gq8sGV
	 BL1w1B5fIw/nIFAosxX8CFlw1Ob1Vz/pp1a6UWEjV/eqnFMRqZOWNenDFA6frJVdSAuwG
	 lEoMakrMCKWZ+TiEJnKC48ps62Cny6zS4zEZbb9FVFKF4oRHdV5Qx28F8xe2yPh49YF/A
	 h809AHNRSj0IvzhsjnK5tW0CubOlTRHbQwTQx0OJTYXatTKuXcqFYUyBtowfqLXtCrlpF
	 +HW0C86JCngV50+gnrGeisvtEXk4pzDV0+9BOKbGpnDzpzRMsJEYN354Ajs2bkcw/Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+Nj4BOl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EC6606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+Nj4BOl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AEC1F01825;
	Sun, 25 Oct 2026 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792899853;
	bh=3B8FSFySMXgVmqpSaZ5ZZGIrWYl20ZD9asecGND8meI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+Nj4BOlnPTjLvkTf0/YxwYs3ouzj+SC7HJqKdBvSkCW/UJtno07waDHFPeLE7wJT
	 YUoZ/L7VFto2E7J3Io0M236R8dVLyAdMDUHpyM2vLu1UCk/slSLHf/1SnVvVHPIsm4
	 dDAuXIntlvFolSN+VMNsTXhsnrp48vLGcBI6PILSw3HJBI+GHrQAcbO7T2EI5NzLjY
	 wLteo3JMr6u849c4X7L/C883V3wyhUHic8rqWpLnHLzcucZQZDmyh05RlDhKG+UpYO
	 Exb1D9BmOYC2L5MjtwuAJwnvtom8sR6dpQI7QpAEU9FkMDlVRqhGoSXASvV/cPq8JX
	 maAb3XW/uc7Gg==
Message-ID: <sashiko-outbox-184025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 07/14] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261024-kaanapali-camss-v22-7-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-7-7da3ea49c8a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 03:44:12 +0000
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
- [High] media: qcom: camss: NULL hw_ops deref in msm_csiphy_subdev_init_le=
gacy()
- [Low] media: qcom: camss: commit message describes phy driver changes
--

commit 64814811592ee91f0301ddbd08c2ef3cf1f43a07
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY

This commit adds the csiphy_res_kaanapali subdevice resource table for
CSIPHY0 through CSIPHY5 and wires it into kaanapali_resources in the
Qualcomm CAMSS driver.

>     media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
>    =20
>     Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
>     the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
>     rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configurat=
ion,
>     which reuses the x1e80100 lane sequence, clocks and supplies but sele=
cts
>     the v2.4.0 common status offset, adds Kaanapali power domain and regi=
ster
>     the "qcom,kaanapali-csi2-phy" compatible.
>    =20
>     Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>     Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

[Severity: Low]
This isn't a bug, but does the second sentence of the commit message
describe changes from an earlier patch in the series ("phy: qcom-mipi-csi2:
Add Kaanapali support") rather than this patch?

Those changes to drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c and
drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c were split into that earlier
commit, whereas this commit adds csiphy_res_kaanapali in
drivers/media/platform/qcom/camss/camss.c and wires .csiphy_res and
.csiphy_num into kaanapali_resources. Could the commit message be updated
to describe the CAMSS changes in this patch?

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 98ec23c39fda2..0358ee3840129 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -38,6 +38,51 @@
> =20
>  static const struct parent_dev_ops vfe_parent_dev_ops;
> =20
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},

[ ... ]

> @@ -5606,8 +5651,10 @@ static void camss_remove(struct platform_device *p=
dev)
>  static const struct camss_resources kaanapali_resources =3D {
>  	.version =3D CAMSS_KAANAPALI,
>  	.pd_name =3D "top",
> +	.csiphy_res =3D csiphy_res_kaanapali,
>  	.icc_res =3D icc_res_kaanapali,
>  	.icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +	.csiphy_num =3D ARRAY_SIZE(csiphy_res_kaanapali),
>  };

[Severity: High]
Can this dereference a NULL csiphy->res->hw_ops pointer in
msm_csiphy_subdev_init_legacy() when probing qcom,kaanapali-camss without
any connected external PHY endpoints in the device tree (for example, with
the default empty port nodes in kaanapali.dtsi or when only using internal
TPGs)?

Because Kaanapali CSIPHY blocks are driven by the standalone PHY driver,
csiphy_res_kaanapali leaves .csiphy.hw_ops as NULL.

However, during camss_probe() -> camss_init_subdevices() ->
camss_detect_legacy_phy() in drivers/media/platform/qcom/camss/camss.c,
camss->legacy_phy defaults to true when no endpoint connected to a remote
node named "phy" is found:

	camss->legacy_phy =3D true;

	/* Find first remote-endpoint and determine if its a PHY */
	for_each_endpoint_of_node(camss->dev->of_node, ep) {
		remote =3D of_graph_get_remote_port_parent(ep);
		if (!remote)
			continue;

		camss->legacy_phy =3D !of_node_name_eq(remote, "phy");
		of_node_put(remote);
		of_node_put(ep);
		break;
	}

Then camss_init_subdevices() takes the legacy path:

	for (i =3D 0; i < camss->res->csiphy_num; i++) {
		if (!camss->legacy_phy) {
			ret =3D msm_csiphy_subdev_init(camss, i);
		} else {
			ret =3D msm_csiphy_subdev_init_legacy(camss,
							    &camss->csiphy[i],
							    &res->csiphy_res[i],
							    res->csiphy_res[i].csiphy.id);
		}

and msm_csiphy_subdev_init_legacy() in
drivers/media/platform/qcom/camss/camss-csiphy.c unconditionally
dereferences csiphy->res->hw_ops:

	csiphy->camss =3D camss;
	csiphy->id =3D id;
	csiphy->cfg.combo_mode =3D 0;
	csiphy->res =3D &res->csiphy;

	ret =3D csiphy->res->hw_ops->init(csiphy);

Should camss_detect_legacy_phy() or camss_init_subdevices() avoid selecting
legacy PHY mode on platforms where csiphy_res[i].csiphy.hw_ops is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-kaanapali-=
camss-v22-0-7da3ea49c8a1@oss.qualcomm.com?part=3D7
