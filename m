Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DEB439F9B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949596; cv=none; b=l5IWenV4Pd67hUc0QMImO6zfcANXmkmYSWfTvc2sANR4pJ4b31H5xfTQ6loibd7WM+HfNf5sexBYhb2W4YmKugc0vEZemgFBcaKTIH1hd2+9az3PkoCB5maYUGUZoWoOskrGt0kdP+/xgj7QnW55MKsHGVTlI8Upq73h2oBORhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949596; c=relaxed/simple;
	bh=IOIwQP5XG/V04nDmZ1HIICa3t7eVkA2AnXJ9xNLuf7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b+QWJ+EbCiKghc58usCpVEAPr/Qe3NpoSDYkKX2mIrl/JAtGqPSFKtJrtPWEMKVuSm+yeFnIhVr2s7bXJ4eBGoSD2a31pwE8TfqU78knaYMznt4dG/Xh6nYVpIyBW4KPQUbwUwGZF/OeL+U5/sTLI86qNQvEaIBisUxc4T6K9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/PsiLj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/PsiLj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722BA1F00A3A;
	Wed,  9 Sep 2026 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949594;
	bh=B6rS/tobbj99+9W2qp5eBLkZyOQjWdcKjfOA0Csu8bE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/PsiLj0QzIZrMCZz4GzuyquiGIjw3OenwxU3j0rAbiZU3xbMI1X0W/BKkrPUFzxf
	 0+N9lbl9g2F/2zdiVp5gXTkU4092STywPH0rjD7HETjBx6BByHCKtY/nCbojNc7+s+
	 WT/fC3T3A+pD/cX6yKR2J6xozFMI8vkAm/pfL2V8umI4SpyHgVdoQJZe452oXcCtAq
	 KWeYVEYDJUOh1u9lHaoPZ3ndeJFBOSUs0yinwkEx8Xiq0naK60J+7JQ2bA3a3mrNsG
	 KFMzQwpo3frHKO8iSK9H2qTn3GurJVv6anr6LK6sHsEF5d9wb9i540ak4jGdmuJJ/r
	 n1peRx+4rO/dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] mux: gpio: Add optional enable gpio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909-add-external-mux-enable-gpio-v4-2-3b12a767bb94@vaisala.com>
References: <20260909-add-external-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com>
 <20260909-add-external-mux-enable-gpio-v4-2-3b12a767bb94@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 10:26:33 +0000
Message-Id: <20260909102634.722BA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing out-of-bounds stack read in `mux_gpio_set` caused by =
unbounded `pins` count from device tree, leading to kernel panic.
--

commit b0b2cc29682249aeca5c93c5b7087aa432f2b30d
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

mux: gpio: Add optional enable gpio

This commit adds support for an optional enable GPIO to the multiplexer dri=
ver
to disconnect channels during address transitions. It handles the
MUX_IDLE_DISCONNECT state by toggling the enable line and captures error re=
turns
from GPIO writes to prevent invalid caching.

> diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
> index f9c7863e51b82..2fd8c83dc22e1 100644
> --- a/drivers/mux/gpio.c
> +++ b/drivers/mux/gpio.c
> @@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int =
state)
>  	struct mux_gpio *mux_gpio =3D mux_chip_priv(mux->chip);
>  	DECLARE_BITMAP(values, BITS_PER_TYPE(state));

[Severity: High]
This is a pre-existing issue, but does this hardcoded bitmap size pose a ri=
sk
if the number of configured pins exceeds 32?

In mux_gpio_probe(), the number of pins is obtained directly from the device
tree using gpiod_count(), without checking if it exceeds the capacity of the
values array (32 bits) or architectural shift limits:

drivers/mux/gpio.c:mux_gpio_probe() {
    ...
    pins =3D gpiod_count(dev, "mux");
    if (pins < 0)
        return pins;
    ...
    WARN_ON(pins !=3D mux_gpio->gpios->ndescs);
    mux_chip->mux->states =3D BIT(pins);
    ...
}

If a malicious or misconfigured device tree overlay specifies a large multi=
ple
of 64 pins (for example, 64000), BIT(64000) could evaluate to 1 on x86-64 d=
ue
to shift mask semantics. This could bypass the bounds limit check later in
the probe function when checking idle_state against mux_chip->mux->states.

>  	u32 value =3D state;
> +	int ret;
> +
> +	/*
> +	 * The gpios might not be updated atomically, disable the mux
> +	 * meanwhile.
> +	 */
> +	ret =3D gpiod_set_value_cansleep(mux_gpio->enable, 0);
> +	if (ret)
> +		return ret;
> +
> +	if (state =3D=3D MUX_IDLE_DISCONNECT)
> +		return 0;
> =20
>  	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
> =20
> -	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
> +	ret =3D gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);

[Severity: High]
This is a pre-existing issue, but can this lead to an out-of-bounds stack
read?

When gpiod_multi_set_value_cansleep() consumes the values bitmap, it proces=
ses
it based on the number of configured pins.

If the number of pins configured in the device tree greatly exceeds the 32-=
bit
capacity of the values stack array, could this read past the end of the sta=
ck,
potentially leading to a kernel panic from hitting a stack guard page or
leaking kernel stack information to physical GPIO lines?

> +	if (ret)
> +		return ret;
> =20
> -	return 0;
> +	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-add-extern=
al-mux-enable-gpio-v4-0-3b12a767bb94@vaisala.com?part=3D2
