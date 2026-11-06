Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991207;
	b=MM3GPnmho55yBbgielgyigQLvL6e8Vnds9UfJ+KYurj3O+r/O7yVnY5LqQpJiq4LNbMt
	 s1d8ml0kg7b8Hgszv2mnVlER/3hmAO6sYftJ0Xm7FSs2XF8jmgmMmA9SGETjxXiLVxC7K
	 8jiCKqBwiAcYhRbnKqFP6dhA02yVfroStGxZWX+KnK8zV1eR9PgpGxDMxOwlkiF7y8Xh0
	 HaQfa7Gx4qhSKMpu7lGfCzT4XVqkNauTXMRdwK+E03DtXTL83PnUSC619xdMBzm3cvsQl
	 556LAA9wbwcQxyx+vNYKtSZdd280gIjgsHBQasEVQKaPxndCX0tEM1a8GSpiR6Hx7yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991207;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nQSBuJnSxKPBm9btUkjMHj9x3ceqEHuHuYT+88WmS7w=;
	b=tEFEovYyacQLMC755aRgH9Mg9D4XSgPReMcBHDxrLclZYv3mljVkpnSrDgFWIwcbUER2
	 wcWLNDEEPeAewKcTqfE/Epl105R6kvQHijOKzvfZw4HNqnhq5jdZbeLaRP/GDvUEV5Bms
	 5QRfTXYMUoQHQR8rLTLaedUsdnvzmHFDTh5a6BFicp2JyNm2Vg5NqWUBvuyp9Z8QR1rGe
	 Nn+BrPQXehRcqkVq87XC4VW8Lzs7OuYzVaKPAnVBT2W+qb0DosVYCuLFFWM3H5N846mdQ
	 OCXvYRLj278xnFX/pyBciNylo61ic+Ewt4skaa4ulZ1ejEIBnmt2EeGwWbVs2kUo9Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7RsnbG2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F39606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7RsnbG2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE801F0089F;
	Fri,  6 Nov 2026 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793991206;
	bh=nQSBuJnSxKPBm9btUkjMHj9x3ceqEHuHuYT+88WmS7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W7RsnbG2AMG5scUPum90zBMB+dHTT1TwFRDk26q7nKVJc41j8+qum3D/QhsoR5NuX
	 3Akg2EZS4izITCRnDyRr4W1bshnLpg9h03/HsUyfFZSX4TzchGV8s+F6hopahrFTUt
	 LDHDpDQcehbWQMs58jVv1mS+voBmMu+EwVqBD3r/0iBFfYcIA4C6mllxLcxz9xmJVE
	 FMGN6bu8LZMVHuun7nnice9V/y0JxEPIdzkIEuGFt49giwDhydIhE0H1v5LudchR/X
	 n4v2i8mCEHwm9/FthX6xuycwZTRyMG/1720xFI1ZmMuKZCquyV9mbEpWdMx1XMGhnt
	 WUNDZUurbwFxA==
Message-ID: <sashiko-outbox-202114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] media: qcom: camss: Add support for SM8150
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:53:25 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] media: qcom: camss: NULL deref and dead code in
  csiphy_res_sm8150
- [Medium] media: qcom: camss: CAMSS_8150 used in parent commit before
  definition
--

commit debc7cc0585d6af1f184ab66cdb3fb1863bba5d6
Author: Andrew Gigena <mail@andrewgigena.dev>

media: qcom: camss: Add support for SM8150

This commit adds CAMSS platform data, resource definitions, and version
handling to support the Qualcomm SM8150 SoC.

> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..5e7c2e67ae887 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1133,6 +1133,7 @@ static bool csiphy_is_gen2(u32 version)
>  	case CAMSS_6150:
>  	case CAMSS_6350:
>  	case CAMSS_7280:
> +	case CAMSS_8150:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
>  	case CAMSS_8300:
> @@ -1235,6 +1236,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>  		regs->lane_regs =3D &lane_regs_sm8250[0];
>  		regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sm8250);
>  		break;
> +	case CAMSS_8150:
>  	case CAMSS_8280XP:
>  		regs->lane_regs =3D &lane_regs_sc8280xp[0];
>  		regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sc8280xp);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..da4d2213fd3dc 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1940,6 +1940,223 @@ static const struct resources_icc icc_res_sm6350[=
] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_sm8150[] =3D {
> +	/* CSIPHY0 - clocks/regs/supplies owned by PHY driver */
> +	{
> +		.csiphy =3D {
> +			.id =3D 0,
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sdm845
> +		}
> +	},

[Severity: Medium]
Can csiphy_res_sm8150 cause a NULL pointer dereference in
platform_get_resource_byname() when no remote PHY endpoints are connected in
Device Tree?

camss_detect_legacy_phy() defaults camss->legacy_phy to true and only clears
it when it finds an endpoint whose remote parent node is named "phy". If the
CSIPHY ports are omitted in DT, camss_init_subdevices() takes the legacy pa=
th
and calls msm_csiphy_subdev_init_legacy(), which passes res->reg[0] (NULL
here) to devm_platform_ioremap_resource_byname().

Conversely, when camss->legacy_phy is false, msm_csiphy_subdev_init() and
csiphy_v4l2_ops never use csiphy->res->hw_ops, making .hw_ops =3D
&csiphy_ops_3ph_1_0 and the CAMSS_8150 additions in
camss-csiphy-3ph-1-0.c unreachable dead code.

[ ... ]

> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0d..74d8cc2921be9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -89,6 +89,7 @@ enum camss_version {
>  	CAMSS_8x39,
>  	CAMSS_8x53,
>  	CAMSS_8x96,
> +	CAMSS_8150,
>  	CAMSS_8250,
>  	CAMSS_8280XP,
>  	CAMSS_8300,

[Severity: Medium]
Does defining CAMSS_8150 here break the build on the preceding commit
"media: qcom: camss: Match VFE lite clocks by name prefix"?

That earlier commit already adds case CAMSS_8150: in vfe_src_pad_code() and
vfe_bpl_align_rdi() in drivers/media/platform/qcom/camss/camss-vfe.c before
CAMSS_8150 is added to enum camss_version, causing an undeclared identifier
error during git bisect. Moving those two switch cases into this patch keeps
both commits buildable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev?part=3D5
