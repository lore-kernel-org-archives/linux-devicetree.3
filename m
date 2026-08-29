Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8478A3AAF70
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 18:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029665; cv=none; b=rN6uGTOlMz8KvZgyiHl3jXRB0gui9Sm/lYI/WBGa0TCyarJFT4fp3KTW0qjyuOzV/KKNy4JMUDSlwBQVgWLOOW+/9WjlfgSS+wyRO8hsc/2YIv0M8FYlzKzn/PDb7QkedL7n/jijXp56x9HHfkY8g8KbfWIvNXhIczA28+B9ddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029665; c=relaxed/simple;
	bh=YzdZ6jbwLy3at7lqurwhQxsaQMIbGGM9kBC8GmyDaPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y+f/E0/ql/Jiqx3RnbD0dXq1ms7eAeUEd4G+JWpY9+l1UEk9BzPFi8XroHxbQUV4gOWhAsJ1MS1Ns8/DoKq4vV9HBiijD0iEl4hFFLcV4T+h6lFkFVWBSw/wD+TXCimeTC2tczqeLL9SBdA5BKz0Uaccc38R//EHG0Bg2rfvgNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYRtJAau; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYRtJAau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFAE1F000E9;
	Sat, 29 Aug 2026 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788029664;
	bh=8wJl3HQ/vXJDWqnB/+Be7CKn8UTnN566bYzo0iJHwug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jYRtJAaubUUiRllwnjBp7FvKttjeT3Dgsua1RITglnYy5TmuBt1oTDS7glSpweaCT
	 e6Athcub4BQPbfHsskO2SeXuIY5KEwn69D9zszz3bMLnjZkD8k0AP0Vs/XH93Vcnru
	 XIGigDer30pVmD6gqOyy4yKe8jCYy4Se1gTnirMd6hD/iKS3kXpm9VMGTPJAmFBYox
	 AYh36OjYSwQsFxpFwco8z6sjBQ1wMuIxDxnRsIU1fhplHnRXjaOaCp1LrjclXBgS5u
	 MsdIJPzGj6JNJRO3Ta+izBZL3zSnqGN6RHFwfFdy+oLdNeED8EkhBnk5MEz1gEUwro
	 am0GEYyZb/XjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] mmc: sdhci-cadence: refactor driver structure
 for V6 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260829184252.27644-7-tanmay.kathpalia@altera.com>
References: <20260829184252.27644-1-tanmay.kathpalia@altera.com>
 <20260829184252.27644-7-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 18:54:23 +0000
Message-Id: <20260829185423.BCFAE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Time-of-check to time-of-use (TOCTOU) buffer overflow during d=
ouble-pass PHY parameter parsing.
--

commit 63b7c6883f34223180b95652ed2ee59e64bc1fac
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: refactor driver structure for V6 controller support

This commit refactors the sdhci-cadence driver in preparation for V6
controller support. It separates PHY parameter handling into a dedicated
sdhci_cdns4_phy structure and introduces a new probe function. Explicit
driver data is now required for compatible entries.

> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-ca=
dence.c
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c

[ ... ]

> @@ -539,6 +544,24 @@ static void sdhci_cdns_mmc_hw_reset(struct mmc_host =
*mmc)
>  	usleep_range(300, 1000);
>  }
> =20
> +static int sdhci_cdns4_phy_probe(struct platform_device *pdev, struct sd=
hci_cdns_priv *priv)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sdhci_cdns4_phy *phy;
> +	unsigned int nr_phy_params;
> +
> +	nr_phy_params =3D sdhci_cdns4_phy_param_count(dev->of_node);
> +	phy =3D devm_kzalloc(dev, struct_size(phy, phy_params, nr_phy_params), =
GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	phy->nr_phy_params =3D nr_phy_params;
> +	sdhci_cdns4_phy_param_parse(dev->of_node, phy);

[Severity: Critical]
This is a pre-existing issue, but does this allocation and double-pass
parsing sequence open a time-of-check to time-of-use window?

If a device tree overlay is applied concurrently during driver probe
(between the count and the parse calls), sdhci_cdns4_phy_param_parse()
could find more properties than were initially allocated.

Looking at sdhci_cdns4_phy_param_parse(), the pointer p is incremented
without bounds checking against the allocated size:

static void sdhci_cdns4_phy_param_parse(...)
{
        ...
        ret =3D of_property_read_u32(np, sdhci_cdns4_phy_cfgs[i].property, =
&val);
        if (!ret) {
                p->addr =3D sdhci_cdns4_phy_cfgs[i].addr;
                p->data =3D val;
                p++;
        }
        ...
}

Could this lead to a heap buffer overflow overwriting adjacent memory if
the property list grows between sdhci_cdns4_phy_param_count() and
sdhci_cdns4_phy_param_parse()?

> +	priv->phy =3D phy;
> +
> +	return sdhci_cdns4_phy_init(priv);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829184252.2764=
4-1-tanmay.kathpalia@altera.com?part=3D6
