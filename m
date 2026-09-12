Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2834E75A
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216662; cv=none; b=sT2UrWg+cjHq1wwo1LHtSFr/V50yYwsxBxF7/gAfK2mlqB1qbn77Z7Ve3HM5iqVXHr2+gCcteFdqKtR936R99dO9dyl5cJZK6XAOucofptK18Kj37eV2o8pzBwHlYb8V20DTVvKPB5iecZslBW4dRWuDwcU/lyYbX+8LSO/Ljpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216662; c=relaxed/simple;
	bh=w+ShKUqh2xpifO+kuTLSyOfXVXUUIq2WMgOmzl83kxQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ki2yuw8klJdF285F9Zd623Kv5CvQ+wtHkmyfhG+zyPs7ztUu1cIaEhkDZ386PVCyL3qoco4gYyCRH5HvQAmHShM6TXOKdmC/Pi+FxapE/WgOZKo511dl5b9X7BSKdmW9R1yWJ6DjC/SHXwlsKha0oRJc3zbL+3EfT0GlIhaK+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7oAgsSC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7oAgsSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A2B1F000FF;
	Sat, 12 Sep 2026 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789216661;
	bh=N8X331gW733PRHZj3C50GrjGKJSQPoh8k6QWTMTVNqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e7oAgsSCnuSnzlAx95ifCxcQKNKUezB2JHJWTietSr8r+Vsk0/og8h4zFvC6FYUfM
	 d0tq0T7EoQr0FyAoaSXCOqShGfgy+i1PfZOPiq7M1Dx8sfDDcXW/B8f3/US+bvNagG
	 7XhXaKxf6qFTb7WMLRvKva6A4084wFEto6TmWqMgWYLxDpS2zpE0KxNtq6CQj1iFxZ
	 ltui+6y0sHPmQxZbXn2diwCcBTkfUlKBfqSDC9erNnOnZgLIzOUdIuXv/1SxsZliQ5
	 9Iq0CPwKHR4PHYTQrk2BeRbiaBuscuFHJ4s9PdIJVBjgV68ee9GO0o2Qzge2yeXjt7
	 7Vr0+fh8XY/1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] power: supply: bq256xx: Expose VBUS state through
 extcon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Reza Kurniawan" <imkyufie@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260912-riva-usb-v1-1-0acd5cf8c62a@gmail.com>
References: <20260912-riva-usb-v1-0-0acd5cf8c62a@gmail.com>
 <20260912-riva-usb-v1-1-0acd5cf8c62a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 12:37:40 +0000
Message-Id: <20260912123740.B9A2B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing Kconfig dependency for EXTCON causes build failures, or ru=
ntime probe regression when CONFIG_EXTCON is disabled.
--

commit 6faa47b2b9aa55be622397291bdc7fb836f78d0c
Author: Reza Kurniawan <imkyufie@gmail.com>

power: supply: bq256xx: Expose VBUS state through extcon

This commit adds support to report VBUS state changes through the extcon=20
subsystem for the bq256xx charger. This allows USB controllers to sense=20
power input presence on devices where the VBUS session comparator is not=20
directly wired.

> diff --git a/drivers/power/supply/bq256xx_charger.c b/drivers/power/suppl=
y/bq256xx_charger.c
> index 4b1f81b1ed867..46b036be38dd8 100644
> --- a/drivers/power/supply/bq256xx_charger.c
> +++ b/drivers/power/supply/bq256xx_charger.c

[ ... ]

> @@ -1554,6 +1586,40 @@ static int bq256xx_power_supply_init(struct bq256x=
x_device *bq,
>  	return 0;
>  }
> =20
> +static const unsigned int bq256xx_usb_extcon_cable[] =3D {
> +	EXTCON_USB,
> +	EXTCON_NONE,
> +};
> +
> +static int bq256xx_extcon_init(struct bq256xx_device *bq)
> +{
> +	unsigned int charger_status_0;
> +	int ret;
> +
> +	bq->edev =3D devm_extcon_dev_allocate(bq->dev, bq256xx_usb_extcon_cable=
);
> +	if (IS_ERR(bq->edev)) {
> +		dev_err(bq->dev, "Failed to allocate extcon device\n");
> +		return PTR_ERR(bq->edev);

[Severity: High]
When the extcon configuration is disabled, the dummy inline implementation=
=20
of devm_extcon_dev_allocate in extcon-provider.h returns -ENOSYS. Will=20
this cause bq256xx_extcon_init in drivers/power/supply/bq256xx_charger.c=20
to immediately return a fatal error on systems without extcon support?

> +	}
> +
> +	ret =3D devm_extcon_dev_register(bq->dev, bq->edev);

[ ... ]

> @@ -1743,6 +1809,12 @@ static int bq256xx_probe(struct i2c_client *client)
>  	if (!IS_ERR_OR_NULL(bq->usb3_phy))
>  		usb_register_notifier(bq->usb3_phy, &bq->usb_nb);
> =20
> +	ret =3D bq256xx_extcon_init(bq);
> +	if (ret) {
> +		dev_err(dev, "Failed to register extcon device\n");
> +		return ret;

[Severity: High]
Because the -ENOSYS error propagates here, does this unconditionally abort=
=20
the entire driver probe in bq256xx_probe when extcon is disabled?

Since extcon appears to be an optional feature for exposing VBUS state,=20
should this missing dependency be handled more gracefully, perhaps by=20
treating -ENOSYS as non-fatal or adding a proper dependency in the build=20
configuration?

> +	}
> +
>  	if (client->irq) {
>  		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
>  						bq256xx_irq_handler_thread,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-riva-usb-v=
1-0-0acd5cf8c62a@gmail.com?part=3D1
