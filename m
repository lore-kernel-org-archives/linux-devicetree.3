Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8139022E
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252815; cv=none; b=ixn6ujxPChOegWsefUJBAiIyyZCHGQ+g0EbeeLbLiLabMeR3TFxxMo1pfWhsjidPeAynIASN9TjQlGhqfXPGvT3Y9sTtD/pGrC70Fd81e2IFer2w1iQLeuzqMWXxh9/TEHDFe5i+IuKLjNPFVcV43qrlM7V/K4GCU7PSF40DGaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252815; c=relaxed/simple;
	bh=ngQeRm8bKAbEtBkG6wKeSzsDGERyDWH/MSJMCbM3bh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YKTXSeGrCDFL0gXYJkXZtoF3NPyMZHBT2UX8Hnd3yUEuC3ZiX3eT8QIOrrhY7qoQf3+1GwraATWv2/VpR2UTGlFWXIqGr0OaOLdCp54M0PyJpIwNdPoqucDDNm9gfDjQMphVbRUHsymoVXZ6m8nJhvqu+11Gm10i9K2RzI+sviA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUF4WWD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUF4WWD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11C01F000E9;
	Thu, 20 Aug 2026 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787252813;
	bh=3Lr73H3+nUqNRGEau3yb3QiL3AheWo+WRe+sarpyZzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUF4WWD5QmeOcLTrR/mVCwN5SqEkRx5OOd3BUhRFvOcGHuBUhntNi92iMReXYyDtk
	 Apf9ytcInamfNdqI7IjFUhCErDZs17GBkRVcaibWAX3wGn0h3b3W8+xMEiqVSFZhhX
	 7E02CMmxv8dSuIXsbwcP0RKArdX89BLvEp7eUn122Yz4OJtl9+37/z+icen+6sCLkZ
	 zQpftV6FRJ8SEZcDfmpfq6pqbL/QWAyz99myNoSb/srwbVwDNp+VQCgZ7NsGKNYv+f
	 R1SXzabsOAQzyATjcHevcB+KXRsucIr+urOaDm57qLutrq0sfxraxcR1C+5Xr2S3hX
	 1LmT8aeUbBieA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/8] mmc: sdhci-cadence: rename SD4HC symbols for
 SD6HC groundwork
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820185721.22823-6-tanmay.kathpalia@altera.com>
References: <20260820185721.22823-1-tanmay.kathpalia@altera.com>
 <20260820185721.22823-6-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 19:06:52 +0000
Message-Id: <20260820190652.F11C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Mismatch between counted and parsed PHY parameters causes unintend=
ed zero-writes to the PHY configuration register.
--

--- Patch [5]: [PATCH v5 5/8] mmc: sdhci-cadence: rename SD4HC symbols for =
SD6HC groundwork ---
commit 15f674da35101e267b2865b095a96414154f99a4
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: rename SD4HC symbols for SD6HC groundwork

SD4HC PHY helpers and the default ops/drv_data are not marked as
version-specific, so it is unclear what is shared versus SD4HC-only
ahead of SD6HC support.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence.c
> index 435603c8c00b2..8a6ef6d9d1dd8 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c

[ ... ]

> @@ -156,44 +155,42 @@ static int sdhci_cdns_write_phy_reg(struct sdhci_cd=
ns_priv *priv,
>  	return ret;
>  }
> =20
> -static unsigned int sdhci_cdns_phy_param_count(struct device_node *np)
> +static unsigned int sdhci_cdns4_phy_param_count(struct device_node *np)
>  {
>  	unsigned int count =3D 0;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(sdhci_cdns_phy_cfgs); i++)
> -		if (of_property_present(np, sdhci_cdns_phy_cfgs[i].property))
> +	for (i =3D 0; i < ARRAY_SIZE(sdhci_cdns4_phy_cfgs); i++)
> +		if (of_property_present(np, sdhci_cdns4_phy_cfgs[i].property))
>  			count++;
> =20
>  	return count;
>  }
> =20
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
This isn't a bug introduced by this patch, but can this error handling logic
lead to uninitialized writes later?

If of_property_present() in sdhci_cdns4_phy_param_count() returns true for a
property (e.g., an empty boolean flag), the global count nr_phy_params is
incremented. However, if of_property_read_u32() fails here, the pointer p is
not incremented, but nr_phy_params is never decremented to reflect the
skipped entry.

> =20
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
This is a pre-existing issue tied to the above parsing logic, but could this
loop process trailing zero-initialized elements?

Because it iterates strictly over the original nr_phy_params count, a parsi=
ng
failure earlier means the array will contain trailing zero-initialized
elements. This would result in writing a value of 0 to addr =3D 0 (which
corresponds to SDHCI_CDNS_PHY_DLY_SD_HS).

Could this unintentionally overwrite the High-Speed delay configuration and
potentially break SD card initialization?

>  		if (ret)
>  			return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820185721.2282=
3-1-tanmay.kathpalia@altera.com?part=3D5
