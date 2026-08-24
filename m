Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B43E7166
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554207; cv=none; b=NwdD296DxQIuV5NIZmRWAJTDiilFUZlvqiw0kw0PZgo6kwENthjbs/qEE+VtM+f0+VlhhPxAz1SNUht6FR01ZyoH1BiH9Npl1cNh8OsopwPXaIl7dfM7RYP1o53ja1YjvWkYCCLN7ZBPyrqhe5d0a/660S4GNfxh3ut8tp0kZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554207; c=relaxed/simple;
	bh=3zLLQcBJHNQCeFdI5EvdUjy1PtKiIMwsufux/1tidok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MoKK8AO4KOARSlbjTolO7bCqTnWYUf31x6np5aYv1OPjXSnxjuwDe9rnBBLKJ3a6Dpoi3iakt4mHvlMCVBUPLwYAY10pYujp/4RPNSMZ4fT3uCf3GlocsxSHahTHYDY51MYdTU13cBFubrjNtkAhI4FR/3TOQdaRlDKbrEDhv5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgD6lGKt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgD6lGKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278811F00A3A;
	Mon, 24 Aug 2026 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787554204;
	bh=Q3N9+PKlxb1crcxS9Jm7JHDey5nErYHnkArNh/zpBrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CgD6lGKtWhMlgyf12aE+8Z/z3TK0ujidHy4jmVFZpQCxft6p4O2au19AqKvq9FUKF
	 O4AUrUZtguhq2Xt8SchMjmwck/QabGwaFwvfmA9abo3s0gH5zTWBL00/a/m+0OVKTp
	 Pi1MYaK8hcScl7KiwssCbXXvDfeecXZsRj3dkm1UDsL7ZuOzFBW15w1ybhyX0SdqKQ
	 PRD5EjJQlsnOly8rKzbYle5tvflJOob4Dq7tTslzT1A5TBduDVqWYlR+GygbeMgJlt
	 w6CfhuBEQVXY48KqjGL8L5N617bdUjRzs1GJ+2nlKCLIIh+/w4cEMzYYShsubNGE0T
	 J5qDY8yndW97A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] phy: qcom: snps-femto-v2: Add IPQ9650 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-phy-v1-5-257d68a3210b@oss.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-5-257d68a3210b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 06:50:03 +0000
Message-Id: <20260824065004.278811F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `hs_5nm_phy_pre` array incorrectly swaps the mask and value pa=
rameters for `USB2_PHY_USB_PHY_REFCLK_CTRL`, resulting in incomplete bit cl=
earing.
--

--- Patch [5]: [PATCH 5/5] phy: qcom: snps-femto-v2: Add IPQ9650 support ---
commit 5cb516a1d2d452ce8939f49955704babc0701171
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

phy: qcom: snps-femto-v2: Add IPQ9650 support

This commit adds the 6nm SNPS femto USB2 PHY configuration needed by
IPQ9650. The PHYs on this SoC require a dedicated init sequence and override
parameters before they can be enabled.

> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/=
qualcomm/phy-qcom-snps-femto-v2.c
> index a34027b215f9b..7e8b346c61896 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c

[ ... ]

> @@ -418,6 +442,34 @@ static const struct phy_reg_config hs_5nm_phy_post[]=
 =3D {
>  	{ UINT_MAX, 0, 0 },
>  };
> =20
> +static const struct phy_reg_config hs_6nm_phy_pre[] =3D {
> +	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CT=
RL_OVERRIDE_EN },
> +	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
> +	{ USB2_PHY_USB_PHY_FSEL_SEL, FSEL_SEL, FSEL_SEL },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, FSEL_24MHZ },
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
> +	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing it I noticed=
 a
discrepancy between the new hs_6nm_phy_pre array and the existing
hs_5nm_phy_pre array.

The newly introduced hs_6nm_phy_pre array correctly orders the mask and val=
ue
parameters:

    { USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },

However, the existing hs_5nm_phy_pre array appears to have the mask and val=
ue
swapped:

    drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:hs_5nm_phy_pre[]
    { USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK },

Since the phy_reg_config struct expects { offset, mask, val }, passing
REFCLK_SEL_DEFAULT (0x2) as the mask and REFCLK_SEL_MASK (0x3) as the value
means qcom_snps_hsphy_write_mask() will execute:

    reg &=3D ~0x2
    reg |=3D (0x3 & 0x2)

This sets bit 1 to 1 but fails to clear bit 0.

If bit 0 was already set by the bootloader, the register will hold 0x3
instead of 0x2, which could result in an incorrect reference clock
configuration and prevent the USB PHY PLL from locking.

Does this swapped mask and value in hs_5nm_phy_pre need to be corrected in a
separate patch?

> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 =
},
> +	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
> +	{ UINT_MAX, 0, 0 },
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-phy-v1-0-2=
57d68a3210b@oss.qualcomm.com?part=3D5
