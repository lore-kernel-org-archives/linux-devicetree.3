Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300C3A1CEA
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792316828; cv=none; b=ttWgXrmZ+fzFet5+gba9Z5IefkXg+truTC/pQl5MoQIhq1Blh3izmkdfLd9mBMZ3qelIoouAup5JjuMsDN/Iu4HTw+R5JhIHBMeLAAsEtg4SJEOcxwiVW5YrLHk210wtdi44i7Z3Co3IeXqJ4A4oe+mc06A0PRWIdlEr9ArwChc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792316828; c=relaxed/simple;
	bh=uDXMOdblUfa1tKr2g3fYpIpYyGwIj6N15jYAzgq3vos=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MMRMeQKoLnXMoMC30waHh2mG3BostsT2UCB1vzFu88iPWRJPChahhk8xtW4rDwdIgiZq2I2qqwOFtUy4FT1ozwlI5sriBgXUNfakL2zV6DYYjtB7mrZ49VOMsJWL/jXZzK8yb6vQuVZZt+TGFKy3VQVDtjcSiPtguqW74yUsRd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdeQNXwF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdeQNXwF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334D41F000C4;
	Sun, 18 Oct 2026 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792316826;
	bh=5K+jvznLvarZTRUM4+ANCw/XJZ1t/jIwHFLm5WgaZVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdeQNXwFtvaT7ruYrwKp8Ava0uFXoRqSBJkodxSOcMGYkihECOna9pSxLO2/SQhzU
	 cXgc6JZ6qD8p0v/+qbVTdJwMHUOXTtWZ91yNcczHJ2ATgapabxBEZFH3dxk09+3HaP
	 hGep4DS0jvVmX0eJyQjxkqPThV2pyM3LsToVUN1THlci3kVRzt0mMaQHF4E89XSRq1
	 oVwgxExYH15bsjTFTUa+ZEZ/+Kmk7lAofU2d3rblFo4qi5dQ9+GkKYEL1ovvWgGxFb
	 7d2LQTRLshRZK/bwRQYrcr28Fg9yeSG/3P9qsAsGxnl8hlDADtjaLt+4KMpZzzOwfJ
	 RDhHifdt0ZvQQ==
Message-ID: <sashiko-outbox-176025@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 09:47:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: stmmac: qcom-ethqos: rgmii_setmask() on multi-bit RGMII_CON=
FIG2_RSVD_CONFIG15
--

commit 405cfced2fa67ffbf18f898b4b34f3a6a9035507
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass

This commit fixes PHY_INTERFACE_MODE_RGMII_ID handling in dwmac-qcom-ethqos=
 by
powering down the DLL, enabling DDR bypass mode, adjusting the link clock r=
ate
for 100M/10M speeds, and programming IO_MACRO via a new
ethqos_rgmii_id_macro_init() helper.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 44270c25d874f..53fb9de4d92c7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -67,6 +67,9 @@
>  /* SDC4_STATUS bits */
>  #define SDC4_STATUS_DLL_LOCK			BIT(7)
> =20
> +/* SDCC_USR_CTL bits */
> +#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
> +
>  /* RGMII_IO_MACRO_CONFIG2 fields */
>  #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
>  #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)

[ ... ]

> @@ -475,6 +485,42 @@ static void ethqos_rgmii_macro_init(struct qcom_ethq=
os *ethqos, int speed)
>  		      RGMII_IO_MACRO_CONFIG);
>  }
> =20
> +static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int s=
peed)
> +{

[ ... ]

> +	if (speed =3D=3D SPEED_1000)
> +		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONF=
IG2);
> +	else
> +		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONF=
IG2);

[Severity: Medium]
Should this else branch be setting all 15 bits of RGMII_CONFIG2_RSVD_CONFIG=
15
in RGMII_IO_MACRO_CONFIG2 when configuring 100M or 10M speeds in
PHY_INTERFACE_MODE_RGMII_ID mode?

RGMII_CONFIG2_RSVD_CONFIG15 is defined as GENMASK(31, 17), where the 15 suf=
fix
denotes the 15-bit width of the field (similar to RGMII_CONFIG_MAX_SPD_PRG_9
and RGMII_CONFIG_MAX_SPD_PRG_2).

Because rgmii_setmask() calls rgmii_updatel(ethqos, mask, mask, offset), it
writes 0x7fff into bits 31:17. Should this instead program a specific value=
 into
that field using rgmii_updatel() and FIELD_PREP(RGMII_CONFIG2_RSVD_CONFIG15=
, ...)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-shikra_eth=
ernet-v3-0-26a8beb44b8f@oss.qualcomm.com?part=3D4
