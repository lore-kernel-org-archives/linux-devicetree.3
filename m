Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693113B14DE
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556783; cv=none; b=sQbIZDz/wGzRPIfWJQANkDx0aUMafh1xeYLJbMi6/L4q7YDI3DIwCzyvPINJf/1otokBl61lAgTrWoNnQGlXNJJwdAwE25uNukkxd8RMYCQBJuJCgmInbtPHDD9EXgqU66kVYrkZXMk1hiQ9peQz+8CQ1rWfLblQRoSkwp07zHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556783; c=relaxed/simple;
	bh=KZLGDOKcALuhyoSDNsJSMuAt485Y0ZobOGZH4mkCNag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sDfn5xdOvhyrGElrVXMSGF9s8fvqnevrGzxVH5I2INiK2eathKFYFICuUSRpWfmG1VIp0htI8FnoQiMutbqnLL483GiNopxR1BV3HK2Ira/fUoE63AMALVK6efuYWkopv4d5Kn1oKudYkiORDMhnBtTlaXv6Mu5//+uYTzpPiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdWTH8ju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdWTH8ju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482441F00A3A;
	Mon, 20 Jul 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556781;
	bh=fZZJLl+VluyyR97qkjr+vlG2RbHowBFzdpRbCckzAhc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JdWTH8juCFZzpA8Sw4Hd7z23RyQdCXv5mdqVfkmqy+UenIMwuP6gZmRe0RS2dDW6U
	 gx1EcbIq+5MsykMp+czhO60gU3D2lQR3541Q4UPQwjXG2OXfp+drNe93KElqbuPJtr
	 rk/r/qkJCx9oPxb3zIL1U8rmTYUBDtukLdy/E4Rf3pGgr0BOiU2osoiWc1akYdSMDZ
	 kGX0c6j9oO3pd+DP9eDrm6usrtAkNVmvTJMjIYHBQNsx1qJiCOdD8e+6ZIqSdcj4tH
	 +hPZeybpb0mNwbB4ICUReI29GAOxXzMVMd1F1btPTfHTi/x/NBCvIVPi00n/77FeeQ
	 UWSFN+9eV6gvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] phy: mediatek: Add support for PCI-Express Gen4
 S-PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720135344.84183-3-angelogioacchino.delregno@collabora.com>
References: <20260720135344.84183-1-angelogioacchino.delregno@collabora.com>
 <20260720135344.84183-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:13:00 +0000
Message-Id: <20260720141301.482441F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Improper handling of missing or unsupported NVMEM calibration data=
 causes spurious error logs and hard probe failures.
- [Medium] A valid calibration value of 0 is incorrectly treated as missing=
 data, discarding all calibrations.
- [Low] The TX_IMPSEL registers are updated twice with identical values dur=
ing initialization.
- [Low] Macros for AEQ_EGEQ_RATIO are defined but unused in favor of litera=
l magic numbers.
--

--- Patch [2]: [PATCH v2 2/2] phy: mediatek: Add support for PCI-Express Ge=
n4 S-PHY ---
commit d91c6c0718440c44adc7e6a83f5aeca706a6c3d5
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: phy: mediatek: Add support for PCI-Express Gen4 S-PHY

This patch adds support for the PCI-Express Gen4 S-PHY found in the latest
MediaTek SoCs, including MT8196 and MT8894.

> --- a/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-pcie-sphy.c
[ ... ]
> +#define PEXTP_DIG_LN_RX2_AEQ_EDGE_0			0x6004
> +#  define RG_XTP_LN_RX_AEQ_EGEQ_RATIO_GEN3		GENMASK(21, 16)
> +#  define RG_XTP_LN_RX_AEQ_EGEQ_RATIO_GEN4		GENMASK(29, 24)
> +#  define AEQ_EGEQ_RATIO_GEN3_TO_22			0x16
> +#  define AEQ_EGEQ_RATIO_GEN4_TO_22			0x16
[ ... ]
> +		mtk_phy_update_field(sif_lane_base + PEXTP_DIG_LN_RX2_AEQ_EDGE_0,
> +				     RG_XTP_LN_RX_AEQ_EGEQ_RATIO_GEN3, 22);
> +
> +		mtk_phy_update_field(sif_lane_base + PEXTP_DIG_LN_RX2_AEQ_EDGE_0,
> +				     RG_XTP_LN_RX_AEQ_EGEQ_RATIO_GEN4, 22);

[Severity: Low]
Is there a reason the literal 22 is used here instead of the
AEQ_EGEQ_RATIO_GEN3_TO_22 and AEQ_EGEQ_RATIO_GEN4_TO_22 macros defined
earlier?

[ ... ]
> +static void mtk_pcie_sphy_apply_calibration(struct mtk_pcie_sphy *pcie_s=
phy)
> +{
[ ... ]
> +		mtk_phy_update_field(sif_lane_base + PEXTP_ANA_LN_TRX_A0,
> +				     RG_XTP_LN_TX_IMPSEL_PMOS, cal->tx_impsel.pmos);
> +
> +		mtk_phy_update_field(sif_lane_base + PEXTP_ANA_LN_TRX_A0,
> +				     RG_XTP_LN_TX_IMPSEL_NMOS, cal->tx_impsel.nmos);
> +	}
> +}
> +
[ ... ]
> +static int mtk_pcie_sphy_init(struct phy *phy)
> +{
[ ... ]
> +	if (pcie_sphy->calibration.supported) {
> +		mtk_pcie_sphy_apply_calibration(pcie_sphy);
> +
> +		tx_impsel.pmos =3D pcie_sphy->calibration.tx_impsel.pmos;
> +		tx_impsel.nmos =3D pcie_sphy->calibration.tx_impsel.nmos;
> +	} else {
> +		/* Set P=3D10, N=3D9 to prevent EMI if no calibration present */
> +		tx_impsel.pmos =3D 10;
> +		tx_impsel.nmos =3D 9;
> +	}
> +
> +	/* Select TX Impedance on N and P MOSFETs */
> +	for (i =3D 0; i < pcie_sphy->num_lanes; i++) {
> +		void __iomem *sif_lane_base =3D pcie_sphy->sif_base + PEXTP_REG_LANE(i=
);
> +
> +		mtk_phy_update_field(sif_lane_base + PEXTP_ANA_LN_TRX_A0,
> +				     RG_XTP_LN_TX_IMPSEL_PMOS, tx_impsel.pmos);
> +
> +		mtk_phy_update_field(sif_lane_base + PEXTP_ANA_LN_TRX_A0,
> +				     RG_XTP_LN_TX_IMPSEL_NMOS, tx_impsel.nmos);
> +	}

[Severity: Low]
Are these register updates redundant?

When calibration is supported, mtk_pcie_sphy_apply_calibration() already
writes cal->tx_impsel.pmos and cal->tx_impsel.nmos to PEXTP_ANA_LN_TRX_A0.

Then this loop immediately overwrites the same registers with the exact same
values.

[ ... ]
> +static int mtk_pcie_sphy_get_one_cal_para(struct device *dev, const char=
 *name, u8 max_val)
> +{
[ ... ]
> +	ret =3D nvmem_cell_read_u8(dev, name, &tmp);
> +	if (ret =3D=3D 0)
> +		buf =3D tmp;
> +	else
> +		ret =3D nvmem_cell_read_u16(dev, name, &buf);
> +
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Cannot get calibration data for %s\n", name);

[Severity: High]
Will this cause spurious error logs or fail the probe when calibration data=
 is
missing or unsupported?

If the system does not have CONFIG_NVMEM enabled, nvmem_cell_read_u8() retu=
rns
-EOPNOTSUPP, which gets logged as an error here.

This error is then passed back up to mtk_pcie_sphy_get_calibration_data(),
where it is not caught. This will cause the entire driver probe to fail.

Similarly, if the cell is simply missing from the Device Tree, it returns
-ENOENT. This also triggers an error log via dev_err_probe(), even though
missing calibration data is explicitly documented as non-fatal and optional.

> +
> +	if (buf =3D=3D 0) {
> +		dev_info(dev, "No calibration for %s. Using defaults\n", name);
> +		return -ENOENT;
> +	}

[Severity: Medium]
Is a value of 0 always indicative of missing calibration?

If a valid tuned calibration value is 0, this check will return -ENOENT and
cause mtk_pcie_sphy_get_calibration_data() to discard all calibrations enti=
rely.

This also seems to prevent the quirk for cal-version =3D=3D 0 from ever bei=
ng
applied:

[ ... ]
> +static int mtk_pcie_sphy_get_calibration_data(struct mtk_pcie_sphy *pcie=
_sphy)
> +{
[ ... ]
> +	ret =3D mtk_pcie_sphy_get_one_cal_para(dev, "cal-version", 15);
> +	if (ret < 0)
> +		goto end;
> +	version =3D ret;
> +
> +	/* Quirk for eFuse calibration table versions 0 to 4 */
> +	if ((version <=3D MTK_PCIE_SPHY_CALIBRATION_LAST_QUIRK_VER) &&
> +	    cal->rx_leq_rl_ctle =3D=3D 10) {

Because mtk_pcie_sphy_get_one_cal_para() returns -ENOENT when it reads a 0,
the version =3D=3D 0 condition will never be reached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720135344.8418=
3-1-angelogioacchino.delregno@collabora.com?part=3D2
