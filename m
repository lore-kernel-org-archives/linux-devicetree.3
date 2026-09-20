Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D909A394496
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939637; cv=none; b=QFq1xyzdfjerhPp2ErZ457BSd8uRBKAZe3TZshJX1YFBq+cy+rnQtY80/NiOvpzbFA5Aa1z+w6YRLQ8veKyhQtTn/od7IjRQQFSg1c6M9hwT8qdkbTx+44PY3cGRU01kj3i651C7taY0Xg40YH6936xXwPWyODU/1+7LjLr0HEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939637; c=relaxed/simple;
	bh=BFxgScEB3P6wcdcnjI1a771PN0XIAk9nM4N8T5uB00Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWYRz4r4JLtSKqjrhknC4ZRYusRprQV3oP5EsPMnXX9wyPgvxM0KGXt0HTPlNXKmIbcL87VsBAhQerA1V4ggJUsxLySeot3stK4vahcPuXEKUsP798ZAJDioNTh44IkPG64DLBinNU+efj1pPG2TewBch7PGZ2O8kItjYc/FUfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gr94omoN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gr94omoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5761F000FF;
	Sun, 20 Sep 2026 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789939635;
	bh=vs3Gb/t7dt6ICkAoDFdlAjNeN2jHSiB/ER+WRKssHy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gr94omoNIWH1O4DPw2FlA1W2kqfogkcdM9VKuQrQYQu+uetJxvy/f5UNLkmSYKWcq
	 H2t4nFRHvpN+WlJtxCbDPmRcX+vqA+dWlPPq+uPmJhV+dWNfqf4gklZt7eo1P2ChCa
	 heT0dSTXa1ZoBZX4PK6ivPa9LLVv4JsEW0ZTZFQSrPmVm7qka4ZiJ7O8ISC3EqnOjF
	 r323sGJ0HWbUALpBc3a1VNVOiw+/PP+P2w/z+TrP6ecBcS5DL4gwI1JMie4DjgqRmO
	 DYqSwbfDgr3V5OZthiwKdWRLZVNL+W7dmVyO8MXuLt/r8vjlPLQ3fyO6TBIbQZ753X
	 99x8DpKeK7jYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: broadcom: model USB VBUS power with
 regulator-fixed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920211356.186967-3-rosenp@gmail.com>
References: <20260920211356.186967-1-rosenp@gmail.com>
 <20260920211356.186967-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 21:27:14 +0000
Message-Id: <20260920212715.6D5761F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] usb: bcma: ABI breakage on older Device Trees due to missing r=
egulator
- [High] usb: bcma: regulator enable count leaked on error paths and remove
- [Low] build: missing closing brace in bcma_hcd_probe() causes compilation=
 failure
--

commit 2da0c63e158c66b33d97e363d8f72cf580a7db29
Author: Rosen Penev <rosenp@gmail.com>

usb: bcma: control VBUS via a regulator instead of a GPIO

This commit replaces the undocumented "vcc-gpio" property handling with the
standard regulator interface. Each core obtains its VBUS supply via
devm_regulator_get_optional() and the regulator core reference-counts the
enable/disable requests to avoid conflicts.

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
> +	if (IS_ERR(usb_dev->regulator)) {
> +		return PTR_ERR(usb_dev->regulator);

[Severity: Critical]
Is it possible this unconditional return breaks backward compatibility with
older device trees?

Since devm_regulator_get_optional() returns -ENODEV when the regulator is
absent, returning this error will fail probe entirely on older setups rather
than proceeding without it.

[Severity: Low]
Does this code have a missing closing brace?

The if block is opened here but the closing brace is missing, incorrectly
scoping the rest of the function and breaking compilation.

> +
> +	err =3D regulator_enable(usb_dev->regulator);

[Severity: High]
Does this code leak the regulator enable count?

If bcma_hcd_probe() encounters an error later in the initialization sequence
after regulator_enable() has succeeded:

drivers/usb/host/bcma-hcd.c:bcma_hcd_probe() {
    ...
	switch (core->id.id) {
    ...
	}
	if (err)
		return err;
    ...
}

It returns without calling regulator_disable().

Similarly, does bcma_hcd_remove() also leak the regulator enable count?

When the module is unbound, it fails to invoke regulator_disable(), which
would leave the regulator active and trigger core warnings.

> +	if (err)
> +		return dev_err_probe(&core->dev, err,
> +				     "error enabling VCC regulator");
> =20
>  	switch (core->id.id) {
>  	case BCMA_CORE_USB20_HOST:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920211356.1869=
67-1-rosenp@gmail.com?part=3D2
