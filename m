Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8F34DCF3
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704613; cv=none; b=Xv8zRQ0y3jmlQQAuc07o0izemBUOzVRWbLYIcynN82n8UWt5yd6Kek99y1fvROWIW0zoMC5t5q3hHcR8jz/bKWbhOjD0kchRYi+j0RN6MtaxsWEne6fomEOOq8RDwz/3Uz4fVQxmj3uwpjrVw/TfuZ+zQIzS6CCFhdZztNptttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704613; c=relaxed/simple;
	bh=y7zgEoILjra2tOeaoyJbjNcO3lwMG4deRZs6q5C1l8U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lxJwaCQDwWVndDvIAsOuJ7XeKO74DYDPKCLvRVCqx51yphsa1ERnaJfXx9rcRf1DbGKGz+zkx5Sp0I77+foY/cqKCfaGbCkh1Jia/FYd/BxxY77hmsWF/slBw6UUwUSMJgbANvei0Of13MoGceYRCsRNJ9CMK40dcz/plCCTgEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6FAe8zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6FAe8zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE921F00A3A;
	Mon, 25 May 2026 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779704611;
	bh=ts20KCf8ObB5M1gDSg1oWcJ+8VvMvMkaNg2pRfJpqYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6FAe8zoJMI7o+BlruVgnValNEEJomkeHZ0qtScfxonrGi1uZ8KhEBEivmWptucqe
	 PW3PY7WdBvJ4UZPugOxsI3t7MSP1VrluZPwIViRwgHo5PIPAkpuJZcVcU/t3nWYXSS
	 Ta9NQNJM+MlYehawnzBKv4W01E649JVCIBXRzmMiXfQo9O3v6M0qr+mAUp5OlZoXK7
	 ockYN0joT6wn+v4C42EmLe2R+tkB2WBA4D6nR+cRjdxLrjIXsBOb/n4F785RZhIyvj
	 c/J21aIexeGeUjEKq1lUZ7++GbGysvQRvDxOPwFikLj1W08/SA1VUMlaGuEppHRS2v
	 4BCLpU5dDK0zA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the required quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525092405.1514213-4-manikandan.m@microchip.com>
References: <20260525092405.1514213-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 10:23:31 +0000
Message-Id: <20260525102331.8AE921F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Reusing AMD-specific hardcoded timing quirks for a Microchip SoC w=
ill result in incorrect I3C bus frequencies.
--

commit 8dab9b9edc49c0214800ec48372900ae0b5bbae4
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

i3c: mipi-i3c-hci: add microchip sama7d65 SoC compatible with the required =
quirk

This commit adds support for the Microchip sama7d65 SoC I3C HCI master IP.
It introduces clock acquisition during probe and applies specific quirks
to the new compatible string.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/=
mipi-i3c-hci/core.c
> index b781dbed21650..4cdf2abd42197 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
[ ... ]
> @@ -969,6 +970,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  static int i3c_hci_probe(struct platform_device *pdev)
>  {
>  	const struct mipi_i3c_hci_platform_data *pdata =3D pdev->dev.platform_d=
ata;
> +	struct clk_bulk_data *clks;
>  	struct i3c_hci *hci;
>  	int irq, ret;
[ ... ]
> @@ -1001,6 +1003,11 @@ static int i3c_hci_probe(struct platform_device *p=
dev)
>  	if (!hci->quirks && platform_get_device_id(pdev))
>  		hci->quirks =3D platform_get_device_id(pdev)->driver_data;
> =20
> +	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to get clocks\n");
> +
>  	ret =3D i3c_hci_init(hci);
[ ... ]
> @@ -1031,6 +1038,9 @@ static void i3c_hci_remove(struct platform_device *=
pdev)
> =20
>  static const __maybe_unused struct of_device_id i3c_hci_of_match[] =3D {
>  	{ .compatible =3D "mipi-i3c-hci", },
> +	{ .compatible =3D "microchip,sama7d65-i3c-hci",
> +	  .data =3D (void *)(ulong)(HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING=
 |
> +				  HCI_QUIRK_RESP_BUF_THLD) },

[Severity: High]
Will applying HCI_QUIRK_OD_PP_TIMING to this Microchip SoC result in
incorrect I3C bus frequencies?

This quirk typically invokes amd_set_od_pp_timing(), which writes hardcoded
timing divisors (0x00cf00cf for Open Drain and 0x00160016 for Push-Pull) to
the controller's vendor-specific registers. These fixed values were
calculated for a 9MHz I3C bus frequency assuming an AMD platform's specific
fixed input clock of roughly 400 MHz.

Since the Microchip SoC acquires its clocks dynamically via
devm_clk_bulk_get_all_enabled() as seen above, its input clock rate could
differ and vary based on the system's clock tree configuration.

Should these timing divisors be calculated dynamically against the actual
input clock rate obtained from the clock framework rather than blindly
reusing the fixed AMD divisors?

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, i3c_hci_of_match);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525092405.1514=
213-1-manikandan.m@microchip.com?part=3D3
