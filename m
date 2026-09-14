Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C495E3BCD38
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415070; cv=none; b=q8fCOAM48RRYFWT7S0ZNmlmrjhgRo+uB1OUfway7Z1Y6LK9hoDeNZ0vEJ+6YzEss2XXQIEwRQINTuk1MC0gatrwDMYK7swqxmAOqlmOMa1jT/OJEAwJvEkGcOcpiSNZRhbbRrY7azOdardSCVaf2Vvav3T9UlytjPoZzW78EeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415070; c=relaxed/simple;
	bh=KsamMF6Q7C4NCBHl2wu8KcE0LuMpUAkJn2FhRb+BeBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ezNaY4fPsVXEt+ZUwPBMCvpf7Q+Ump3E4A6+M0+stc61LsF9EPmkzI7Cfx4zav+WvYc3RPxoHpTH3kelTYcguUoDRdMMgDXziSz5sRxZa/QZHH92IlSXJYh5CRUU2BwgYYkxZ+mqRMzjNwANrHRNt7uqMc4iLTD9QYiwtMeBZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2SyrbHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2SyrbHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991071F000FF;
	Mon, 14 Sep 2026 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415064;
	bh=NSdBDbohHV/CRLu82cfAybZmDYmMyJIrw2WhEqbfEPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2SyrbHwGULUPYx6n6fJbbmuOLmsaBlwZk+CXetl1vDPfe9SVPyIe8sutLhEuVmbL
	 tNCbUYpdWBLYSvnlaIL1TfblnX4JFZJx1qkALzs0RIqxe+fKfZM0hGUpj30FrvNeWS
	 eQF4qrW719NeGNbg63/9OXWnUdF4OySfeJd6ePrBA01/Z/8z7t8D5yUqP8HGUKHoFv
	 ofLfVBXmtsqPb7R1evDhdRjEN3m+jhk7HMuENm0Nd4PP3lVSdCEUfguCZ8e9sRUCEE
	 +Fvyj0rLF1szGGoFa5phKCa1hiqNy6xAaOaxvB1jbb/didoUov7NqzRIy9/7BB+eAt
	 dep002OojZMwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260913185849.907479-8-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
 <20260913185849.907479-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 19:44:23 +0000
Message-Id: <20260914194423.991071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect MMD write remapping for MII vendor registers breaks conf=
iguration for ports 1, 2, and 3.
- [High] Calculation of `eee_mult_fact` overflows the 32-bit `unsigned long=
` on 32-bit architectures, leading to completely incorrect EEE configuratio=
ns.
- [Medium] Acquiring `device_lock()` of another device from within a probe =
path causes a lockdep warning (recursive locking).
--

commit ba02c9523dcac3b326b325ec63d9a16255030d26
Author: Coia Prant <coiaprant@gmail.com>
net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit adds the Rockchip RK3568 platform glue driver for the Synopsys
DesignWare XPCS. It creates a virtual MDIO bus to translate standard MDIO
operations into APB3 register accesses with address remapping.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..7fd1408c044cc
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c

[ ... ]

> +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> +{
> +	switch (dev) {
> +	case MDIO_MMD_PMAPMD:
> +		return ROCKCHIP_MMD_PMAPMD;
> +	case MDIO_MMD_VEND2:
> +		break;
> +	default:
> +		return -ENXIO;
> +	}
> +
> +	/* Writable only on MII */
> +	switch (reg) {
> +	case DW_VR_MII_AN_CTRL:
> +	case DW_VR_MII_AN_INTR_STS:
> +	case DW_VR_MII_EEE_MCTRL0:
> +	case DW_VR_MII_EEE_MCTRL1:
> +	case DW_VR_MII_DIG_CTRL2:
> +		return ROCKCHIP_MMD_MII;
> +	default:
> +		break;
> +	}

[Severity: High]
Does this break the configuration for ports 1, 2, and 3? This block interce=
pts
writes to these specific MII vendor registers and unconditionally routes th=
em
to MMD 7 (port 0), ignoring the port address mapping.=20

If these registers are modified via the MDIO bus for ports greater than 0
during initialization, the auto-negotiation and EEE configurations might be
applied to port 0 instead, potentially breaking the network links for the
secondary ports.

[ ... ]

> +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> +{

[ ... ]

> +	/*
> +	 * Compute the multiplier for the EEE clock so that
> +	 * clk_eee_period * (mult_fact + 1) falls within 80..120 ns.
> +	 *
> +	 * On RK3568, clk_xpcs_eee is muxed between gpll200 (200 MHz, 5 ns)
> +	 * and cpll125 (125 MHz, 8 ns), selected by CRU_CLKSEL_CON29 bit 13.
> +	 * The reset value is 0 (200 MHz), but derive the value at runtime to
> +	 * stay correct if the mux is changed by a board.
> +	 */
> +	pxpcs->eee_mult_fact =3D DIV_ROUND_CLOSEST(100 * clk_get_rate(pxpcs->ee=
e_clk),
> +						 1000000000UL) - 1;

[Severity: High]
Can this calculation overflow on 32-bit architectures? clk_get_rate() retur=
ns
an unsigned long. On 32-bit architectures (like an ARM32 kernel or during a=
=20
COMPILE_TEST build), the multiplication of 100 * 125,000,000 equals=20
12,500,000,000, which exceeds the 32-bit maximum (4,294,967,295).=20

This overflow could result in completely incorrect hardware timings for the
EEE configuration.

[ ... ]

> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{

[ ... ]

> +	pdev =3D of_find_device_by_node(pcs_np);
> +	of_node_put(pcs_np);
> +	if (!pdev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	device_lock(&pdev->dev);
> +	pxpcs =3D platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {
> +		device_unlock(&pdev->dev);

[Severity: Medium]
Will this trigger a lockdep warning for recursive locking? The MAC driver's=
=20
probe already holds its own dev->mutex via really_probe() when it invokes=20
xpcs_rk_create(), and this code then attempts to acquire the XPCS device's=
=20
dev->mutex.=20

Since all default device locks share the same lockdep class, could this
un-annotated nesting cause a false-positive lockdep splat that pollutes
kernel logs (and panics if panic_on_warn is enabled)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913185849.9074=
79-1-coiaprant@gmail.com?part=3D7
