Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F6353A95
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649407; cv=none; b=SV5o9mvbR9LjK5o9x6xT1vWHe70MGCpVZeVRNrV4hRcn21iOiv02f0h7xnittLNW5KGW3StVEOmuu+99/zjDW/Q/aRbiuJHE1C2B97hO3tpVn/eQHwHE8Ax7AI+nJ3OXiwco0URAyt0/r7rPaCtuP9mEGzNrDRX7xMdC044C1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649407; c=relaxed/simple;
	bh=UfWxmBe81Dv4NC3mQlfIvISVhc43nfvq/XmCxitWa5g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=iNLRNC+lCaYJQc9eXCmUPlmzscoH22ylsZr2oa6GnzjoVlzJw5rIa0jb2qt7nPmFJw4kLbWBSj2LwMXemTR9L1T3cyjlAGZjAXuXe1NGKL8fP6NlL7H5Z8h2gbPESPirIRK/SRPG7NRmGWPQ+bguXeJBRNhisCGqXBz0iAX64Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbReUmCa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbReUmCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8381F00893;
	Sat, 10 Oct 2026 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649405;
	bh=JVyksopITaUHR/LMg8KqXG3l9Gsaif1T31GDC6NmJH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GbReUmCaiKAozOgFQoeSmQsDTUi7lxqv00vlWixBuEpLHBNToh6TsTZnsPcmMBy/6
	 frsIzeB53qSEWplaUPUcuHGDHF75YGWLecLsMHyzpqcWCxqWEK4vIQyCF2YTD8A93Z
	 pNzRaxDKFqUh6z/Egib7MZOD2FfnPB3RwSWdGYTiZL1wM0cSMJt8fD7YF012gD6u1l
	 Udr9Psn8mzR2FN2Y4i5HfFVpabf+Sm55IfG1l11L0roUsNIbS+j1lPIhRQbMnmEtL+
	 MdKexN+AOWKbcQGD3YyjQFCvFnrfKO18NYzGQqEt8XFUvKj1Ig/7Bh6zR7TJKTeb/c
	 joIxfGKAbyoqg==
Message-ID: <sashiko-outbox-166734@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 06/13] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20261010-kaanapali-camss-v20-6-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-6-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:23:24 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: NULL deref in msm_csiphy_subdev_init_legacy() =
on malformed DT
--

commit 08f91d74b650b5a3e039a9cddfa9acbe4783d78b
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index fca3de214a922..eeceb79c1e863 100644
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

[Severity: High]
Does this configuration cause a NULL pointer dereference if the Device Tree
is malformed?

Since .hw_ops is intentionally omitted for this configuration, it expects to
use the standalone driver. However, if the Device Tree is malformed and lac=
ks
endpoints (for example, if an overlay is missing or incorrectly configured),
camss_detect_legacy_phy() does not execute its loop and legacy_phy remains
true:

drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
    ...
    camss->legacy_phy =3D true;

    /* Find first remote-endpoint and determine if its a PHY */
    for_each_endpoint_of_node(camss->dev->of_node, ep) {
    ...
}

This true value forces the probe to take the fallback legacy path and call
msm_csiphy_subdev_init_legacy(), which unconditionally dereferences
hw_ops->init:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init_leg=
acy() {
    ...
    csiphy->res =3D &res->csiphy;

    ret =3D csiphy->res->hw_ops->init(csiphy);
    ...
}

Should untrusted or malformed configurations be handled without panicking t=
he
kernel?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-kaanapali-=
camss-v20-0-63e98ce9ac0c@oss.qualcomm.com?part=3D6
