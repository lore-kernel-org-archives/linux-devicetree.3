Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF56335091
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029479; cv=none; b=j0mCy3KqZBFdnJeODXQDaQHWtDjSvFTn1XSSuJoVR0BJ30HmzXCA9zHBya6GyivYWp3Fg+1FdxF9ABTtiFOWoLcxo8rGDhXwBeRlQ8zu6btDT+q7jwcFsosIEgl98eqsWBjfNbUEnaXnf6twTQTyzq5S0v/jaly8dyT6YOs97NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029479; c=relaxed/simple;
	bh=xQSZsETnqxadcnNErkkRu4U9oo2/cRsWA15Gm/RidWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OD8PEl56lB404xDjhJEQi3ekRxUZlZh/PPFpc3kY2r7FfsfJYDAA2R9oTENYwqSh0NXYTxAC3SWlpu+UEnREzqp8yQpPeiP66qQ0i0eCDVvSH4LWsnHh/H4BOXbwOCZTujZewGqFC4xs3r+DrsdhmTOc3KgL7FM+axk5nIK9mAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr1kzp9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr1kzp9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D520E1F00A3E;
	Sat, 29 Aug 2026 18:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788029478;
	bh=mm/8uvkdjIhRWbf7OTh+ofcJuSOQ362LOhw06mtvBcI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tr1kzp9MasWyqbeItdZ0FJboD5YvSps8F/ut9hH3ZbhPqiGgoh5l5ICOPHpkzSO+f
	 8JKtOXXalTL3SVk09kv1EPmb9XnxYFW2jbepX32lbUFXNAxZnX+NDqUOPClhellGi0
	 pKjXD5NcofF+xySkFEs2puCt/Z80/YVsKzjs4/6NwJf2oYoEcYOcJtwiw5Nzve5PDk
	 H+PziUZNvoiMnPrTzlpSFmNxMpywj7FUEN4wEbkfIVhjOQhZYZwX8KBl/L8zXZxJJg
	 PolOUCUJ3mobstjDvDP2DrhyE67v6irTFGsAlsijC+Jzlqke2nRDrCKo5ILAtFEXmD
	 /Eyw+9nd9o7tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/8] mmc: sdhci-cadence: rename SD4HC symbols for
 SD6HC groundwork
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260829184252.27644-6-tanmay.kathpalia@altera.com>
References: <20260829184252.27644-1-tanmay.kathpalia@altera.com>
 <20260829184252.27644-6-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 18:51:17 +0000
Message-Id: <20260829185117.D520E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Mismatch between property counting and parsing logic leads to unin=
itialized array elements being written to PHY registers if a property is ma=
lformed.
--

commit 8f13dab23e01e84497b28e9b7e93c757eb2c1d11
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: rename SD4HC symbols for SD6HC groundwork

This commit renames SD4HC PHY helpers and default operations with a cdns4
prefix to separate them from the shared driver core. This prepares the
driver for future SD6HC support by avoiding symbol clashes.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence.c
> index 435603c8c00b2..8a6ef6d9d1dd8 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c

[ ... ]

> -static void sdhci_cdns_phy_param_parse(struct device_node *np,
> -				       struct sdhci_cdns_priv *priv)
> +static void sdhci_cdns4_phy_param_parse(struct device_node *np, struct s=
dhci_cdns_priv *priv)
>  {
> -	struct sdhci_cdns_phy_param *p =3D priv->phy_params;
> +	struct sdhci_cdns4_phy_param *p =3D priv->phy_params;
>  	u32 val;
>  	int ret, i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(sdhci_cdns_phy_cfgs); i++) {
> -		ret =3D of_property_read_u32(np, sdhci_cdns_phy_cfgs[i].property,
> -					   &val);
> +	for (i =3D 0; i < ARRAY_SIZE(sdhci_cdns4_phy_cfgs); i++) {
> +		ret =3D of_property_read_u32(np, sdhci_cdns4_phy_cfgs[i].property, &va=
l);
>  		if (ret)
>  			continue;

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
mismatch in sdhci_cdns4_phy_param_parse between how properties are counted
and parsed.

If a device tree property is present but malformed (for example, defined as
an empty property or a boolean instead of a u32), of_property_read_u32
fails and this loop continues without advancing the p pointer.

Because sdhci_cdns4_phy_param_count previously incremented the count
simply because the property was present, priv->nr_phy_params will end up
larger than the number of elements actually parsed. This leaves the trailing
elements in the priv->phy_params array zero-initialized.

> -		p->addr =3D sdhci_cdns_phy_cfgs[i].addr;
> +		p->addr =3D sdhci_cdns4_phy_cfgs[i].addr;
>  		p->data =3D val;
>  		p++;
>  	}
>  }
> =20
> -static int sdhci_cdns_phy_init(struct sdhci_cdns_priv *priv)
> +static int sdhci_cdns4_phy_init(struct sdhci_cdns_priv *priv)
>  {
>  	int ret, i;
> =20
>  	for (i =3D 0; i < priv->nr_phy_params; i++) {
> -		ret =3D sdhci_cdns_write_phy_reg(priv, priv->phy_params[i].addr,
> -					       priv->phy_params[i].data);
> +		ret =3D sdhci_cdns4_write_phy_reg(priv, priv->phy_params[i].addr,
> +						priv->phy_params[i].data);

[Severity: High]
This isn't a bug introduced by this patch, but following from the parsing
mismatch above, can this loop write uninitialized array elements to the PHY
registers?

Since priv->nr_phy_params includes the count of malformed properties,
sdhci_cdns4_phy_init will iterate over the trailing zero-initialized elemen=
ts
in the array.

This would inadvertently write data 0 to address 0, which corresponds to
SDHCI_CDNS_PHY_DLY_SD_HS. Could this unintentionally corrupt unrelated
hardware configurations and potentially break SD/eMMC access?

>  		if (ret)
>  			return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829184252.2764=
4-1-tanmay.kathpalia@altera.com?part=3D5
