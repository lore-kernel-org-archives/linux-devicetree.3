Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C5B457E56
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638059; cv=none; b=jFlRYMSIWVW1kY8AV0gv+6AxNOxKBZIzuGx9hybdQBzgD2dvCXfV3pYQDVZIFFQxdymmBJhsF3hX8nXUzRaNpzXs84yXoXYZ6b4kqb/Mja/m/AtXBwyyJ7pMPvFeC9dFO1BXCWT8ChmZLPeZjeVpGHzVOhpjgrLQfhXCqD+NTP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638059; c=relaxed/simple;
	bh=2rig3hjdVgarZnDPLHbnUEAdBRCjrb+XBu8dkXv6M+U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CceG94F4EtpvPaDOUVDivAaJpG38VFT+5ItjGMIVm8okXnOavbwiKIMP0F+4YXavlA3e7IScz9ExcVQ599gq/mr/5QlwpKmN5+OY11R1n+Ll2nHlZd4wTY8B5JI9Z7emUbMb1b4eFKLJy368oxlmEOGwN0GiIiYJ0u4r2tLyOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jY6P38Dq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jY6P38Dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B6E1F000FF;
	Sat, 10 Oct 2026 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638057;
	bh=m03W3RGnAIaR5uUrSTvbp3OmLoH9eNmU1/nOn7/8IUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jY6P38DqG2Y5/ZZcyPkGRMK2O7DL2MggYr4ml5DnpLFL+mM6RkcDfM34tqIFKXRaK
	 D8ogXCjijdJDS/zc27zLTI8wBY+z6tjqJk80A2xTtftHzgWWwfs4CtHGtiDpp6EnLh
	 szV9mAa7MvMV5Epu/CYu5sFXlXBR3m7XAul4G9nQ7EuqdGFSocun7+TuvxlwtQR/3Y
	 K/75oJJrSPwLRb6e4cD1aaJaC49mydZIbaiGMsvsu9UIEkS7fVxUXORXuOxxd95xzq
	 NQjIGgeJFb6T4T/Eo2pGesU8Hdu3aBREpgDLO0y3tWGHq2ey/Y8C6cG/PbQg0+Utrv
	 xEb+xbaLOY7PQ==
Message-ID: <sashiko-outbox-166576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-14-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:14:16 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pci: race condition and state corruption in shared CRM2_RST regist=
er
- [Medium] pci: LNKCTL 32-bit read-modify-write clears LNKSTA W1C bits
- [Medium] pci: missing hardware cleanup on probe failure leaks clocks and =
PHY state
--

commit 41b496fd57c1fa24884637e3c63af32d3b98ad9f
Author: Navid Ghahremani <ghahramani.navid@gmail.com>
PCI: dwc: Add ZTE ZX279128S host controller driver

This commit adds a new PCIe controller driver for the ZTE ZX279128S SoC.
It supports bringing up both controller links using a vendor sequence,
handles shared board reset, and relies on legacy INTx interrupts.

> diff --git a/drivers/pci/controller/dwc/pcie-zx279128s.c b/drivers/pci/co=
ntroller/dwc/pcie-zx279128s.c
> new file mode 100644
> index 0000000000000..3559beb35a142
> --- /dev/null
> +++ b/drivers/pci/controller/dwc/pcie-zx279128s.c
[ ... ]
> +static void zx279128s_pcie_force_gen1(struct dw_pcie *pci)
> +{
> +	u8 cap =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	u32 val;
> +
> +	if (WARN_ON(!cap))
> +		return;
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val =3D dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCTL2);
> +	val &=3D ~PCI_EXP_LNKCTL2_TLS;
> +	val |=3D PCI_EXP_LNKCTL2_TLS_2_5GT;
> +	dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCTL2, val);
> +
> +	val =3D dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCTL);
> +	dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCTL, val | PCI_EXP_LNKCTL_RL);

[Severity: Medium]
Does using 32-bit accessors (dw_pcie_readl_dbi and dw_pcie_writel_dbi) for
the 16-bit PCI_EXP_LNKCTL and PCI_EXP_LNKCTL2 registers inadvertently clear
Write-1-to-Clear (W1C) bits in the adjacent Link Status registers?

Because the Link Status registers are adjacent to the Link Control register=
s,
a 32-bit read-modify-write includes them. If any W1C bits (like Link
Autonomous Bandwidth Status) were read as 1, writing them back as 1 clears
them, which can result in lost link events. Should this use 16-bit accessors
or dw_pcie_read_dbi() with a size of 2?

> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
> +static int zx279128s_pcie_init_crm(struct zx279128s_pcie *pcie)
> +{
> +	const struct zx279128s_pcie_port *port =3D pcie->port;
> +	struct regmap *crm1 =3D pcie->crm[ZX_CRM1];
> +	struct regmap *crm2 =3D pcie->crm[ZX_CRM2];
> +	int ret, i;
[ ... ]
> +	ret =3D regmap_write_bits(crm2, CRM2_RST, port->rst, port->rst);
> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write_bits(crm2, CRM2_CLK, port->clk_off, 0);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_write(crm2, CRM2_RST, CRM2_RST_ALL);

[Severity: High]
Does an unconditional regmap_write() of CRM2_RST_ALL completely overwrite
the shared CRM2_RST register, potentially corrupting the reset state of a
sibling PCIe controller or other SoC peripherals?

> +}
> +
> +static int zx279128s_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> +	struct zx279128s_pcie *pcie =3D to_zx279128s_pcie(pci);
> +	int ret;
> +
> +	/*
> +	 * The board lines reset a device that can sit behind both controllers
> +	 * (the MT7915 of the H3600 uses both). The first controller to start
> +	 * resets and releases it; the second must not reset it again.
> +	 */
> +	mutex_lock(&zx279128s_board_lock);
> +	if (!zx279128s_board_released && (pcie->reset || pcie->enable)) {
[ ... ]
> +		msleep(200);
> +		zx279128s_board_released =3D true;
> +	}
> +	mutex_unlock(&zx279128s_board_lock);
> +
> +	ret =3D zx279128s_pcie_init_crm(pcie);

[Severity: High]
Since zx279128s_board_lock is released right before calling
zx279128s_pcie_init_crm(), can two concurrently probing controllers race
during initialization?

One controller might still be inside its 50ms fsleep() window after asserti=
ng
its reset bit, while the other completes its sequence and overwrites the
entire CRM2_RST register with CRM2_RST_ALL, prematurely deasserting the fir=
st
controller's reset.

> +	if (ret)
> +		return dev_err_probe(pci->dev, ret, "failed to initialize CRM\n");
> +
> +	/* Enable the controller, which starts link training */
[ ... ]
> +static const struct dw_pcie_host_ops zx279128s_pcie_host_ops =3D {
> +	.init =3D zx279128s_pcie_host_init,
> +	.msi_init =3D zx279128s_pcie_msi_init,
> +};

[Severity: Medium]
If the core dw_pcie_host_init() fails after successfully calling the driver=
's
.init callback, does the lack of a .deinit callback here cause the driver to
leak enabled clocks and leave PHYs powered on permanently?

Also, if any register access fails mid-sequence inside
zx279128s_pcie_init_crm(), the function returns immediately without rolling
back the already-enabled clocks and PHYs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D13
