Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E1C443C11
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788831; cv=none; b=pIe0d3STtE3JWJ9QhNFi/wMbtLKkh7c2uYnACLPEZbjV12slPyBhSMJ3YRmOjkMZVKk9Cl4e5TzshVW+/mFw/0b7G5mgaR3nOXg6jbizAynZ5n6eNzBa8e2Hn2vZFgSOhzd9xr6KkzBKdHW+bqSM+dAt3K4SlOwghjZTLVpOFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788831; c=relaxed/simple;
	bh=pNGhh8fM9pYho8MfmiCdDajRBVfPOBARpMAP8caLEq0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t/7tH5apVFHK6+Cf9U0EOy1c8R275pRfx1NKOjJQPkxQSO7kZ/jhSLHB3SfDyp/dAL0gRb00Q8N6KpadaFgETWzXB+8lqvILanmSgUvBc2bkpk0yQviRsJpOToilTrl7XpFdJiRrKeo8vYPQ+qKZwmKUCvw+GrtKaqItwfR6f04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARGn9/QZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARGn9/QZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BA01F0089B;
	Mon, 12 Oct 2026 07:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791788830;
	bh=rdfrzaw9jpWPrVrElAovQ48toenlwQtDznKZDtv9e+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ARGn9/QZwvkvyPIbMwWoFdgBXzuJzCfoRbWwxQhgiFLgtBL8uk1R7YI3Dy3bZ+oDn
	 dq2CRPVG9S8i6nb2r7Yor1ygQtHHTIoNhkFNY7II/jYTIPfPwZIV0cF8+t+XOfafnL
	 mgsiR14xbFCRa56sDx2t4tjvHiAyc5ZRsmD7nUt2vb5FAZ9MF56g5r3G1iXuijR07M
	 aabPUIcMXhZl3clT/0UrB9OM6+2jAHI1dSJRjex4+MBK7VH6LVCLlwkWMt6w2XhW8t
	 N20fPLkr1f3kv9EN05C+KZIBnIjKLoOsD6RmHr4qPsvJZLK3kcNc2DmaPWVK4RQKlo
	 eoSNC0BbS+nXw==
Message-ID: <sashiko-outbox-167774@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 07/14] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20261011-kaanapali-camss-v21-7-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-7-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 07:07:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: NULL pointer dereference on malformed DT in le=
gacy PHY fallback
--

commit b51422793e63d50b9c2d85f3e71a49c0f3bb4e69
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

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

[Severity: High]
What happens when a malformed device tree causes the driver to fall back to
legacy PHY mode?

If camss_detect_legacy_phy() encounters missing or differently named remote
endpoints, it defaults to leaving camss->legacy_phy set to true.

When this happens on Kaanapali platforms, camss_init_subdevices() invokes t=
he
legacy initialization path:

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
    ...
    } else {
        ret =3D msm_csiphy_subdev_init_legacy(camss,
                                            &camss->csiphy[i],
                                            &res->csiphy_res[i],
    ...
}

This legacy path unconditionally dereferences the hw_ops pointer:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init_leg=
acy() {
    ...
    csiphy->res =3D &res->csiphy;

    ret =3D csiphy->res->hw_ops->init(csiphy);
    ...
}

Since hw_ops is left uninitialized (NULL) in the Kaanapali definitions, cou=
ld
this result in a kernel panic during driver probe?

> +	},

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-kaanapali-=
camss-v21-0-04fd28d815c6@oss.qualcomm.com?part=3D7
