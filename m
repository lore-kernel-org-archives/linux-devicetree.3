Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019EA3909AE
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763178; cv=none; b=e1aBHGMdUp8ODeaYimrPKVJtMu4AFFS+p8c95EaKa815Ri6BqRH8vt3mKe+2I2EZ8BoeGqfLTTAz4tJaGnh/xumnLChEWKlC6LgVl8x3WTioM2Om1GOQBK6P3phrIQXnGSelZ3ZDzOnqyVrKfY09bdiR3vhMCuHI/LfjelF3Sc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763178; c=relaxed/simple;
	bh=7BcAX27xjr2pPp5tvFDoX6DqrmU5yLDBk+GGVOVgJUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QCZv6l6WmwyX3sanSgOM6rKNtbNqlsGAB1bop44PFLFylBn7LbUmhJd9csKNtJHuVqNzwPOJ63qRm4K1732FYOH2fXnuk6NLn0NKfAM/ZXT8fsn2AfAs1zjof1SojOSRe/gPbT+SfuuIbJbXCPYsNgDLVnVaiqGkYKC/F2vaM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWql75Ah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWql75Ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EB5C2BCB3;
	Thu, 14 May 2026 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763177;
	bh=7BcAX27xjr2pPp5tvFDoX6DqrmU5yLDBk+GGVOVgJUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oWql75Ahkh1InVUuabW7hjhFvsQFpmGWMwrX5+655FAwp+APXbb9Dho4dR31CnCp+
	 Ss6NCGngvVWkHGSiLnGefAm0GYHM9vjZDkJZCkBLq9OLAH8NBY80jqL5yDXAtkrW9q
	 V6zBGS6rDwQzEi7UyJFq1VKT7SDEpQkvk6jI4l+msgDqXBGjlGU7R14yMhWDoBB5x1
	 wA6GK/RUIiJNtutwrd4eZ4t7JzHL6mQRDsoUtco7ZCGWWnK88oorG8+WvUwR2ybdc0
	 XAnWYapShREHOjMYjXEKW5wJX7VAyCnuipA3x4ZfzpkcDFZZw70XFEZa+ulVe+chiB
	 p9INaAdAUozIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: qcom-qmp-pcie: Add support for ipq5210 PCIe
 phys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260514-pci-phy-v1-2-482429192746@oss.qualcomm.com>
References: <20260514-pci-phy-v1-2-482429192746@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 12:52:55 +0000
Message-Id: <20260514125256.78EB5C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant array duplication and misleading naming for PHY init tabl=
es
--

commit 1a4fb65a84494415ea2c151ef7e1a6c4328d3d7f
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

This commit adds support for the PCIe PHYs found on the Qualcomm
ipq5210 platform.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualc=
omm/phy-qcom-qmp-pcie.c
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -514,6 +514,105 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_g=
en3_pcs_misc_tbl[] =3D {
[ ... ]
> +static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_tx_tbl[] =3D=
 {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
> +};

Does this new table duplicate the existing ipq6018_pcie_tx_tbl? Could we
reuse the existing table instead of creating a redundant copy?

[ ... ]
> +static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_pcs_tbl[] =
=3D {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_FLL_CNTRL1, 0x01),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x0d),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_DCC_CAL_CONFIG, 0x01),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x01),
> +};

Is it possible this is an exact duplicate of ipq6018_pcie_pcs_tbl?

[ ... ]
> @@ -654,6 +753,13 @@ static const struct qmp_phy_init_tbl ipq9574_gen3x2_=
pcie_serdes_tbl[] =3D {
[ ... ]
> +static const struct qmp_phy_init_tbl ipq9574_pcie_tx_tbl[] =3D {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_HIGHZ_DRVR_EN, 0x10),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x06),
> +};

Could this table be entirely replaced by ipq8074_pcie_gen3_tx_tbl?

Also, does the name ipq9574_pcie_tx_tbl accurately reflect its usage? It
seems to be used exclusively by the newly added ipq5210_gen3x1_pciephy_cfg,
while the actual IPQ9574 configurations retain their use of the ipq8074 tab=
le.

[ ... ]
> @@ -3613,6 +3719,49 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cf=
g =3D {
[ ... ]
> +static const struct qmp_phy_cfg ipq5210_gen3x1_pciephy_cfg =3D {
> +	.lanes			=3D 1,
> +
> +	.offsets		=3D &qmp_pcie_offsets_v4x1,
> +
> +	.tbls =3D  {
> +		.serdes		=3D ipq9574_gen3x1_pcie_serdes_tbl,
> +		.serdes_num	=3D ARRAY_SIZE(ipq9574_gen3x1_pcie_serdes_tbl),
> +		.tx		=3D ipq9574_pcie_tx_tbl,
> +		.tx_num		=3D ARRAY_SIZE(ipq9574_pcie_tx_tbl),

If ipq9574_pcie_tx_tbl is identical to ipq8074_pcie_gen3_tx_tbl, should
this reference the existing ipq8074_pcie_gen3_tx_tbl instead?

> +		.rx		=3D ipq9574_pcie_rx_tbl,
> +		.rx_num		=3D ARRAY_SIZE(ipq9574_pcie_rx_tbl),
[ ... ]
> +	.tbls_ep =3D &(const struct qmp_phy_cfg_tbls) {
> +		.serdes		=3D ipq5210_gen3x1_pcie_ep_serdes_tbl,
> +		.serdes_num	=3D ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_serdes_tbl),
> +		.tx		=3D ipq5210_gen3x1_pcie_ep_tx_tbl,
> +		.tx_num		=3D ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_tx_tbl),
> +		.rx		=3D ipq5210_gen3x1_pcie_ep_rx_tbl,
> +		.rx_num		=3D ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_rx_tbl),
> +		.pcs		=3D ipq5210_gen3x1_pcie_ep_pcs_tbl,
> +		.pcs_num	=3D ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_pcs_tbl),

Similarly, could these point to ipq6018_pcie_tx_tbl and
ipq6018_pcie_pcs_tbl respectively?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-pci-phy-v1=
-0-482429192746@oss.qualcomm.com?part=3D2
