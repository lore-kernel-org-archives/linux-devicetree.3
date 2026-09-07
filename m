Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F44CA798
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788176; cv=none; b=V80iVjzzHaF0sGj7B3rCPvpRJpZNci68vvDwsYZKwUpnkOiOo9MEeTVe6n/spCVQaS8GyCNPcDL6RqNcju7usktU7zaTiBn00otz8ty3i0rhXRbP0i0lth1BqxkZ9z4mGYdQlEREFrFegNuBObxqWKb1bZLvSIYfjCCVj3YiCSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788176; c=relaxed/simple;
	bh=iktCcNXY3Eir2dORK6JzBM8Ce62Nz1CzPOVrXgWRRvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EuJpTRofBX5OG3meI/M3xfTz4Dx6YOuMrYj6ELcgoWX7olViNDmJisT4YDztGfVkQ/BB9uG3LBYs//PiPC2UzqN1hD84Uh0H032W+CYqsYtUSmK2f9gFICeVaQ6p0WibPJ8Je6JHUdqa5KHXmSz4iYFzwIIRoyNQ+uWLDhIeCZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5CLIbXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5CLIbXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971BA1F00A3E;
	Mon,  7 Sep 2026 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788174;
	bh=8vGCVrP1n2qhK1b75aXug5SSk7/S6VSh7bp3SunCUpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l5CLIbXSvS7FuTkviGZmQdG2de8zfOAjky1J13kOGxqan9N2FhcrAYp52k9tow52t
	 eCBo6094ce1RXdffPRSIC1sSAreUtFPAZ0/NfBaOnVJy53fiLF/jZ759ZIusoYxvZ+
	 /7aGW/Zn8lp1Jpg1e/6J/zlFecsenlx1pviIk6rJh9Q5yjETk73eD3rKVgAOJDHCb/
	 p6fXPggf+KRu6ZMX4r50WNctspHNNOb7W6WMQIsz9jBnmElsHXH+l/VZWUx2bGXcmV
	 6eXhxNW615dpdUApt9GccLATuV3dvusB2jqp033q09a7Gw7OOOZoC24fmbbVrR5mNM
	 27JLUTIAZ5pkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] mmc: sdhci-of-at91: add option to keep clocks
 enabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260907132617.1198548-3-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 13:36:14 +0000
Message-Id: <20260907133614.971BA1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Return values of mandatory clk_prepare_enable() calls are complete=
ly ignored in probe and resume paths
--

commit 6269754970c40ae19a0c5916bfacc745090e47c2
Author: Robert Marko <robert.marko@sartura.hr>

mmc: sdhci-of-at91: add option to keep clocks enabled
   =20
sdhci_at91_set_clks_presets() both enables the controller clocks and
programs its capabilities and preset registers. This prevents callers from
restoring the registers without changing the clock enable counts.
   =20
Move clock enablement to callers and add a SoC data flag for controllers
that must keep their clocks enabled. Use it in the runtime PM paths while
keeping register restoration separate from clock enablement.

> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of=
-at91.c
> index 7c4ac65f247d3..b7e2a89da348a 100644
> --- a/drivers/mmc/host/sdhci-of-at91.c
> +++ b/drivers/mmc/host/sdhci-of-at91.c
[ ... ]
> @@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct device =
*dev)
>  	int ret;
> =20
>  	if (priv->restore_needed) {
> -		ret =3D sdhci_at91_set_clks_presets(dev);
> -		if (ret)
> -			return ret;
> +		if (!priv->soc_data->keep_clks_on)
> +			clk_prepare_enable(priv->hclock);
> +
> +		sdhci_at91_set_clks_presets(dev);
> +
> +		if (!priv->soc_data->keep_clks_on) {
> +			clk_prepare_enable(priv->mainck);
> +			clk_prepare_enable(priv->gck);
> +		}

[Severity: High]
This isn't a bug introduced by this patch, as the old implementation in
sdhci_at91_set_clks_presets() also ignored the return values. However, could
this cause a kernel panic if the clock enablement fails?

In drivers/mmc/host/sdhci-of-at91.c:sdhci_at91_runtime_resume(), if
clk_prepare_enable(priv->hclock) fails, the subsequent call to
sdhci_at91_set_clks_presets() will perform MMIO accesses to the SDHCI
controller without the clock being enabled. This can trigger a synchronous
external abort.

> =20
>  		priv->restore_needed =3D false;
>  		goto out;
>  	}
[ ... ]
> @@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_device *=
pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
>  				     "failed to get multclk\n");
> =20
> -	ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> -	if (ret)
> -		return ret;
> +	clk_prepare_enable(priv->hclock);
> +	sdhci_at91_set_clks_presets(&pdev->dev);
> +	clk_prepare_enable(priv->mainck);
> +	clk_prepare_enable(priv->gck);

[Severity: High]
This is a pre-existing issue, but this patch spreads the pattern to new
locations without adding error handling. Is it possible to check the return
values of clk_prepare_enable() here?

In drivers/mmc/host/sdhci-of-at91.c:sdhci_at91_probe(), if
clk_prepare_enable(priv->hclock) fails, the initialization will continue
and the MMIO accesses in sdhci_at91_set_clks_presets() will lead to a
system crash rather than a graceful failure of the probe function.

> =20
>  	priv->restore_needed =3D false;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907132617.1198=
548-1-robert.marko@sartura.hr?part=3D2
