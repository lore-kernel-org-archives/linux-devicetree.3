Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894223E00B5
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939350; cv=none; b=NjASu8PZTbA1jNhlvPKC/Vj7zaLaasgaZNEwZWF5OlwzaOuAP2qcpYjWb5QvQmQpDxZ3VXP3a4gRSVbxRs9D9II1mSORNieKErPoWqOId683+FijElL+mNuv/DxTqLgbD2f/W24ytJLeplRz5z18mPoYp5SAJb1suQVLH1uObcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939350; c=relaxed/simple;
	bh=WE1V0jtDaL0Kp40ELptelPKoQ68nRsueJD2vjmezWgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fk2x2XG4hZEa0sL47WQ1Q8NlPIEPqoXpW3TS9P7ZWU3SZCrBWwNnrmLf5/AH96+j0zIn/REXd8TEp7t0R7y6xT68+BjgTKMyFV7dntdKR4kRqzQxiOzp/evoLRkf37QTlZFetEFvlxK/l2xaEhLHIsNXZaVaQdbsT8qXDIn1gdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZgUaJU7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZgUaJU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBD71F000FF;
	Sun, 20 Sep 2026 21:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789939348;
	bh=mXF9cR2ZD7GKnEXJyzp6ZSHlDnT4d6eiweoNFkcnyW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZgUaJU7d7fvCFfXhTolI6VcgGiJu6RCxTrb4d7jJ/ymUujUIqzCtvQXIqIZnxtbQ
	 /GisQHvmdtsSXuL5bubvwAP/akI5duQYT/DTKki5ZFxbBxkWZBY6AcI3QOWJBbvjSO
	 QW7bO7jNqxjJ9os90ZHhmmGYvWly0z2VEuT5K31Fk1/JSoRgFE8dax2ZBl0qIrhuBB
	 SzM5n5jG4msnwrsSXg39tSE9PBnk6tx70p90U6tY+go/bap/TDj/4pL5NipDiZzFb+
	 1y5NRW2MmNwJ8CTQCihOUBxJ/jvzxhQEtEuXgc24m7rSgBVFkfuHSH9OyIFC/eNHgi
	 3Uhw8oQ+BrZbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: bcma: control VBUS via a regulator instead of
 a GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260920211356.186967-2-rosenp@gmail.com>
References: <20260920211356.186967-1-rosenp@gmail.com>
 <20260920211356.186967-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 21:22:27 +0000
Message-Id: <20260920212227.CBBD71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] usb: bcma: ABI breakage by removing vcc-gpio DT backward compa=
tibility
- [High] usb: bcma: fatal probe failure on missing optional regulator
- [High] usb: bcma: regulator enable count leak on error and remove
- [Low] build: syntax error due to missing closing brace
--

commit 2da0c63e158c66b33d97e363d8f72cf580a7db29
Author: Rosen Penev <rosenp@gmail.com>

usb: bcma: control VBUS via a regulator instead of a GPIO

This commit replaces the custom vcc-gpio GPIO driving in bcma-hcd with the
standard regulator framework. It uses devm_regulator_get_optional so shared
regulators are properly reference-counted, avoiding conflicts on boards whe=
re
multiple controllers share the same GPIO.

> diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
> index 519386255886c..394ba9e5a7f77 100644
> --- a/drivers/usb/host/bcma-hcd.c
> +++ b/drivers/usb/host/bcma-hcd.c

[ ... ]

> @@ -405,11 +411,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
>  		return -ENOMEM;
>  	usb_dev->core =3D core;
> =20
> -	usb_dev->gpio_desc =3D devm_gpiod_get_optional(&core->dev, "vcc",
> -						     GPIOD_OUT_HIGH);
> -	if (IS_ERR(usb_dev->gpio_desc))
> -		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
> -				     "error obtaining VCC GPIO");
> +	usb_dev->regulator =3D devm_regulator_get_optional(&core->dev, "vbus");

[Severity: Critical]
Does replacing the vcc property with vbus drop support for existing devices
using older Device Trees? It seems like this might break backward
compatibility for any board still relying on the legacy vcc-gpio binding.

> +	if (IS_ERR(usb_dev->regulator)) {
> +		return PTR_ERR(usb_dev->regulator);

[Severity: High]
Does this unconditionally fail the probe when an optional regulator is not
present? devm_regulator_get_optional() returns -ENODEV when no supply is
defined in the Device Tree, which seems like it would cause this to return
early instead of treating the regulator as optional.

If -ENODEV is handled to allow the probe to continue, does
usb_dev->regulator need to be set to NULL so an error pointer is not passed
to regulator_enable() below?

[Severity: Low]
Is there a missing closing brace here? It looks like this will cause a
compilation error.

> +
> +	err =3D regulator_enable(usb_dev->regulator);
> +	if (err)
> +		return dev_err_probe(&core->dev, err,
> +				     "error enabling VCC regulator");
> =20
>  	switch (core->id.id) {
>  	case BCMA_CORE_USB20_HOST:

[ ... ]

> @@ -452,7 +461,7 @@ static void bcma_hcd_remove(struct bcma_device *dev)

[Severity: High]
If the probe fails later, or when the device is unbound via bcma_hcd_remove=
(),
does this leak the regulator enable count? It appears regulator_disable() is
not called in the probe error paths or during removal.

> =20
>  static void bcma_hcd_shutdown(struct bcma_device *dev)
>  {
> -	bcma_hci_platform_power_gpio(dev, false);
> +	bcma_hci_platform_power(dev, false);
>  	bcma_core_disable(dev, 0);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920211356.1869=
67-1-rosenp@gmail.com?part=3D1
