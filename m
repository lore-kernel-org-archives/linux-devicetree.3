Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73156412C17
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787253388; cv=none; b=bE87GuuLtA/qItyNMABMiLEbdc4MjkOySTXom9/B1EtstcviiaXGKIFt1p1n4xx8uuZo2GXEGW0SO+GQVRkuFlpbAUBE+s2uWeZ9e5guQ8JlaP0Kqy4+ceUF4KB9pd7Ezqu1m1oWbsPyoSSqlwWjb31hoFFDPcAewioWYiJqppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787253388; c=relaxed/simple;
	bh=Byq+WV3V2HXRI7Lqq35WXxXWZD7ObgfjyHlyyeyAIk4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WsvXBeHIkwR+5fCTHtHx9HT2LAjXwaJ6tGX9A+yyUrZ/f1uAkXZCbSX+I2rE2XORyonjj6h82gYVbcmPK/+rYwVQTmJBcaeET7z41uiH+zhTlt7b9VE5Aw8DAOnUCKYZWNw8Q0l+p/dg5ih/QfYl6Bs9CVygALoiDVusSY6IjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkrrJS4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkrrJS4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AFD1F000E9;
	Thu, 20 Aug 2026 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787253378;
	bh=N7znEC6sGsMUIFkjMiVhld5GUEjGJr0OY1qZi3nuDCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BkrrJS4zJbriHanuN6Tap7LiD4M8WpftGv+O0fIlNhA0DIymjQwqCPJbsmcuGYyDL
	 PoKrGJpukB28ltQxTzfQL5blA3ByCFsrVC8iPZ53oAntA1gQeIG363nmYhqbt4bLdp
	 YOUioqpvjGQHSTCBC2ucwUUEZ5XRR3OHhF+bchJ01xCICogN2nvGpvaUQZ5h3mqKdV
	 KEOwPM9tTbglvsDapWKKZ40G21cJG0yyMzlJgqKES521LXn7/VZLzGQpjiLKKzv2Ho
	 KXYI1qPd0fMjxhUcqdQngJB3E+vXgabbZ8iKXl02ME6NC5uEJbuLlDLkfx12kUCSj7
	 4enTJjdZmmzWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/8] mmc: sdhci-cadence: add Altera Agilex5 SD6HC
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tanmay Kathpalia" <tanmay.kathpalia@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820185721.22823-9-tanmay.kathpalia@altera.com>
References: <20260820185721.22823-1-tanmay.kathpalia@altera.com>
 <20260820185721.22823-9-tanmay.kathpalia@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 19:16:17 +0000
Message-Id: <20260820191617.E4AFD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Agilex5-specific hardware reset sequence is missing during syste=
m resume.
--

--- Patch [8]: [PATCH v5 8/8] mmc: sdhci-cadence: add Altera Agilex5 SD6HC =
support ---
commit f23f3c9ace34e8e3ffc420a82aed2510f467099c
Author: Tanmay Kathpalia <tanmay.kathpalia@altera.com>

mmc: sdhci-cadence: add Altera Agilex5 SD6HC support

This patch adds support for the Altera Agilex5 SoC with a Cadence SD6HC
controller. It implements a platform-specific initialization routine to
handle overlapping resets for the SDHCI, SoftPHY, and OCP/AXI clock domains.

[ ... ]

> diff --git a/drivers/mmc/host/sdhci-cadence-core.c b/drivers/mmc/host/sdh=
ci-cadence-core.c
> index 18a5329f27db9..e215f6a4c344f 100644
> --- a/drivers/mmc/host/sdhci-cadence-core.c
> +++ b/drivers/mmc/host/sdhci-cadence-core.c

[ ... ]

> @@ -462,6 +481,44 @@ static int elba_drv_init(struct platform_device *pde=
v)
>  	return 0;
>  }
> =20
> +static int sdhci_cdns6_agilex5_init(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control_bulk_data resets[] =3D {
> +		{ .id =3D "sdhc-reset" },
> +		{ .id =3D "combophy" },
> +		{ .id =3D "sdmmc-ocp" },
> +	};
> +	int ret;
> +
> +	/*
> +	 * Assert SDHCI, SoftPHY (combophy), and SDMMC OCP/AXI resets together
> +	 * so their active periods overlap before all domains are released.
> +	 * SoftPHY is shared with NAND, but only one of SDMMC
> +	 * or NAND is enabled on a given board.
> +	 */
> +	ret =3D reset_control_bulk_get_exclusive(dev, ARRAY_SIZE(resets), reset=
s);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get resets\n");
> +
> +	ret =3D reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to assert resets\n");
> +		goto out_put;
> +	}
> +
> +	/* Hold resets asserted long enough for all clock domains to capture. */
> +	usleep_range(10, 20);
> +
> +	ret =3D reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
> +	if (ret)
> +		dev_err_probe(dev, ret, "failed to deassert resets\n");
> +
> +out_put:
> +	reset_control_bulk_put(ARRAY_SIZE(resets), resets);
> +	return ret;
> +}

[Severity: Medium]
Is this reset sequence also required during system resume?

Looking at sdhci_cdns_resume() in sdhci-cadence-core.c, it appears the
platform-specific init routine is not executed upon waking:

static int sdhci_cdns_resume(struct device *dev)
{
	...
	ret =3D clk_prepare_enable(pltfm_host->clk);
	...
	ret =3D sdhci_resume_host(host);
}

If the SoC power-collapses these domains during suspend, will they require
this specific overlapping reset sequence upon wake to correctly synchronize
the clock domains again? Or is this hardware state maintained across suspend
or perhaps handled transparently by the boot firmware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820185721.2282=
3-1-tanmay.kathpalia@altera.com?part=3D8
