Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D0370AD5
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887929; cv=none; b=NPpK6D9N9nHYSZpj6JPKWpIFgHpBjfj8xOsie5PTrNKPtANxo3JXVhHOZF/blmgIpk8/lTLkcEamq7+SWmSRu+o8FK2r1scIm/D6J284KpQnu8uLbmiAXfyEeuNTNKjSrvXkMBZANKBR9aBdfI7glMV4olXnjZC+P7QqO2ExLqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887929; c=relaxed/simple;
	bh=vJmrT11AfyfQsY+wSJF64dGln69Hls62f5CYax+oqko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RAW2W6AuAJx1mmXE0LbIRQE0p1LF8z432L0ekQfYrWZsmbveW66GeZLZaXfs/T+RBXPZDjfGCGUS0gBNGiml+5Vt3U9kRSsm/uy6ry6qY6lsWqzxA0wDD8t+jTLSYm8XkuKGdf3O8u+WjRonS3QcFz84n9pohew2ZryHTK20nNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kldd6Wx1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kldd6Wx1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD91E1F000E9;
	Fri, 24 Jul 2026 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887928;
	bh=xOKOHFc9g0k1D9WtwT+0BuB86ggXpOKqrNZ51pBDOAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kldd6Wx17Pj+PihF0qUQ93MWiweDx0M2SL/1i3NoIXzlxRA7SRgd3mVvl3Sy7fGqA
	 LdqsROeZxVyUyICBygVk29H95bxtBz+wBtcOFgFjOSbi8thPF4MfUO+JnRpsOMrjFI
	 LUQtb/WR2n8aT9LasW1SGuRjwMXlgWISoql5m5dkh8aRkhwiEipARL6MRvO0wxV6Uw
	 D7rinvS2Nr8p05QkGNiV7k1LVVr4mhr7tZTh4AeAe15VMrbs3ZDFGWnXSBY0uPn6jZ
	 vO2CnE/aytxj8ZRAaZhhq8lzc4bV3ABVV0uJ+a2MaBeFRVMP96AxFTN1aXBrH2kKtr
	 zrfFG9r8EOY+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-2-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:12:07 +0000
Message-Id: <20260724101207.DD91E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing AHB clock `cfg_ahb_b` (and `rchng_b`) in X8 mode clock lis=
t will likely cause bus hangs when polling `port_b` registers.
- [Low] Unused `pipe_clk_fixed` field in `struct qmp_pcie`.
--

--- Patch [2]: [PATCH v7 2/6] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY d=
river ---
commit f6ac710b3219c54fc755a82474f60ba0b32281bb
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
   =20
Add a dedicated driver for QMP PCIe PHY hardware blocks that support
multiple link topologies (e.g. x8 or x4+x4). Match data carries a per-mode
cfg table; qmp_pcie_multiphy_probe() reads the current link mode and
instantiates one qmp_pcie per sub-PHY.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/=
phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> new file mode 100644
> index 0000000000000..210c951e997d2
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
[ ... ]
> +struct qmp_pcie {
> +	struct device *dev;
> +	const struct qmp_phy_cfg *cfg;
> +	void __iomem **base;
> +	struct clk_bulk_data *clks;
> +	struct clk_bulk_data *pipe_clks;
> +	struct reset_control_bulk_data *nocsr_resets;
> +	struct regulator_bulk_data *vregs;
> +	struct device **pd_devs;
> +	struct clk_fixed_rate pipe_clk_fixed;

[Severity: Low]
Is this pipe_clk_fixed field used anywhere?

It appears the driver dynamically allocates an array of struct clk_fixed_ra=
te
in qmp_data->pipe_out_clks instead, so this might be an unused leftover from
the single-PHY driver.

> +};
[ ... ]
> +static const char * const glymur_pciephy_clk_l[] =3D {
> +	"aux", "cfg_ahb", "ref", "rchng", "phy_b_aux",
> +};

[Severity: High]
Does this clock list for X8 mode need to include cfg_ahb_b and rchng_b?

In X8 mode, glymur_qmp_gen5x8_pciephy_cfg sets num_regs =3D 2 and includes =
both
"port_a" and "port_b". When qmp_pcie_power_on() runs, it iterates over both
sub-PHYs:

	for (i =3D 0; i < cfg->num_regs; i++) {
		status =3D qmp->base[i] + offs->pcs + cfg->regs[QPHY_PCS_STATUS];
		ret =3D readl_poll_timeout(status, val, !(val & cfg->phy_status), 200,

If cfg_ahb_b is not enabled, reading port_b's PCS status register at
qmp->base[1] could cause an unclocked MMIO access, which typically leads to=
 a
synchronous external abort on these platforms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-glymur_lin=
kmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com?part=3D2
