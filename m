Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004172F7EF5
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 22:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374077; cv=none; b=FF+GKaMzdZF6AkR/c9bVXUAemIawamLaM1HpIJNGahF/PBarjIYkqXTrYHfP7TbWpJlwZuZvCbBp5cU/5+alzCe3Reqwbzvv4+PW/eGihZ/Cw6g2Ad6mNiOG/uEVGdh2rlYvGKUORc9xrAqB4dZ13bv/5XnYBm/qGErKPV24ZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374077; c=relaxed/simple;
	bh=oFjEspnZaSVuCyjyNdwGXqAIs5F2i43mf6bqbVHOP1c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oTRcJ5ZgXqKxHylALXz3N1gsKdo9YgxHbVtif5Z24LZwQT3xj3aRBMPDoEe90RwbBphdnXOp7Xv5rBlgdHeHPG0O8LXG4efgYfqhnJGS/xoHsjdhAnpj63Jn1SRH5kvhsOQx/AOpMssD7/sAZMNvN6N6503IHdCWgNOf8qra5XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQVB8prh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQVB8prh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A61F000FF;
	Fri, 25 Sep 2026 22:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374075;
	bh=zYgoF/2BDRayKbN3S8y4ezcR6sB8Ly7VZzaJfncrDx0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQVB8prhLyLzzQh/xVqoDfJnYBp4VqeJ9Zp8/GGPLg2tuAin6nfh229CN5KfL3eUg
	 QXdU9AgnA+efBjrn7sYLT4aMZkvaRykA/jhDkUgh0zy2Fr/B7ub2W0Ov8PcYjbnm3M
	 2S52lAdzXeoqzQJyV4ch+zoGtWVgQWRmNHNBlS0p/EYqxmz+qduoO7TRdcYhtC+ey4
	 ch2gd20DIA0lV5McThYgjtQmBGNK7qg+FAAT/+AwWRLOzFtNh93kcEmhY8qcksTNWF
	 gXEcBlV3Y0zY4e+Wstx9Wm01pIEF8oZKERfGWQ9hX44f1tX1pjqSS5eYFG5aHvICl6
	 W16xfCIS2JS6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: Add Lenovo ThinkPad X13s EC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: Clover <alex@ironrobin.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925215358.33417-3-alex@ironrobin.net>
References: <20260925215358.33417-1-alex@ironrobin.net>
 <20260925215358.33417-3-alex@ironrobin.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 22:07:53 +0000
Message-Id: <20260925220754.BF1A61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm: system suspend aborted on non-critical backlight read failure
--

commit d53f4ca8cee991526718fae25d7c38b7a3993fc8
Author: Clover <alex@ironrobin.net>

platform: arm64: Add Lenovo ThinkPad X13s EC driver

Add a standalone driver for the Lenovo ThinkPad X13s embedded controller,
providing keyboard-backlight control and notifications of firmware-driven
brightness changes.

> diff --git a/drivers/platform/arm64/lenovo-thinkpad-x13s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-x13s.c
> new file mode 100644
> index 0000000000000..066f6e300d38f
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-x13s.c

[ ... ]

> +static int x13s_suspend(struct device *dev)
> +{
> +	struct x13s_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Finish in-flight access while the GENI parent is still usable. */
> +	mutex_lock(&ec->lock);
> +	if (ec->suspended) {
> +		ret =3D -EBUSY;
> +		goto out;
> +	}
> +	/* Capture hardware state before firmware can reset the backlight. */
> +	ret =3D x13s_brightness(ec);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to save backlight brightness: %d\n", ret);
> +		goto out;
> +	}

[Severity: High]
Could this abort the entire system suspend if the non-critical keyboard
backlight read fails? If x13s_brightness() fails due to a transient bus
error or returns a reserved state (-EINVAL), returning this error to the
PM core prevents the system from sleeping.

> +	ec->saved_brightness =3D ret;
> +
> +	/* DSDT: register 0x80 <- 0x55, then GPIO176 low. */
> +	ret =3D x13s_write(ec, X13S_EC_REG_POWER_STATE, X13S_EC_POWER_STATE_ENT=
ER);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925215358.3341=
7-1-alex@ironrobin.net?part=3D2
