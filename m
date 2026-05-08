Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F2930BF4F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282780; cv=none; b=VlWtuJs/c041DYEzQqttLXCvIoAtGUx2YjaX0uzQMj7qmecc7gUKKJQ/EeUwKTP4N/s207GDD6SWWEVm2axVJKkxgLpQp7W/Als7Fy1BJW120szn+trghkWHOXhSehjGkF7Hz+P7xf0Xzy1epgwZqdyhU9AZ35wiiVrMekPf3Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282780; c=relaxed/simple;
	bh=GLsL7mMy0YYKQltGa+4I4uqaEt6ji4K6qjCRfSM/YkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gy4H08BuAREqLCTLAYut+uwkjN2EISQ3IGb0tUeoF01jCGnRUJ477fKhnxQOHyrszOgPUBaopdW2kREj5W/+5+TOWB5rMHvtpm8RWL+NqgeJPs+tq/j/977Eda5PSORl+3acvVKZFW8INovksHFybL9gZ2LusXsrsRiHZ1WA9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyDWCyu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyDWCyu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD04C2BCB0;
	Fri,  8 May 2026 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282780;
	bh=GLsL7mMy0YYKQltGa+4I4uqaEt6ji4K6qjCRfSM/YkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cyDWCyu2Ii9pmACua1GGn9q7y8bxYjfFnWyD4ONA1Vkr0w8eg4dqA7X6PoPOMTL6e
	 9MuerZ8fbZ4C+5th7zSP06xVFJp0RBma1+028qIs/L3IYEnRaCB0JN0C79GrKJ7cUQ
	 33fCKsT6nL1N+bIHt5TCgh/dfEycmPqofz0YQplSvGN16LM+K5k1C+Kr2/VZAOf15X
	 v7OvhUZlo0ij7N7B2wqpsPnkURpa5vw5alMxhyjOdUTgFGqmeX+c7rIre5Hu2FZa0V
	 K14LiuJyLTbG3jNh8Mz6EulP83ku0Ho4dewEP87+8VsH/+xeEy9qt1Pn/bcDrDBz44
	 NPrfRZpW98iuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Add support for Hawi
 SoC
Reply-To: sashiko@lists.linux.dev
To: "Ronak Raheja" <ronak.raheja@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260508213234.4643-5-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-5-ronak.raheja@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:26:19 +0000
Message-Id: <20260508232620.2FD04C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing DP PHY function pointers in `hawi_usb3dpphy_cfg` lead to N=
ULL pointer dereferences when the DP PHY is initialized.
- [High] Valid register offset `0x00` causes the AON toggle hardware reset =
override to be silently skipped.
--

commit 39c99ec3129f1da7348c282db12eb565e967941d
Author: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

phy: qualcomm: qmp-combo: Add support for Hawi SoC

This commit adds support for the USB3-DP combo PHY found on the Hawi
platform, introducing new V10 register layouts and the COM AON register
module.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 93f1aa10d4008..53b709ea93d52 100644
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
> +	.reset_list		=3D msm8996_usb3phy_reset_l,
> +	.num_resets		=3D ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		=3D qmp_phy_vreg_l,
> +	.num_vregs		=3D ARRAY_SIZE(qmp_phy_vreg_l),
> +};

Does this configuration miss the DP PHY function pointers?=20

Because this is a USB3-DP combo PHY, the driver unconditionally creates the=
 DP
PHY. When a DisplayPort controller tries to initialize it, functions like
qmp_combo_dp_init() and qmp_combo_dp_power_on() will unconditionally call
cfg->dp_aux_init(qmp) and cfg->configure_dp_tx(qmp).=20

Without these pointers defined in hawi_usb3dpphy_cfg, will this lead to a N=
ULL
pointer dereference and a kernel panic upon DP PHY initialization?

[ ... ]
> @@ -3699,9 +3915,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp=
, bool force)
>  			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
> =20
>  	/* override hardware control for reset of qmp phy */
> -	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> -		qphy_clrbits(pcs_aon, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
> +	if (aon_toggle && cfg->regs[QPHY_AON_TOGGLE_ENABLE]) {
> +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> +		qphy_clrbits(aon_toggle, cfg->regs[QPHY_DP_AON_TOGGLE_ENABLE], 0x1);
>  	}

Is it possible for the hardware reset override to be silently skipped here?

The V10 register layout maps QPHY_AON_TOGGLE_ENABLE to
QPHY_V10_COM_AON_USB3_AON_TOGGLE_ENABLE, which is defined as 0x00 in
phy-qcom-qmp-com-aon-v10.h.

Because 0x00 is a valid register offset but evaluates to false in C, the
check for cfg->regs[QPHY_AON_TOGGLE_ENABLE] will fail. This would skip the
qphy_clrbits() calls entirely, bypassing the necessary hardware reset overr=
ide
sequence and leaving the PHY in a broken state.=20

Could we use a different way to check if this register is supported by the
layout without relying on the truthiness of the offset value?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508213234.4643=
-1-ronak.raheja@oss.qualcomm.com?part=3D4
