Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB13812D1
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029972; cv=none; b=UmPYWFO2RR2vD2/ouycOE2rdFBz9YtS249HLFmVez7tE+nBAvg66T2aC5Ab2L7DAOQRkf7hYEA2/o+ZjyHpAtISgzqezcyTwsOrhCIBdDYv9c7AZS7QuRCOQ2w/Y0yPYHbekNvya2AxGcFtWNjGhMpNXj0kq/jDKvYt9MGm/5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029972; c=relaxed/simple;
	bh=KjlW8T/QHhwsP25OCq7GnotIBPuLjaW2c2mxmVkbUmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CM/ZmJB+iRcQH724omQDK55+zEq/omVrtzm+3OaT9fWbHjkcyaDZcyI0UvM1cfo6Zlvb8GsKtrmhtPaV1yYNAvGEIh/Wn0aAeYHSfTbPTtAaEZY2uz64ThO7165Er8bz74jVi3ek2gDM24EzdUdFYBzNLYsTGb0WpRK0hu/NWiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7Np/Nr9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7Np/Nr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D171D1F000E9;
	Sat, 29 Aug 2026 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788029971;
	bh=W3V1vtZ2q4dd7rMNtXGuba9mEb6klSk3BEswpu5b7Sk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f7Np/Nr94PWrWemo1Oe0EbwcGhTaxKAbqBoNLddAXHKMfAaXDbZ6OQSoDXZfl4XBK
	 W9xd3VvUZMG/aKz8IAmf51M6qX2EZjpoRxG1Xh5eUdwlJ3nNoRpKvZ78a9sv5bsLEK
	 wfDgFJQZfRVyiZS1ge/mwPtkgcTeG7OsYLfSLs6TGsonuUSlhpwXnCnWCLry2KYtVJ
	 6RsP0O9XRJtH5fBHYpbUeicrifi4qf9yHduQqBul2aEXQ2ofex6drwcswrjuuH/XAK
	 wZgc0L1YVI7O6SuVNn7C5KSOfEdHXNv49E9Nfv+qx8U+f44Ls7313aJit272Atdnt6
	 8HgVBwICHU9Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] mmc: sdhci-cadence: add Cadence SD6HC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260829184252.27644-8-tanmay.kathpalia@altera.com>
References: <20260829184252.27644-1-tanmay.kathpalia@altera.com>
 <20260829184252.27644-8-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 18:59:30 +0000
Message-Id: <20260829185930.D171D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Type confusion and out-of-bounds memory access due to split-brain =
PHY version detection
- [Medium] BIU clock is not disabled during system suspend, causing power i=
nefficiency
--

commit ae6fe1c869dec5dbfd62f818d4b7f208b7357ea8
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: add Cadence SD6HC support

The Cadence SD6HC is a sixth-generation SD/SDIO/eMMC host controller
with an integrated combo-PHY. This commit splits the existing driver to
support SD6HC, adding sdhci-cadence-phy-v6.c and updating the core.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence-core.c
> index 1fb23051a047b..18a5329f27db9 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c
[ ... ]
> @@ -569,6 +583,7 @@ static int sdhci_cdns_probe(struct platform_device *p=
dev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
> =20
> +	/* SD6HC requires a second clock, "biu", for the bus interface unit. */
> +	if (of_device_is_compatible(dev->of_node, "cdns,sd6hc")) {
> +		biu_clk =3D devm_clk_get_enabled(dev, "biu");

[Severity: Medium]
Is there a way to turn this clock off during suspend? Since biu_clk is
stored in a local variable, the power management callbacks won't be able
to access it to disable it later.

> +		if (IS_ERR(biu_clk))
> +			return dev_err_probe(dev, PTR_ERR(biu_clk), "failed to enable biu clo=
ck\n");
> +	}
[ ... ]
> +	if (of_device_is_compatible(dev->of_node, "cdns,sd4hc")) {
> +		__sdhci_read_caps(host, &version, NULL, NULL);
> +		ret =3D sdhci_cdns4_phy_probe(pdev, priv);
> +		if (ret)
> +			return ret;
[ ... ]
> +	} else {
> +		ret =3D sdhci_cdns6_phy_probe(pdev, priv);

[Severity: High]
If the device is bound using the "cdns,sd6hc" compatible string, the driver
allocates the struct sdhci_cdns6_phy type and assigns it to the opaque
priv->phy pointer here.

What happens during suspend/resume if the hardware itself reports an SDHCI
spec version lower than 4.20?

> +		if (ret)
> +			return ret;
>  	}
> =20
>  	return sdhci_add_host(host);
>  }
> =20
> +/*
> + * Only the CIU clock is gated on suspend. The SD6HC "biu" clock is not
> + * toggled here as it may be a shared bus clock; a dedicated biu clock
> + * would need explicit PM gating added here.
> + */

[Severity: Medium]
Does this assumption hold true under the Linux Common Clock Framework?

Since CCF handles shared clocks through reference counting, it will keep the
underlying hardware clock running as long as other consumers hold a referen=
ce,
and safely power it down when all consumers have disabled it. Could we safe=
ly
disable the BIU clock during suspend to improve power efficiency?

>  static int sdhci_cdns_resume(struct device *dev)
>  {
>  	struct sdhci_host *host =3D dev_get_drvdata(dev);
[ ... ]
> -	ret =3D sdhci_cdns4_phy_init(priv);
> +	if (host->version >=3D SDHCI_SPEC_420)
> +		ret =3D sdhci_cdns6_phy_init(priv);
> +	else
> +		ret =3D sdhci_cdns4_phy_init(priv);

[Severity: High]
Could this cause type confusion if we allocated sdhci_cdns6_phy in probe but
hit the fallback branch here? (e.g. due to a misconfigured device tree or
anomalous hardware reporting an older spec version)

If this falls back to sdhci_cdns4_phy_init() for an SD6HC PHY pointer:

sdhci_cdns4_phy_init(struct sdhci_cdns_priv *priv) {
    struct sdhci_cdns4_phy *phy =3D priv->phy;
    ...
    for (i =3D 0; i < phy->nr_phy_params; i++) {
        ret =3D sdhci_cdns4_write_phy_reg(priv, phy->phy_params[i].addr,
                                        phy->phy_params[i].data);
    }
}

This would misinterpret the fields from sdhci_cdns6_phy (such as treating
t_cmd_output_min as nr_phy_params), which could lead to out-of-bounds reads
and arbitrary MMIO writes. Should this check use the compatible string or a
saved flag rather than the host version to determine the PHY type?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829184252.2764=
4-1-tanmay.kathpalia@altera.com?part=3D7
