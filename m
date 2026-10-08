Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7C23CEBA7
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444653; cv=none; b=N2chw+LKfOZWCvXTBnFMDhPJjxZVNLIftlj1GnW+gdCuoh9G/GmDOBH50jH5fkvWZdvVinGDtJWaxIhUrlRxbYzOHioUYIoyzbx1HysGCIvw+CzOhNgYhjHc6aumGgSkLCdE9Ol3D02gpoFSYCSkwI7j9CzmHJG6v+Y0sA24WZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444653; c=relaxed/simple;
	bh=OtIghGMdCWARL6B0CyLy5j0OZGFTzqRdcbvsk52wTvc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HkNoX4rBdG5kjPHMeHmF9Jya0nsN83zGrASTlFFljxOxILWfFyjKgoNvRWpPyG3VLQZNa3HWe2XgF6Ksi6mblNEC0/YCaodb0jNsG+f7nH+XOEadGlRoZCapIqzlj43H6HjsA8GOie7o1MsLEbmL08ylLWgsAQKrYmyPtimaoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bv//8vmD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv//8vmD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CFC1F00893;
	Thu,  8 Oct 2026 07:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444647;
	bh=YtAY573Trop1gldQFI3m6kmIqtZQmLORC9wIKpI6iSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bv//8vmDlnc6EQrDpZ/TVEUzSgsyeunUZGo/ytOn/oklaiAmJfU21SRwc9uzLrz6G
	 dM2jrgO1pNCMQYirVPeO44qUUIwQM27TOpEWmXX6YIOrXBoAzJsVxhm3soc9u7bnr1
	 xFq22wG6j71v0i6pvmsohHhwKXwGW1obkVfTJy5uGi6woLwgj/ozO0U7AbWYrkhCwl
	 BOyjW7B4cxDHkgeKkHeso+otRbvjkSKnupKWOklBN9wr6g8ihm+A88Ss2ZcPyz8FKO
	 aziRW1Y+0k9x0qO+mY15/V1TcloBS5g+rvgZbpzCdVlRePfc/6LFLNGTIqz/5B1a2+
	 hds6CCyuXsX8g==
Message-ID: <sashiko-outbox-163763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 06/12] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20261008-kaanapali-camss-v19-6-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-6-b2c583ef50e0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 07:30:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: camss: NULL dereference in msm_csiphy_subdev_init_legacy on=
 Kaanapali
- [Medium] doc: commit message claims to modify DPHY driver but patch diff =
only modifies camss.c
--

commit ee4f5ef31347740ffd64c4c9ec08e7e1f2398bfc
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY

This commit adds support for the v2.4.0 two-phase CSIPHY found on
Kaanapali, defining a new resource structure for its configuration.

>     Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
>     the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
>     rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configurat=
ion,
>     which reuses the x1e80100 lane sequence, clocks and supplies but sele=
cts
>     the v2.4.0 common status offset, adds Kaanapali power domain and regi=
ster
>     the "qcom,kaanapali-csi2-phy" compatible.

[Severity: Medium]
Does this patch omit some files, or does the commit message incorrectly
attribute changes that belong to another patch in the series?

The commit message explicitly claims to add the DPHY configuration and
register the compatible, but the actual patch diff only modifies
drivers/media/platform/qcom/camss/camss.c.

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

[Severity: High]
Does this code cause a NULL pointer dereference on probe if the device tree
lacks endpoints for the camss node?

If a malformed or empty device tree is provided, camss_detect_legacy_phy()
leaves camss->legacy_phy as true.

During camss_init_subdevices(), this triggers a fallback to the legacy
initialization:

camss_init_subdevices() -> msm_csiphy_subdev_init_legacy()

The legacy initialization unconditionally dereferences hw_ops:

ret =3D csiphy->res->hw_ops->init(csiphy);

Since csiphy_res_kaanapali omits hw_ops here, wouldn't this result in an
immediate kernel panic instead of a clean error during probe?

> +			.id =3D 0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-kaanapali-=
camss-v19-0-b2c583ef50e0@oss.qualcomm.com?part=3D6
