Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC2364EB1
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125385; cv=none; b=aMIDBbF2nArFMblX38UtSREuykBbaGvFgLd9S6ld6B3+k8MmLcjLxl6kfhn9M460iWGvTFaOi6ill6UMH1Gx4aodBP3NiezEkiGCmGM7RslcWhDhI6RvpQ5mOTw4+bGf8pXgalgmak0vrEL++jgjc5cJFlczKlLzq7Ybd17poVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125385; c=relaxed/simple;
	bh=MT5hotBsGBvGo6ebLCh0/y2UPVnF0qNyMVgDULEhvWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NImAkuiqDQ81Q9gTI+9pO1foKeLNRLmInJ05DqNE1zpjnYCRZ3zzspH+oyfy5U4dXOyMK0wSlH6Mz9YCz++pfY5REwGbNhWRDheecw4f1cUzFzbYdn32N0hcJdkawneDPhzVx3HehoTtuoID8/hJyj0djSIVXi8vuDlWHmqMFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X961oXhF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X961oXhF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FFC2BCB7;
	Mon, 18 May 2026 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779125385;
	bh=MT5hotBsGBvGo6ebLCh0/y2UPVnF0qNyMVgDULEhvWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=X961oXhFdoMlepy2QzXoDEWGbenkjr9FqAYrpd5emjqgJ2BZxxSeHT/ZKNG1i+oLT
	 EYn6bs/n9JiIgrNAfiBwsgwVcXcdhaOd5q4xnfOFp/HPpU14M9/CAu+JKhJhRIb+PA
	 DPu97NF5LUkIXg8luzhtdQC3bLrG4phPP4t4ldRSzyolS763hM70yBIvwibNvjumfC
	 HjdRRDhr1uU9uWp6MKfzF7nT7SemMHlg5cgDSEXAOtBxEYFTflymKBgu4sHOTNul4M
	 9YhhSaGiPNwCGUUlt1vpZtPOCKheZuNwCs701OYah9VxzJtk1adnPVoVe1Yzp5mJD1
	 G3p+J+9lR6v4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V1 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: palash.kambar@oss.qualcomm.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260518165346.1732548-4-palash.kambar@oss.qualcomm.com>
References: <20260518165346.1732548-4-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 17:29:43 +0000
Message-Id: <20260518172944.657FFC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing UFS HS-G4 gear configuration overlay for the Hawi PHY will=
 leave critical hardware capabilities uninitialized during G4 negotiation.
--

commit a0d83dfe8a3203b506d45d5c8262f7f0b14d810a
Author: Palash Kambar <palash.kambar@oss.qualcomm.com>

phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

Adds the initialization sequence tables and configuration for the UFS
QMP PHY found in the Hawi SoC.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualco=
mm/phy-qcom-qmp-ufs.c
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
[ ... ]
> @@ -1844,6 +1868,119 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg=
 =3D {
[ ... ]
> +static const struct qmp_phy_init_tbl hawi_ufsphy_g5_pcs[] =3D {
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_PLL_CNTL, 0x3b),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x05),
> +	QMP_PHY_INIT_CFG(QPHY_V7_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x05),
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
> +

Is there a missing UFS HS-G4 gear configuration overlay for the Hawi PHY he=
re?

When the UFS controller negotiates HS-G4 (e.g., connected to a G4-only
device or during fallback) and requests the PHY to operate at G4,
qmp_ufs_get_gear_overlay() will fail to find a matching configuration.

In qmp_ufs_get_gear_overlay(), it initializes floor_max_gear to 5.
It then checks the only available table where max_gear is 5.
Since submode (4) =3D=3D max_gear (5) is false, and max_gear (5) <
floor_max_gear (5) is also false, it returns -EINVAL.

Because qmp_ufs_get_gear_overlay() returns -EINVAL,
qmp_ufs_init_registers() will skip applying any overlay. This means
capabilities like QPHY_V7_PCS_UFS_TX_HSGEAR_CAPABILITY are never
programmed during G4 operation.

Other G5-capable PHYs (like sm8750) seem to provide both G4 and G5 overlays:

static const struct qmp_phy_cfg sm8750_ufsphy_cfg =3D {
[ ... ]
	.tbls_hs_overlay[0] =3D {
		.pcs		=3D sm8750_ufsphy_g4_pcs,
		.pcs_num	=3D ARRAY_SIZE(sm8750_ufsphy_g4_pcs),
		.max_gear	=3D UFS_HS_G4,
	},
	.tbls_hs_overlay[1] =3D {
		.pcs		=3D sm8650_ufsphy_g5_pcs,
		.pcs_num	=3D ARRAY_SIZE(sm8650_ufsphy_g5_pcs),
		.max_gear	=3D UFS_HS_G5,
	},
[ ... ]
};

Will leaving these uninitialized cause link instability or initialization
failure on devices falling back to HS-G4?

> +	.vreg_list		=3D hawi_ufsphy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(hawi_ufsphy_vreg_l),
> +	.regs			=3D ufsphy_v7_regs_layout,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518165346.1732=
548-1-palash.kambar@oss.qualcomm.com?part=3D3
