Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392C743712D
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316830; cv=none; b=jJHR1R0pWsBG0ahkMXVyLs74UD2Nrmz7nT/4R5WORBcSEnJ2LmqgyG++zFujTEb4wXzWRMNRkHgXTNrkhs6RwoNZFMsnQ2Ru8QjpGZtTe7C+SFTHwwh3uEyu6St3Wa6506prfy8PGe5IliikQ+ybti65YPACNBJUeFHs/mqnnTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316830; c=relaxed/simple;
	bh=r7kuRLHAP7RT+YYShyM8ndzki7HKlU8DGVwaSyQ0thQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TgCJ+NqVo/eaKKOBfe9SPJ8K0WM/zeVUrcJX2LhQD66r/WlkaK5b/YxxP2N7bqVzTvUq9MTCxTsPaiKNbtb+msTpbC+1W1FrXJIAH9zDacJJXfQJT+5N+3qpjHOKExvEmX/dCgCY1eT/uVo4xb6QoaOSrGqGNYKanNYyVhwJaAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pzukug/y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pzukug/y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2238D1F000C4;
	Sun, 18 Oct 2026 09:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792316828;
	bh=SiyCrxblmdXnAia3VqQ6PGAAUjugTGXRYn7vtJ9vty8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pzukug/yJL+r95YAG7U+fw5O6KSHxiU+RqErZw26i+eJFP8UUZeeD8e1WLQCiw9Ah
	 5M2L+azJgqqsFIsrJS8a1Cj2aFE0vin90ltEmD6rnDeVKxBO/8LGJUlStcsmx5Nmd1
	 k5avM3q5b8ClF07b7aAdBgvPUL0cXRitk1yH4KA9hbkBrDhrXYpyM/oGyFy7n+MyXf
	 KIbzw6ZhyEQLb2/tb0PloaW0Msaw/MmbCl1JaYCH+d3Us+JuSiiJH9eIa69enN4sZU
	 zgEz+2RrrI9jlgB/yVhDUSc3pkvI82HracJXcAQK9EvoKBbGbH1PpBRL+PR1/nnM/f
	 6v8EDpcPTh4sQ==
Message-ID: <sashiko-outbox-176030@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 9/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-shikra_ethernet-v3-9-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-9-26a8beb44b8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 09:47:07 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: stmmac: qcom-ethqos: missing rgmii_por in shikra_data
--

commit 8e4d72d76d93b838333086304a2ba657b2b5e8e1
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add Shikra EMAC support

This patch adds support for the Qualcomm Shikra ETHQOS controller by
registering the qcom,shikra-ethqos compatible string and defining the
shikra_data driver data descriptor with its three NOC clocks and 36-bit
DMA address width.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 9c602755532e1..a4e083a8517d0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -307,6 +307,22 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_data =3D {
>  	.dwmac4_addrs =3D &ethqos_dwmac4_addrs,
>  };
> =20
> +static const char * const shikra_noc_clk_names[] =3D {
> +	"stmmaceth",
> +	"axi-noc",
> +	"pcie-tile-axi-noc",
> +	NULL,
> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data =3D {
> +	.dma_addr_width =3D 36,
> +	.has_emac_ge_3 =3D true,
> +	.noc_clk_names =3D shikra_noc_clk_names,
> +	.num_noc_clks =3D ARRAY_SIZE(shikra_noc_clk_names) - 1,
> +	.rgmii_config_loopback_en =3D false,
> +	.dwmac4_addrs =3D &ethqos_dwmac4_addrs,
> +};

[Severity: Medium]
Should shikra_data also populate .rgmii_por and .num_rgmii_por like all the
other struct ethqos_emac_driver_data descriptors (emac_v2_3_0_data,
emac_v2_1_0_data, emac_v3_0_0_data, and emac_v4_0_0_data) in
drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c?

With .rgmii_por and .num_rgmii_por omitted, qcom_ethqos_probe() leaves
ethqos->rgmii_por as NULL and ethqos->num_rgmii_por as 0 while registering
ethqos_fix_mac_speed_rgmii() as plat_dat->fix_mac_speed. When phylink brings
up or changes the RGMII link speed, the POR reset loop in
ethqos_fix_mac_speed_rgmii() does nothing:

	/* Reset to POR values and enable clk */
	for (i =3D 0; i < ethqos->num_rgmii_por; i++)
		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
			     ethqos->rgmii_por[i].offset);

Subsequent configuration in ethqos_fix_mac_speed_rgmii() and
ethqos_rgmii_id_macro_init() relies on read-modify-write updates assuming
RGMII_IO_MACRO_CONFIG, SDCC_HC_REG_DLL_CONFIG, SDCC_HC_REG_DDR_CONFIG,
SDCC_HC_REG_DLL_CONFIG2, SDCC_USR_CTL, and RGMII_IO_MACRO_CONFIG2 were first
reset to their baseline POR defaults.

Without this reset, non-POR state left by a bootloader or kexec is never
cleared in any RGMII mode (including PHY_INTERFACE_MODE_RGMII_ID, where
ethqos_rgmii_id_macro_init() relies on POR defaults for fields such as
RGMII_CONFIG_INTF_SEL, RGMII_CONFIG_MAX_SPD_PRG_2, and
RGMII_CONFIG_MAX_SPD_PRG_9). Additionally, in PHY_INTERFACE_MODE_RGMII,
PHY_INTERFACE_MODE_RGMII_RXID, and PHY_INTERFACE_MODE_RGMII_TXID modes, spe=
ed
transitions between 1000M and 100M/10M will leave stale bits set from the
previous speed (such as SDCC_DLL_CONFIG_DLL_EN, SDCC_DLL_CONFIG_CDR_EN,
SDCC_DLL_CONFIG_CDR_EXT_EN, and SDCC_DDR_CONFIG_PRG_RCLK_DLY when switching
from 1000M to 100M/10M, or SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY, and SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE
when switching from 100M/10M to 1000M).

[ ... ]

> @@ -947,6 +963,7 @@ static const struct of_device_id qcom_ethqos_match[] =
=3D {
>  	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
> +	{ .compatible =3D "qcom,shikra-ethqos", .data =3D &shikra_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-shikra_eth=
ernet-v3-0-26a8beb44b8f@oss.qualcomm.com?part=3D9
