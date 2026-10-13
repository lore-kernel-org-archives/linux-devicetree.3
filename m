Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9649C4CC
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892278; cv=none; b=ewCBr8lL0kFP1hTw1pfmtOTucWPOHJcWpeARc74oqHIspFhqAIJz61lO1QjCfvT2CpBqEtWKNdzsx8gdASj9kefQVsHQm0U0ewd4Pc5K/8LoKHz2MbyiTPKb0II8A6eYIaWCT6GwL9Mh1Nw0f0CPi7cf86o7QhXYUqkObJrp258=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892278; c=relaxed/simple;
	bh=iPm75syX8+qrZqF6Hn0d+GqCduGN1XSjQpBsHILBz/o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e/JKQ1ppWlQtJgMKpL07NKtsNiGCp3oFqJrzAELQRDd+7x/j6lFXAO2eFWzpGrrPS6SxQGqnjuOg2hmUoJyDfZC2B1VWuoC5sBV5fV9jRsYpVYK81hAQYX50LH/MyGO+JaEPOjYPM8ba6MAuJyftYayejLcbQyMnm3LzOJnNnrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBqsA2J3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBqsA2J3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2381F000FF;
	Tue, 13 Oct 2026 11:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791892277;
	bh=6n9XRzzB5F7yVGP2sNosYizbCRryJ8XuRjYFhl3Ig18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MBqsA2J3MOmMKAXwv7ZyI23/OTbtdZunkJAf7SJNA269ubUKgyle5POOwvofb6CKF
	 CKbdSAkyuMgucXFlND27n2F5OlZOdRh+zMPZpEd2tbqlZympUVkH18TzTM3uga6LEY
	 G8H4yP2nwuiuY9nzXROEUFAhqt80IZUZMLVbvHSGzUvOUXoIkW92XjMq/0haEdE+cC
	 N77tS83wP97K+bF849kEgQ5kKwgD0DoE1G9CgT2KWMtrYikuH64fMV4x+gZ+maJXUn
	 0VShLRntux3wxUuVRY4Vy4s5VCursAU9qWuFYWsQ2o8p79jejbjIWhYR4w7526e8sz
	 JzNg/SDAX0C8A==
Message-ID: <sashiko-outbox-169654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add Hawi compatible camss
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:51:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: camss: NULL deref in legacy init with malformed DT
--

commit ab588bfa99e7559381531b339a38e6b03af9609c
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: Add Hawi compatible camss driver

Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
resource table from Kaanapali and the TPG resource table from
X1E80100.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 5db7e12a6f869..664237ad5ce60 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
[ ... ]
> @@ -6086,6 +6099,17 @@ static const struct camss_resources sm8650_resourc=
es =3D {
>  	.vfe_num =3D ARRAY_SIZE(vfe_res_sm8650),
>  };
> =20
> +static const struct camss_resources hawi_resources =3D {
> +	.version =3D CAMSS_HAWI,
> +	.pd_name =3D "top",
> +	.csiphy_res =3D csiphy_res_kaanapali,

[Severity: High]
Can a malformed device tree without endpoints cause a NULL pointer
dereference when initializing this new compatible?

If a device tree node for Hawi is provided without endpoints,
camss_detect_legacy_phy() in drivers/media/platform/qcom/camss/camss.c
iterates over zero endpoints, leaving camss->legacy_phy =3D true:

camss_detect_legacy_phy() {
    ...
    camss->legacy_phy =3D true;

    /* Find first remote-endpoint and determine if its a PHY */
    for_each_endpoint_of_node(camss->dev->of_node, ep) {
    ...
}

camss_init_subdevices() then unconditionally calls
msm_csiphy_subdev_init_legacy(). Since the csiphy_res_kaanapali
structure reused here lacks a .hw_ops definition,
msm_csiphy_subdev_init_legacy() in
drivers/media/platform/qcom/camss/camss-csiphy.c will dereference
a NULL pointer:

msm_csiphy_subdev_init_legacy() {
    ...
    ret =3D csiphy->res->hw_ops->init(csiphy);
    ...
}

Should there be an explicit check for NULL hw_ops before dereferencing, or
should camss_detect_legacy_phy() handle cases with zero endpoints
differently so it fails gracefully instead of crashing?

> +	.tpg_res =3D tpg_res_x1e80100,
> +	.icc_res =3D icc_res_hawi,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_hawi),
> +	.csiphy_num =3D ARRAY_SIZE(csiphy_res_kaanapali),
> +	.tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-hawi-maili=
-camss-v2-0-fc93222da89c@oss.qualcomm.com?part=3D6
