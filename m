Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEA930DEA3
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293703; cv=none; b=XZ5AWvcsWprwaGDoUsowkB+YvcPgqxkuwqmR7t58PrBAPctjkzE1NLp8/A2cCijwNDuEmD1Bh+JuXGBK7pPn7eRk/5nzmrrJoEE4k9VKQMzH+6sjpO2RJ6PcRDkd7du8l1/NVply8k+PquQx2a8fOLZZGA/zzRExAV3x5/b6w/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293703; c=relaxed/simple;
	bh=AIUQ5KgxAf8t7iwFsItCQjvIpZjCnmZIGrCXIpImyo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XNSFe0z/QpufOo54y9vtxN5Pa3cJR7dV4aWoNaslprucUq1+axiLV0U076QEhGXV7E1YHhNZ/j9S4XnMZ3fS6jdwUUM+gbuE44Wc5TKwpBgL/yyp0eJ5rxk58tovnQqifTMTRXDKpjoGgu5ec6yxpNlq25lT8xx3BrlFzFk8YBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLemGU5/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLemGU5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFD91F000FF;
	Thu, 24 Sep 2026 23:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790293701;
	bh=0hbfE+fAInDzGe5H0I5HgB/p5S4ljKsQKsZJLhqGt10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLemGU5/LvNWlXlZyeLanqaRaqPbAeYeNXp1WpZudhI/4bQ49xx/6WIDU2OFSEUiq
	 glQbyKISgubLPLqqwgmzBBermlpp4+0Saa+1/iyU8m4+lunRGwHcnh/mJTV/B+ika4
	 oZ/a1pA7mtJ5vnxL8b+KqXJ9RWmY0GModjL2V2bF6uOyx1Y52NfO3A+mjmz03phHCL
	 HAYDDVl+tIgs7M7D6oqx+8jtONe7DUidQhdpbSvDEaqAOnqHqaa2IElMKyTVUwdpy3
	 Y/O5ka599rciCA/pn1HB78c345vKjpFFjXxdTKX3aCS+OzUZHtjiRXifaWT/A62MHu
	 Wyyu70aitmJQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 1/2] usb: bcma: add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924233831.127617-2-rosenp@gmail.com>
References: <20260924233831.127617-1-rosenp@gmail.com>
 <20260924233831.127617-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 23:48:21 +0000
Message-Id: <20260924234821.9DFD91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] usb: bcma: redundant NULL check for regulator pointer
--

commit 3c80ddac8dba5090761a99f4b7fdd330945bd836
Author: Rosen Penev <rosenp@gmail.com>

usb: bcma: add regulator support

This commit adds standard regulator interface support to the bcma-hcd
driver, replacing the non-standard exclusive GPIO manipulation for VBUS
power. It allows the regulator core to reference-count enable and disable
requests so that shared GPIOs do not cause conflicts between USB2 and
USB3 controllers.

> diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
> index 519386255886c..cb253cae29aef 100644
> --- a/drivers/usb/host/bcma-hcd.c
> +++ b/drivers/usb/host/bcma-hcd.c
[ ... ]
> @@ -280,14 +282,23 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_d=
evice *bcma_hcd)
>  	return 0;
>  }
> =20
> -static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool v=
al)
> +static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
>  {
>  	struct bcma_hcd_device *usb_dev =3D bcma_get_drvdata(dev);
> +	int err;
> +
> +	if (usb_dev->gpio_desc)
> +		return gpiod_set_value(usb_dev->gpio_desc, on);
> =20
> -	if (!usb_dev->gpio_desc)
> -		return;
> +	if (!usb_dev->regulator)
> +		return 0;

[Severity: Low]
Since devm_regulator_get() returns either an ERR_PTR or a valid pointer,
and returns NULL only if CONFIG_REGULATOR is disabled, is this NULL check
necessary? The regulator stubs safely accept NULL pointers and return 0,
and the probe function already aborts if IS_ERR() is true.

> +
> +	if (on)
> +		err =3D regulator_enable(usb_dev->regulator);
> +	else
> +		err =3D regulator_disable(usb_dev->regulator);
> +
> +	return err;
>  }
[ ... ]
> @@ -395,12 +406,12 @@ static int bcma_hcd_usb30_init(struct bcma_hcd_devi=
ce *bcma_hcd)
>  static int bcma_hcd_probe(struct bcma_device *core)
>  {
[ ... ]
>  	usb_dev->gpio_desc =3D devm_gpiod_get_optional(&core->dev, "vcc",
>  						     GPIOD_OUT_HIGH);
>  	if (IS_ERR(usb_dev->gpio_desc))
>  		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
> -				     "error obtaining VCC GPIO");
> +				     "error obtaining VBUS GPIO");
> +
> +	usb_dev->regulator =3D devm_regulator_get(dev, "vbus");
> +	if (IS_ERR(usb_dev->regulator))
> +		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtainin=
g VBUS regulator");

[Severity: Low]
This is a pre-existing issue, but if probe fails here and returns directly,
will the physical GPIO pin remain driven high indefinitely? The earlier call
to devm_gpiod_get_optional() uses GPIOD_OUT_HIGH, and while devres will free
the software descriptor, gpiod_put() intentionally does not revert the
physical pin state.

> +
> +	err =3D regulator_enable(usb_dev->regulator);
> +	if (err)
> +		return dev_err_probe(dev, err, "error enabling VBUS regulator");

[Severity: Low]
This is a pre-existing issue, but similar to the above, does this direct
return skip reverting the GPIO state?

> =20
>  	switch (core->id.id) {
>  	case BCMA_CORE_USB20_HOST:
[ ... ]
> @@ -427,13 +446,16 @@ static int bcma_hcd_probe(struct bcma_device *core)
>  	if (err)
> -		return err;
> +		goto error;
> =20
>  	bcma_set_drvdata(core, usb_dev);
>  	return 0;
> +error:
> +	regulator_disable(usb_dev->regulator);
> +	return err;

[Severity: Low]
This is a pre-existing issue, but while this common error path correctly
handles disabling the newly added regulator, does it also need to drive
the pre-existing GPIO back low so the peripheral isn't left powered
indefinitely on failure?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924233831.1276=
17-2-rosenp@gmail.com?part=3D1
