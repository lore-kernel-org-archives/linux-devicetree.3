Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201510;
	b=NjUXoxDQUyOgpWuiC4jyw+I7HZq7rdn71G++h5cmNOUJ/iFXZoTff5aGn3jpReYGlqpK
	 M+LjPjRS/WFjHQaXQt3XkuBCslUMwzBV8ZT0aGtm3d9ID98oI8KyIDhQJLrh/3K+BEU7S
	 zcFU24Rat+Nx7RtEOj1bdCFN2cA5YO7t5RCG2oj9RuLtIzL5nEMO779TrhLa3yO38FJHs
	 7/IKxtsrM4NziysbpULcHix5QOomQIFNGnL0ojfK655SPG+bawlUa2YvC4vyK4siHC6zB
	 LhXDBydS/wmzxoS6dVJtD3sQ64g9uFTL030WXKWKjGbBz0yh5w6V3aeRMv01/Dr46Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=haffo54whZGL9CC0UchBL2ccyG/VDVgEs7sItmcLBZU=;
	b=O9/JzlKxgZpqgTeA3QASGUavV/6nAM/jDxfolKafj+jP3HPJn63+Jtxjug5GIuWSro/6
	 h6fIkHC7wusj70blm+7VaV2SZOyHuRVuUFlAgB0AoVBdTd38qVAmPzZLU2dGGOIG5SXyZ
	 Kya3hDf92HGL3Ts74/X920mCGrUiTFU51qFtbKtIC6T0xt4HBM4Lh0/XQCuXU6cbmrxjg
	 AjVGEiqR2hR7m4r7RJuD4tUIHHL1QmznQjXquAPhldwTqk91bX3dQLFUchgDIodw51HY1
	 XhZua3HpHxP5RLiAgp0gnwhIyVJOABHWlE33hSDWMgCafQSkNKrP0d+3mkxlqwqKvCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFxB188l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D842D606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFxB188l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F911F01825;
	Wed, 28 Oct 2026 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793201509;
	bh=haffo54whZGL9CC0UchBL2ccyG/VDVgEs7sItmcLBZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iFxB188lp9JzvowXggMC8HmYIZPQ3CNmrAMMZdF1ZZRCUwRF82V8kUxQVtMQrVx39
	 ubfCYvjIjFl1Uy0d/uNnywgCplz2cEgFJrah9mmWlfthtNdaSvqbwoCimbNmwJEUzt
	 x+5AWdnRu/eTnX394DEmfDNp6LXDa8grRrzQtAKRI9LbSOtA4eXDd+7mDujvNSf/H+
	 O/njR42FC7AK8h5Kpm8rBbsitHs9i83uti7I0aaP/tQsNpwhhEo9avcV78ufYJ4pOO
	 zbcs9tsXNdpDsLxvi+p+0DoisVXTvGo6DLVDklm4td7fuM7Nz4oOlXU1Q0f1+3y2/U
	 +GTzEBMd0R9wQ==
Message-ID: <sashiko-outbox-188056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 15:31:48 +0000
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
- [High] media: qcom: camss: NULL deref in msm_csiphy_subdev_init_legacy()
- [Medium] media: qcom: camss: commit message describes phy driver changes
--

commit 746e86a20142c7ce6cfd5e7633a02e7c5b459ec6
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY

This patch defines the csiphy subdevice resource table for Kaanapali and
wires it into kaanapali_resources in camss.

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

[Severity: Medium]
Does this commit message match the changes in this patch?

The commit message states that this patch adds the
mipi_csi2_dphy_3nm_kaanapali configuration and registers the
"qcom,kaanapali-csi2-phy" compatible, which were added in commit 09220cf48f=
3f
("phy: qcom-mipi-csi2: Add Kaanapali support") in drivers/phy/qualcomm/,
whereas this patch only populates csiphy_res_kaanapali and wires it into
kaanapali_resources in drivers/media/platform/qcom/camss/camss.c.

In addition, the subject and commit description refer to a "v2.4.0 two-phas=
e"
phy, while Kaanapali uses a 3-phase v2.4.0 phy. Could the commit subject and
description be updated to reflect the camss changes here?

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index a64242c66cf06..b0b63dd3d958e 100644
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

> @@ -5607,8 +5652,10 @@ static const struct camss_resources kaanapali_reso=
urces =3D {
>  	.version =3D CAMSS_KAANAPALI,
>  	.pd_name =3D "top",
>  	.pm_clks =3D { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
> +	.csiphy_res =3D csiphy_res_kaanapali,
>  	.icc_res =3D icc_res_kaanapali,
>  	.icc_path_num =3D ARRAY_SIZE(icc_res_kaanapali),
> +	.csiphy_num =3D ARRAY_SIZE(csiphy_res_kaanapali),
>  };

[Severity: High]
Can this trigger a null pointer dereference in msm_csiphy_subdev_init_legac=
y()
when probing camss on Kaanapali without a remote "phy" endpoint in the devi=
ce
tree?

Each entry in csiphy_res_kaanapali[] only initializes .csiphy.id and
.csiphy.formats, leaving .csiphy.hw_ops as null because the Kaanapali phy is
driven by the standalone phy-qcom-mipi-csi2 driver.

However, during camss_probe() -> camss_init_subdevices() ->
camss_detect_legacy_phy(), camss->legacy_phy defaults to true:

drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
	...
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
}

If camss is enabled without an active endpoint connected to a node named "p=
hy"
(for example, with unconnected ports in a base board device tree or when
using only the internal test pattern generators csitpg0..2),
camss->legacy_phy remains true.

camss_init_subdevices() then takes the legacy initialization path for each =
of
the 6 csiphy_res_kaanapali entries:

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
	...
	for (i =3D 0; i < camss->res->csiphy_num; i++) {
		if (!camss->legacy_phy) {
			ret =3D msm_csiphy_subdev_init(camss, i);
		} else {
			ret =3D msm_csiphy_subdev_init_legacy(camss,
							    &camss->csiphy[i],
							    &res->csiphy_res[i],
							    res->csiphy_res[i].csiphy.id);
		}
	...
}

And msm_csiphy_subdev_init_legacy() unconditionally dereferences
csiphy->res->hw_ops:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init_leg=
acy() {
	...
	csiphy->res =3D &res->csiphy;

	ret =3D csiphy->res->hw_ops->init(csiphy);
	...
}

Should camss_init_subdevices() or camss_detect_legacy_phy() guard against
taking the legacy path when res->csiphy_res[i].csiphy.hw_ops is null?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-kaanapali-=
camss-v23-0-95f250b18612@oss.qualcomm.com?part=3D8
