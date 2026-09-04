Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFB23EE1FC
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503310; cv=none; b=p4n6KUVQO98pLSQgtWyIBlWydPL1JpZaTVIs0/DodEpmbSffQ4ThFTUz0s7hvlQLkKrlxh8Vug0GbSdym5Wnbt0pJ+bWdKI7U9fTjqaqBmVftMS8MRx7Xa+JMgmUDHbiykV1Gsq99mEe3+Y+4loq1ooTcsDiyu4q6vbvFAe3Gug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503310; c=relaxed/simple;
	bh=KbwFDrlmSN27QV9R6WstdjhTl+A4a1WSAvAikQgN1Is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ckqd0/Fx2kltnuNy+grAvnDB/rM7lXVc7FWpGBZYdlo6aDp0Pe/MGp9Nmx6Kho2hhnAb9QxyfWUs8ZIwu+U2FVPKjUL8ZKq0TikCoVCIMokqo7eqYEGPQMnx6EhFP/4XdQlXiKgNldDANytvo2mYnZQgZQ0IgyV8uIrAcH3Ea0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1FdLYB8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1FdLYB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9CF1F00A3D;
	Fri,  4 Sep 2026 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503308;
	bh=fLdgweaoK1hPjaQvVxqwaxyRFVaf51hCXNqxqMknSd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M1FdLYB8mSYNE/6kN/ctABMLz1S4jRFWrrMz26OFAbok1fTfAfmzehaklxK6AZ6y7
	 1BMHnI6R2ywuQZdvov2Xqh4jPtyl+vPoVr8myET7Ls9/EJQM277CO7a59z9I4Hr1qJ
	 ETjhCO5WCv3xZa2CPM8ySBV52WvqHDksjEG8rJNySMsHoOlkbB+QSr+qpQQzp1AO8p
	 yshT71VJMw/wDtB6+v+FUCvqer/J9Rd7qevhf8IN7I6pw6oTiZsbtdPtxVS0kBv1NY
	 gWyYtWaftri8F43xqi6ca3HvFSdy3CVSIV1Ri6p/ww1nLBzkzAWfiJCZNSA+nZYEZ6
	 UTcbFGFrU2www==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] mux: gpio: Add optional enable gpio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-add-external-mux-enable-gpio-v3-2-1b868e669e43@vaisala.com>
References: <20260904-add-external-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com>
 <20260904-add-external-mux-enable-gpio-v3-2-1b868e669e43@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:28:27 +0000
Message-Id: <20260904062828.4B9CF1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds stack read in `mux_gpio_set` when the number of GPIO=
s specified in the device tree exceeds the bit width of `unsigned long`.
--

commit e5d22f785ccbb077940b83f814cc7d4237449e05
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

mux: gpio: Add optional enable gpio

Some analog multiplexers have an enable input that disconnects all
channels when deasserted, independent of the address inputs. This patch
adds support for an optional enable gpio to handle this. It also updates
the mux idle state logic to require this enable gpio when disconnecting.

> diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
> index f9c7863e51b82..2fd8c83dc22e1 100644
> --- a/drivers/mux/gpio.c
> +++ b/drivers/mux/gpio.c

[ ... ]

> @@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int =
state)
>  	struct mux_gpio *mux_gpio =3D mux_chip_priv(mux->chip);
>  	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
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
This is a pre-existing issue, but is it possible for an out-of-bounds stack
read to occur here?

In mux_gpio_probe(), the number of pins is parsed from the device tree
using gpiod_count() which sets ndescs. There doesn't appear to be an upper
limit check on this value.

The values bitmap allocated earlier in mux_gpio_set():

    DECLARE_BITMAP(values, BITS_PER_TYPE(state));

limits the capacity to a single unsigned long. If the number of GPIOs
specified in the device tree exceeds the bit width of state, it looks like
gpiod_multi_set_value_cansleep() will iterate past the bounds of the
allocated stack array when reading from values.

Could this lead to leaking adjacent kernel stack memory or triggering a
KASAN panic if an oversized number of pins is provided?

> +	if (ret)
> +		return ret;
> =20
> -	return 0;
> +	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-add-extern=
al-mux-enable-gpio-v3-0-1b868e669e43@vaisala.com?part=3D2
