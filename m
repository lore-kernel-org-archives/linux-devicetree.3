Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6FA3859D3
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925302; cv=none; b=MIieK0V+5H+fXi7yvQv+ahLGC8BELqHZilnQpNOLluQZKtCVE8cHntVozcMizpCWXnTBWrakSCwQxttfhrORb9DNBfdaMyZ33b4o+xzCVXhZfT2M7G3NnnBK1/sYTOCVeSThh0PuwT/6CABSbPBUk0bE4TYF3DIsCutuiCxRvas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925302; c=relaxed/simple;
	bh=Wb35bxAf74ZFNJB7wDtRpq44Pb4xDw6Xjd5uKp/3C60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ic2BWLJLv+ySbPikJn+D6tgr0NtPyV3zpvGvoy4bgBjcRUWmNzMpLb9YRvFBaYCsBpDSRMA0LD8o0Nrgl0lLHoDAAA8twrVHZuqyxi8UecEKc+4IuoVwMiE5WtZ6IMt5JOoAt9itE/kbkxC7CtaACd35MUopniTLVdZtj6nuEfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLy/YUiy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLy/YUiy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2F71F000E9;
	Wed,  1 Jul 2026 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925301;
	bh=hgJ/aZTehbqSM3idN8ia7auX5efqpn+wPKPmB0XlNbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JLy/YUiyBEvrGbczdDFt7j/Fh9rh7XVVhRmJqJqjI65ar5uiaqMk8UfeMZT3u6khY
	 N7ACJcP5xteYc7/PwS6LC9kmlFyfITixnapRL9ujWJDPLRMhcFVuuXqpTwypo9+QB4
	 9I/6YeVvlZb0rLgTmo9VEsODUVoSpqGe/nvb5Bc4eY3ipmNfCWdsSXT6Xpifd6luh8
	 EO0c6MY+ZPz6ADbiptrNSwDI+ijmNyE4APQ+aK7okiRQtk705IJwZe+p/1iRD9RG/P
	 zmHRm4ridcwYWS+Dy5HnD2k0Y33Y8SP/F+4mYiCD3aSHsNKB1G27LGod+wIEqNFGGQ
	 2YQ3WKxdBcWPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] phy: qcom-qusb2: Add support for Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
 <20260701165051.4122259-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 17:01:40 +0000
Message-Id: <20260701170141.2D2F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message and code regarding the Shikra in=
itialization sequence, indicating a potentially missing SoC-specific init t=
able.
--

commit 32d713dabf7fa1b123bcb3d8f9e6ad4438cd95c4
Author: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

phy: qcom-qusb2: Add support for Shikra

This commit introduces the PHY configuration and match table entries
necessary to support the Shikra platform in the qcom-qusb2 driver.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm=
/phy-qcom-qusb2.c
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
[ ... ]
> @@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg =3D=
 {
>  	.autoresume_en	 =3D BIT(3),
>  };
> =20
> +static const struct qusb2_phy_cfg shikra_phy_cfg =3D {
> +	.tbl            =3D qcs615_init_tbl,

[Severity: Medium]
The commit message states "Add init sequence and phy configuration for
Shikra", but this configuration reuses qcs615_init_tbl.

Since shikra_phy_cfg differs from qcs615 in key hardware parameters like
has_pll_test, se_clk_scheme_default, and autoresume_en, does the Shikra
PHY actually require its own specific tuning table that might have been
accidentally omitted?

If reusing the QCS615 table is intentional, could the commit message be
updated to clarify this reuse instead of stating an init sequence was added?

> +	.tbl_num        =3D ARRAY_SIZE(qcs615_init_tbl),
> +	.regs           =3D ipq6018_regs_layout,
> +
> +	.has_pll_test	=3D true,
> +	.se_clk_scheme_default =3D true,
> +	.disable_ctrl   =3D CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
> +	.mask_core_ready =3D PLL_LOCKED,
> +	.autoresume_en   =3D BIT(3),
> +	.update_tune1_with_efuse =3D false,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701165051.4122=
259-1-krishna.kurapati@oss.qualcomm.com?part=3D3
