Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD93DB655
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789778; cv=none; b=dvBZj90kAhWPQmszZosDrs5qXUVFZmlVHB0oFq7L3mJ6WpP4MXQjD5hQ4J7//bMr57EilqVG8l+Hc3VHEE66uuTE3rQ4OzPkNSazJGkBXOwRwljDFqhJoio7GEepcQzLbM9HBDnZGK3Y9yI5CapmQi66L3fdM98+bqoZhMf8lO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789778; c=relaxed/simple;
	bh=PixFcFKLBiuLHlO5uvwBEdux7Cjb3/Hbl5Bl9rV/+xs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mqnFMCM8VszeUyaJTnWWNHwuAUVatYzGHwfBUdeX6fp+jF8c/8GGtZGuQkNGjCJ/D7X/aZwfPTA86iRMZXpfRyGZJMFR1/SZeep9LHRz+LEbQRT/UKacn52qC8DLPp18GVfjCICt6FP1Z9limR7VZwMd5EBxF9xX2oMafSb0kC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUwt3JAV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUwt3JAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1BC1F000E9;
	Tue, 26 May 2026 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779789775;
	bh=xDZWQhbtSIJ/t1BgVUxCNNTdkuOLBAeDeVenBa2bTDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUwt3JAVnFM+j8Bk4hzF9EHs8SNyOX4gwepuQvWHT3LixCUxuN12Um1rmzBmvm7FA
	 mBXvIjWOvhyZ8l31+hA2Io+xr2Q5UIPS/xz2duP7sAl8/HuJKiAG9ZEFHaPI3V68+P
	 5VJ2S2tCsoKsslSCe74II18T3FKCLdyvAeBcWnVPNa6LgA5avDCPtuJbRu34YPFuaR
	 Tw8gFQ/XxMXPS0YJD6RJpYvNfLgxA5OhsTe4hctmU9pVLxVBq9hExYmYCKWYPrncAq
	 gssHapQokxRWWVe9bcesf0PzP+HHJr75oNdMGT+VniuwkfQMLpF1Pl2FUvUHE8eqwh
	 DCq7VVETCE3zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: palash.kambar@oss.qualcomm.com
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-4-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 10:02:54 +0000
Message-Id: <20260526100255.0D1BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The Hawi UFS PHY configuration (`hawi_ufsphy_cfg`) lacks a fallbac=
k overlay for `UFS_HS_G4`, preventing proper initialization for UFS 3.1 or =
lower devices.
- [High] Incorrect HSGEAR_CAPABILITY value configured for the UFS HS Gear 5=
 overlay.
--

commit 1174a7d9d404cf84ecf6ba8228fcab24e26ef4df
Author: Palash Kambar <palash.kambar@oss.qualcomm.com>

phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

This commit adds the initialization sequence tables and configuration
for the UFS QMP PHY found in the Hawi SoC.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualco=
mm/phy-qcom-qmp-ufs.c
> index 771bc7c2ab505..2fac3a7eb8201 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c

[ ... ]

> @@ -1844,6 +1867,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg=
 =3D {
> =20
>  };
> =20

[ ... ]

> +static const struct qmp_phy_init_tbl hawi_ufsphy_g5_pcs[] =3D {
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PLL_CNTL, 0x3b),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x06),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x06),

[Severity: High]
Does this code advertise an incorrect gear capability?

The overlay is named g5_pcs and the maximum supported gear is UFS_HS_G5, but
these capability registers are being programmed with 0x06. This typically m=
aps
to a Gear 6 capability, which could cause link training failures or mismatc=
hes
during UFS negotiation if the value should actually be 0x05.

> +};
> +
> +static const struct qmp_phy_cfg hawi_ufsphy_cfg =3D {
> +	.lanes			=3D 2,
> +
> +	.offsets		=3D &qmp_ufs_offsets_v7,
> +	.max_supported_gear	=3D UFS_HS_G5,
> +
> +	.tbls =3D {
> +		.serdes		=3D hawi_ufsphy_serdes,
> +		.serdes_num	=3D ARRAY_SIZE(hawi_ufsphy_serdes),
> +		.tx		=3D hawi_ufsphy_tx,
> +		.tx_num		=3D ARRAY_SIZE(hawi_ufsphy_tx),
> +		.rx		=3D hawi_ufsphy_rx,
> +		.rx_num		=3D ARRAY_SIZE(hawi_ufsphy_rx),
> +		.pcs		=3D hawi_ufsphy_pcs,
> +		.pcs_num	=3D ARRAY_SIZE(hawi_ufsphy_pcs),
> +	},
> +
> +	.tbls_hs_overlay[0] =3D {
> +		.pcs		=3D hawi_ufsphy_g5_pcs,
> +		.pcs_num	=3D ARRAY_SIZE(hawi_ufsphy_g5_pcs),
> +		.max_gear	=3D UFS_HS_G5,
> +	},

[Severity: High]
Does this configuration lack a fallback overlay for UFS_HS_G4?

If the UFS host controller negotiates Gear 4 (for a UFS 3.1 device) or lowe=
r,
qmp_ufs_get_gear_overlay() will attempt to find the closest higher supported
gear overlay. Because floor_max_gear is initialized to cfg->max_supported_g=
ear
(5), the fallback condition max_gear < floor_max_gear evaluates to 5 < 5 (f=
alse)
for this single available overlay.

This results in qmp_ufs_get_gear_overlay() returning -EINVAL with no overlay
applied, leaving critical PCS registers uninitialized and causing link
establishment to fail. Should a G4 overlay be added here similar to other
G5-capable PHYs like sm8750_ufsphy_cfg?

> +
> +	.vreg_list		=3D hawi_ufsphy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(hawi_ufsphy_vreg_l),
> +	.regs			=3D ufsphy_v7_regs_layout,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526090956.2340=
262-1-palash.kambar@oss.qualcomm.com?part=3D3
