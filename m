Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384472E7BD9
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 02:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157416; cv=none; b=ip6svcUomDkLzs8RcEsEHI5TOEOARjixs77Ipbi/fZNHMprs7K75XJmqE4soJ/FrQjpbVu1PiltqjiF62uQeKeW9a/5J/hlKorEkJKVhqpvgK4zA5LLAiNz2tz2uTa+8tRyV0FLrxbYCAKakb2GxKnBFzOeHVOELMkvK+stPr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157416; c=relaxed/simple;
	bh=0WzHxvv8ut6+aaoLMHA96Jtp/KiSby+xsIoEZHdbN24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bvbjHUwpEbiNi6ujDWwwS4DJ96+c6X8iMwxJiIT7NvUJOLl2OTvhJS9DMsKeLSIkX3nVdLeCjWUNISIBdcDVKqZOXRt1Mv53VTJteJo1fHMjtYzCCv2F/8rz0egafQGmVF/Pwa3s1kDpmlD4yl34BpwNQrswA+DfudpRTHxTmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pczLSuI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pczLSuI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931D6C2BCB7;
	Tue, 19 May 2026 02:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779157415;
	bh=0WzHxvv8ut6+aaoLMHA96Jtp/KiSby+xsIoEZHdbN24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pczLSuI2UNWdIJdAa0VDdD5YlxwtG3M69iTU2Nk+6YPVUy6/IS+9twJs3D2oeVeWz
	 R4f7ZgZvFXQZ08i7Bl7wsHCKimQugUf6vhulBel3uyCAOL36uKasXMlb/UiR9YmWF/
	 0QTF3BLBOWFebrtN2w3HmsrDbYoOL20n2wGwRPG07WcP9eTujAp/7Y8ap2PjeiYPt+
	 xDDoaDoZqceLk/w/b5N3UrVxYd1NBOA36yJD5fnPnd5UHTI9xNtRQQrDrq1WUBreSj
	 tdOej68PnatEvYwVEgpenUb/Eerd0QEIYX+XQ5dGKvR6ugynlWrMhBdoeHO84I3hdt
	 QI4ijVHAgsiaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 2/5] net: stmmac: eswin: fix HSP CSR init
 ordering after clock enable
Reply-To: sashiko-reviews@lists.linux.dev
To: lizhi2@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518022055.444-1-lizhi2@eswincomputing.com>
References: <20260518022055.444-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 02:23:35 +0000
Message-Id: <20260519022335.931D6C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware State Loss on Resume: The HSP CSR registers are not resto=
red during system resume, contradicting the commit message.
--

commit 627f510ee556ff4322e0f4ed0b60fdd27337080f
Author: Zhi Li <lizhi2@eswincomputing.com>

net: stmmac: eswin: fix HSP CSR init ordering after clock enable

This commit moves the HSP CSR configuration in the EIC7700 DWMAC glue driver
into the post-clock-enable initialization path to ensure proper ordering.
The intent is to prevent register access before clock enablement and ensure
deterministic initialization during probe or resume.

>     This change ensures deterministic initialization and prevents
>     clock-dependent register access failures during probe or resume.

Are the HSP CSR registers actually restored during system resume?

The driver overrides the core resume callback by setting
plat_dat->resume =3D eic7700_dwmac_resume. Because a custom resume callback=
 is
provided, the STMMAC core invokes this instead of the default
stmmac_plat_resume() (which would have called plat->init()).

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index bcb8e000e720b..63001c4acdb7a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

[ ... ]

> @@ -61,8 +66,28 @@ static int eic7700_clks_config(void *priv, bool enable=
d)
>  static int eic7700_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc =3D priv;
> +	int ret;
> +
> +	ret =3D eic7700_clks_config(dwc, true);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(dwc->eic7700_hsp_regmap,
> +			      dwc->eth_phy_ctrl_offset,
> +			      EIC7700_ETH_TX_CLK_SEL |
> +			      EIC7700_ETH_PHY_INTF_SELI);
> +	if (ret) {
> +		eic7700_clks_config(dwc, false);
> +		return ret;
> +	}
> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
> +		     EIC7700_ETH_CSYSREQ_VAL);
> =20
> -	return eic7700_clks_config(dwc, true);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_clk_offset,
> +		     dwc->eth_clk_dly_param);
> +
> +	return 0;
>  }

Since eic7700_dwmac_resume() only calls pm_runtime_force_resume(dev) and
doesn't invoke eic7700_dwmac_init(), the HSP CSR configuration won't be
re-applied upon system resume. If the hardware loses state during suspend,
will the RGMII delays be permanently lost, leading to a MAC hang or silent
network failure?

Also, if we try to fix this by naively calling init() from resume(), would
it cause a clock reference leak? pm_runtime_force_resume() already
re-enables the clocks via the runtime PM callbacks, so the CSR configuration
might need to be factored out into a separate helper function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518021919.404-=
1-lizhi2@eswincomputing.com?part=3D2
