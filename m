Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EFA37F317
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749459; cv=none; b=pI9LZMITSkG1G0Xmdk9gViWdZKy1d8zUjBcg8hzzCNH3Aev2yu+RFrUpg/ObyIlhpJcnf+U6BSFPtYsOJwqvxOnJQgbR+OPd/Mp8DzDLk3ZqyRLA1lnMCE+BD5JUWwtagnuDaSSz8EYwX1+46WkNHqMVkt+vUE8VBY3UVL9CJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749459; c=relaxed/simple;
	bh=UW3BDVPrnA5aXO0zDkvVABilx4CrRePHGrD2n4AEW1U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OxVtFQeuiUOTXVr3FkUQQx6Fn/l/J7mC+lOOXJTgeUnPRU8xt3fy4dghI5oSu3j0ekGkxP54BZJdDh+NrR5ZDYIKVol0F2GWVxCzpmRipN9oBPDcC7KiDu/H+Bl+ubs2TzTx7Bk3gksXPVyCFs4dYtAcUD4Ndbo+3fe8DIPOusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzTYonKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzTYonKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548671F000E9;
	Mon,  3 Aug 2026 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749445;
	bh=Q94vXQPGl/Cm4YahreUaaYMC+pJJZe33gSYxR+GoHGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NzTYonKGHCmVfRHYOEZ4mRJ52QIOoLt8WPIEBtJXyoW3EJlRZ4ICYbYF8cOl+M9Z4
	 ux57YgHt2CjAl8R08gz+rs5iHQJv/bnIWMDlkcqmXoWiHPudbU0kPuBtyTrbqCzt1P
	 qKgevM7jLUYT90E0NSxOomelXutL3TUuR5oH0j6NAAyxX7dazMZv4aUEUhFUtKVouz
	 M8vy6mUOtZMTiEeDAd+FAfqpvPlJS/W/CMRtJUYmjzRh7pc9FjhOjBHO3QpjwWyiw1
	 xmA2wYTinmPtTXUFuf3oyE7zHDZsOTwYegmqAh6K00W/M4Q+rrHr3ORZNUkfHnThlL
	 p+/kT0dtabXLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] phy: qualcomm: qmp-combo: Add support for Hawi
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260803091441.3040830-5-mukesh.ojha@oss.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:30:44 +0000
Message-Id: <20260803093045.548671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing DisplayPort initialization callbacks in `hawi_usb3dpphy_cf=
g` will cause a NULL pointer dereference when the DP PHY is initialized.
- [High] The AON toggle registers will not be cleared because `cfg->regs[QP=
HY_AON_TOGGLE_ENABLE]` evaluates to false for the Hawi V10 PHY.
--

--- Patch [4]: [PATCH v4 4/4] phy: qualcomm: qmp-combo: Add support for Haw=
i SoC ---
commit 74a7f87645b4d6da0a341014f5299e1ad20ae0d5
Author: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add support for Hawi SoC

Add support for the USB3-DP combo PHY found on Hawi platform.
The QMP PHY for Hawi uses QSERDES V10 register layouts.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1d..ae80eee628c5e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -2705,6 +2895,27 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy=
_cfg =3D {
>  	.regs			=3D qmp_v6_n4_usb3phy_regs_layout,
>  };
> =20
> +static const struct qmp_phy_cfg hawi_usb3dpphy_cfg =3D {
> +	.offsets		=3D &qmp_combo_offsets_v10,
> +
> +	.serdes_tbl		=3D hawi_usb3_serdes_tbl,
> +	.serdes_tbl_num		=3D ARRAY_SIZE(hawi_usb3_serdes_tbl),
> +	.tx_tbl			=3D hawi_usb3_tx_tbl,
> +	.tx_tbl_num		=3D ARRAY_SIZE(hawi_usb3_tx_tbl),
> +	.rx_tbl			=3D hawi_usb3_rx_tbl,
> +	.rx_tbl_num		=3D ARRAY_SIZE(hawi_usb3_rx_tbl),
> +	.pcs_tbl		=3D hawi_usb3_pcs_tbl,
> +	.pcs_tbl_num		=3D ARRAY_SIZE(hawi_usb3_pcs_tbl),
> +	.pcs_usb_tbl		=3D hawi_usb3_pcs_usb_tbl,
> +	.pcs_usb_tbl_num	=3D ARRAY_SIZE(hawi_usb3_pcs_usb_tbl),
> +
> +	.regs			=3D qmp_v10_usb3phy_regs_layout,

[Severity: High]
Does this configuration miss the mandatory DisplayPort function pointers
like dp_aux_init, configure_dp_tx, and configure_dp_phy?

If a DisplayPort client calls phy_init() or phy_power_on(), the driver
executes qmp_combo_dp_init() and qmp_combo_dp_power_on() which
unconditionally call these function pointers. Because they are omitted here,
they will be NULL and cause a NULL pointer dereference regression.

> +	.reset_list		=3D msm8996_usb3phy_reset_l,
> +	.num_resets		=3D ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		=3D qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +};
> +
>  static const struct qmp_phy_cfg sm6350_usb3dpphy_cfg =3D {
>  	.offsets		=3D &qmp_combo_offsets_v3,

[ ... ]

> @@ -3706,9 +3922,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp=
, bool force)
>  			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> =20
>  	/* override hardware control for reset of qmp phy */
> -	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
> +	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {

[Severity: High]
Will this condition fail to clear the AON toggle registers for the Hawi V10
PHY?

Since QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE is defined as 0x00,
cfg->regs[QPHY_AON_TOGGLE_ENABLE] evaluates to 0. This causes the condition
to fail and skips the qphy_clrbits() execution, leaving the hardware reset
control improperly configured and potentially causing a regression.

> +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
>  	}
> =20
>  	/* Use software based port select and switch on typec orientation */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803091441.3040=
830-1-mukesh.ojha@oss.qualcomm.com?part=3D4
