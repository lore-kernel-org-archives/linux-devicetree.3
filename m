Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62FB361669
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662634; cv=none; b=YJJK+OABtsKeJvNS2WR0rPP63vVxigqJqpV2PwI34mmQc9vmGTNclnqtqgFrY1d/oNS0LDCuI2txVYdimwskjnvj8ze+q2CZqIkEps8l7ntmEjSdpK6BnZbRc55Wlf3fORXiZ2IZZA52wsW/sLRztZgmngE0SnHYLvs5dDsh0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662634; c=relaxed/simple;
	bh=KUxjhs7N+sUgfdZ5X+VI7pBJ5u4chLtQ4EyJGCOWNHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dw78whOHReI7b+jg81lrhrvXwxQh7v3iTqJUSjQTnEdLG7WpmcCfsNpjDiHW25DiZkx8M4kDAHt5gP2C5FENT+MxV5bHIanTQauqUS/+96LsOrP2/FOeT4KXw5Ce9qFy4olWO/nNqSoyl5DaRIdjqgem5/NmBLk4UbIYrXOupkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr8D3PVl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr8D3PVl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083BD1F000FF;
	Tue, 29 Sep 2026 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662632;
	bh=JQXiG0ytaT9dDc9UIGKGQiT5GixQs81SrAE3iTDCXq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vr8D3PVlT3LFR/h+gMFDMepfh5zNv+TRYZ2OxBAxRQlG6bij7rXl7b0CEbM8PMwW+
	 2kBU6fC4V+zns2aaQCS0xWBt3Ko4Wzp/3VJ6/DPySuLsTBF4VD3q2yX92dZAAOmGwx
	 31i7M4uON8XR4UNTQQgLh/ubWxcjJvP6gzVJG470QqRBpwtfHO+qNv8YlrajkpKkOL
	 4j7h/KDrZ2T0WeWFnHGa2PCX3TkWRK1M/xHUI96TOnbFHIlcWQ3Rjzypan9SsNbfoT
	 KFZ5N7TNFgC80jhaemBh3oEGF4dmQ/qRVLaaX2S+MD53cUojs7VKIUbnnwrf/CR2TR
	 tbnuGDQRc0dyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com, media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260928-kaanapali-camss-v17-5-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
 <20260928-kaanapali-camss-v17-5-dcf3fd37f76c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 06:17:11 +0000
Message-Id: <20260929061712.083BD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] media: camss: guaranteed NULL pointer dereference in msm_csiph=
y_subdev_init()
--

commit 3c87101a27e8d1c1d3a64a10ed465e1ed433c549
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adding Kaanapali power domain and
register the "qcom,kaanapali-csi2-phy" compatible.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index a528760487bd9..a0cd839c9948a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,57 @@
> =20
>  static const struct parent_dev_ops vfe_parent_dev_ops;
> =20
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 0,
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},

[Severity: Critical]
Can this result in a NULL pointer dereference during device probe?

Because this Kaanapali resource definition completely omits the .reg array,=
 it
implicitly initializes to NULL. However, it still binds legacy hardware
operations (&csiphy_ops_3ph_1_0) that expect MMIO mappings.

When the CAMSS probe unconditionally iterates over all csiphy_num entries
and invokes msm_csiphy_subdev_init() for each, it attempts to map the legacy
register space:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
    ...
    csiphy->base =3D devm_platform_ioremap_resource_byname(pdev, res->reg[0=
]);
    ...
}

Because .reg was omitted, res->reg[0] is NULL, which propagates down to
platform_get_resource_byname(). Since Kaanapali defines other named resourc=
es,
evaluating strcmp(r->name, NULL) with a NULL name argument can cause a cras=
h.

Does the standalone PHY need to be consumed via the kernel's generic PHY
framework (e.g., devm_phy_get) instead of retaining legacy CAMSS ops that
assume direct MMIO control?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-kaanapali-=
camss-v17-0-dcf3fd37f76c@oss.qualcomm.com?part=3D5
